#include <mkl.h>
#define DGEMM cblas_dgemm

const char* dgemm_desc = "Reference dgemm.";

/* This routine performs a dgemm operation
 *  C := C + A * B
 * where A, B, and C are lda-by-lda matrices stored in column-major format.
 * On exit, A and B maintain their input values.    
 * This function wraps a call to the BLAS-3 routine DGEMM, via the standard FORTRAN interface - hence the reference semantics. */
void square_dgemm (int N, double* A, double* B, double* C)
{
  double BETA = 1.;
  int LDA = N;
  int LDB = N;
  int LDC = N;
  /* DGEMM(&TRANSA, &TRANSB, &M, &N, &K, &ALPHA, A, &LDA, B, &LDB, &BETA, C, &LDC); */
DGEMM(CblasColMajor, CblasNoTrans, CblasNoTrans, LDA, LDB, LDC, BETA, A, LDA, B, LDB, BETA, C, LDC);
}   
