#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <float.h>
#include <math.h>


#include <time.h>


#define min(a,b) (((a)<(b))?(a):(b))
/* #include <mkl.h> */

/* void reference_dgemm (int N, double* A, double* B, double* C) { */
/*   cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, A, N, B, N, 1, C, N); */
/* } */


typedef double vector __attribute__((vector_size(4 * sizeof(double))));


int __attribute__((optimize("O0"))) rdcycle() {
  int out = 0;
  asm("rdcycle %0" : "=r" (out));
  return out;
}

int __attribute__((optimize("O0"))) rdinstret() {
  int out = 0;
  asm("rdinstret %0" : "=r" (out));
  return out;
}

void fill (double* p, int n) {
  for (int i = 0; i < n; i++) {
    p[i] = rand()% 10;
    p[i] = 1;
  }
}

void printmatrix (int m, int n, double* M) {
  for (int i = 0; i < m; i++)
    {
      for(int j = 0; j < n; j++)
	printf("%.3f\t ", M[i+j*m]);
      printf("\n");
    }
  printf("\n");
}

void naive_dgemm(int M, int N, int K,  double* __restrict__ A, double* __restrict__ B, double* __restrict__ C) {
  for (int m = 0; m < M; m++) {
    for (int n = 0; n < N; n++) {
      double t = C[m + n * M];
      for (int k = 0; k < K; k++) {
  	double a = A[m + k * M];
  	double b = B[k + n * K];
  	t += a * b;
      }
      C[m + n * M] = t;
    }
  }
}


void slow_dgemm(int M, int N, int K, double* restrict A, double* restrict B, double* restrict C) {
  for (int m = 0; m < M ; m++) {
    for (int n = 0; n < N; n++) {
      for (int k = 0; k < K; k++) {
	C[m + n * M] += A[m + k * M] * B[k + n * K];
      }
    }
  }
}

  
void do_4x4_block_fast(int M, int N, int K, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  vector c[4];
  for (int n = 0; n < 4; n++) {
    asm("# initial memcopy");
    memcpy(c + n, C + n * M, 4*sizeof(double));
  }  
  for (int k = 0; k < kdepth; k++) {
    vector a;
    memcpy(&a, A + k * M, 32);
    for (int n = 0; n < 4; n++) {
      double bv = B[k + n * K];
      vector b = {bv, bv, bv, bv};

      c[n] += a * b;
    }
  }
  for (int n = 0; n < 4; n++) {
    asm("# final memcopy");
    memcpy(C + n * M, c + n, 4*sizeof(double));
  }
}



void blocked_dgemm(int M, int N, int K, double* restrict A, double* restrict B, double* restrict C) {
  for (int k = 0; k < K; k += 32){
    int kend = min(k + 32, K);
    for (int n = 0; n < N; n += 32){
      int nend = min(n + 32, N);
      for (int m = 0; m < M; m += 32){
	int mend = min(m + 32, M);
	
	int bfringe = (mend - m) % 4;
	int rfringe = (nend - n) % 4;

	int bboundary = mend - bfringe;
	int rboundary = nend - rfringe;

	int m1, n1, k1;
	for (n1 = n; n1 < rboundary; n1 += 4){
	  for (m1 = m; m1 < bboundary; m1 += 4){
	    do_4x4_block_fast(M, N, K, kend - k, A + m1 + k * M, B + k + n1 * K, C + m1 + n1 * M);
	  }
	}
	if (bfringe > 0) {
	  for (n1 = n; n1 < rboundary; n1++) {
	    for (m1 = bboundary ; m1 < mend; m1++) {
	      for (k1 = k; k1 < kend; k1 ++) {
		C[m1 + n1 * M] += A[m1 + k1 * M] * B[k1 + n1 * K];
	      }
	    }
	  }
	}
	if (rfringe > 0) {
	  for (m1 = m; m1 < bboundary; m1 ++) {
	    for (n1 = rboundary; n1 < nend; n1++) {
	      for (k1 = k; k1 < kend; k1++) {
		C[m1 + n1 * M] += A[m1 + k1 * M] * B[k1 + n1 * K];
	      }
	    }
	  }
	}
	for (m1 = bboundary; m1 < mend; m1++) {
	  for (n1 = rboundary; n1 < nend; n1++) {
	    for (k1 = k; k1 < kend; k1++) {
	      C[m1 + n1 * M] += A[m1 + k1 * M] * B[k1 + n1 * K];
	    }
	  }
	}
      }
    }
  }
}
	
void benchmark_once(void (*f)(int, int, int, double*, double*, double*), int m, int n, int k) {
  double* A = (double*)malloc(m * k * sizeof(double));
  double* B = (double*)malloc(k * n * sizeof(double));
  double* C = (double*)malloc(m * n * sizeof(double));
  double* Co = (double*)malloc(m * n * sizeof(double));

  fill(A, m * k);
  fill(B, k * n);
  fill(C, m * n);

  (*f)(m, n, k, A, B, C);

  int start_ins = rdinstret();
  int start = rdcycle();
  (*f)(m, n, k, A, B, C);
  int cycles = rdcycle() - start;
  int instructions = rdinstret() - start_ins;
  

  memcpy(Co, C, sizeof(double) * m * n);
  memset(C, 0, m * n * sizeof(C));
  memset(Co, 0, m * n * sizeof(Co));
  

  (*f)(m, n, k, A, B, C);
  naive_4x4_dgemm(m, n, k, A, B, Co);

  for (int i = 0; i < m * n ; i++) {
    if (fabs(C[i] - Co[i]) > 0.01) {
      perror("error in matrix multiply");
      printmatrix(m, n , C);
      printmatrix(m, n , Co);
      exit(EXIT_FAILURE);
    }
  }

  free(A);
  free(B);
  free(C);
  free(Co);
  printf("%d\t%d\t%d\t%d\t%d\n", m, n, k , cycles, instructions);
}

void benchmark (char* desc, void(*f)(int, int, int, double*, double*, double*), int* m, int* n, int* k) {
  printf("%s\nM\tN\tK\tCycles\tInstructions\n", desc);
  int numm = sizeof(m) / sizeof(int);
  int numn = sizeof(n) / sizeof(int);
  int numk = sizeof(k) / sizeof(int);
  
  for ( ; numm > 1; numm--) {
    for ( ; numn > 1; numn--) {
      for ( ; numk > 1; numk--) {
	benchmark_once(f, *m++, *n++, *k++);
      }
    }
  }
}



	
int main (int argc, char **argv) {
  int s;
  if (argc == 2) {
    s = atoi(argv[1]);
  } else{
    s = 4;
  }
  
  int* m = (int*)malloc(sizeof(int));
  int* n = (int*)malloc(sizeof(int));
  int* k = (int*)malloc(sizeof(int));
  m[0] = s;
  n[0] = s;
  k[0] = s;
  

  /* benchmark("naive", naive_dgemm, m, n, k); */
  /* benchmark("slow", slow_dgemm, m, n, k); */
  /* benchmark("blocked", blocked_dgemm, m, n, k); */

  benchmark("naive_4x4", naive_4x4_dgemm, m, n, k);
  benchmark("slow_4x4", slow_4x4_dgemm, m, n, k);
  benchmark("fast_4x4", fast_4x4_dgemm, m, n, k);
}
