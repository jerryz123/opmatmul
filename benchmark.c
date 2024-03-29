#include <stdlib.h> // For: exit, drand48, malloc, free, NULL, EXIT_FAILURE
#include <stdio.h>  // For: perror
#include <string.h> // For: memset

#include <float.h>  // For: DBL_EPSILON
#include <math.h>   // For: fabs
#include <immintrin.h>
#ifdef GETTIMEOFDAY
#include <sys/time.h> // For struct timeval, gettimeofday
#else
#include <time.h> // For struct timespec, clock_gettime, CLOCK_MONOTONIC
#include <mkl.h>
#endif

/* reference_dgemm wraps a call to the BLAS-3 routine DGEMM, via the standard FORTRAN interface - hence the reference semantics. */ 
/* extern void DGEMM (char*, char*, int*, int*, int*, double*, double*, int*, double*, int*, double*, double*, int*);  */
void reference_dgemm (int N, double ALPHA, double* A, double* B, double* C)
{
  
  int n = N;
  
  double alpha = ALPHA;
  
  cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, n, n, n, alpha, A, n, B, n, 1, C, n);
}   

/* Your function must have the following signature: */
extern const char* dgemm_desc;
extern void square_dgemm (int, double*, double*, double*);
extern void my_dgemm(int, int, int, double*, double*, double*);

double wall_time ()
{
#ifdef GETTIMEOFDAY
  struct timeval t;
  gettimeofday (&t, NULL);
  return 1.*t.tv_sec + 1.e-6*t.tv_usec;
#else
  struct timespec t;
  clock_gettime (CLOCK_MONOTONIC, &t);
  return 1.*t.tv_sec + 1.e-9*t.tv_nsec;
#endif
}

void die (const char* message)
{
  perror (message);
  exit (EXIT_FAILURE);
}

void fill (double* p, int n)
{
  for (int i = 0; i < n; ++i) {
    p[i] = 2 * drand48() - 1; // Uniformly distributed over [-1, 1]
    p[i] = 1;
  }
}

