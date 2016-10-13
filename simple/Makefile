CC = gcc
 
OPT = -O3  -ftree-vectorize -fopt-info-vec -msse -msse2 -mavx -mavx2 -ffast-math -fverbose-asm -funroll-loops 
MKLROOT = /opt/intel/compilers_and_libraries_2016.2.181/linux/mkl
CFLAGS = -Wall -std=gnu99 -save-temps $(OPT) 

LDFLAGS = -Wall 
# librt is needed for clock_gettime
LDLIBS= -lrt -g -lm -ldl $(OPT)
targets = matmul
objects = matmul.o

.PHONY : default
default : all
.PHONY : all
all : clean $(targets)

matmul : matmul.o
	$(CC) -o $@ $^ $(LDLIBS) 

%.o : %.c
	$(CC) -c $(CFLAGS) $<

.PHONY: clean
clean:
	rm -f $(targets) $(objects)
