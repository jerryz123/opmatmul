#include <stdio.h>

int main(char argc, char** args) {
  double A[2];
  double B[2];
  double C[2];
  int i;
  for (i = 0; i < 2; i++) {
    C[i] = A[i] * B[i] + C[i];
  }
  for (i = 0; i < 2; i++) {
    printf("%f\n", C[i]);
  }
}
