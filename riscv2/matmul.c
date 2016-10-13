#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include <time.h>

#define min(a,b) (((a)<(b))?(a):(b))

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
    p[i] = rand() % 10;
    p[i] = 1;

  }
}

void printmatrix (int m, int n, double* M) {
  printf("\n");
  for (int i = 0; i < m; i++)
    {
      for(int j = 0; j < n; j++)
	printf("%.3f\t ", M[i+j*m]);
      printf("\n");
    }
  printf("\n");
}

void naive_dgemm(int M, int N, int K, double* A, double* B, double* C) {
  for (int m = 0; m < M; m++) {
    for (int n = 0; n < N; n++) {
      double t = C[m + n * M];
      for (int k = 0; k < K; k++) {
  	double a = A[k + m * K];
  	double b = B[k + n * K];
  	t += a * b;
      }
      C[m + n * M] = t;
    }
  }
}

void opt1_2x2_dgemm(int M, int N, int K, int kdepth, double* __restrict__ A, double* __restrict__ B, double* __restrict__ C) {
  for (int m = 0; m < 2; m++) {
    for (int n = 0; n < 2; n++) {
      double t = C[m + n * M];
     
      /* double* restrict Bp = B + n * K; */
      
      /* asm("li %%t0, 0  \n\t" : "=f" (t) :"f" (Ap), "f" (Bp), "f" (t) : "t0"); */
      
      for (int k = 0; k < kdepth; k++) {
      	double a = A[k + m * K];
      	double b = B[k + n * K];
      	asm ("fmadd.d %0, %1, %2, %3\n\t":"=f" (t): "f" (a), "f" (b), "f" (t) : "memory");

      }
      C[m + n * M] = t;
    }
  }
}



void opt2_2x2_dgemm(int M, int N, int K, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  double c00 = *C;
  double c10 = *(C + 1);
  double c01 = *(C + M);
  double c11 = *(C + M + 1);

  double* restrict ar0 = A;
  double* restrict ar1 = A + K;

  double* restrict bc0 = B;
  double* restrict bc1 = B + K;

  double a0, a1, b0, b1;

  asm("# begin kloop");
  for (int k = 0; k < kdepth; k++) {
    a0 = *ar0++;
    a1 = *ar1++;
    b0 = *bc0++;
    b1 = *bc1++;
    c00 += a0 * b0;
    c10 += a1 * b0;
    c01 += a0 * b1;
    c11 += a1 * b1;
  }
  *C = c00;
  *(C + 1) = c10;
  *(C + M) = c01;
  *(C + M + 1) = c11;
}

void slow_2x2_dgemm(int M, int N, int K, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  for (int m = 0; m < 2 ; m++) {
    for (int n = 0; n < 2; n++) {
      for (int k = 0; k < kdepth; k++) {

	C[m + n * M] += A[k + m * K] * B[k + n * K];

      }
   
    }
  }
}
void opt1_4x4_dgemm(int M, int N, int K, int kdepth, double* __restrict__ A, double* __restrict__ B, double* __restrict__ C) {
  for (int m = 0; m < 4; m++) {
    for (int n = 0; n < 4; n++) {
      double t = C[m + n * M];
      for (int k = 0; k < kdepth; k++) {
  	double a = A[k + m * K];
  	double b = B[k + n * K];
  	t += a * b;
      }
      C[m + n * M] = t;
    }
  }
}

