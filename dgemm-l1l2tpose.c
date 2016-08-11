#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#define min(a,b) (((a)<(b))?(a):(b))

const char* dgemm_desc = "Naive, three-loop dgemm.";
const int L1_BLOCK_SIZE = 32;
const int L2_BLOCK_SIZE = 256;
void transpose (int n, double* A, double* At)
{
  for (int i = 0; i < n; ++i)
    {
      for (int j = 0; j < n; ++j)
	{
	  At[i+j*n] = A[j+i*n];
	}
    }
}


void do_l1_block (int lda, int M, int N, int K, double* A, double* B, double* C)
{
  for (int j = 0; j < N; ++j)
    {
      double* Bp = B + j * lda;
      double* Cp = C + j * lda;
      for (int i = 0; i < M; ++i)
	{
	  double* Bpp = Bp;
	  double* Ap = A + i * lda;
	  double Ct = *Cp;
	  int k = 0;
	  while (k < K - 4) {
	    __m256d as = _mm256_loadu_pd(Ap);
	    __m256d bs = _mm256_loadu_pd(Bpp);
	    __m256d r = _mm256_mul_pd(as, bs);
	    double* re = (double*)&r;
	    /* Ct += (Ap[0]*Bpp[0]) + (Ap[1]*Bpp[1]) + (Ap[2]*Bpp[2]) + (Ap[3]*Bpp[3]); */
	    Ct += re[0] + re[1] + re[2] + re[3];
	    Ap += 4;
	    Bpp += 4;
	    k += 4;
	  }
	  while (k < K) {
	    Ct += (*Ap)*(*Bpp);
	    Ap++;
	    Bpp++;
	    k++;
	  }
		
		
	    
	  /* for (int k = 0; k < K; ++k) */
	  /*   { */
	  /*     Ct += (*Ap)*(*Bpp); */
	  /*     Ap++; */
	  /*     Bpp++; */
	    /* } */
	  *Cp = Ct;
	  Cp++;
	}
    }
}

void do_l2_block (int lda, int M, int N, int K, double* A, double* B, double* C)
{
  for (int j = 0; j < N; j += L1_BLOCK_SIZE)
    {
      for (int i = 0; i < M; i += L1_BLOCK_SIZE)
	{
	  for (int k = 0; k < K; k += L1_BLOCK_SIZE)
	    {
	      /* Correct block dimensions if block "goes off edge of" the matrix */
	      int Mi = min (L1_BLOCK_SIZE, M-i);
	      int Ni = min (L1_BLOCK_SIZE, N-j);
	      int Ki = min (L1_BLOCK_SIZE, K-k);

	      /* Perform individual block dgemm */
	      do_l1_block(lda, Mi, Ni, Ki, A + k + i*lda, B + k + j*lda, C + i + j*lda);
	    }
	}
    }
}


/* This routine performs a dgemm operation
 *  C := C + A * B
 * where A, B, and C are lda-by-lda matrices stored in column-major format. 
 * On exit, A and B maintain their input values. */  
void square_dgemm (int lda, double* A, double* B, double* C)
{
  double At[lda*lda];
  transpose(lda, A, At);
  /* For each block-row of A */ 
  for (int i = 0; i < lda; i += L2_BLOCK_SIZE)
    /* For each block-column of B */
    for (int j = 0; j < lda; j += L2_BLOCK_SIZE)
      /* Accumulate block dgemms into block of C */
      for (int k = 0; k < lda; k += L2_BLOCK_SIZE)
      {
	/* Correct block dimensions if block "goes off edge of" the matrix */
	int M = min (L2_BLOCK_SIZE, lda-i);
	int N = min (L2_BLOCK_SIZE, lda-j);
	int K = min (L2_BLOCK_SIZE, lda-k);

	/* Perform individual block dgemm */
	do_l2_block(lda, M, N, K, At + k + i*lda, B + k + j*lda, C + i + j*lda);
      }
}

/* void fill (double* p, int n) */
/* { */
/*   for (int i = 0; i < n; ++i) */
/*     p[i] = 2 * drand48() - 1; */
/* } */
/* int main (int argc, char **argv) */
/* { */
/*   int nmax = 769; */
/*   double* buf = (double*) malloc (3*nmax*nmax*sizeof(double)); */
/*   double* A = buf + 0; */
/*   double* B = A + nmax*nmax; */
/*   double* C = B + nmax*nmax; */
/*   fill (A, nmax*nmax); */
/*   fill (B, nmax*nmax); */
/*   fill (C, nmax*nmax); */
/*   square_dgemm(nmax, A, B, C); */
/* } */
  
