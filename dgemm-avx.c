#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "Naive, three-loop dgemm.";
const int L1_BLOCK_SIZE = 32;
const int L2_BLOCK_SIZE = 256;

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

  __m256d c0 = _mm256_loadu_pd(C);
  __m256d c1 = _mm256_loadu_pd(C+M);
  __m256d c2 = _mm256_loadu_pd(C+2*M);
  __m256d c3 = _mm256_loadu_pd(C+3*M);

  double* B0 = B;
  double* B1 = B + K;
  double* B2 = B + K * 2;
  double* B3 = B + K * 3;

  for (int i = 0; i < depth; i++) {
    acol = _mm256_loadu_pd(A);
    A += M;
    
    bx0 = _mm256_broadcast_sd(B0);
    bx1 = _mm256_broadcast_sd(B1);
    bx2 = _mm256_broadcast_sd(B2);
    bx3 = _mm256_broadcast_sd(B3);

    B0++;
    B1++;
    B2++;
    B3++;

    c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0));
    c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1));
    c2 = _mm256_add_pd(c2, _mm256_mul_pd(acol, bx2));
    c3 = _mm256_add_pd(c3, _mm256_mul_pd(acol, bx3));

    
  }

  _mm256_storeu_pd(C, c0);
  _mm256_storeu_pd(C+M, c1);
  _mm256_storeu_pd(C+2*M, c2);
  _mm256_storeu_pd(C+3*M, c3);
}

void do_l1_block(int M, int N, int K, int idepth, int jdepth, int kdepth, double* A, double* B, double* C) {
  
  int i, j, k;
  int rboundary = jdepth - (jdepth % 4);
  int bboundary = idepth - (idepth % 4);
  for (j = 0; j < rboundary; j += 4) {
    for (i = 0; i < bboundary ; i += 4) {
      for (k = 0; k < kdepth - 3; k += 4) {
	do_4x4_block(M, N, K, 4, A + i + k * M, B + k + j * N, C + i + j * M);
      }
      if (kdepth - k > 0) {
      	do_4x4_block(M, N, K, kdepth - k, A + i + k * M, B + k + j * N, C + i + j * M);
      }	
    }
  }
  /* handle right fringe */
  for (int i = 0; i < bboundary; i++ ) {
    for (int j = rboundary; j < jdepth; j++ ) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++ ) {
  	t += A[i+k*M] * B[k+j*N];
      }
      C[i+j*M] = t;
    }
  }

  /* handle bottom fringe */
  for (int i = bboundary; i < idepth; i++) {
    for (int j = 0; j < jdepth; j++) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++ ) {
  	t += A[i+k*M] * B[k+j*N];
      }
      C[i+j*M] = t;
    }
  }
}

void do_l2_block(int M, int N, int K, int idepth, int jdepth, int kdepth, double* A, double* B, double* C) {
  for (int k = 0; k < kdepth; k += L1_BLOCK_SIZE) {
    int kdepth1 = min(L1_BLOCK_SIZE, kdepth - k);
    for (int j = 0; j < jdepth; j += L1_BLOCK_SIZE) {
      int jdepth1 = min(L1_BLOCK_SIZE, jdepth - j);
      for (int i = 0; i < idepth; i += L1_BLOCK_SIZE) {
	int idepth1 = min(L1_BLOCK_SIZE, idepth - i);

	do_l1_block(M, N, K, idepth1, jdepth1, kdepth1, A + i + k * M, B + k + j * N, C + i + j * M);
      }
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

  for (int k = 0; k < K; k += L2_BLOCK_SIZE) {
    int kdepth = min(L2_BLOCK_SIZE, K - k);
    for (int j = 0; j < N; j += L2_BLOCK_SIZE) {
      int jdepth = min(L2_BLOCK_SIZE, N - j);
      for (int i = 0; i < M; i += L2_BLOCK_SIZE) {
	int idepth = min(L2_BLOCK_SIZE, M - i);
	
	do_l2_block(M, N, K, idepth, jdepth, kdepth, A + i + k * M, B + k + j * N, C + i + j * M);
      }
    }
  }
}


void square_dgemm (int lda, double* A, double* B, double* C)
{
  dgemm(lda, lda, lda, A, B, C);
  
  
}
