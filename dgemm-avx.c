#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "Naive, three-loop dgemm.";
const int L1_BLOCK_SIZE = 256;
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

/* void do_4x4_blockc(int M, int N, int K, int depth,  double* cA, double* cB, double* C) { */
/*   __m256d bx0, bx1, bx2, bx3; */

/*   __m256d acol; */

/*   double* C0p = C; */
/*   double* C1p = C + M; */
/*   double* C2p = C + M * 2; */
/*   double* C3p = C + M * 3; */
  
/*   __m256d c0 = _mm256_loadu_pd(C0p); */
/*   __m256d c1 = _mm256_loadu_pd(C1p); */
/*   __m256d c2 = _mm256_loadu_pd(C2p); */
/*   __m256d c3 = _mm256_loadu_pd(C3p); */

  

/*   for (int i = 0; i < depth; i++) { */
/*     acol = _mm256_loadu_pd(cA); */
/*     cA += 4; */
    
/*     bx0 = _mm256_broadcast_sd(cB++); */
/*     bx1 = _mm256_broadcast_sd(cB++); */
/*     bx2 = _mm256_broadcast_sd(cB++); */
/*     bx3 = _mm256_broadcast_sd(cB++); */

/*     c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0)); */
/*     c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1)); */
/*     c2 = _mm256_add_pd(c2, _mm256_mul_pd(acol, bx2)); */
/*     c3 = _mm256_add_pd(c3, _mm256_mul_pd(acol, bx3)); */

    
/*   } */

/*   _mm256_storeu_pd(C0p, c0); */
/*   _mm256_storeu_pd(C1p, c1); */
/*   _mm256_storeu_pd(C2p, c2); */
/*   _mm256_storeu_pd(C3p, c3); */
/* } */

void do_l1_block(int M, int N, int K, int idepth, int jdepth, int kdepth, double* A, double* B, double* C) {
  
  int i, j, k;
  int rboundary = jdepth - (jdepth % 4);
  int bboundary = idepth - (idepth % 4);

  /* double continuousA[bboundary * kdepth]; */
  /* double continuousB[kdepth * 4]; */

  /* double* cAp = continuousA; */
  /* for (i = 0; i < bboundary; i += 4) { */
   
  /*   double* App = A + i; */
  /*   for (k = 0; k < kdepth; k++) { */
  /*     *cAp++ = App[0]; */
  /*     *cAp++ = App[1]; */
  /*     *cAp++ = App[2]; */
  /*     *cAp++ = App[3]; */
  /*     App = App + M; */
  /*   } */
  /* } */
    
  
  
  for (i = 0; i < bboundary; i += 4) {

    /* double* cBp = continuousB; */

    /* double* B0 = B + j * K; */
    /* double* B1 = B + (j + 1) * K; */
    /* double* B2 = B + (j + 2) * K; */
    /* double* B3 = B + (j + 3) * K; */
    
    /* for (int n = 0; n < kdepth; n++) { */
    /*   *cBp++ = *B0++; */
    /*   *cBp++ = *B1++; */
    /*   *cBp++ = *B2++; */
    /*   *cBp++ = *B3++; */
    /* } */
    
    for (j = 0; j < rboundary ; j += 4) {
      for (k = 0; k < kdepth - 3; k += 4) {
 	/* do_4x4_blockc(M, N, K, 4, continuousA + i * kdepth + k * 4, continuousB + 4 * k, C + i + j * M); */
	do_4x4_block(M, N, K, 4, A + i + k * M, B + k + j * K, C + i + j * M);
      }
      if (kdepth - k > 0) {
	/* do_4x4_blockc(M, N, K, kdepth - k, continuousA + i * kdepth + k * 4, continuousB + 4 * k, C + i + j * M); */
      	do_4x4_block(M, N, K, kdepth - k, A + i + k * M, B + k + j * K, C + i + j * M);
      }	
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
    int k2depth = min(L2_BLOCK_SIZE, K - k2);
    for (int j2 = 0; j2 < N; j2 += L2_BLOCK_SIZE) {
      int j2depth = min(L2_BLOCK_SIZE, N - j2);
      for (int i2 = 0; i2 < M; i2 += L2_BLOCK_SIZE) {
	int i2depth = min(L2_BLOCK_SIZE, M - i2);

	/* L1 Blocking */
        for (int k1 = 0; k1 < k2depth; k1 += L1_BLOCK_SIZE) {
	  int k1depth = min(L1_BLOCK_SIZE, k2depth - k1);
	  for (int j1 = 0; j1 < j2depth; j1 += L1_BLOCK_SIZE) {
	    int j1depth = min(L1_BLOCK_SIZE, j2depth - j1);
	    for (int i1 = 0; i1 < i2depth; i1 += L1_BLOCK_SIZE) {
	      int i1depth = min(L1_BLOCK_SIZE, i2depth - i1);

	      do_l1_block(M, N, K, i1depth, j1depth, k1depth, A + i1 + i2 + (k1 + k2) * M, B + k1 + k2 + (j1 + j2) * K, C + i1 + i2 + (j1 + j2) * M);

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
