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
 * C is M by N*/
void do_4x4_block(int M, int N, int K, int depth,  const double* restrict A, const double* restrict B, double* restrict C) {
 
  double* restrict B0 = B;
  double* restrict B1 = B + K;
  double* restrict B2 = B + K * 2;
  double* restrict B3 = B + K * 3;

  double* restrict Cp = C;
  
  double b0, b1, b2, b3;
  
  double a0, a1, a2, a3;

  double c00 = C[0];
  double c01 = C[1];
  double c02 = C[2];
  double c03 = C[3];
  C += M;
  double c10 = C[0];
  double c11 = C[1];
  double c12 = C[2];
  double c13 = C[3];
  C += M;
  double c20 = C[0];
  double c21 = C[1];
  double c22 = C[2];
  double c23 = C[3];
  C += M;
  double c30 = C[0];
  double c31 = C[1];
  double c32 = C[2];
  double c33 = C[3];
  C = Cp;
  
  for (int k = 0; k < depth; k ++) {
    b0 = B0[k];
    b1 = B1[k];
    b2 = B2[k];
    b3 = B3[k];

    a0 = A[0];
    a1 = A[1];
    a2 = A[2];
    a3 = A[3];

    A += 4;
      
    c00 += a0 * b0;
    c01 += a1 * b0;
    c02 += a2 * b0;
    c03 += a3 * b0;
    
    c10 += a0 * b1;
    c11 += a1 * b1;
    c12 += a2 * b1;
    c13 += a3 * b1;

    c20 += a0 * b2;
    c21 += a1 * b2;
    c22 += a2 * b2;
    c23 += a3 * b2;

    c30 += a0 * b3;
    c31 += a1 * b3;
    c32 += a2 * b3;
    c33 += a3 * b3;
    
  }
  C[0] = c00;
  C[1] = c01;
  C[2] = c02;
  C[3] = c03;
  C += M;
  C[0] = c10;
  C[1] = c11;
  C[2] = c12;
  C[3] = c13;
  C += M;
  C[0] = c20;
  C[1] = c21;
  C[2] = c22;
  C[3] = c23;
  C += M;
  C[0] = c30;
  C[1] = c31;
  C[2] = c32;
  C[3] = c33;
  
  
  /* __m256d bx0, bx1, bx2, bx3; */
  
  /* __m256d acol; */

  /* double* C0p = C; */
  /* /\* C += 4; *\/ */
  /* C += M; */
  /* double* C1p = C; */
  /* /\* C += 4; *\/ */
  /* C += M; */
  /* double* C2p = C; */
  /* /\* C += 4; *\/ */
  /* C += M; */
  /* double* C3p = C; */
  
  /* __m256d c0 = _mm256_loadu_pd(C0p); */
  /* __m256d c1 = _mm256_loadu_pd(C1p); */
  /* __m256d c2 = _mm256_loadu_pd(C2p); */
  /* __m256d c3 = _mm256_loadu_pd(C3p); */

  /* double* B0 = B; */
  /* B += K; */
  /* double* B1 = B; */
  /* B += K; */
  /* double* B2 = B; */
  /* B += K; */
  /* double* B3 = B; */

  /* for (int i = 0; i < depth; i++) { */
  /*   acol = _mm256_loadu_pd(A); */
  /*   A += M; */
    
  /*   bx0 = _mm256_set1_pd(B0[i]); */
  /*   bx1 = _mm256_set1_pd(B1[i]); */
  /*   bx2 = _mm256_set1_pd(B2[i]); */
  /*   bx3 = _mm256_set1_pd(B3[i]); */

  /*   c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0)); */
  /*   c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1)); */
  /*   c2 = _mm256_add_pd(c2, _mm256_mul_pd(acol, bx2)); */
  /*   c3 = _mm256_add_pd(c3, _mm256_mul_pd(acol, bx3)); */

    
  /* } */

  /* _mm256_storeu_pd(C0p, c0); */
  /* _mm256_storeu_pd(C1p, c1); */
  /* _mm256_storeu_pd(C2p, c2); */
  /* _mm256_storeu_pd(C3p, c3); */
}