void opt2_4x4_dgemm(int M, int N, int K, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  double* restrict C0 = C;
  double* restrict C1 = C + M;
  double* restrict C2 = C + M * 2;
  double* restrict C3 = C + M * 3;
  
  double c00 = C0[0];
  double c01 = C1[0];
  double c02 = C2[0];
  double c03 = C3[0];
  
  double c10 = C0[1];
  double c11 = C1[1];
  double c12 = C2[1];
  double c13 = C3[1];
  
  double c20 = C0[2];
  double c21 = C1[2];
  double c22 = C2[2];
  double c23 = C3[2];
  
  double c30 = C0[3];
  double c31 = C1[3];
  double c32 = C2[3];
  double c33 = C3[3];

  double* restrict ar0 = A;
  double* restrict ar1 = A + K;
  double* restrict ar2 = A + K * 2;
  double* restrict ar3 = A + K * 3;

  double* restrict bc0 = B;
  double* restrict bc1 = B + K;
  double* restrict bc2 = B + K * 2;
  double* restrict bc3 = B + K * 3;

  double a0, a1, a2, a3, b0, b1, b2, b3;

  asm("# begin kloop");
  for (int k = 0; k < kdepth; k++) {
    a0 = ar0[k];
    a1 = ar1[k];
    a2 = ar2[k];
    a3 = ar3[k];
    b0 = bc0[k];
    b1 = bc1[k];
    b2 = bc2[k];
    b3 = bc3[k];

    c00 += a0 * b0;
    c01 += a0 * b1;
    c02 += a0 * b2;
    c03 += a0 * b3;

    c10 += a1 * b0;
    c11 += a1 * b1;
    c12 += a1 * b2;
    c13 += a1 * b3;

    c20 += a2 * b0;
    c21 += a2 * b1;
    c22 += a2 * b2;
    c23 += a2 * b3;

    c30 += a3 * b0;
    c31 += a3 * b1;
    c32 += a3 * b2;
    c33 += a3 * b3;
    
  }


  C0[3] = c30;
  C1[3] = c31;
  C2[3] = c32;
  C3[3] = c33;
  C0[2] = c20;
  C1[2] = c21;
  C2[2] = c22;
  C3[2] = c23;
  C0[1] = c10;
  C1[1] = c11;
  C2[1] = c12;
  C3[1] = c13;
  C0[0] = c00;
  C1[0] = c01;
  C2[0] = c02;
  C3[0] = c03; 
}

void slow_4x4_dgemm(int M, int N, int K, int kdepth, double* restrict A, double* restrict B, double* restrict C) {
  for (int m = 0; m < 4 ; m++) {
    for (int n = 0; n < 4; n++) {
      for (int k = 0; k < kdepth; k++) {

	C[m + n * M] += A[k + m * K] * B[k + n * K];

      }
   
    }
  }
}

void blocked_dgemm(int M, int N, int K, int block, double* restrict A, double* restrict B, double* restrict C, void (*f)(int, int, int, int, double* restrict, double* restrict, double* restrict)) {
  double* restrict Ap;
  double* restrict Cp;
  for (int n = 0; n < N; n += block){
    Cp = C;
    Ap = A;
    for (int m = 0; m < M; m += block){
      (*f)(M, N, K, K, Ap, B, Cp);
      Ap += K * block;
      Cp += block;
    }
    C += M * block;
    B += K * block;
  }
}
	
void benchmark_once(void (*f)(int, int, int, int, double* restrict, double* restrict, double* restrict), int m, int n, int k, int block) {
  if (m % block || n % block || k % block) {
    printf("Error\n");
    return;
  }
  double* A = (double*)malloc(m * k * sizeof(double));
  double* B = (double*)malloc(k * n * sizeof(double));
  double* C = (double*)malloc(m * n * sizeof(double));
  double* Co = (double*)malloc(m * n * sizeof(double));

  fill(A, m * k);
  fill(B, k * n);
  fill(C, m * n);

  blocked_dgemm(m, n, k, block, A, B, C, f);

  int instructions = rdinstret();
  blocked_dgemm(m, n, k, block, A, B, C, f);
  instructions = rdinstret() - instructions;
  
  int cycles = rdcycle();
  blocked_dgemm(m, n, k, block, A, B, C, f);
  cycles = rdcycle() - cycles;

  
  memset(C, 0, m * n * sizeof(C));
  memset(Co, 0, m * n * sizeof(Co));



  blocked_dgemm(m, n, k, block, A, B, C, f);

  naive_dgemm(m, n, k, A, B, Co);

  
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
  printf("%d\t%d\t%d\t%d\t%d\t%d\n", m, n, k, block, cycles, instructions);
}




	
int main (int argc, char **argv) {
  int c = 16;
  if (argc == 2) {
    c = atoi(argv[1]);
  }
  int m = c;
  int n = c;
  int k = c;
  
  printf("Name\tM\tN\tK\tBlock\tCycles\tInstructions\n");
  
  printf("Slow\t");
  benchmark_once(slow_2x2_dgemm, c, c, k, 2);

  printf("Opt1\t");
  benchmark_once(opt1_2x2_dgemm, c, c, k, 2);

  printf("Opt2\t");
  benchmark_once(opt2_2x2_dgemm, c, c, k, 2);

  

  printf("Slow\t");
  benchmark_once(slow_4x4_dgemm, c, c, k, 4);

  printf("Opt1\t");
  benchmark_once(opt1_4x4_dgemm, c, c, k, 4);

  printf("Opt2\t");
  benchmark_once(opt2_4x4_dgemm, c, c, k, 4);
  
}