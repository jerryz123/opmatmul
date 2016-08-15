#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "Naive, three-loop dgemm.";
const int L1_BLOCK_SIZE = 32;
const int L2_BLOCK_SIZE = 512;

/* L1 Block size should be an increment of L2 block size */

void transpose (int m, int n, double* A, double* At)
{
  for (int i = 0; i < m; ++i)
    {
      for (int j = 0; j < n; ++j)
	{
	  At[j+i*n] = A[i+j*m];
	}
    }
}
/* A is M by K
 * B is K by N
 * C is M by N*/
void do_4x4_block(int M, int N, int K, int depth,  double* A, double* B, double* C) {
  __m256d bx0, bx1, bx2, bx3;

  __m256d acol;

  double* C0p = C;
  double* C1p = C + M;
  double* C2p = C + M * 2;
  double* C3p = C + M * 3;
  
  __m256d c0 = _mm256_loadu_pd(C0p);
  __m256d c1 = _mm256_loadu_pd(C1p);
  __m256d c2 = _mm256_loadu_pd(C2p);
  __m256d c3 = _mm256_loadu_pd(C3p);

  double* B0 = B;
  double* B1 = B + K;
  double* B2 = B + K * 2;
  double* B3 = B + K * 3;

  for (int i = 0; i < depth; i++) {
    acol = _mm256_loadu_pd(A);
    A += M;
    
    bx0 = _mm256_broadcast_sd(B0++);
    bx1 = _mm256_broadcast_sd(B1++);
    bx2 = _mm256_broadcast_sd(B2++);
    bx3 = _mm256_broadcast_sd(B3++);

    c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0));
    c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1));
    c2 = _mm256_add_pd(c2, _mm256_mul_pd(acol, bx2));
    c3 = _mm256_add_pd(c3, _mm256_mul_pd(acol, bx3));

    
  }

  _mm256_storeu_pd(C0p, c0);
  _mm256_storeu_pd(C1p, c1);
  _mm256_storeu_pd(C2p, c2);
  _mm256_storeu_pd(C3p, c3);
}

void do_bfringex4_block(int M, int N, int K, int depth, double* A, double* B, double* C, int bfringe) {
  if (bfringe == 3) {
    __m128d bx0, bx1, bx2, bx3;

    __m128d acol;
    double a;

    double* C0p = C;
    double* C1p = C + M;
    double* C2p = C + M * 2;
    double* C3p = C + M * 3;

    __m128d c0 = _mm_loadu_pd(C0p);
    __m128d c1 = _mm_loadu_pd(C1p);
    __m128d c2 = _mm_loadu_pd(C2p);
    __m128d c3 = _mm_loadu_pd(C3p);

    double* c03 = C0p + 2;
    double* c13 = C1p + 2;
    double* c23 = C2p + 2;
    double* c33 = C3p + 2;

    double tempc03 = *c03;
    double tempc13 = *c13;
    double tempc23 = *c23;
    double tempc33 = *c33;
    
    double* B0 = B;
    double* B1 = B + K;
    double* B2 = B + K * 2;
    double* B3 = B + K * 3;

    for (int i = 0; i < depth; i++) {
      acol = _mm_loadu_pd(A);
      a = A[2];
      A += M;

      tempc03 += (*B0)*a;
      tempc13 += (*B1)*a;
      tempc23 += (*B2)*a;
      tempc33 += (*B3)*a;

      bx0 = _mm_load1_pd(B0++);
      bx1 = _mm_load1_pd(B1++);
      bx2 = _mm_load1_pd(B2++);
      bx3 = _mm_load1_pd(B3++);

      c0 = _mm_add_pd(c0, _mm_mul_pd(acol, bx0));
      c1 = _mm_add_pd(c1, _mm_mul_pd(acol, bx1));
      c2 = _mm_add_pd(c2, _mm_mul_pd(acol, bx2));
      c3 = _mm_add_pd(c3, _mm_mul_pd(acol, bx3));
    
    }
    
    _mm_storeu_pd(C0p, c0);
    _mm_storeu_pd(C1p, c1);
    _mm_storeu_pd(C2p, c2);
    _mm_storeu_pd(C3p, c3);
    
    *c03 = tempc03;
    *c13 = tempc13;
    *c23 = tempc23;
    *c33 = tempc33;
  } else if (bfringe == 2) {
    __m128d bx0, bx1, bx2, bx3;

    __m128d acol;


    double* C0p = C;
    double* C1p = C + M;
    double* C2p = C + M * 2;
    double* C3p = C + M * 3;

    __m128d c0 = _mm_loadu_pd(C0p);
    __m128d c1 = _mm_loadu_pd(C1p);
    __m128d c2 = _mm_loadu_pd(C2p);
    __m128d c3 = _mm_loadu_pd(C3p);
    
    double* B0 = B;
    double* B1 = B + K;
    double* B2 = B + K * 2;
    double* B3 = B + K * 3;

    for (int i = 0; i < depth; i++) {
      acol = _mm_loadu_pd(A);
      A += M;

      bx0 = _mm_load1_pd(B0++);
      bx1 = _mm_load1_pd(B1++);
      bx2 = _mm_load1_pd(B2++);
      bx3 = _mm_load1_pd(B3++);

      c0 = _mm_add_pd(c0, _mm_mul_pd(acol, bx0));
      c1 = _mm_add_pd(c1, _mm_mul_pd(acol, bx1));
      c2 = _mm_add_pd(c2, _mm_mul_pd(acol, bx2));
      c3 = _mm_add_pd(c3, _mm_mul_pd(acol, bx3));
    
    }
    
    _mm_storeu_pd(C0p, c0);
    _mm_storeu_pd(C1p, c1);
    _mm_storeu_pd(C2p, c2);
    _mm_storeu_pd(C3p, c3);
    
  } else if (bfringe == 1) {

    double a;

    double* C0p = C;
    double* C1p = C + M;
    double* C2p = C + M * 2;
    double* C3p = C + M * 3;

    double tempc0 = *C0p;
    double tempc1 = *C1p;
    double tempc2 = *C2p;
    double tempc3 = *C3p;
    
    double* B0 = B;
    double* B1 = B + K;
    double* B2 = B + K * 2;
    double* B3 = B + K * 3;

    for (int i = 0; i < depth; i++) {
      a = *A;
      A += M;

      tempc0 += (*B0)*a;
      tempc1 += (*B1)*a;
      tempc2 += (*B2)*a;
      tempc3 += (*B3)*a;

      B0++;
      B1++;
      B2++;
      B3++;    
    }
    *C0p = tempc0;
    *C1p = tempc1;
    *C2p = tempc2;
    *C3p = tempc3;
  
  }
}
    
