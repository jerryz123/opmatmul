#include <stdio.h>

void transpose (int n, double* A, double* R)
{
  for (int i = 0; i < n; ++i)
    {
      for (int j = 0; j < n; ++j)
	{
	  R[i+j*n] = A[j+i*n];
	}
    }
} 

void printmatrix(int n, double* A)
{
  for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < n; j++)
	{
	  printf("%f ", A[i+j*n]);
	}
      printf("\n");
    }
}

int main()
{
  int n = 3;
  double A[9] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0};
  double At[9];
  transpose(n, A, At);

  printmatrix(n, A);
  printmatrix(n, At);
} 
