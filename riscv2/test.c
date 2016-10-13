#include <stdio.h>

int rdcycles() {
  int out;
  asm("rdcycle %0" : "=r" (out));
  return out;
}



int main(char argc, char** args) {
  double A[200];
  double B[200];
  double C[200];
  int i;
  int start = rdcycles();
  for (i = 0; i < 200; i++) {
    C[i] = i;
    A[i] = i * i;
    B[i] = 2 * i;
  }

  for (i = 0; i < 200; i++) {
    C[i] = A[i] * B[i] + C[i];
  }
  int end = rdcycles();
  printf("Cycles:\t%d\n", end - start);
}
