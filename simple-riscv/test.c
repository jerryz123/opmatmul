#include <stdio.h>

int main(char argc, char** args) {
  double A[200];
  double B[200];
  double C[200];
  int i;
  for (i = 0; i < 200; i++) {
    C[i] = A[i] * B[i] + C[i];
  }
  for (i = 0; i < 200; i++) {
    printf("%f\n", C[i]);
  }
}
