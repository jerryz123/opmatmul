#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "mydgemm";
const int L1_BLOCK_SIZE = 32;
const int L2_BLOCK_SIZE = 160;

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
 * C is M by N 
 * idepth is number of rows in A to handle
 * jdepth is number of columns in B to handle
 * kdepth is number of columns in A, rows in B to handle
 * A, B, C should point to (0, 0) location in each matrix, stored in column-major format */
void do_l1_block(int M, int N, int K, int idepth, int jdepth, int kdepth, const double* restrict A, const double* restrict B, double* restrict C) {
  for (auto i = 0; i < idepth; i++) {
    for (auto j = 0; j < jdepth; j++) {
      double c = C[i+j*M];
      
      for (auto k = 0; k < kdepth; k++) {
	double av = A[i+k*M];
	double bv = B[k+j*K];
	c += av * bv;
      }
      C[i+j*M] = c;
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

void square_dgemm_l1l2 (int lda, double* A, double* B, double* C, int L1, int L2) {
  int M = lda;
  int N = lda;
  int K = lda;
  /* L2 Blocking */
  for (int k2 = 0; k2 < K; k2 += L2) {
    int k2end = min(k2 + L2, K);
    for (int j2 = 0; j2 < N; j2 += L2) {
      int j2end = min(j2 + L2, N);
      for (int i2 = 0; i2 < M; i2 += L2) {
	int i2end = min(i2 + L2, M);

	/* L1 Blocking */
        for (int k1 = k2; k1 < k2end; k1 += L1) {
	  int k1depth = min(L1, k2end - k1);
	  for (int j1 = j2; j1 < j2end; j1 += L1) {
	    int j1depth = min(L1, j2end - j1);
	    for (int i1 = i2; i1 < i2end; i1 += L1) {
	      int i1depth = min(L1, i2end - i1);

	      do_l1_block(M, N, K, i1depth, j1depth, k1depth, A + i1 + k1 * M, B + k1 + j1 * K, C + i1 + j1 * M);

	    }
	  }
	}
	
      }
    }
  }
}
