#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <float.h>
#include <math.h>


#ifdef GETTIMEOFDAY
#include <sys/time.h>
#else
#include <time.h>
#endif

#define min(a,b) (((a)<(b))?(a):(b))
/* #include <mkl.h> */

/* void reference_dgemm (int N, double* A, double* B, double* C) { */
/*   cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, A, N, B, N, 1, C, N); */
/* } */


typedef double vector __attribute__((vector_size(4 * sizeof(double))));

/* double wall_time () { */
/* #ifdef GETTIMEOFDAY */
/*   struct timeval t; */
/*   gettimeofday (&t, NULL); */
/*   return 1.*t.tv_sec + 1.e-6*t.tv_usec; */
/* #else */
/*   struct timespec t; */
/*   clock_gettime (CLOCK_MONOTONIC, &t); */
/*   return 1.*t.tv_sec + 1.e-9*t.tv_nsec; */
/* #endif */
/* } */

void fill (double* p, int n) {
  for (int i = 0; i < n; i++) {
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

void naive_dgemm(int n, double* __restrict__ A, double* __restrict__ B, double* __restrict__ C) {
 
  for (int i = 0; i < n; i++) {
    
    for (int j = 0; j < n; j++) {
      double t = C[i + j * n];
      
      for (int k = 0; k < n; k++) {
	
  	double a = A[i + k * n];
  	double b = B[k + j * n];
  	t += a * b;
      }
      C[i + j * n] = t;
    }
  }
}

void do_4x4_block(int n, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  vector c[4];
  for (int j = 0; j < 4; j++) {
    asm("# initial memcopy");
    memcpy(c + j, C + n * j, 32);
  }
  
  for (int k = 0; k < kdepth; k++) {
    vector a;
    memcpy(&a, A + k * n, 32);
    for (int j = 0; j < 4; j++) {
      double bv = B[k + j * n];
      vector b = {bv, bv, bv, bv};

      c[j] += a * b;
    }
  }
  for (int j = 0; j < 4; j++) {
    asm("# final memcopy");
    memcpy(C + n * j, c + j, 32);
  }
  /* vector c; */
  /* for (int j = 0 ; j < 4; j++) { */
  /*   memcpy(&c, C, 32); */
  /*   for (int k = 0 ; k < kdepth ; k++) { */
  /*     vector a; */
  /*     memcpy(&a, A + k * n, 32); */
  /*     double bv = B[k + j * n]; */
  /*     vector b = {bv, bv, bv, bv}; */
  /*     c += a * b; */
  /*     /\* for (int i = 0; i < 4; i++) { *\/ */
  /*     /\* 	 C[i + j * n] += A[i + k * n] * B[k + j * n]; *\/ */
  /*     /\* } *\/ */
  /*   } */
  /*   memcpy(C, &c, 32); */
  /*   C += n; */
  /* } */
  /* double a, b, c; */
  /* for (int j = 0; j < 4; j++) { */
  /*   for (int i = 0; i < 4; i++) { */
  /*     c = C[i + j * n]; */
  /*     for (int k = 0; k < n; k++) { */
  /* 	a = A[i + k * n]; */
  /* 	b = B[k + j * n]; */
  /* 	c += a * b; */
  /*     } */
  /*     C[i + j * n] = c; */
  /*   } */
  /* } */
}


void avx_dgemm_slow(int n, double* restrict A, double* restrict B, double* restrict C) {
  for (int k = 0; k < n; k += 32){
    int kend = min(k + 32, n);
    for (int j = 0; j < n; j += 32){
      int jend = min(j + 32, n);
      for (int i = 0; i < n; i += 32){
	int iend = min(i + 32, n);
	
	int bfringe = (iend - i) % 4;
	int rfringe = (jend - j) % 4;

	int bboundary = iend - bfringe;
	int rboundary = jend - rfringe;

	int i1, j1, k1;
	for (j1 = j; j1 < rboundary; j1 += 4){
	  for (i1 = i; i1 < bboundary; i1 += 4){
	    /* printf("%d\t%d\t%d\n", j1, i1, k); */
	    do_4x4_block(n, kend - k, A + i1 + k * n, B + k + j1 * n, C + i1 + j1 * n);
	  }
	  
	}
	for (j1 = j; j1 < rboundary; j1++) {
	  for (i1 = bboundary ; i1 < iend; i1++) {
	    for (k1 = k; k1 < kend; k1 ++) {
	      C[i1 + j1 * n] += A[i1 + k1 * n] * B[k1 + j1 * n];
	    }
	  }
	}
	for (i1 = i; i1 < bboundary; i1 ++) {
	  for (j1 = rboundary; j1 < jend; j1++) {
	    for (k1 = k; k1 < kend; k1++) {
	      C[i1 + j1 * n] += A[i1 + k1 * n] * B[k1 + j1 * n];
	    }
	  }
	}
	for (i1 = bboundary; i1 < iend; i1++) {
	  for (j1 = rboundary; j1 < jend; j1++) {
	    for (k1 = k; k1 < kend; k1++) {
	      C[i1 + j1 * n] += A[i1 + k1 * n] * B[k1 + j1 * n];
	    }
	  }
	}
      }
    }
  }
}
	
	
void test(int n, double* A, double* B, double* C) {
  
  for (int i = 0; i < n; i++) {
    C[i] = A[i] + B[i];
  }
  
}

void benchmark (char* desc, void (*f)(int, double*, double*, double*), int* test_sizes, int nsizes) {

  printf("%s\nSize:\tGflops\n", desc);
  for (int isize = 0; isize < nsizes; isize++) {
    int n = test_sizes[isize];

    double A[n*n];
    double B[n*n];
    double C[n*n];
    
    /* fill(A, n * n); */
    /* fill(B, n * n); */
    /* fill(C, n * n); */
 
    double Gflops_s, seconds = -1.0;
    double timeout = 0.1;

    
    int n_iterations = 1;
    for (int it = 0; it < n_iterations; it++) {
      (*f)(n, A, B, C);
    }
    /* Gflops_s = 2.e-9 * n_iterations * n * n * n / seconds; */
    Gflops_s = 0;
    
    printf("%d\t%.3g\n", n, Gflops_s);

    memset(C, 0, n * n * sizeof(double));

    double* Co = (double*)malloc(n * n * sizeof(double));
    memset(Co, 0, n * n * sizeof(double));

    naive_dgemm(n, A, B, Co);
    (*f)(n, A, B, C);

    for (int i = 0; i < n * n; i++) {
      if (fabs(C[i] - Co[i]) > 0.01) {
    	perror("error in matrix multiply");
    	printmatrix(n, n, C);
    	printmatrix(n, n, Co);
    	exit(EXIT_FAILURE);
      }
    }
  }
}
	

    

int main (int argc, char **argv) {
  int test_sizes[] = {4, 6, 7, 8, 16, 32, 64, 65, 66, 67, 128, 153, 185, 251, 285, 301, 339};
  
  int nsizes = sizeof(test_sizes) / sizeof(int);
  int nmax = test_sizes[nsizes - 1];
 

  /* benchmark("reference", reference_dgemm, test_sizes, nsizes, A, B, C); */
  /* benchmark("naive", naive_dgemm, test_sizes, nsizes, A, B, C); */

  benchmark("avx_slow", avx_dgemm_slow, test_sizes, nsizes);


}
