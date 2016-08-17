#include <stdio.h>

void printmatrix (int m, int n, double* M) {
  for (int i = 0; i < m; i++)
    {
      for(int j = 0; j < n; j++)
	printf("%f     ", M[i+j*m]);
      printf("\n");
    }
  printf("\n");
}

int main(char a, char** a1) {
  double A[25] = {-1, -1, -1, -1, -1,
		   -1, -2, -3, -4, -5,
		   -1, -3, -3, -4, -5,
		   -1, -4, -4, -4, -5,
		   -1, -5, -5, -5, -5};
  double B[25]  = {-1, -1, -1, -1, -1,
		   -1, -2, -3, -4, -5,
		   -1, -3, -3, -4, -5,
		   -1, -4, -4, -4, -5,
		   -1, -5, -5, -5, -5};
  double C[25] = { 0,  0,  0,  0,  0,
		    0,  0,  0,  0,  0,
		    0,  0,  0,  0,  0,
		    0,  0,  0,  0,  0,
		    0,  0,  0,  0,  0};

  printmatrix(5, 5, A);
  printmatrix(5, 5, B);


  square_dgemm(5, A, B, C);

  printmatrix(5, 5, C);
;
}
  