void do_bfringex4_block(int M, int N, int K, int depth, double* A, double* B, double* C, int bfringe) {
  if (bfringe == 3) {
    __m128d bx0, bx1, bx2, bx3;

    __m128d acol;
    double a;

    double* C0p = C;
    C += M;
    double* C1p = C;
    C += M;
    double* C2p = C;
    C += M;
    double* C3p = C;

    __m128d c0 = _mm_loadu_pd(C0p);
    __m128d c1 = _mm_loadu_pd(C1p);
    __m128d c2 = _mm_loadu_pd(C2p);
    __m128d c3 = _mm_loadu_pd(C3p);

    double* c03 = C0p + 2;
    double* c13 = C1p + 2;
    double* c23 = C2p + 2;
    double* c33 = C3p + 2;

    double tempc03 = C0p[2];
    double tempc13 = C1p[2];
    double tempc23 = C2p[2];
    double tempc33 = C3p[2];
    
    double* B0 = B;
    B += K;
    double* B1 = B;
    B += K;
    double* B2 = B;
    B += K;
    double* B3 = B;

    double B0v, B1v, B2v, B3v;

    for (int i = 0; i < depth; i++) {
      acol = _mm_loadu_pd(A);
      a = A[2];
      A += M;

      B0v = B0[i];
      B1v = B1[i];
      B2v = B2[i];
      B3v = B3[i];
      
      tempc03 += B0v*a;
      tempc13 += B1v*a;
      tempc23 += B2v*a;
      tempc33 += B3v*a;

      bx0 = _mm_set1_pd(B0v);
      bx1 = _mm_set1_pd(B1v);
      bx2 = _mm_set1_pd(B2v);
      bx3 = _mm_set1_pd(B3v);

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
    C += M;
    double* C1p = C;
    C += M;
    double* C2p = C;
    C += M;
    double* C3p = C;

    __m128d c0 = _mm_loadu_pd(C0p);
    __m128d c1 = _mm_loadu_pd(C1p);
    __m128d c2 = _mm_loadu_pd(C2p);
    __m128d c3 = _mm_loadu_pd(C3p);
    
    double* B0 = B;
    B += K;
    double* B1 = B;
    B += K;
    double* B2 = B;
    B += K;
    double* B3 = B;
    
    for (int i = 0; i < depth; i++) {
      acol = _mm_loadu_pd(A);
      A += M;

      bx0 = _mm_set1_pd(B0[i]);
      bx1 = _mm_set1_pd(B1[i]);
      bx2 = _mm_set1_pd(B2[i]);
      bx3 = _mm_set1_pd(B3[i]);

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
    C += M;
    double* C1p = C;
    C += M;
    double* C2p = C;
    C += M;
    double* C3p = C;

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

      tempc0 += B0[i]*a;
      tempc1 += B1[i]*a;
      tempc2 += B2[i]*a;
      tempc3 += B3[i]*a;

    }
    *C0p = tempc0;
    *C1p = tempc1;
    *C2p = tempc2;
    *C3p = tempc3;
  
  }
}
void do_4xrfringe_block(int M, int N, int K, int depth, double* A, double* B, double* C, int rfringe) {
  if (rfringe == 3) {
    __m256d bx0, bx1, bx2;

    __m256d acol;

    double* C0p = C;
    double* C1p = C + M;
    double* C2p = C + M * 2;
  
    __m256d c0 = _mm256_loadu_pd(C0p);
    __m256d c1 = _mm256_loadu_pd(C1p);
    __m256d c2 = _mm256_loadu_pd(C2p);

    double* B0 = B;
    double* B1 = B + K;
    double* B2 = B + K * 2;

    for (int i = 0; i < depth; i++) {
      acol = _mm256_loadu_pd(A);
      A += M;
    
      bx0 = _mm256_broadcast_sd(B0++);
      bx1 = _mm256_broadcast_sd(B1++);
      bx2 = _mm256_broadcast_sd(B2++);

      c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0));
      c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1));
      c2 = _mm256_add_pd(c2, _mm256_mul_pd(acol, bx2));
    }

    _mm256_storeu_pd(C0p, c0);
    _mm256_storeu_pd(C1p, c1);
    _mm256_storeu_pd(C2p, c2);
  } else if (rfringe == 2) {
    __m256d bx0, bx1;

    __m256d acol;

    double* C0p = C;
    double* C1p = C + M;
  
    __m256d c0 = _mm256_loadu_pd(C0p);
    __m256d c1 = _mm256_loadu_pd(C1p);

    double* B0 = B;
    double* B1 = B + K;

    for (int i = 0; i < depth; i++) {
      acol = _mm256_loadu_pd(A);
      A += M;
    
      bx0 = _mm256_broadcast_sd(B0++);
      bx1 = _mm256_broadcast_sd(B1++);

      c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0));
      c1 = _mm256_add_pd(c1, _mm256_mul_pd(acol, bx1));
    }

    _mm256_storeu_pd(C0p, c0);
    _mm256_storeu_pd(C1p, c1);
  } else if (rfringe == 1) {
    __m256d bx0;

    __m256d acol;

    double* C0p = C;
  
    __m256d c0 = _mm256_loadu_pd(C0p);

    double* B0 = B;

    for (int i = 0; i < depth; i++) {
      acol = _mm256_loadu_pd(A);
      A += M;
    
      bx0 = _mm256_broadcast_sd(B0++);
      
      c0 = _mm256_add_pd(c0, _mm256_mul_pd(acol, bx0));
    }

    _mm256_storeu_pd(C0p, c0);
  }
}

