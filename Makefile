# on Franklin and Hopper, we will benchmark you against Cray LibSci, the default vendor-tuned BLAS. The Cray compiler wrappers handle all the linking. If you wish to compare with other BLAS implementations, check the NERSC documentation.
# This makefile is intended for the GNU C compiler. On Franklin and Hopper, the Portland compilers are default, so you must instruct the Cray compiler wrappers to switch to GNU: type "module swap PrgEnv-pgi PrgEnv-gnu"
# Your code must compile (with GCC) with the given CFLAGS. You may experiment with the OPT variable to invoke additional compiler options.

CC = cc 
OPT = -O3
MKLROOT = /opt/intel/compilers_and_libraries_2016.2.181/linux/mkl
CFLAGS = -Wall -std=gnu99 $(OPT) -funroll-loops -ffast-math -march=corei7-avx -Wno-strict-overflow -g   -DMKL_ILP64 -m64 -I${MKLROOT}/include
LDFLAGS = -Wall 
# librt is needed for clock_gettime
LDLIBS= -lrt -g  -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_core.a ${MKLROOT}/lib/intel64/libmkl_sequential.a -Wl,--end-group -lpthread -lm -ldl

# targets = benchmark-naive benchmark-blocked benchmark-blas benchmark-l1l2tpose benchmark-avx benchmark-other
# objects = benchmark.o dgemm-naive.o dgemm-blocked.o dgemm-blas.o dgemm-l1l2tpose.o dgemm-avx.o dgemm-other.o

targets = benchmark-naive benchmark-avx benchmark-l1l2-avx benchmark-blas
objects = benchmark.o benchmark-naive.o benchmark-l1l2.o dgemm-avx.o dgemm-blas.o

.PHONY : default
default : all

.PHONY : all
all : clean $(targets)

benchmark-naive : benchmark.o dgemm-naive.o 
	$(CC) -o $@ $^ $(LDLIBS)
# benchmark-blocked : benchmark.o dgemm-blocked.o
# 	$(CC) -o $@ $^ $(LDLIBS)
benchmark-blas : benchmark.o dgemm-blas.o
	$(CC) -o $@ $^ $(LDLIBS)
# benchmark-l1l2tpose : benchmark.o dgemm-l1l2tpose.o
# 	$(CC) -o $@ $^ $(LDLIBS)
benchmark-l1l2-avx : benchmark-l1l2.o dgemm-avx.o
	$(CC) -o $@ $^ $(LDLIBS)
benchmark-avx : benchmark.o dgemm-avx.o
	$(CC) -o $@ $^ $(LDLIBS)
# benchmark-other : benchmark.o dgemm-other.o
# 	$(CC) -o $@ $^ $(LDLIBS)

%.o : %.c
	$(CC) -c $(CFLAGS) $<

.PHONY : clean
clean:
	rm -f $(targets) $(objects)