void absolute_value (double *p, int n)
{
  for (int i = 0; i < n; ++i)
    p[i] = fabs (p[i]);
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
/* The benchmarking program */
int main (int argc, char **argv)
{
  printf ("Description:\t%s\n\n", dgemm_desc);

  /* Test sizes should highlight performance dips at multiples of certain powers-of-two */

  /* int test_sizes[800]; */
  /* for (int i = 0; i < 800; i++) { */
  /*   test_sizes[i] = 4 + i; */
  /* } */
  
  int test_sizes[] = 
  /* Multiples-of-32, +/- 1. Currently commented. */
  /* {31,32,33,63,64,65,95,96,97,127,128,129,159,160,161,191,192,193,223,224,225,255,256,257,287,288,289,319,320,321,351,352,353,383,384,385,415,416,417,447,448,449,479,480,481,511,512,513,543,544,545,575,576,577,607,608,609,639,640,641,671,672,673,703,704,705,735,736,737,767,768,769,799,800,801,831,832,833,863,864,865,895,896,897,927,928,929,959,960,961,991,992,993,1023,1024,1025}; */
    /* {4, 8, 15, 16, 32, 64, 128, 255, 256, 512, 1024}; */
  /* A representative subset of the first list. Currently uncommented. */ 
    { 4, 5, 6, 7, 12, 13, 14, 15, 16, 31, 32, 96, 97, 127, 128, 129, 191, 192, 229, 255, 256, 257,
      319, 320, 321, 417, 479, 480, 511, 512, 639, 640, 767, 768, 769};
    
  int nsizes = sizeof(test_sizes)/sizeof(test_sizes[0]);

  /* assume last size is also the largest size */
  int nmax = test_sizes[nsizes-1];

  /* allocate memory for all problems */
  double* buf = NULL;
  buf = (double*) _mm_malloc (3 * nmax * nmax * sizeof(double), 64);
  if (buf == NULL) die ("failed to allocate largest problem size");


  
  
  printf("Size:\ttestGflops/s\trefGflops/s\tpercent\n");
  /* For each test size */
  for (int isize = 0; isize < sizeof(test_sizes)/sizeof(test_sizes[0]); ++isize) {
    /* Create and fill 3 random matrices A,B,C*/
    int n = test_sizes[isize];

    double* A = buf + 0;
    double* B = A + nmax*nmax;
    double* C = B + nmax*nmax;
    
    fill (A, n*n);
    fill (B, n*n);
    fill (C, n*n);

    /* Measure performance (in Gflops/s). */

    /* Time a "sufficiently long" sequence of calls to reduce noise */
    double testGflops_s, refGflops_s, seconds = -1.0;
    double timeout = 0.1; // "sufficiently long" := at least 1/10 second.
    for (int n_iterations = 1; seconds < timeout; n_iterations *= 2)
      {
	/* Warm-up */
	square_dgemm (n, A, B, C);

	/* Benchmark n_iterations runs of square_dgemm */
	seconds = -wall_time();
	for (int it = 0; it < n_iterations; ++it)
	  square_dgemm (n, A, B, C);
	seconds += wall_time();

	/*  compute Mflop/s rate */
	testGflops_s = 2.e-9 * n_iterations * n * n * n / seconds;
      }
    seconds = -1.0;
    for (int n_iterations = 1; seconds < timeout; n_iterations *= 2)
      {
	/* Warm-up */
	reference_dgemm (n, 1., A, B, C);

	/* Benchmark n_iterations runs of square_dgemm */
	seconds = -wall_time();
	for (int it = 0; it < n_iterations; ++it)
	  reference_dgemm (n, 1., A, B, C);
	seconds += wall_time();

	/*  compute Mflop/s rate */
	refGflops_s = 2.e-9 * n_iterations * n * n * n / seconds;
      }

    printf ("%d\t%.3g\t\t%.3g\t\t%.3g\n", n, testGflops_s, refGflops_s, testGflops_s / refGflops_s);

    /* Ensure that error does not exceed the theoretical error bound. */

    /* C := A * B, computed with square_dgemm */
    memset (C, 0, n * n * sizeof(double));
    square_dgemm (n, A, B, C);
    /* Do not explicitly check that A and B were unmodified on square_dgemm exit
     *  - if they were, the following will most likely detect it:   
     * C := C - A * B, computed with reference_dgemm */
    /* printmatrix(n, n, A); */
    /* printmatrix(n, n, B); */
    /* printmatrix(n, n, C); */
    
    reference_dgemm(n, -1., A, B, C);
    

    /* A := |A|, B := |B|, C := |C| */
    absolute_value (A, n * n);
    absolute_value (B, n * n);
    absolute_value (C, n * n);
    
    /* C := |C| - 3 * e_mach * n * |A| * |B|, computed with reference_dgemm */ 
    reference_dgemm (n, -3.*DBL_EPSILON*n, A, B, C);

    /* If any element in C is positive, then something went wrong in square_dgemm */
    for (int i = 0; i < n * n; ++i)
      
      if (C[i] > 0){
	printf("%f\n", C[i]);
	for (int i = 0; i < n*n; i++)
	  C[i] = 0;
	square_dgemm(n, A, B, C);
	printmatrix(n, n, C);
	
	
	die("*** FAILURE *** Error in matrix multiply exceeds componentwise error bounds.\n" );
	
      }

      

  }
  free(buf);
  
  /* for (int m = 1; m < 12; m++ ) { */
  /*   for (int n = 1; n < 12; n++ ) { */
  /*     for (int k = 1; k < 12; k++ ) { */
  /* 	double x[m*k];  */
  /* 	double y[k*n];  */
  /* 	double z1[m*n]; */
  /* 	double z2[m*n]; */

  /* 	fill(x, m*k); */
  /* 	fill(y, k*n); */
  /* 	fill(z1, m*n); */
  /* 	for(int i = 0; i < m*n; i++) { */
  /* 	  z2[i] = z1[i]; */
  /* 	} */

  /* 	cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, m, n, k, 1, x, m, y, k, 1, z1, m); */

  /* 	if (dgemm_desc == "mydgemm") { */
  /* 	  my_dgemm(m, n, k, x, y, z2); */
  /* 	  for (int i = 0; i < m*n; i++) { */
  /* 	    if (fabs(z1[i] - z2[i]) >= 0.01) { */
  /* 	      printf("%f,\t%f", z1[i], z2[i]); */
  /* 	      printmatrix(m, k, x); */
  /* 	      printmatrix(k, n, y); */
  /* 	      printmatrix(m, n, z1); */
  /* 	      printmatrix(m, n, z2); */

  /* 	      die("Any dimension test failed"); */
	    
  /* 	    } */
  /* 	  } */
  /* 	} */
  /*     } */
  /*   } */
  /* } */
 
  
  return 0;
}