void copy4x4toa(int M, double* X, double* Xt) {
  _mm256_store_pd(Xt, _mm256_loadu_pd(X));
  _mm256_store_pd(Xt + 4, _mm256_loadu_pd(X + M));
  _mm256_store_pd(Xt + 8, _mm256_loadu_pd(X + M * 2));
  _mm256_store_pd(Xt + 12, _mm256_loadu_pd(X + M * 3));
  
}
void copy4x4tou(int S, double* X, double* Xt) {
  _mm256_storeu_pd(Xt, _mm256_load_pd(X));
  _mm256_storeu_pd(Xt + S, _mm256_load_pd(X + 4));
  _mm256_storeu_pd(Xt + S * 2, _mm256_load_pd(X + 8));
  _mm256_storeu_pd(Xt + S  *3, _mm256_load_pd(X + 12));
  
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

  /* double* Ct = (double*)_mm_malloc(4*4*sizeof(double), 32); */
  

  /* double* Ap = A; */
  /* double* Bp = B; */
  /* double* Cp = C; */
  for (j = 0; j < rboundary; j += 4) {

    for (i = 0; i < bboundary ; i += 4) {
      /* do_4x4_block(M, N, K, kdepth, Ap, Bp, Cp); */
      /* copy4x4toa(M, C + i + j * M, Ct); */
      do_4x4_block(M, N, K, kdepth, A + i, B + j * K, C + i + j * M);
      /* copy4x4tou(M, Ct, C + i + j * M); */
      /* Ap += 4; */
      /* Cp += 4; */
    }
    /* handle bottom fringe */
    /* do_bfringex4_block(M, N, K, kdepth, Ap, Bp, Cp, bfringe); */
    do_bfringex4_block(M, N, K, kdepth, A + i, B + j * K, C + i + j * M, bfringe);
    /* Bp += 4 * K; */
    /* Cp += 4 * M; */
    
  }
  /* handle right fringe */
  for (int i = 0; i < bboundary ; i += 4) {
    do_4xrfringe_block(M, N, K, kdepth, A + i, B + rboundary * K, C + i + rboundary * M, rfringe);
  }

  /* handle bottom right corner */
  for (int i = bboundary; i < idepth; i++ ) {
    for (int j = rboundary; j < jdepth; j++ ) {
      double t = C[i+j*M];
      for (int k = 0; k < kdepth; k++) {
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
