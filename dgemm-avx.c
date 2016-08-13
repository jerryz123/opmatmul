#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "Naive, three-loop dgemm.";
const int L1_BLOCK_SIZE = 32;
const int L2_BLOCK_SIZE = 512;

/* L1 Block size should be an increment of L2 block size */

void printmatrix (int m, int n, double* M) {
  for (int i = 0; i < m; i++)
    {
      for(int j = 0; j < n; j++)
	printf("%f     ", M[i+j*m]);
      printf("\n");
    }
}
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
/* A is M by K
 * B is K by N
 * C is M by N 
 * idepth is number of rows in A to handle
 * jdepth is number of columns in B to handle
 * kdepth is number of columns in A, rows in B to handle
 * A, B, C should point to (0, 0) location in each matrix, stored in column-major format */
void do_l1_block(int M, int N, int K, int idepth, int jdepth, int kdepth, double* A, double* B, double* C) {
  
  int i, j, k;
  int rboundary = jdepth - (jdepth % 4);
  int bboundary = idepth - (idepth % 4);

  for (j = 0; j < rboundary; j += 4) {    
    for (i = 0; i < bboundary ; i += 4) {
      do_4x4_block(M, N, K, kdepth, A + i, B + j * K, C + i + j * M);
    }
  }
  
  /* handle right fringe */
  for (int i = 0; i < bboundary; i++ ) {
    for (int j = rboundary; j < jdepth; j++ ) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++ ) {
  	t += A[i+k*M] * B[k+j*K];
      }
      C[i+j*M] = t;
    }
  }

  /* handle bottom fringe */
  for (int i = bboundary; i < idepth; i++) {
    for (int j = 0; j < jdepth; j++) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++ ) {
  	t += A[i+k*M] * B[k+j*K];
      }
      C[i+j*M] = t;
    }
  }
}


    
/* This routine performs a dgemm operation
 *  C := C + A * B
 * where A is M x K,
 *       B is K x N,
 *       C is M x N
 * All in column-major format
 * On  exit, A and B maintain their input values. */  
void dgemm (int M, int N, int K, double* A, double* B, double* C) {
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
  dgemm(lda, lda, lda, A, B, C);
  
  
}