/* A is M by K
 * B is K by N
 * C is M by N 
 * idepth is number of rows in A to handle
 * jdepth is number of columns in B to handle
 * kdepth is number of columns in A, rows in B to handle
 * A, B, C should point to (0, 0) location in each matrix, stored in column-major format */
void do_l1_block(int M, int N, int K, int idepth, int jdepth, int kdepth, double* A, double* B, double* C) {
  
  int i, j, k;
  int bfringe = idepth % 4;
  int rfringe = jdepth % 4;
  int rboundary = jdepth - rfringe;
  int bboundary = idepth - bfringe;
  

  for (j = 0; j < rboundary; j += 4) {    
    for (i = 0; i < bboundary ; i += 4) {
      do_4x4_block(M, N, K, kdepth, A + i, B + j * K, C + i + j * M);
    }
    do_bfringex4_block(M, N, K, kdepth, A + i, B + j * K, C + i + j * M, bfringe);
    
  }
  
  /* handle right fringe */
  for (int i = 0; i < idepth; i++ ) {
    for (int j = rboundary; j < jdepth; j++ ) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++ ) {
  	t += A[i+k*M] * B[k+j*K];
      }
      C[i+j*M] = t;
    }
  }

  /* /\* handle bottom fringe *\/ */
  /* for (int i = bboundary; i < idepth; i++) { */
  /*   for (int j = 0; j < jdepth; j++) { */
  /*     double t = C[i+j*M]; */
  /*     for (int k = 0; k < kdepth; k++ ) { */
  /* 	t += A[i+k*M] * B[k+j*K]; */
  /*     } */
  /*     C[i+j*M] = t; */
  /*   } */
  /* } */

}


    
/* This routine performs a dgemm operation
 *  C := C + A * B
 * where A is M x K,
 *       B is K x N,
 *       C is M x N
 * All in column-major format
 * On  exit, A and B maintain their input values. */  
void my_dgemm (int M, int N, int K, double* A, double* B, double* C) {
  /* L2 Blocking */
  for (int k2 = 0; k2 < K; k2 += L2_BLOCK_SIZE) {
    int k2end = min(k2 + L2_BLOCK_SIZE, K);
    for (int j2 = 0; j2 < N; j2 += L2_BLOCK_SIZE) {
      int j2end = min(j2 + L2_BLOCK_SIZE, N);
      for (int i2 = 0; i2 < M; i2 += L2_BLOCK_SIZE) {
	int i2end = min(i2 + L2_BLOCK_SIZE, M);

	/* L1 Blocking */
        for (int k1 = k2; k1 < k2end; k1 += L1_BLOCK_SIZE) {
	  int k1depth = min(L1_BLOCK_SIZE, k2end - k1);
	  for (int j1 = j2; j1 < j2end; j1 += L1_BLOCK_SIZE) {
	    int j1depth = min(L1_BLOCK_SIZE, j2end - j1);
	    for (int i1 = i2; i1 < i2end; i1 += L1_BLOCK_SIZE) {
	      int i1depth = min(L1_BLOCK_SIZE, i2end - i1);

	      do_l1_block(M, N, K, i1depth, j1depth, k1depth, A + i1 + k1 * M, B + k1 + j1 * K, C + i1 + j1 * M);

	    }
	  }
	}
	
      }
    }
  }
}


void square_dgemm (int lda, double* A, double* B, double* C)
{
  my_dgemm(lda, lda, lda, A, B, C);
}
