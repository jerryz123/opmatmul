	.file	"matmul.c"
# GNU C (Ubuntu 4.8.4-2ubuntu1~14.04.3) version 4.8.4 (x86_64-linux-gnu)
#	compiled by GNU C version 4.8.4, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed matmul.i -msse -msse2 -mavx -mavx2
# -mtune=generic -march=x86-64 -O3 -Wall -std=gnu99 -ftree-vectorize
# -fopt-info-vec -ffast-math -fverbose-asm -funroll-loops -fstack-protector
# -Wformat-security
# options enabled:  -faggressive-loop-optimizations -fassociative-math
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -foptimize-register-move -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeephole -fpeephole2 -fpredictive-commoning
# -fprefetch-loop-arrays -freciprocal-math -free -freg-struct-return
# -fregmove -frename-registers -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
# -fshow-column -fshrink-wrap -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstack-protector -fstrict-aliasing -fstrict-overflow
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
# -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename
# -ftree-cselim -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop
# -ftree-fre -ftree-loop-distribute-patterns -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vect-loop-version -ftree-vectorize
# -ftree-vrp -funit-at-a-time -funroll-loops -funsafe-math-optimizations
# -funswitch-loops -funwind-tables -fvect-cost-model -fverbose-asm -fweb
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -maccumulate-outgoing-args -malign-stringops -mavx -mavx2
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mlong-double-80 -mmmx
# -mpopcnt -mpush-args -mred-zone -msse -msse2 -msse3 -msse4 -msse4.1
# -msse4.2 -mssse3 -mtls-direct-seg-refs -mvzeroupper -mxsave

	.text
	.p2align 4,,15
	.globl	avx_dgemm_fast
	.type	avx_dgemm_fast, @function
avx_dgemm_fast:
.LFB1062:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rcx, %r11	# C, C
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, %ebx	# n, n
	andq	$-32, %rsp	#,
	subq	$336, %rsp	#,
	testl	%edi, %edi	# n
	movl	%edi, 332(%rsp)	# n, %sfp
	movq	%rsi, 32(%rsp)	# A, %sfp
	movq	%rcx, 80(%rsp)	# C, %sfp
	jle	.L172	#,
	movslq	%edi, %rax	# n, D.10386
	movq	%rdx, %r15	# B, B
	movl	%edi, %edx	# n, D.10390
	leaq	0(,%rax,8), %r12	#, D.10386
	sall	$5, %edx	#, D.10390
	leal	(%rbx,%rbx), %r14d	#, D.10387
	movq	%rax, 224(%rsp)	# D.10386, %sfp
	movl	%ebx, %eax	# n, n
	movslq	%edx, %r8	# D.10390, D.10386
	sall	$2, %eax	#, tmp970
	movq	%r8, %rdi	# D.10386, D.10386
	movslq	%r14d, %rcx	# D.10387, D.10392
	leal	(%rax,%rbx), %r10d	#, D.10387
	addl	%ebx, %r14d	# n, D.10387
	movq	%r8, 320(%rsp)	# D.10386, %sfp
	cltq
	negq	%r8	# tmp967
	subq	%r11, %rsi	# C, D.10389
	salq	$3, %r8	#, tmp968
	movslq	%r14d, %rbx	# D.10387, D.10392
	salq	$3, %rax	#, D.10389
	movq	%rsi, -96(%rsp)	# D.10389, %sfp
	subq	%r12, -96(%rsp)	# D.10386, %sfp
	movslq	%r10d, %r13	# D.10387, D.10392
	movl	%edx, -28(%rsp)	# D.10390, %sfp
	movq	%r8, -88(%rsp)	# tmp968, %sfp
	movq	%rdi, %r9	# D.10386, D.10386
	leaq	0(,%rbx,8), %rdx	#, ivtmp.281
	movq	%r15, %r8	# B, ivtmp.285
	movq	%rax, 72(%rsp)	# D.10389, %sfp
	movq	%r12, %r10	# D.10386, D.10386
	leaq	(%r11,%r12), %rax	#, ivtmp.254
	salq	$3, %r13	#, ivtmp.274
	salq	$3, %rcx	#, ivtmp.279
	salq	$3, %r9	#, D.10392
	subq	%r11, %r8	# C, ivtmp.285
	negq	%r10	# D.10386
	movq	%r13, -16(%rsp)	# ivtmp.274, %sfp
	movq	%r9, (%rsp)	# D.10392, %sfp
	movq	%rcx, 200(%rsp)	# ivtmp.279, %sfp
	movq	%rdx, -64(%rsp)	# ivtmp.281, %sfp
	movq	%r12, %r13	# D.10386, D.10386
	movq	%r8, -80(%rsp)	# ivtmp.285, %sfp
	movq	%rdi, -72(%rsp)	# D.10386, %sfp
	movq	%r15, %r14	# B, B
	movq	%rcx, -56(%rsp)	# ivtmp.279, %sfp
	movq	%r12, -48(%rsp)	# D.10386, %sfp
	movq	$0, 8(%rsp)	#, %sfp
	movq	$0, 88(%rsp)	#, %sfp
	movq	$0, 40(%rsp)	#, %sfp
	movl	$0, -8(%rsp)	#, %sfp
	movq	%rax, -120(%rsp)	# ivtmp.254, %sfp
	movq	%r10, 304(%rsp)	# D.10386, %sfp
.L66:
	movq	88(%rsp), %r11	# %sfp, ivtmp.266
	movl	332(%rsp), %ecx	# %sfp, n
	movq	8(%rsp), %r9	# %sfp, ivtmp.273
	movq	-120(%rsp), %rbx	# %sfp, ivtmp.254
	movq	32(%rsp), %r10	# %sfp, A
	movslq	-8(%rsp), %rdx	# %sfp, D.10392
	movl	%r11d, %r15d	# ivtmp.266, tmp1782
	movl	%r11d, %r12d	# ivtmp.266, D.10390
	movl	%r11d, 316(%rsp)	# tmp1782, %sfp
	addl	$32, %r15d	#, D.10390
	movq	%rbx, 16(%rsp)	# ivtmp.254, %sfp
	movq	%r9, %rbx	# ivtmp.273, D.10392
	cmpl	%r15d, %ecx	# D.10390, n
	movq	-96(%rsp), %r8	# %sfp, D.10389
	movq	%r9, %rax	# ivtmp.273, D.10392
	cmovle	%ecx, %r15d	# n,, kend
	addq	-16(%rsp), %rbx	# %sfp, D.10392
	addq	-48(%rsp), %rax	# %sfp, D.10392
	movl	%r15d, 328(%rsp)	# kend, %sfp
	movq	%r9, %rsi	# ivtmp.273, D.10392
	subl	%r11d, %r15d	# ivtmp.266, D.10390
	addq	-56(%rsp), %rsi	# %sfp, D.10392
	movq	%r9, %r11	# ivtmp.273, D.10392
	movq	%r9, %rcx	# ivtmp.273, D.10392
	addq	-64(%rsp), %r11	# %sfp, D.10392
	addq	-72(%rsp), %rcx	# %sfp, D.10392
	leaq	(%r8,%rdx,8), %rdi	#, ivtmp.258
	addq	%r10, %rbx	# A, D.10385
	movl	$0, 96(%rsp)	#, %sfp
	movq	%r14, %rdx	# B, B
	movq	%rbx, 240(%rsp)	# D.10385, %sfp
	movl	96(%rsp), %ebx	# %sfp, j1
	addq	%r10, %rax	# A, D.10385
	addq	%r10, %rsi	# A, D.10385
	movl	%r12d, %r14d	# D.10390, D.10390
	movq	%rdi, -40(%rsp)	# ivtmp.258, %sfp
	addq	%r10, %r11	# A, D.10385
	addq	%r10, %rcx	# A, D.10385
	movq	%r13, %r12	# D.10386, D.10386
	movl	$0, -4(%rsp)	#, %sfp
	movq	$0, -24(%rsp)	#, %sfp
	movq	%rdx, %r13	# B, B
	movq	%rax, 272(%rsp)	# D.10385, %sfp
	movq	%rsi, 264(%rsp)	# D.10385, %sfp
	movq	%r11, 256(%rsp)	# D.10385, %sfp
	movq	%rcx, 248(%rsp)	# D.10385, %sfp
.L64:
	movl	332(%rsp), %edi	# %sfp, n
	movl	%ebx, %r8d	# j1, j1
	movq	-24(%rsp), %r11	# %sfp, D.10389
	addl	$32, %r8d	#, j1
	movq	16(%rsp), %r9	# %sfp, ivtmp.254
	movq	%r13, 288(%rsp)	# B, %sfp
	movl	%r8d, -32(%rsp)	# j1, %sfp
	movq	$0, 48(%rsp)	#, %sfp
	cmpl	%edi, %r8d	# n, j1
	movl	%edi, %eax	# n, jend
	cmovle	%r8d, %eax	# j1,, jend
	subq	%r12, %r11	# D.10386, D.10389
	movq	%r9, 24(%rsp)	# ivtmp.254, %sfp
	movl	%eax, %r10d	# jend, jend
	movl	%eax, 312(%rsp)	# jend, %sfp
	subl	%ebx, %eax	# j1, D.10387
	cltd
	shrl	$30, %edx	#, tmp988
	addl	%edx, %eax	# tmp988, tmp991
	andl	$3, %eax	#, tmp991
	subl	%edx, %eax	# tmp988, tmp991
	subl	%eax, %r10d	# tmp991, j1
	movl	%r10d, %eax	# j1, j1
	movl	%r10d, 136(%rsp)	# j1, %sfp
	imull	%edi, %eax	# n, D.10390
	movl	%eax, 100(%rsp)	# D.10390, %sfp
	cltq
	movq	%rax, %rbx	# D.10386, D.10386
	addq	88(%rsp), %rbx	# %sfp, D.10386
	leaq	(%r11,%rax,8), %rcx	#, D.10389
	movq	%rax, -104(%rsp)	# D.10386, %sfp
	movq	%rcx, -112(%rsp)	# D.10389, %sfp
	leaq	0(%r13,%rbx,8), %r8	#, ivtmp.154
	movl	%r14d, %r13d	# D.10390, D.10390
	movq	%r12, %r14	# D.10386, D.10386
	movl	%r15d, %r12d	# D.10390, D.10390
	movq	%r8, 104(%rsp)	# ivtmp.154, %sfp
.L62:
	movq	48(%rsp), %r15	# %sfp, ivtmp.246
	movl	332(%rsp), %edi	# %sfp, n
	movl	136(%rsp), %esi	# %sfp, j1
	movl	%r15d, %eax	# ivtmp.246, tmp1813
	movl	%r15d, 280(%rsp)	# tmp1813, %sfp
	addl	$32, %eax	#, D.10390
	cmpl	%eax, %edi	# D.10390, n
	cmovle	%edi, %eax	# n,, iend
	movl	%eax, %r10d	# iend, iend
	movl	%eax, 116(%rsp)	# iend, %sfp
	subl	%r15d, %eax	# ivtmp.246, D.10387
	cltd
	shrl	$30, %edx	#, tmp999
	addl	%edx, %eax	# tmp999, tmp1002
	andl	$3, %eax	#, tmp1002
	subl	%edx, %eax	# tmp999, tmp1002
	subl	%eax, %r10d	# tmp1002, i1
	cmpl	%esi, 96(%rsp)	# j1, %sfp
	movl	%r10d, 284(%rsp)	# i1, %sfp
	jge	.L26	#,
	movl	48(%rsp), %r11d	# %sfp, D.10390
	movq	24(%rsp), %r8	# %sfp, ivtmp.247
	movq	16(%rsp), %rcx	# %sfp, ivtmp.254
	movq	-80(%rsp), %rbx	# %sfp, ivtmp.285
	movl	96(%rsp), %r9d	# %sfp, j1
	movl	%r13d, 184(%rsp)	# D.10390, %sfp
	notl	%r11d	# D.10390
	addl	284(%rsp), %r11d	# %sfp, D.10390
	movq	%r8, 232(%rsp)	# ivtmp.247, %sfp
	addq	-40(%rsp), %r8	# %sfp, D.10389
	leaq	(%rcx,%rbx), %rsi	#, ivtmp.236
	movl	%r9d, 216(%rsp)	# j1, %sfp
	shrl	$2, %r11d	#,
	salq	$5, %r11	#, D.10389
	movq	%r8, 208(%rsp)	# D.10389, %sfp
	addq	$32, %r11	#, D.10389
	movq	%r11, 192(%rsp)	# D.10389, %sfp
	.p2align 4,,10
	.p2align 3
.L6:
	movl	280(%rsp), %r13d	# %sfp, i1
	cmpl	%r13d, 284(%rsp)	# i1, %sfp
	jle	.L11	#,
	movq	232(%rsp), %r10	# %sfp, ivtmp.234
	movq	200(%rsp), %r15	# %sfp, ivtmp.279
	movq	%rsi, %r9	# ivtmp.236, D.10385
	movq	208(%rsp), %r11	# %sfp, ivtmp.226
	leaq	(%rsi,%r14), %r8	#, D.10385
	subq	%r14, %r9	# D.10386, D.10385
	movq	%r10, %rax	# ivtmp.234, D.10389
	addq	192(%rsp), %rax	# %sfp, D.10389
	leaq	(%rsi,%r15), %rdi	#, D.10385
	movq	%rax, 296(%rsp)	# D.10389, %sfp
	.p2align 4,,10
	.p2align 3
.L12:
	movq	200(%rsp), %rdx	# %sfp, ivtmp.279
	movq	%r10, %r13	# ivtmp.223, D.10385
	leaq	(%r10,%r14), %rbx	#, D.10385
	subq	%r14, %r13	# D.10386, D.10385
	testl	%r12d, %r12d	# D.10390
	vmovupd	(%r10), %ymm3	#* ivtmp.223, c1
	vmovupd	0(%r13), %ymm2	#* D.10385, c0
	leaq	(%r10,%rdx), %r15	#, D.10385
	vmovupd	(%rbx), %ymm4	#* D.10385, c2
	vmovupd	(%r15), %ymm0	#* D.10385, c3
	jle	.L7	#,
	vmovupd	(%r11), %ymm1	#* ivtmp.226, tmp1011
	leal	-1(%r12), %edx	#, tmp1373
	leaq	(%r11,%r14), %rcx	#, A
	vbroadcastsd	(%r9), %ymm5	# MEM[base: _1110, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	movl	$1, %eax	#, ivtmp.206
	vbroadcastsd	(%rsi), %ymm7	# MEM[base: _399, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	andl	$1, %edx	#, tmp1373
	vbroadcastsd	(%r8), %ymm9	# MEM[base: _1112, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	cmpl	$1, %r12d	#, D.10390
	vbroadcastsd	(%rdi), %ymm11	# MEM[base: _1115, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vmulpd	%ymm5, %ymm1, %ymm6	# D.10391, tmp1011, tmp1013
	vmulpd	%ymm7, %ymm1, %ymm8	# D.10391, tmp1011, tmp1016
	vmulpd	%ymm9, %ymm1, %ymm10	# D.10391, tmp1011, tmp1019
	vaddpd	%ymm6, %ymm2, %ymm2	# tmp1013, c0, c0
	vmulpd	%ymm11, %ymm1, %ymm12	# D.10391, tmp1011, tmp1022
	vaddpd	%ymm8, %ymm3, %ymm3	# tmp1016, c1, c1
	vaddpd	%ymm10, %ymm4, %ymm4	# tmp1019, c2, c2
	vaddpd	%ymm12, %ymm0, %ymm0	# tmp1022, c3, c3
	jle	.L7	#,
	testl	%edx, %edx	# tmp1373
	je	.L8	#,
	vmovupd	(%rcx), %ymm13	#* A, tmp1625
	addq	%r14, %rcx	# D.10386, A
	cmpl	$2, %r12d	#, D.10390
	vbroadcastsd	8(%r9), %ymm14	# MEM[base: _1110, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	movl	$2, %eax	#, ivtmp.206
	vbroadcastsd	8(%rsi), %ymm1	# MEM[base: _399, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vbroadcastsd	8(%r8), %ymm6	# MEM[base: _1112, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vbroadcastsd	8(%rdi), %ymm8	# MEM[base: _1115, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vmulpd	%ymm14, %ymm13, %ymm15	# D.10391, tmp1625, tmp1631
	vmulpd	%ymm1, %ymm13, %ymm5	# D.10391, tmp1625, tmp1633
	vmulpd	%ymm6, %ymm13, %ymm7	# D.10391, tmp1625, tmp1635
	vaddpd	%ymm15, %ymm2, %ymm2	# tmp1631, c0, c0
	vmulpd	%ymm8, %ymm13, %ymm9	# D.10391, tmp1625, tmp1637
	vaddpd	%ymm5, %ymm3, %ymm3	# tmp1633, c1, c1
	vaddpd	%ymm7, %ymm4, %ymm4	# tmp1635, c2, c2
	vaddpd	%ymm9, %ymm0, %ymm0	# tmp1637, c3, c3
	jle	.L7	#,
	.p2align 4,,10
	.p2align 3
.L8:
	vmovupd	(%rcx), %ymm10	#* A, tmp1377
	leaq	1(%rax), %rdx	#, tmp1374
	addq	%r14, %rcx	# D.10386, A
	vbroadcastsd	(%r9,%rax,8), %ymm11	# MEM[base: _1110, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vbroadcastsd	(%rdi,%rax,8), %ymm5	# MEM[base: _1115, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vmulpd	%ymm11, %ymm10, %ymm12	# D.10391, tmp1377, tmp1384
	vmovupd	(%rcx), %ymm9	#* A, tmp1396
	addq	%r14, %rcx	# D.10386, A
	vmulpd	%ymm5, %ymm10, %ymm7	# D.10391, tmp1377, tmp1393
	vbroadcastsd	(%rsi,%rax,8), %ymm14	# MEM[base: _399, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vaddpd	%ymm12, %ymm2, %ymm13	# tmp1384, c0, c0
	vbroadcastsd	(%r8,%rax,8), %ymm2	# MEM[base: _1112, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vmulpd	%ymm14, %ymm10, %ymm15	# D.10391, tmp1377, tmp1387
	addq	$2, %rax	#, ivtmp.206
	vaddpd	%ymm7, %ymm0, %ymm8	# tmp1393, c3, c3
	cmpl	%eax, %r12d	# ivtmp.206, D.10390
	vmulpd	%ymm2, %ymm10, %ymm1	# D.10391, tmp1377, tmp1390
	vbroadcastsd	(%r8,%rdx,8), %ymm12	# MEM[base: _1112, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vbroadcastsd	(%rsi,%rdx,8), %ymm10	# MEM[base: _399, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vaddpd	%ymm15, %ymm3, %ymm3	# tmp1387, c1, c1
	vbroadcastsd	(%rdi,%rdx,8), %ymm14	# MEM[base: _1115, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vaddpd	%ymm1, %ymm4, %ymm6	# tmp1390, c2, c2
	vbroadcastsd	(%r9,%rdx,8), %ymm4	# MEM[base: _1110, index: ivtmp.206_414, step: 8, offset: 0B], D.10391
	vmulpd	%ymm10, %ymm9, %ymm11	# D.10391, tmp1396, tmp1404
	vmulpd	%ymm4, %ymm9, %ymm0	# D.10391, tmp1396, tmp1402
	vmulpd	%ymm14, %ymm9, %ymm15	# D.10391, tmp1396, tmp1408
	vaddpd	%ymm11, %ymm3, %ymm3	# tmp1404, c1, c1
	vaddpd	%ymm0, %ymm13, %ymm2	# tmp1402, c0, c0
	vmulpd	%ymm12, %ymm9, %ymm13	# D.10391, tmp1396, tmp1406
	vaddpd	%ymm15, %ymm8, %ymm0	# tmp1408, c3, c3
	vaddpd	%ymm13, %ymm6, %ymm4	# tmp1406, c2, c2
	jg	.L8	#,
.L7:
	vmovupd	%ymm2, 0(%r13)	# c0,* D.10385
	addq	$32, %r10	#, ivtmp.223
	addq	$32, %r11	#, ivtmp.226
	vmovupd	%ymm3, -32(%r10)	# c1,
	vmovupd	%ymm4, (%rbx)	# c2,* D.10385
	vmovupd	%ymm0, (%r15)	# c3,* D.10385
	cmpq	296(%rsp), %r10	# %sfp, ivtmp.223
	jne	.L12	#,
.L11:
	movq	72(%rsp), %r9	# %sfp, D.10389
	addl	$4, 216(%rsp)	#, %sfp
	addq	%r9, 232(%rsp)	# D.10389, %sfp
	movl	136(%rsp), %r8d	# %sfp, j1
	addq	%r9, %rsi	# D.10389, ivtmp.236
	cmpl	%r8d, 216(%rsp)	# j1, %sfp
	jl	.L6	#,
	movl	284(%rsp), %r11d	# %sfp, i1
	movq	40(%rsp), %rsi	# %sfp, ivtmp.265
	movl	116(%rsp), %r9d	# %sfp, iend
	movl	184(%rsp), %r10d	# %sfp, D.10390
	movl	96(%rsp), %edi	# %sfp, j1
	movl	-4(%rsp), %ecx	# %sfp, ivtmp.203
	movslq	%r11d, %rax	# i1, D.10386
	movl	%r11d, %r8d	# i1, D.10390
	movq	32(%rsp), %r15	# %sfp, A
	movq	%rax, %r13	# D.10386, D.10386
	subl	$1, %r9d	#, D.10390
	movq	%rax, 64(%rsp)	# D.10386, %sfp
	leaq	1(%rsi,%r13), %rdx	#, D.10386
	addq	%rsi, %rax	# ivtmp.265, ivtmp.198
	movl	%edi, 112(%rsp)	# j1, %sfp
	subl	%r11d, %r9d	# i1, D.10386
	leal	1(%r10), %edi	#, k1
	movq	288(%rsp), %rbx	# %sfp, B
	addq	%rdx, %r9	# D.10386, D.10386
	subl	%eax, %r8d	# ivtmp.198, D.10390
	movl	%r12d, %r13d	# D.10390, D.10390
	movq	%rax, 56(%rsp)	# ivtmp.198, %sfp
	movq	%r9, 192(%rsp)	# D.10386, %sfp
	movl	%ecx, %r12d	# ivtmp.203, ivtmp.203
	movl	%r8d, 184(%rsp)	# D.10390, %sfp
	movl	%edi, 172(%rsp)	# k1, %sfp
	.p2align 4,,10
	.p2align 3
.L27:
	movl	284(%rsp), %ecx	# %sfp, i1
	cmpl	%ecx, 116(%rsp)	# i1, %sfp
	jle	.L18	#,
	movq	88(%rsp), %rdx	# %sfp, ivtmp.266
	movq	64(%rsp), %rax	# %sfp, D.10386
	movslq	%r12d, %r11	# ivtmp.203, D.10386
	movq	80(%rsp), %rsi	# %sfp, C
	movl	%r10d, 176(%rsp)	# D.10390, %sfp
	addq	%r11, %rax	# D.10386, D.10386
	addq	%rdx, %r11	# ivtmp.266, D.10386
	leaq	(%rbx,%r11,8), %r9	#, batmp.74
	leaq	(%rsi,%rax,8), %rsi	#, ivtmp.190
	movl	%edx, %eax	# ivtmp.266, tmp1893
	movl	%r12d, %r11d	# ivtmp.203, ivtmp.203
	movq	56(%rsp), %rdx	# %sfp, ivtmp.198
	movq	%r9, 120(%rsp)	# batmp.74, %sfp
	andl	$31, %r9d	#, D.10389
	shrq	$3, %r9	#, D.10389
	negq	%r9	# D.10389
	andl	$3, %r9d	#, D.10390
	cmpl	%r9d, %r13d	# D.10390, D.10390
	cmovbe	%r13d, %r9d	# D.10390,, prolog_loop_niters.77
	addl	%r12d, %eax	# ivtmp.203, D.10390
	cltq
	movl	%r9d, 180(%rsp)	# prolog_loop_niters.77, %sfp
	leaq	(%rbx,%rax,8), %r8	#, D.10385
	movl	172(%rsp), %eax	# %sfp, k1
	movq	%r8, 160(%rsp)	# D.10385, %sfp
	addl	%r12d, %eax	# ivtmp.203, D.10387
	cltq
	movq	%rax, 152(%rsp)	# D.10386, %sfp
	leal	2(%r10), %eax	#, k1
	movl	%eax, 168(%rsp)	# k1, %sfp
	addl	%r12d, %eax	# ivtmp.203, D.10387
	cltq
	movq	%rax, 144(%rsp)	# D.10386, %sfp
	leal	3(%r10), %eax	#, k1
	movl	%eax, 140(%rsp)	# k1, %sfp
	addl	%r12d, %eax	# ivtmp.203, D.10387
	cltq
	movq	%rax, 128(%rsp)	# D.10386, %sfp
	jmp	.L30	#
	.p2align 4,,10
	.p2align 3
.L175:
	movq	160(%rsp), %rcx	# %sfp, D.10385
	vmovsd	(%r15,%rdx,8), %xmm3	# MEM[base: A_64(D), index: ivtmp.198_467, step: 8, offset: 0B], MEM[base: A_64(D), index: ivtmp.198_467, step: 8, offset: 0B]
	cmpl	$1, %r9d	#, prologue_after_cost_adjust.78
	movl	172(%rsp), %eax	# %sfp, k1
	vmulsd	(%rcx), %xmm3, %xmm2	# *_848, MEM[base: A_64(D), index: ivtmp.198_467, step: 8, offset: 0B], D.10388
	vaddsd	%xmm2, %xmm5, %xmm5	# D.10388, D__lsm.28, D.10388
	jbe	.L22	#,
	movq	152(%rsp), %r8	# %sfp, D.10386
	movq	272(%rsp), %rdi	# %sfp, D.10385
	cmpl	$2, %r9d	#, prologue_after_cost_adjust.78
	movl	168(%rsp), %eax	# %sfp, k1
	vmovsd	(%rbx,%r8,8), %xmm1	# *_867, *_867
	vmulsd	(%rdi,%rdx,8), %xmm1, %xmm6	# MEM[base: _1041, index: ivtmp.198_467, step: 8, offset: 0B], *_867, D.10388
	vaddsd	%xmm6, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L22	#,
	movq	144(%rsp), %r10	# %sfp, D.10386
	movq	264(%rsp), %rax	# %sfp, D.10385
	cmpl	$3, %r9d	#, prologue_after_cost_adjust.78
	vmovsd	(%rbx,%r10,8), %xmm7	# *_886, *_886
	vmulsd	(%rax,%rdx,8), %xmm7, %xmm8	# MEM[base: _1050, index: ivtmp.198_467, step: 8, offset: 0B], *_886, D.10388
	movl	140(%rsp), %eax	# %sfp, k1
	vaddsd	%xmm8, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L22	#,
	movq	128(%rsp), %rcx	# %sfp, D.10386
	movq	256(%rsp), %r8	# %sfp, D.10385
	movl	176(%rsp), %edi	# %sfp, D.10390
	vmovsd	(%rbx,%rcx,8), %xmm9	# *_905, *_905
	movl	%edi, %eax	# D.10390, D.10390
	vmulsd	(%r8,%rdx,8), %xmm9, %xmm4	# MEM[base: _1059, index: ivtmp.198_467, step: 8, offset: 0B], *_905, D.10388
	addl	$4, %eax	#, k1
	cmpl	$4, %r9d	#, prologue_after_cost_adjust.78
	vaddsd	%xmm4, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L22	#,
	addl	%r11d, %eax	# ivtmp.203, D.10387
	movq	248(%rsp), %r10	# %sfp, D.10385
	cltq
	vmovsd	(%rbx,%rax,8), %xmm0	# *_924, *_924
	movl	%edi, %eax	# D.10390, D.10390
	addl	$5, %eax	#, k1
	cmpl	$5, %r9d	#, prologue_after_cost_adjust.78
	vmulsd	(%r10,%rdx,8), %xmm0, %xmm10	# MEM[base: _1068, index: ivtmp.198_467, step: 8, offset: 0B], *_924, D.10388
	vaddsd	%xmm10, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L22	#,
	addl	%r11d, %eax	# ivtmp.203, D.10387
	cltq
	vmovsd	(%rbx,%rax,8), %xmm11	# *_519, *_519
	movq	240(%rsp), %rax	# %sfp, D.10385
	vmulsd	(%rax,%rdx,8), %xmm11, %xmm12	# MEM[base: _1032, index: ivtmp.198_467, step: 8, offset: 0B], *_519, D.10388
	movl	%edi, %eax	# D.10390, D.10390
	addl	$6, %eax	#, k1
	vaddsd	%xmm5, %xmm12, %xmm5	# D.10388, D.10388, D__lsm.28
.L22:
	cmpl	%r9d, %r13d	# prologue_after_cost_adjust.78, D.10390
	je	.L23	#,
.L21:
	movl	%r13d, %r8d	# D.10390, niters.80
	movl	%r9d, %ecx	# prologue_after_cost_adjust.78, prolog_loop_adjusted_niters.79
	subl	%r9d, %r8d	# prologue_after_cost_adjust.78, niters.80
	movl	%r8d, %edi	# niters.80, niters.80
	movl	%r8d, 232(%rsp)	# niters.80, %sfp
	shrl	$2, %edi	#, bnd.81
	leal	0(,%rdi,4), %r9d	#, ratio_mult_vf.82
	testl	%r9d, %r9d	# ratio_mult_vf.82
	je	.L24	#,
	movq	120(%rsp), %r10	# %sfp, batmp.74
	movl	$1, 296(%rsp)	#, %sfp
	leaq	(%r10,%rcx,8), %r8	#, ivtmp.179
	leal	-1(%rdi), %r10d	#, tmp1368
	imulq	224(%rsp), %rcx	# %sfp, D.10392
	movq	%r8, 216(%rsp)	# ivtmp.179, %sfp
	movl	%r10d, 208(%rsp)	# tmp1368, %sfp
	andl	$3, 208(%rsp)	#, %sfp
	addq	%rdx, %rcx	# ivtmp.198, D.10392
	leaq	(%r15,%rcx,8), %r8	#, D.10385
	leaq	(%r8,%r14), %rcx	#, ivtmp.183
	vmovsd	(%r8,%r14,2), %xmm13	# MEM[base: _712, index: _398, offset: 0B], tmp1871
	movq	304(%rsp), %r8	# %sfp, D.10386
	vmovhpd	(%rcx,%r14,2), %xmm13, %xmm14	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp1871, tmp1451
	vmovsd	(%rcx,%r8), %xmm15	# MEM[base: _712, index: _1104, offset: 0B], tmp1873
	movq	216(%rsp), %r8	# %sfp, ivtmp.179
	vmovhpd	(%rcx), %xmm15, %xmm3	# MEM[base: _712, offset: 0B], tmp1873, tmp1454
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	addq	$32, %r8	#, ivtmp.179
	vinsertf128	$0x1, %xmm14, %ymm3, %ymm2	# tmp1451, tmp1454, vect_cst_.84
	vmulpd	-32(%r8), %ymm2, %ymm1	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.91
	cmpl	$1, %edi	#, bnd.81
	jbe	.L156	#,
	movl	208(%rsp), %r10d	# %sfp, tmp1368
	testl	%r10d, %r10d	# tmp1368
	je	.L169	#,
	cmpl	$1, %r10d	#, tmp1368
	je	.L140	#,
	cmpl	$2, %r10d	#, tmp1368
	je	.L141	#,
	movq	304(%rsp), %r8	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm6	# MEM[base: _712, index: _398, offset: 0B], tmp2018
	movq	216(%rsp), %r10	# %sfp, ivtmp.179
	movl	$2, 296(%rsp)	#, %sfp
	vmovhpd	(%rcx,%r14,2), %xmm6, %xmm8	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp2018, tmp1603
	vmovsd	(%rcx,%r8), %xmm7	# MEM[base: _712, index: _1104, offset: 0B], tmp2020
	leaq	64(%r10), %r8	#, ivtmp.179
	vmovhpd	(%rcx), %xmm7, %xmm9	# MEM[base: _712, offset: 0B], tmp2020, tmp1606
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm8, %ymm9, %ymm4	# tmp1603, tmp1606, vect_cst_.84
	vmulpd	32(%r10), %ymm4, %ymm0	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vaddpd	%ymm0, %ymm1, %ymm1	# vect_var_.90, vect_var_.91, vect_var_.91
.L141:
	movq	304(%rsp), %r10	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm10	# MEM[base: _712, index: _398, offset: 0B], tmp2023
	addl	$1, 296(%rsp)	#, %sfp
	addq	$32, %r8	#, ivtmp.179
	vmovhpd	(%rcx,%r14,2), %xmm10, %xmm11	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp2023, tmp1611
	vmovsd	(%rcx,%r10), %xmm12	# MEM[base: _712, index: _1104, offset: 0B], tmp2025
	vmovhpd	(%rcx), %xmm12, %xmm13	# MEM[base: _712, offset: 0B], tmp2025, tmp1614
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1611, tmp1614, vect_cst_.84
	vmulpd	-32(%r8), %ymm14, %ymm15	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vaddpd	%ymm15, %ymm1, %ymm1	# vect_var_.90, vect_var_.91, vect_var_.91
.L140:
	movq	304(%rsp), %r10	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm3	# MEM[base: _712, index: _398, offset: 0B], tmp2026
	addl	$1, 296(%rsp)	#, %sfp
	addq	$32, %r8	#, ivtmp.179
	vmovhpd	(%rcx,%r14,2), %xmm3, %xmm2	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp2026, tmp1619
	vmovsd	(%rcx,%r10), %xmm6	# MEM[base: _712, index: _1104, offset: 0B], tmp2028
	vmovhpd	(%rcx), %xmm6, %xmm8	# MEM[base: _712, offset: 0B], tmp2028, tmp1622
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm2, %ymm8, %ymm7	# tmp1619, tmp1622, vect_cst_.84
	vmulpd	-32(%r8), %ymm7, %ymm9	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	cmpl	296(%rsp), %edi	# %sfp, bnd.81
	vaddpd	%ymm9, %ymm1, %ymm1	# vect_var_.90, vect_var_.91, vect_var_.91
	jbe	.L156	#,
.L169:
	movl	%eax, 216(%rsp)	# k1, %sfp
	movl	176(%rsp), %r10d	# %sfp, D.10390
	movq	304(%rsp), %rax	# %sfp, D.10386
.L25:
	vmovsd	(%rcx,%r14), %xmm4	# MEM[base: _712, index: _398, offset: 0B], tmp1839
	addl	$4, 296(%rsp)	#, %sfp
	subq	$-128, %r8	#, ivtmp.179
	vmovsd	(%rcx,%rax), %xmm10	# MEM[base: _712, index: _1104, offset: 0B], tmp1841
	vmovhpd	(%rcx,%r14,2), %xmm4, %xmm0	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp1839, tmp1030
	vmovhpd	(%rcx), %xmm10, %xmm11	# MEM[base: _712, offset: 0B], tmp1841, tmp1033
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm0, %ymm11, %ymm12	# tmp1030, tmp1033, vect_cst_.84
	vmovsd	(%rcx,%r14), %xmm15	# MEM[base: _712, index: _398, offset: 0B], tmp1842
	vmovsd	(%rcx,%rax), %xmm3	# MEM[base: _712, index: _1104, offset: 0B], tmp1844
	vmulpd	-128(%r8), %ymm12, %ymm13	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vmovhpd	(%rcx,%r14,2), %xmm15, %xmm2	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp1842, tmp1415
	vmovhpd	(%rcx), %xmm3, %xmm6	# MEM[base: _712, offset: 0B], tmp1844, tmp1418
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm2, %ymm6, %ymm8	# tmp1415, tmp1418, vect_cst_.84
	vmovsd	(%rcx,%rax), %xmm0	# MEM[base: _712, index: _1104, offset: 0B], tmp1847
	vmulpd	-96(%r8), %ymm8, %ymm7	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vaddpd	%ymm13, %ymm1, %ymm14	# vect_var_.90, vect_var_.91, vect_var_.91
	vmovsd	(%rcx,%r14), %xmm1	# MEM[base: _712, index: _398, offset: 0B], tmp1845
	vmovhpd	(%rcx), %xmm0, %xmm10	# MEM[base: _712, offset: 0B], tmp1847, tmp1430
	vmovhpd	(%rcx,%r14,2), %xmm1, %xmm4	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp1845, tmp1427
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm4, %ymm10, %ymm11	# tmp1427, tmp1430, vect_cst_.84
	vaddpd	%ymm7, %ymm14, %ymm9	# vect_var_.90, vect_var_.91, vect_var_.91
	vmovsd	(%rcx,%rax), %xmm2	# MEM[base: _712, index: _1104, offset: 0B], tmp1850
	vmovsd	(%rcx,%r14), %xmm14	# MEM[base: _712, index: _398, offset: 0B], tmp1848
	vmulpd	-64(%r8), %ymm11, %ymm12	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vmovhpd	(%rcx), %xmm2, %xmm3	# MEM[base: _712, offset: 0B], tmp1850, tmp1442
	vmovhpd	(%rcx,%r14,2), %xmm14, %xmm15	# MEM[base: _712, index: _398, step: 2, offset: 0B], tmp1848, tmp1439
	addq	320(%rsp), %rcx	# %sfp, ivtmp.183
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm6	# tmp1439, tmp1442, vect_cst_.84
	vmulpd	-32(%r8), %ymm6, %ymm8	# MEM[base: _713, offset: 0B], vect_cst_.84, vect_var_.90
	vaddpd	%ymm12, %ymm9, %ymm13	# vect_var_.90, vect_var_.91, vect_var_.91
	cmpl	296(%rsp), %edi	# %sfp, bnd.81
	vaddpd	%ymm8, %ymm13, %ymm1	# vect_var_.90, vect_var_.91, vect_var_.91
	ja	.L25	#,
	movl	216(%rsp), %eax	# %sfp, k1
	movl	%r10d, 176(%rsp)	# D.10390, %sfp
	.p2align 4,,10
	.p2align 3
.L156:
	vhaddpd	%ymm1, %ymm1, %ymm7	# vect_var_.91, vect_var_.91, tmp1045
	addl	%r9d, %eax	# ratio_mult_vf.82, k1
	cmpl	%r9d, 232(%rsp)	# ratio_mult_vf.82, %sfp
	vperm2f128	$1, %ymm7, %ymm7, %ymm9	#, tmp1045, tmp1045, tmp1046
	vaddpd	%ymm9, %ymm7, %ymm1	# tmp1046, tmp1045, vect_var_.93
	vaddsd	%xmm5, %xmm1, %xmm5	# D__lsm.28, stmp_var_.92, D__lsm.28
	je	.L23	#,
.L24:
	movl	332(%rsp), %r9d	# %sfp, n
	leal	(%r11,%rax), %ecx	#, D.10387
	movslq	%ecx, %r10	# D.10387, D.10386
	leal	1(%rax), %ecx	#, k1
	movl	%r9d, %edi	# n, D.10387
	imull	%eax, %edi	# k1, D.10387
	addl	%r12d, %edi	# D.10387, D.10387
	movslq	%edi, %r8	# D.10387, D.10386
	vmovsd	(%r15,%r8,8), %xmm4	# *_808, *_808
	movl	328(%rsp), %r8d	# %sfp, kend
	vmulsd	(%rbx,%r10,8), %xmm4, %xmm0	# *_813, *_808, D.10388
	cmpl	%ecx, %r8d	# k1, kend
	vaddsd	%xmm5, %xmm0, %xmm5	# D__lsm.28, D.10388, D__lsm.28
	jle	.L23	#,
	imull	%ecx, %r9d	# k1, D.10387
	addl	%r11d, %ecx	# ivtmp.203, D.10387
	addl	$2, %eax	#, k1
	movslq	%ecx, %r10	# D.10387, D.10386
	addl	%r12d, %r9d	# D.10387, D.10387
	cmpl	%eax, %r8d	# k1, kend
	movslq	%r9d, %rdi	# D.10387, D.10386
	vmovsd	(%r15,%rdi,8), %xmm10	# *_825, *_825
	vmulsd	(%rbx,%r10,8), %xmm10, %xmm11	# *_830, *_825, D.10388
	vaddsd	%xmm11, %xmm5, %xmm5	# D.10388, D__lsm.28, D.10388
	jle	.L23	#,
	movl	332(%rsp), %ecx	# %sfp, D.10387
	imull	%eax, %ecx	# k1, D.10387
	addl	%r11d, %eax	# ivtmp.203, D.10387
	cltq
	addl	%r12d, %ecx	# D.10387, D.10387
	movslq	%ecx, %r12	# D.10387, D.10386
	vmovsd	(%r15,%r12,8), %xmm12	# *_555, *_555
	vmulsd	(%rbx,%rax,8), %xmm12, %xmm13	# *_560, *_555, D.10388
	vaddsd	%xmm5, %xmm13, %xmm5	# D.10388, D.10388, D__lsm.28
.L23:
	vmovsd	%xmm5, (%rsi)	# D__lsm.28, MEM[base: _1069, offset: 0B]
.L19:
	addq	$8, %rsi	#, ivtmp.190
	addq	$1, %rdx	#, ivtmp.198
	cmpq	192(%rsp), %rdx	# %sfp, ivtmp.198
	je	.L160	#,
.L30:
	movl	316(%rsp), %r10d	# %sfp, k1
	cmpl	%r10d, 328(%rsp)	# k1, %sfp
	movl	184(%rsp), %edi	# %sfp, D.10390
	leal	(%rdi,%rdx), %r12d	#, D.10387
	jle	.L19	#,
	movl	180(%rsp), %r9d	# %sfp, prologue_after_cost_adjust.78
	cmpl	$6, %r13d	#, D.10390
	vmovsd	(%rsi), %xmm5	# MEM[base: _1069, offset: 0B], D__lsm.28
	cmovbe	%r13d, %r9d	# prologue_after_cost_adjust.78,, D.10390, prologue_after_cost_adjust.78
	testl	%r9d, %r9d	# prologue_after_cost_adjust.78
	jne	.L175	#,
	movl	316(%rsp), %eax	# %sfp, k1
	jmp	.L21	#
	.p2align 4,,10
	.p2align 3
.L160:
	movl	176(%rsp), %r10d	# %sfp, D.10390
	movl	%r11d, %r12d	# ivtmp.203, ivtmp.203
.L18:
	addl	$1, 112(%rsp)	#, %sfp
	addl	332(%rsp), %r12d	# %sfp, ivtmp.203
	movl	136(%rsp), %esi	# %sfp, j1
	cmpl	%esi, 112(%rsp)	# j1, %sfp
	jne	.L27	#,
	movl	%r13d, %r12d	# D.10390, D.10390
	movl	%r10d, %r13d	# D.10390, D.10390
.L26:
	movq	24(%rsp), %rdx	# %sfp, ivtmp.247
	movq	-112(%rsp), %rbx	# %sfp, D.10389
	movq	48(%rsp), %r15	# %sfp, ivtmp.173
	movl	280(%rsp), %r11d	# %sfp, i1
	addq	40(%rsp), %r15	# %sfp, ivtmp.173
	movq	32(%rsp), %r10	# %sfp, A
	addq	%rbx, %rdx	# D.10389, ivtmp.165
	cmpl	%r11d, 284(%rsp)	# i1, %sfp
	movq	%rdx, 184(%rsp)	# ivtmp.165, %sfp
	jle	.L5	#,
	.p2align 4,,10
	.p2align 3
.L44:
	movl	136(%rsp), %r8d	# %sfp, j1
	cmpl	%r8d, 312(%rsp)	# j1, %sfp
	jle	.L36	#,
	movl	100(%rsp), %r9d	# %sfp, ivtmp.159
	movq	%r10, %rdi	# A, A
	movq	104(%rsp), %rax	# %sfp, ivtmp.154
	movq	184(%rsp), %rbx	# %sfp, ivtmp.151
	movl	%r8d, 296(%rsp)	# j1, %sfp
	movq	%rdi, %r11	# A, A
	movl	%r9d, %r10d	# ivtmp.159, ivtmp.159
	jmp	.L46	#
	.p2align 4,,10
	.p2align 3
.L176:
	vmovsd	(%rax), %xmm14	# MEM[base: _974, offset: 0B], MEM[base: _974, offset: 0B]
	cmpl	$1, %esi	#, prologue_after_cost_adjust.56
	leal	1(%r13), %edx	#, k1
	vmulsd	(%r11,%r15,8), %xmm14, %xmm15	# MEM[base: A_64(D), index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, offset: 0B], D.10388
	vaddsd	%xmm15, %xmm5, %xmm5	# D.10388, D__lsm.27, D.10388
	jbe	.L40	#,
	movq	272(%rsp), %r8	# %sfp, D.10385
	vmovsd	8(%rax), %xmm2	# MEM[base: _974, index: _979, step: 8, offset: 0B], MEM[base: _974, index: _979, step: 8, offset: 0B]
	cmpl	$2, %esi	#, prologue_after_cost_adjust.56
	leal	2(%r13), %edx	#, k1
	vmulsd	(%r8,%r15,8), %xmm2, %xmm3	# MEM[base: _152, index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, index: _979, step: 8, offset: 0B], D.10388
	vaddsd	%xmm3, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L40	#,
	movq	264(%rsp), %r9	# %sfp, D.10385
	vmovsd	16(%rax), %xmm6	# MEM[base: _974, index: _984, step: 8, offset: 0B], MEM[base: _974, index: _984, step: 8, offset: 0B]
	cmpl	$3, %esi	#, prologue_after_cost_adjust.56
	leal	3(%r13), %edx	#, k1
	vmulsd	(%r9,%r15,8), %xmm6, %xmm8	# MEM[base: _1001, index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, index: _984, step: 8, offset: 0B], D.10388
	vaddsd	%xmm8, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L40	#,
	movq	256(%rsp), %rdi	# %sfp, D.10385
	vmovsd	24(%rax), %xmm7	# MEM[base: _974, index: _989, step: 8, offset: 0B], MEM[base: _974, index: _989, step: 8, offset: 0B]
	cmpl	$4, %esi	#, prologue_after_cost_adjust.56
	leal	4(%r13), %edx	#, k1
	vmulsd	(%rdi,%r15,8), %xmm7, %xmm9	# MEM[base: _1010, index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, index: _989, step: 8, offset: 0B], D.10388
	vaddsd	%xmm9, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L40	#,
	movq	248(%rsp), %rcx	# %sfp, D.10385
	vmovsd	32(%rax), %xmm1	# MEM[base: _974, index: _994, step: 8, offset: 0B], MEM[base: _974, index: _994, step: 8, offset: 0B]
	cmpl	$5, %esi	#, prologue_after_cost_adjust.56
	leal	5(%r13), %edx	#, k1
	vmulsd	(%rcx,%r15,8), %xmm1, %xmm4	# MEM[base: _1019, index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, index: _994, step: 8, offset: 0B], D.10388
	vaddsd	%xmm4, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L40	#,
	movq	240(%rsp), %rdx	# %sfp, D.10385
	vmovsd	40(%rax), %xmm0	# MEM[base: _974, index: _973, step: 8, offset: 0B], MEM[base: _974, index: _973, step: 8, offset: 0B]
	vmulsd	(%rdx,%r15,8), %xmm0, %xmm10	# MEM[base: _795, index: ivtmp.173_717, step: 8, offset: 0B], MEM[base: _974, index: _973, step: 8, offset: 0B], D.10388
	leal	6(%r13), %edx	#, k1
	vaddsd	%xmm5, %xmm10, %xmm5	# D.10388, D.10388, D__lsm.27
.L40:
	cmpl	%r12d, %esi	# D.10390, prologue_after_cost_adjust.56
	je	.L41	#,
.L39:
	movl	%r12d, %r8d	# D.10390, niters.58
	movl	%esi, %r9d	# prologue_after_cost_adjust.56, prolog_loop_adjusted_niters.57
	subl	%esi, %r8d	# prologue_after_cost_adjust.56, niters.58
	movl	%r8d, %esi	# niters.58, bnd.59
	movl	%r8d, 216(%rsp)	# niters.58, %sfp
	shrl	$2, %esi	#, bnd.59
	leal	0(,%rsi,4), %r8d	#, ratio_mult_vf.60
	testl	%r8d, %r8d	# ratio_mult_vf.60
	je	.L42	#,
	leaq	(%rax,%r9,8), %rdi	#, ivtmp.140
	movl	$1, 232(%rsp)	#, %sfp
	imulq	224(%rsp), %r9	# %sfp, D.10392
	movq	%rdi, 208(%rsp)	# ivtmp.140, %sfp
	addq	%r15, %r9	# ivtmp.173, D.10392
	leaq	(%r11,%r9,8), %rdi	#, D.10385
	leal	-1(%rsi), %r9d	#, tmp1363
	leaq	(%rdi,%r14), %rcx	#, ivtmp.144
	vmovsd	(%rdi,%r14,2), %xmm11	# MEM[base: _230, index: _398, offset: 0B], tmp1932
	movq	304(%rsp), %rdi	# %sfp, D.10386
	movl	%r9d, 192(%rsp)	# tmp1363, %sfp
	vmovhpd	(%rcx,%r14,2), %xmm11, %xmm12	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp1932, tmp1499
	andl	$3, 192(%rsp)	#, %sfp
	vmovsd	(%rcx,%rdi), %xmm13	# MEM[base: _230, index: _1104, offset: 0B], tmp1934
	movq	208(%rsp), %rdi	# %sfp, ivtmp.140
	vmovhpd	(%rcx), %xmm13, %xmm14	# MEM[base: _230, offset: 0B], tmp1934, tmp1502
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	addq	$32, %rdi	#, ivtmp.140
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1499, tmp1502, vect_cst_.62
	vmulpd	-32(%rdi), %ymm15, %ymm1	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.69
	cmpl	$1, %esi	#, bnd.59
	jbe	.L157	#,
	movl	192(%rsp), %r9d	# %sfp, tmp1363
	testl	%r9d, %r9d	# tmp1363
	je	.L167	#,
	cmpl	$1, %r9d	#, tmp1363
	je	.L138	#,
	cmpl	$2, %r9d	#, tmp1363
	je	.L139	#,
	movq	304(%rsp), %rdi	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm2	# MEM[base: _230, index: _398, offset: 0B], tmp2007
	movl	$2, 232(%rsp)	#, %sfp
	vmovhpd	(%rcx,%r14,2), %xmm2, %xmm6	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp2007, tmp1579
	vmovsd	(%rcx,%rdi), %xmm3	# MEM[base: _230, index: _1104, offset: 0B], tmp2009
	movq	208(%rsp), %rdi	# %sfp, ivtmp.140
	vmovhpd	(%rcx), %xmm3, %xmm8	# MEM[base: _230, offset: 0B], tmp2009, tmp1582
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	addq	$64, %rdi	#, ivtmp.140
	vinsertf128	$0x1, %xmm6, %ymm8, %ymm7	# tmp1579, tmp1582, vect_cst_.62
	vmulpd	-32(%rdi), %ymm7, %ymm9	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vaddpd	%ymm9, %ymm1, %ymm1	# vect_var_.68, vect_var_.69, vect_var_.69
.L139:
	movq	304(%rsp), %r9	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm4	# MEM[base: _230, index: _398, offset: 0B], tmp2012
	addl	$1, 232(%rsp)	#, %sfp
	addq	$32, %rdi	#, ivtmp.140
	vmovhpd	(%rcx,%r14,2), %xmm4, %xmm0	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp2012, tmp1587
	vmovsd	(%rcx,%r9), %xmm10	# MEM[base: _230, index: _1104, offset: 0B], tmp2014
	vmovhpd	(%rcx), %xmm10, %xmm11	# MEM[base: _230, offset: 0B], tmp2014, tmp1590
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm0, %ymm11, %ymm12	# tmp1587, tmp1590, vect_cst_.62
	vmulpd	-32(%rdi), %ymm12, %ymm13	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vaddpd	%ymm13, %ymm1, %ymm1	# vect_var_.68, vect_var_.69, vect_var_.69
.L138:
	movq	304(%rsp), %r9	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm14	# MEM[base: _230, index: _398, offset: 0B], tmp2015
	addl	$1, 232(%rsp)	#, %sfp
	addq	$32, %rdi	#, ivtmp.140
	vmovhpd	(%rcx,%r14,2), %xmm14, %xmm15	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp2015, tmp1595
	vmovsd	(%rcx,%r9), %xmm2	# MEM[base: _230, index: _1104, offset: 0B], tmp2017
	vmovhpd	(%rcx), %xmm2, %xmm6	# MEM[base: _230, offset: 0B], tmp2017, tmp1598
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm15, %ymm6, %ymm3	# tmp1595, tmp1598, vect_cst_.62
	vmulpd	-32(%rdi), %ymm3, %ymm8	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	cmpl	232(%rsp), %esi	# %sfp, bnd.59
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.68, vect_var_.69, vect_var_.69
	jbe	.L157	#,
.L167:
	movq	%rax, 208(%rsp)	# ivtmp.154, %sfp
	movl	296(%rsp), %r9d	# %sfp, j1
	movq	304(%rsp), %rax	# %sfp, D.10386
.L43:
	vmovsd	(%rcx,%r14), %xmm7	# MEM[base: _230, index: _398, offset: 0B], tmp1903
	addl	$4, 232(%rsp)	#, %sfp
	subq	$-128, %rdi	#, ivtmp.140
	vmovsd	(%rcx,%rax), %xmm4	# MEM[base: _230, index: _1104, offset: 0B], tmp1905
	vmovhpd	(%rcx,%r14,2), %xmm7, %xmm9	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp1903, tmp1118
	vmovhpd	(%rcx), %xmm4, %xmm0	# MEM[base: _230, offset: 0B], tmp1905, tmp1121
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm9, %ymm0, %ymm10	# tmp1118, tmp1121, vect_cst_.62
	vmovsd	(%rcx,%r14), %xmm13	# MEM[base: _230, index: _398, offset: 0B], tmp1906
	vmovsd	(%rcx,%rax), %xmm15	# MEM[base: _230, index: _1104, offset: 0B], tmp1908
	vmulpd	-128(%rdi), %ymm10, %ymm11	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vmovhpd	(%rcx,%r14,2), %xmm13, %xmm14	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp1906, tmp1463
	vmovhpd	(%rcx), %xmm15, %xmm2	# MEM[base: _230, offset: 0B], tmp1908, tmp1466
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm6	# tmp1463, tmp1466, vect_cst_.62
	vmovsd	(%rcx,%rax), %xmm7	# MEM[base: _230, index: _1104, offset: 0B], tmp1911
	vmulpd	-96(%rdi), %ymm6, %ymm3	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vaddpd	%ymm11, %ymm1, %ymm12	# vect_var_.68, vect_var_.69, vect_var_.69
	vmovsd	(%rcx,%r14), %xmm1	# MEM[base: _230, index: _398, offset: 0B], tmp1909
	vmovhpd	(%rcx), %xmm7, %xmm4	# MEM[base: _230, offset: 0B], tmp1911, tmp1478
	vmovhpd	(%rcx,%r14,2), %xmm1, %xmm9	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp1909, tmp1475
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm9, %ymm4, %ymm0	# tmp1475, tmp1478, vect_cst_.62
	vaddpd	%ymm3, %ymm12, %ymm8	# vect_var_.68, vect_var_.69, vect_var_.69
	vmovsd	(%rcx,%rax), %xmm14	# MEM[base: _230, index: _1104, offset: 0B], tmp1914
	vmovsd	(%rcx,%r14), %xmm12	# MEM[base: _230, index: _398, offset: 0B], tmp1912
	vmulpd	-64(%rdi), %ymm0, %ymm10	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vmovhpd	(%rcx), %xmm14, %xmm15	# MEM[base: _230, offset: 0B], tmp1914, tmp1490
	vmovhpd	(%rcx,%r14,2), %xmm12, %xmm13	# MEM[base: _230, index: _398, step: 2, offset: 0B], tmp1912, tmp1487
	addq	320(%rsp), %rcx	# %sfp, ivtmp.144
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm2	# tmp1487, tmp1490, vect_cst_.62
	vmulpd	-32(%rdi), %ymm2, %ymm6	# MEM[base: _803, offset: 0B], vect_cst_.62, vect_var_.68
	vaddpd	%ymm10, %ymm8, %ymm11	# vect_var_.68, vect_var_.69, vect_var_.69
	cmpl	232(%rsp), %esi	# %sfp, bnd.59
	vaddpd	%ymm6, %ymm11, %ymm1	# vect_var_.68, vect_var_.69, vect_var_.69
	ja	.L43	#,
	movq	208(%rsp), %rax	# %sfp, ivtmp.154
	movl	%r9d, 296(%rsp)	# j1, %sfp
	.p2align 4,,10
	.p2align 3
.L157:
	vhaddpd	%ymm1, %ymm1, %ymm3	# vect_var_.69, vect_var_.69, tmp1133
	addl	%r8d, %edx	# ratio_mult_vf.60, k1
	cmpl	216(%rsp), %r8d	# %sfp, ratio_mult_vf.60
	vperm2f128	$1, %ymm3, %ymm3, %ymm8	#, tmp1133, tmp1133, tmp1134
	vaddpd	%ymm8, %ymm3, %ymm1	# tmp1134, tmp1133, vect_var_.71
	vaddsd	%xmm5, %xmm1, %xmm5	# D__lsm.27, stmp_var_.70, D__lsm.27
	je	.L41	#,
.L42:
	movl	332(%rsp), %edi	# %sfp, n
	leal	(%r10,%rdx), %ecx	#, D.10387
	movslq	%ecx, %r9	# D.10387, D.10386
	leal	1(%rdx), %ecx	#, k1
	movl	%edi, %esi	# n, D.10387
	imull	%edx, %esi	# k1, D.10387
	addl	280(%rsp), %esi	# %sfp, D.10387
	movslq	%esi, %r8	# D.10387, D.10386
	vmovsd	(%r11,%r8,8), %xmm9	# *_679, *_679
	movq	288(%rsp), %r8	# %sfp, B
	vmulsd	(%r8,%r9,8), %xmm9, %xmm7	# *_684, *_679, D.10388
	movl	328(%rsp), %r9d	# %sfp, kend
	cmpl	%ecx, %r9d	# k1, kend
	vaddsd	%xmm5, %xmm7, %xmm5	# D__lsm.27, D.10388, D__lsm.27
	jle	.L41	#,
	imull	%ecx, %edi	# k1, D.10387
	addl	280(%rsp), %edi	# %sfp, D.10387
	addl	%r10d, %ecx	# ivtmp.159, D.10387
	movslq	%ecx, %rcx	# D.10387, D.10386
	addl	$2, %edx	#, k1
	cmpl	%edx, %r9d	# k1, kend
	movslq	%edi, %rsi	# D.10387, D.10386
	vmovsd	(%r11,%rsi,8), %xmm4	# *_696, *_696
	vmulsd	(%r8,%rcx,8), %xmm4, %xmm0	# *_701, *_696, D.10388
	vaddsd	%xmm0, %xmm5, %xmm5	# D.10388, D__lsm.27, D.10388
	jle	.L41	#,
	movl	332(%rsp), %r9d	# %sfp, D.10387
	movq	288(%rsp), %rsi	# %sfp, B
	imull	%edx, %r9d	# k1, D.10387
	addl	280(%rsp), %r9d	# %sfp, D.10387
	addl	%r10d, %edx	# ivtmp.159, D.10387
	movslq	%edx, %rdx	# D.10387, D.10386
	movslq	%r9d, %rdi	# D.10387, D.10386
	vmovsd	(%r11,%rdi,8), %xmm10	# *_6, *_6
	vmulsd	(%rsi,%rdx,8), %xmm10, %xmm11	# *_1, *_6, D.10388
	vaddsd	%xmm5, %xmm11, %xmm5	# D.10388, D.10388, D__lsm.27
.L41:
	vmovsd	%xmm5, (%rbx)	# D__lsm.27, MEM[base: _995, offset: 0B]
.L37:
	addl	$1, 296(%rsp)	#, %sfp
	addq	%r14, %rbx	# D.10386, ivtmp.151
	addq	%r14, %rax	# D.10386, ivtmp.154
	addl	332(%rsp), %r10d	# %sfp, ivtmp.159
	movl	312(%rsp), %ecx	# %sfp, jend
	cmpl	%ecx, 296(%rsp)	# jend, %sfp
	je	.L161	#,
.L46:
	movl	316(%rsp), %ecx	# %sfp, k1
	cmpl	%ecx, 328(%rsp)	# k1, %sfp
	jle	.L37	#,
	movq	%rax, %rsi	# ivtmp.154, D.10389
	vmovsd	(%rbx), %xmm5	# MEM[base: _995, offset: 0B], D__lsm.27
	andl	$31, %esi	#, D.10389
	shrq	$3, %rsi	#, D.10389
	negq	%rsi	# D.10389
	andl	$3, %esi	#, D.10390
	cmpl	%r12d, %esi	# D.10390, D.10390
	cmova	%r12d, %esi	# D.10390,, D.10390, prolog_loop_niters.55
	cmpl	$6, %r12d	#, D.10390
	cmovbe	%r12d, %esi	# prolog_loop_niters.55,, D.10390, prologue_after_cost_adjust.56
	testl	%esi, %esi	# prologue_after_cost_adjust.56
	jne	.L176	#,
	movl	316(%rsp), %edx	# %sfp, k1
	jmp	.L39	#
	.p2align 4,,10
	.p2align 3
.L161:
	movq	%r11, %r10	# A, A
.L36:
	addl	$1, 280(%rsp)	#, %sfp
	addq	$8, 184(%rsp)	#, %sfp
	addq	$1, %r15	#, ivtmp.173
	movl	284(%rsp), %ebx	# %sfp, i1
	cmpl	%ebx, 280(%rsp)	# i1, %sfp
	jne	.L44	#,
.L5:
	movl	284(%rsp), %r11d	# %sfp, i1
	cmpl	%r11d, 116(%rsp)	# i1, %sfp
	jle	.L29	#,
	movslq	284(%rsp), %r15	# %sfp, D.10386
	movq	-104(%rsp), %rax	# %sfp, D.10386
	movq	80(%rsp), %r8	# %sfp, C
	addq	%r15, %rax	# D.10386, D.10386
	addq	40(%rsp), %r15	# %sfp, ivtmp.134
	leaq	(%r8,%rax,8), %r9	#, ivtmp.126
	movq	%r9, 208(%rsp)	# ivtmp.126, %sfp
	movq	32(%rsp), %r9	# %sfp, A
	.p2align 4,,10
	.p2align 3
.L45:
	movl	136(%rsp), %edi	# %sfp, j1
	cmpl	%edi, 312(%rsp)	# j1, %sfp
	jle	.L52	#,
	movl	100(%rsp), %esi	# %sfp, ivtmp.120
	movq	104(%rsp), %rax	# %sfp, ivtmp.115
	movq	208(%rsp), %r11	# %sfp, ivtmp.112
	movl	%edi, 296(%rsp)	# j1, %sfp
	movl	%esi, %ebx	# ivtmp.120, ivtmp.120
	jmp	.L60	#
	.p2align 4,,10
	.p2align 3
.L177:
	vmovsd	(%rax), %xmm12	# MEM[base: _743, offset: 0B], MEM[base: _743, offset: 0B]
	cmpl	$1, %r10d	#, prologue_after_cost_adjust.34
	leal	1(%r13), %edx	#, k1
	vmulsd	(%r9,%r15,8), %xmm12, %xmm13	# MEM[base: A_64(D), index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, offset: 0B], D.10388
	vaddsd	%xmm5, %xmm13, %xmm5	# D__lsm.26, D.10388, D.10388
	jbe	.L56	#,
	movq	272(%rsp), %r8	# %sfp, D.10385
	vmovsd	8(%rax), %xmm14	# MEM[base: _743, index: _371, step: 8, offset: 0B], MEM[base: _743, index: _371, step: 8, offset: 0B]
	cmpl	$2, %r10d	#, prologue_after_cost_adjust.34
	leal	2(%r13), %edx	#, k1
	vmulsd	(%r8,%r15,8), %xmm14, %xmm15	# MEM[base: _288, index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, index: _371, step: 8, offset: 0B], D.10388
	vaddsd	%xmm5, %xmm15, %xmm5	# D.10388, D.10388, D.10388
	je	.L56	#,
	movq	264(%rsp), %rdi	# %sfp, D.10385
	vmovsd	16(%rax), %xmm2	# MEM[base: _743, index: _637, step: 8, offset: 0B], MEM[base: _743, index: _637, step: 8, offset: 0B]
	cmpl	$3, %r10d	#, prologue_after_cost_adjust.34
	leal	3(%r13), %edx	#, k1
	vmulsd	(%rdi,%r15,8), %xmm2, %xmm6	# MEM[base: _945, index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, index: _637, step: 8, offset: 0B], D.10388
	vaddsd	%xmm6, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L56	#,
	movq	256(%rsp), %rsi	# %sfp, D.10385
	vmovsd	24(%rax), %xmm3	# MEM[base: _743, index: _294, step: 8, offset: 0B], MEM[base: _743, index: _294, step: 8, offset: 0B]
	cmpl	$4, %r10d	#, prologue_after_cost_adjust.34
	leal	4(%r13), %edx	#, k1
	vmulsd	(%rsi,%r15,8), %xmm3, %xmm8	# MEM[base: _954, index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, index: _294, step: 8, offset: 0B], D.10388
	vaddsd	%xmm8, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L56	#,
	movq	248(%rsp), %rcx	# %sfp, D.10385
	vmovsd	32(%rax), %xmm1	# MEM[base: _743, index: _938, step: 8, offset: 0B], MEM[base: _743, index: _938, step: 8, offset: 0B]
	cmpl	$5, %r10d	#, prologue_after_cost_adjust.34
	leal	5(%r13), %edx	#, k1
	vmulsd	(%rcx,%r15,8), %xmm1, %xmm9	# MEM[base: _963, index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, index: _938, step: 8, offset: 0B], D.10388
	vaddsd	%xmm9, %xmm5, %xmm5	# D.10388, D.10388, D.10388
	je	.L56	#,
	movq	240(%rsp), %rdx	# %sfp, D.10385
	vmovsd	40(%rax), %xmm7	# MEM[base: _743, index: _747, step: 8, offset: 0B], MEM[base: _743, index: _747, step: 8, offset: 0B]
	vmulsd	(%rdx,%r15,8), %xmm7, %xmm4	# MEM[base: _164, index: ivtmp.134_80, step: 8, offset: 0B], MEM[base: _743, index: _747, step: 8, offset: 0B], D.10388
	leal	6(%r13), %edx	#, k1
	vaddsd	%xmm5, %xmm4, %xmm5	# D.10388, D.10388, D__lsm.26
.L56:
	cmpl	%r12d, %r10d	# D.10390, prologue_after_cost_adjust.34
	je	.L57	#,
.L55:
	movl	%r12d, %r8d	# D.10390, niters.36
	movl	%r10d, %ecx	# prologue_after_cost_adjust.34, prolog_loop_adjusted_niters.35
	subl	%r10d, %r8d	# prologue_after_cost_adjust.34, niters.36
	movl	%r8d, %esi	# niters.36, bnd.37
	movl	%r8d, 232(%rsp)	# niters.36, %sfp
	shrl	$2, %esi	#, bnd.37
	leal	0(,%rsi,4), %r10d	#, ratio_mult_vf.38
	testl	%r10d, %r10d	# ratio_mult_vf.38
	movl	%r10d, 280(%rsp)	# ratio_mult_vf.38, %sfp
	je	.L58	#,
	leaq	(%rax,%rcx,8), %rdi	#, ivtmp.100
	leal	-1(%rsi), %r10d	#, tmp1358
	imulq	224(%rsp), %rcx	# %sfp, D.10392
	movq	%rdi, %r8	# ivtmp.100, ivtmp.100
	movq	%rdi, 216(%rsp)	# ivtmp.100, %sfp
	andl	$3, %r10d	#, tmp1358
	addq	$32, %r8	#, ivtmp.100
	addq	%r15, %rcx	# ivtmp.134, D.10392
	leaq	(%r9,%rcx,8), %rdi	#, D.10385
	leaq	(%rdi,%r14), %rcx	#, ivtmp.104
	vmovsd	(%rdi,%r14,2), %xmm0	# MEM[base: _674, index: _398, offset: 0B], tmp1973
	movq	304(%rsp), %rdi	# %sfp, D.10386
	vmovhpd	(%rcx,%r14,2), %xmm0, %xmm10	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1973, tmp1547
	vmovsd	(%rcx,%rdi), %xmm11	# MEM[base: _674, index: _1104, offset: 0B], tmp1975
	movl	$1, %edi	#, ivtmp.95
	vmovhpd	(%rcx), %xmm11, %xmm12	# MEM[base: _674, offset: 0B], tmp1975, tmp1550
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp1547, tmp1550, vect_cst_.40
	vmulpd	-32(%r8), %ymm13, %ymm1	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.47
	cmpl	%esi, %edi	# bnd.37, ivtmp.95
	jnb	.L158	#,
	testl	%r10d, %r10d	# tmp1358
	je	.L165	#,
	cmpl	$1, %r10d	#, tmp1358
	je	.L136	#,
	cmpl	$2, %r10d	#, tmp1358
	je	.L137	#,
	movq	304(%rsp), %r8	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm14	# MEM[base: _674, index: _398, offset: 0B], tmp1996
	movq	216(%rsp), %r10	# %sfp, ivtmp.100
	movl	$2, %edi	#, ivtmp.95
	vmovhpd	(%rcx,%r14,2), %xmm14, %xmm15	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1996, tmp1555
	vmovsd	(%rcx,%r8), %xmm2	# MEM[base: _674, index: _1104, offset: 0B], tmp1998
	leaq	64(%r10), %r8	#, ivtmp.100
	vmovhpd	(%rcx), %xmm2, %xmm6	# MEM[base: _674, offset: 0B], tmp1998, tmp1558
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm15, %ymm6, %ymm3	# tmp1555, tmp1558, vect_cst_.40
	vmulpd	32(%r10), %ymm3, %ymm8	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.46, vect_var_.47, vect_var_.47
.L137:
	movq	304(%rsp), %r10	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm9	# MEM[base: _674, index: _398, offset: 0B], tmp2001
	addl	$1, %edi	#, ivtmp.95
	addq	$32, %r8	#, ivtmp.100
	vmovhpd	(%rcx,%r14,2), %xmm9, %xmm4	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp2001, tmp1563
	vmovsd	(%rcx,%r10), %xmm7	# MEM[base: _674, index: _1104, offset: 0B], tmp2003
	vmovhpd	(%rcx), %xmm7, %xmm0	# MEM[base: _674, offset: 0B], tmp2003, tmp1566
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm4, %ymm0, %ymm10	# tmp1563, tmp1566, vect_cst_.40
	vmulpd	-32(%r8), %ymm10, %ymm11	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	vaddpd	%ymm11, %ymm1, %ymm1	# vect_var_.46, vect_var_.47, vect_var_.47
.L136:
	movq	304(%rsp), %r10	# %sfp, D.10386
	vmovsd	(%rcx,%r14), %xmm12	# MEM[base: _674, index: _398, offset: 0B], tmp2004
	addl	$1, %edi	#, ivtmp.95
	addq	$32, %r8	#, ivtmp.100
	vmovhpd	(%rcx,%r14,2), %xmm12, %xmm13	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp2004, tmp1571
	vmovsd	(%rcx,%r10), %xmm14	# MEM[base: _674, index: _1104, offset: 0B], tmp2006
	vmovhpd	(%rcx), %xmm14, %xmm15	# MEM[base: _674, offset: 0B], tmp2006, tmp1574
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm2	# tmp1571, tmp1574, vect_cst_.40
	vmulpd	-32(%r8), %ymm2, %ymm6	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	cmpl	%esi, %edi	# bnd.37, ivtmp.95
	vaddpd	%ymm6, %ymm1, %ymm1	# vect_var_.46, vect_var_.47, vect_var_.47
	jnb	.L158	#,
.L165:
	movq	%rax, 216(%rsp)	# ivtmp.115, %sfp
	movl	296(%rsp), %r10d	# %sfp, j1
	movq	304(%rsp), %rax	# %sfp, D.10386
.L59:
	vmovsd	(%rcx,%r14), %xmm3	# MEM[base: _674, index: _398, offset: 0B], tmp1942
	addl	$4, %edi	#, ivtmp.95
	subq	$-128, %r8	#, ivtmp.100
	vmovsd	(%rcx,%rax), %xmm9	# MEM[base: _674, index: _1104, offset: 0B], tmp1944
	vmovhpd	(%rcx,%r14,2), %xmm3, %xmm8	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1942, tmp1195
	vmovhpd	(%rcx), %xmm9, %xmm4	# MEM[base: _674, offset: 0B], tmp1944, tmp1198
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm8, %ymm4, %ymm7	# tmp1195, tmp1198, vect_cst_.40
	vmovsd	(%rcx,%r14), %xmm11	# MEM[base: _674, index: _398, offset: 0B], tmp1945
	vmovsd	(%rcx,%rax), %xmm13	# MEM[base: _674, index: _1104, offset: 0B], tmp1947
	vmulpd	-128(%r8), %ymm7, %ymm0	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	vmovhpd	(%rcx,%r14,2), %xmm11, %xmm12	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1945, tmp1511
	vmovhpd	(%rcx), %xmm13, %xmm14	# MEM[base: _674, offset: 0B], tmp1947, tmp1514
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1511, tmp1514, vect_cst_.40
	vmovsd	(%rcx,%r14), %xmm6	# MEM[base: _674, index: _398, offset: 0B], tmp1948
	vmulpd	-96(%r8), %ymm15, %ymm2	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	vaddpd	%ymm0, %ymm1, %ymm10	# vect_var_.46, vect_var_.47, vect_var_.47
	vmovsd	(%rcx,%rax), %xmm3	# MEM[base: _674, index: _1104, offset: 0B], tmp1950
	vmovhpd	(%rcx,%r14,2), %xmm6, %xmm1	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1948, tmp1523
	vmovhpd	(%rcx), %xmm3, %xmm9	# MEM[base: _674, offset: 0B], tmp1950, tmp1526
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm1, %ymm9, %ymm4	# tmp1523, tmp1526, vect_cst_.40
	vaddpd	%ymm2, %ymm10, %ymm8	# vect_var_.46, vect_var_.47, vect_var_.47
	vmovsd	(%rcx,%rax), %xmm12	# MEM[base: _674, index: _1104, offset: 0B], tmp1953
	vmovsd	(%rcx,%r14), %xmm10	# MEM[base: _674, index: _398, offset: 0B], tmp1951
	vmulpd	-64(%r8), %ymm4, %ymm7	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	vmovhpd	(%rcx), %xmm12, %xmm13	# MEM[base: _674, offset: 0B], tmp1953, tmp1538
	vmovhpd	(%rcx,%r14,2), %xmm10, %xmm11	# MEM[base: _674, index: _398, step: 2, offset: 0B], tmp1951, tmp1535
	addq	320(%rsp), %rcx	# %sfp, ivtmp.104
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1535, tmp1538, vect_cst_.40
	vmulpd	-32(%r8), %ymm14, %ymm15	# MEM[base: _835, offset: 0B], vect_cst_.40, vect_var_.46
	cmpl	%esi, %edi	# bnd.37, ivtmp.95
	vaddpd	%ymm7, %ymm8, %ymm0	# vect_var_.46, vect_var_.47, vect_var_.47
	vaddpd	%ymm15, %ymm0, %ymm1	# vect_var_.46, vect_var_.47, vect_var_.47
	jb	.L59	#,
	movq	216(%rsp), %rax	# %sfp, ivtmp.115
	movl	%r10d, 296(%rsp)	# j1, %sfp
	.p2align 4,,10
	.p2align 3
.L158:
	vhaddpd	%ymm1, %ymm1, %ymm8	# vect_var_.47, vect_var_.47, tmp1210
	movl	280(%rsp), %ecx	# %sfp, ratio_mult_vf.38
	movl	232(%rsp), %esi	# %sfp, niters.36
	addl	%ecx, %edx	# ratio_mult_vf.38, k1
	cmpl	%esi, %ecx	# niters.36, ratio_mult_vf.38
	vperm2f128	$1, %ymm8, %ymm8, %ymm2	#, tmp1210, tmp1210, tmp1211
	vaddpd	%ymm2, %ymm8, %ymm6	# tmp1211, tmp1210, vect_var_.49
	vaddsd	%xmm5, %xmm6, %xmm5	# D__lsm.26, stmp_var_.48, D__lsm.26
	je	.L57	#,
.L58:
	movl	332(%rsp), %edi	# %sfp, n
	leal	(%rdx,%rbx), %ecx	#, D.10387
	movslq	%ecx, %rcx	# D.10387, D.10386
	movl	%edi, %r8d	# n, D.10387
	imull	%edx, %r8d	# k1, D.10387
	addl	284(%rsp), %r8d	# %sfp, D.10387
	movslq	%r8d, %r10	# D.10387, D.10386
	movq	288(%rsp), %r8	# %sfp, B
	vmovsd	(%r9,%r10,8), %xmm1	# *_336, *_336
	movl	328(%rsp), %r10d	# %sfp, kend
	vmulsd	(%r8,%rcx,8), %xmm1, %xmm3	# *_23, *_336, D.10388
	leal	1(%rdx), %ecx	#, k1
	cmpl	%ecx, %r10d	# k1, kend
	vaddsd	%xmm5, %xmm3, %xmm5	# D__lsm.26, D.10388, D__lsm.26
	jle	.L57	#,
	imull	%ecx, %edi	# k1, D.10387
	addl	284(%rsp), %edi	# %sfp, D.10387
	addl	%ebx, %ecx	# ivtmp.120, D.10387
	movslq	%ecx, %rcx	# D.10387, D.10386
	addl	$2, %edx	#, k1
	cmpl	%edx, %r10d	# k1, kend
	movslq	%edi, %rsi	# D.10387, D.10386
	vmovsd	(%r9,%rsi,8), %xmm9	# *_376, *_376
	vmulsd	(%r8,%rcx,8), %xmm9, %xmm4	# *_410, *_376, D.10388
	vaddsd	%xmm5, %xmm4, %xmm5	# D__lsm.26, D.10388, D.10388
	jle	.L57	#,
	movl	332(%rsp), %r10d	# %sfp, D.10387
	movq	288(%rsp), %rsi	# %sfp, B
	imull	%edx, %r10d	# k1, D.10387
	addl	284(%rsp), %r10d	# %sfp, D.10387
	addl	%ebx, %edx	# ivtmp.120, D.10387
	movslq	%edx, %rdx	# D.10387, D.10386
	movslq	%r10d, %rdi	# D.10387, D.10386
	vmovsd	(%r9,%rdi,8), %xmm7	# *_350, *_350
	vmulsd	(%rsi,%rdx,8), %xmm7, %xmm0	# *_345, *_350, D.10388
	vaddsd	%xmm0, %xmm5, %xmm5	# D.10388, D.10388, D__lsm.26
.L57:
	vmovsd	%xmm5, (%r11)	# D__lsm.26, MEM[base: _939, offset: 0B]
.L53:
	addl	$1, 296(%rsp)	#, %sfp
	addq	%r14, %r11	# D.10386, ivtmp.112
	addq	%r14, %rax	# D.10386, ivtmp.115
	addl	332(%rsp), %ebx	# %sfp, ivtmp.120
	movl	312(%rsp), %ecx	# %sfp, jend
	cmpl	%ecx, 296(%rsp)	# jend, %sfp
	je	.L52	#,
.L60:
	movl	316(%rsp), %ecx	# %sfp, k1
	cmpl	%ecx, 328(%rsp)	# k1, %sfp
	jle	.L53	#,
	movq	%rax, %r10	# ivtmp.115, D.10389
	vmovsd	(%r11), %xmm5	# MEM[base: _939, offset: 0B], D__lsm.26
	andl	$31, %r10d	#, D.10389
	shrq	$3, %r10	#, D.10389
	negq	%r10	# D.10389
	andl	$3, %r10d	#, D.10390
	cmpl	%r12d, %r10d	# D.10390, D.10390
	cmova	%r12d, %r10d	# D.10390,, D.10390, prolog_loop_niters.33
	cmpl	$6, %r12d	#, D.10390
	cmovbe	%r12d, %r10d	# prolog_loop_niters.33,, D.10390, prologue_after_cost_adjust.34
	testl	%r10d, %r10d	# prologue_after_cost_adjust.34
	jne	.L177	#,
	movl	316(%rsp), %edx	# %sfp, k1
	jmp	.L55	#
	.p2align 4,,10
	.p2align 3
.L52:
	addl	$1, 284(%rsp)	#, %sfp
	addq	$8, 208(%rsp)	#, %sfp
	addq	$1, %r15	#, ivtmp.134
	movl	116(%rsp), %r11d	# %sfp, iend
	cmpl	%r11d, 284(%rsp)	# iend, %sfp
	jne	.L45	#,
.L29:
	addq	$32, 48(%rsp)	#, %sfp
	addq	$256, 24(%rsp)	#, %sfp
	movl	48(%rsp), %ebx	# %sfp, tmp1980
	cmpl	%ebx, 332(%rsp)	# tmp1980, %sfp
	jg	.L62	#,
	movq	(%rsp), %r8	# %sfp, D.10392
	movq	-88(%rsp), %rax	# %sfp, tmp968
	movl	%r12d, %r15d	# D.10390, D.10390
	addq	%rax, -24(%rsp)	# tmp968, %sfp
	addq	%r8, 16(%rsp)	# D.10392, %sfp
	movq	%r14, %r12	# D.10386, D.10386
	movl	-28(%rsp), %r10d	# %sfp, D.10390
	movl	-32(%rsp), %edi	# %sfp, j1
	movl	%r13d, %r14d	# D.10390, D.10390
	addl	%r10d, -4(%rsp)	# D.10390, %sfp
	subq	%r8, -40(%rsp)	# D.10392, %sfp
	cmpl	%edi, 332(%rsp)	# j1, %sfp
	movq	288(%rsp), %r13	# %sfp, B
	jle	.L63	#,
	movl	%edi, 96(%rsp)	# j1, %sfp
	movl	%edi, %ebx	# j1, j1
	jmp	.L64	#
.L63:
	addq	$32, 88(%rsp)	#, %sfp
	movq	(%rsp), %r9	# %sfp, D.10392
	movq	%r13, %r14	# B, B
	addl	%r10d, -8(%rsp)	# D.10390, %sfp
	movq	320(%rsp), %rsi	# %sfp, D.10386
	movq	%r12, %r13	# D.10386, D.10386
	addq	%rsi, 40(%rsp)	# D.10386, %sfp
	movq	-88(%rsp), %rcx	# %sfp, tmp968
	addq	%r9, -16(%rsp)	# D.10392, %sfp
	addq	%rcx, 8(%rsp)	# tmp968, %sfp
	addq	%r9, -48(%rsp)	# D.10392, %sfp
	movl	88(%rsp), %r11d	# %sfp, tmp1995
	addq	%r9, -56(%rsp)	# D.10392, %sfp
	addq	%r9, -64(%rsp)	# D.10392, %sfp
	addq	%r9, -72(%rsp)	# D.10392, %sfp
	addq	$256, -80(%rsp)	#, %sfp
	cmpl	%r11d, 332(%rsp)	# tmp1995, %sfp
	jg	.L66	#,
	vzeroupper
.L172:
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1062:
	.size	avx_dgemm_fast, .-avx_dgemm_fast
	.p2align 4,,15
	.globl	wall_time
	.type	wall_time, @function
wall_time:
.LFB1056:
	.cfi_startproc
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 32
	movl	$1, %edi	#,
	movq	%rsp, %rsi	#,
	call	clock_gettime	#
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm0	# t.tv_nsec, D.10402
	vcvtsi2sdq	(%rsp), %xmm1, %xmm1	# t.tv_sec, D.10402
	vmulsd	.LC0(%rip), %xmm0, %xmm2	#, D.10402, D.10402
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 8
	vaddsd	%xmm1, %xmm2, %xmm0	# D.10402, D.10402, D.10402
	ret
	.cfi_endproc
.LFE1056:
	.size	wall_time, .-wall_time
	.p2align 4,,15
	.globl	fill
	.type	fill, @function
fill:
.LFB1057:
	.cfi_startproc
	testl	%esi, %esi	# n
	jle	.L222	#,
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leal	-1(%rsi), %eax	#, D.10418
	movq	%rdi, %r13	# p, p
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	8(%rdi), %rbx	#, D.10418
	leaq	(%rbx,%rax,8), %r12	#, D.10418
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	movq	%r12, %rbp	# D.10418, tmp81
	subq	%rdi, %rbp	# p, tmp81
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.10417, D.10417, D.10417
	subq	$8, %rbp	#, tmp83
	shrq	$3, %rbp	#, tmp83
	andl	$7, %ebp	#, tmp83
	cmpq	%r12, %rbx	# D.10418, ivtmp.294
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.10417, D.10417
	vmovsd	%xmm1, 0(%r13)	# D.10417, MEM[base: _1, offset: 0B]
	je	.L219	#,
	testq	%rbp, %rbp	# tmp83
	je	.L183	#,
	cmpq	$1, %rbp	#, tmp83
	je	.L205	#,
	cmpq	$2, %rbp	#, tmp83
	je	.L206	#,
	cmpq	$3, %rbp	#, tmp83
	je	.L207	#,
	cmpq	$4, %rbp	#, tmp83
	je	.L208	#,
	cmpq	$5, %rbp	#, tmp83
	je	.L209	#,
	cmpq	$6, %rbp	#, tmp83
	je	.L210	#,
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.10417, D.10417
	vmovsd	%xmm3, (%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	leaq	16(%r13), %rbx	#, ivtmp.294
.L210:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.10417, D.10417
	vmovsd	%xmm5, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
.L209:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.10417, D.10417
	vmovsd	%xmm7, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
.L208:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.10417, D.10417
	vmovsd	%xmm9, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
.L207:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.10417, D.10417
	vmovsd	%xmm11, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
.L206:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.10417, D.10417
	vmovsd	%xmm13, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
.L205:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.10417, D.10417, D.10417
	addq	$8, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.10417, D.10417
	vmovsd	%xmm15, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	cmpq	%r12, %rbx	# D.10418, ivtmp.294
	je	.L219	#,
.L183:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.10417, D.10417, D.10417
	addq	$64, %rbx	#, ivtmp.294
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.10417, D.10417
	vmovsd	%xmm1, -64(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.10417, D.10417
	vmovsd	%xmm3, -56(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.10417, D.10417
	vmovsd	%xmm5, -48(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.10417, D.10417
	vmovsd	%xmm7, -40(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.10417, D.10417
	vmovsd	%xmm9, -32(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.10417, D.10417
	vmovsd	%xmm11, -24(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.10417, D.10417
	vmovsd	%xmm13, -16(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.10417, D.10417, D.10417
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.10417, D.10417
	vmovsd	%xmm15, -8(%rbx)	# D.10417, MEM[base: _1, offset: 0B]
	cmpq	%r12, %rbx	# D.10418, ivtmp.294
	jne	.L183	#,
.L219:
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.L222:
	rep ret
	.cfi_endproc
.LFE1057:
	.size	fill, .-fill
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%.3f\t "
	.text
	.p2align 4,,15
	.globl	printmatrix
	.type	printmatrix, @function
printmatrix:
.LFB1058:
	.cfi_startproc
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
	testl	%edi, %edi	# m
	movl	%edi, 12(%rsp)	# m, %sfp
	jle	.L224	#,
	movslq	%edi, %rbp	# m, D.10442
	movl	%esi, %r12d	# n, n
	movq	%rdx, %r13	# M, ivtmp.306
	salq	$3, %rbp	#, D.10442
	xorl	%r14d, %r14d	# i
	.p2align 4,,10
	.p2align 3
.L225:
	testl	%r12d, %r12d	# n
	jle	.L227	#,
	leal	-1(%r12), %ecx	#, tmp73
	vmovsd	0(%r13), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	andl	$7, %ecx	#, tmp73
	movl	$1, %r15d	#, j
	leaq	0(%r13,%rbp), %rbx	#, ivtmp.301
	movl	%ecx, 8(%rsp)	# tmp73, %sfp
	call	__printf_chk	#
	cmpl	%r12d, %r15d	# n, j
	movl	8(%rsp), %edx	# %sfp, tmp73
	je	.L227	#,
	testl	%edx, %edx	# tmp73
	je	.L228	#,
	cmpl	$1, %edx	#, tmp73
	je	.L252	#,
	cmpl	$2, %edx	#, tmp73
	.p2align 4,,3
	je	.L253	#,
	cmpl	$3, %edx	#, tmp73
	.p2align 4,,2
	je	.L254	#,
	cmpl	$4, %edx	#, tmp73
	.p2align 4,,2
	je	.L255	#,
	cmpl	$5, %edx	#, tmp73
	.p2align 4,,2
	je	.L256	#,
	cmpl	$6, %edx	#, tmp73
	.p2align 4,,2
	je	.L257	#,
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L257:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L256:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L255:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L254:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L253:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
.L252:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	call	__printf_chk	#
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	cmpl	%r12d, %r15d	# n, j
	je	.L227	#,
.L228:
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$8, %r15d	#, j
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _28, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addq	%rbp, %rbx	# D.10442, ivtmp.301
	call	__printf_chk	#
	cmpl	%r12d, %r15d	# n, j
	jne	.L228	#,
.L227:
	movl	$10, %edi	#,
	addl	$1, %r14d	#, i
	addq	$8, %r13	#, ivtmp.306
	call	putchar	#
	cmpl	12(%rsp), %r14d	# %sfp, i
	jne	.L225	#,
.L224:
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 56
	movl	$10, %edi	#,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	jmp	putchar	#
	.cfi_endproc
.LFE1058:
	.size	printmatrix, .-printmatrix
	.p2align 4,,15
	.globl	naive_dgemm
	.type	naive_dgemm, @function
naive_dgemm:
.LFB1059:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movl	%edi, %r14d	# n, n
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	addq	$8, %rsp	#,
	testl	%edi, %edi	# n
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdx, -40(%rsp)	# B, %sfp
	jle	.L312	#,
	movslq	%edi, %rax	# n, D.10524
	movq	%rsi, %r13	# A, A
	movq	%rsi, %r12	# A, ivtmp.361
	movq	%rax, %rbx	# D.10524, D.10524
	leaq	0(,%rax,8), %r15	#, D.10524
	movq	%rax, -56(%rsp)	# D.10524, %sfp
	leal	(%rdi,%rdi), %eax	#, D.10527
	movq	%rcx, -120(%rsp)	# C, %sfp
	movq	%rbx, %rcx	# D.10524, D.10524
	salq	$5, %rcx	#, D.10524
	movq	$0, -72(%rsp)	#, %sfp
	movslq	%eax, %rsi	# D.10527, D.10523
	addl	%edi, %eax	# n, D.10527
	movq	%rcx, -24(%rsp)	# D.10524, %sfp
	cltq
	movq	%rsi, -104(%rsp)	# D.10523, %sfp
	movq	%rax, -96(%rsp)	# D.10523, %sfp
	leal	0(,%rdi,4), %eax	#, D.10527
	movslq	%eax, %rdx	# D.10527, D.10523
	addl	%edi, %eax	# n, D.10527
	movq	%r15, %rdi	# D.10524, D.10524
	cltq
	negq	%rdi	# D.10524
	movq	%rdx, -112(%rsp)	# D.10523, %sfp
	movq	%rax, -88(%rsp)	# D.10523, %sfp
	movq	%rdi, -32(%rsp)	# D.10524, %sfp
	.p2align 4,,10
	.p2align 3
.L268:
	movl	-72(%rsp), %r8d	# %sfp, tmp408
	xorl	%r11d, %r11d	# j
	movq	-40(%rsp), %rax	# %sfp, ivtmp.349
	movq	-120(%rsp), %rsi	# %sfp, ivtmp.347
	xorl	%ebx, %ebx	# ivtmp.355
	movl	%r11d, -12(%rsp)	# j, %sfp
	movl	%r8d, -16(%rsp)	# tmp408, %sfp
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L269:
	vmovsd	(%rax), %xmm1	# MEM[base: _160, offset: 0B], MEM[base: _160, offset: 0B]
	cmpl	$1, %r10d	#, prologue_after_cost_adjust.315
	vmulsd	(%r12), %xmm1, %xmm2	# MEM[base: _240, offset: 0B], MEM[base: _160, offset: 0B], D.10526
	vaddsd	%xmm2, %xmm0, %xmm0	# D.10526, t, t
	je	.L284	#,
	movq	-56(%rsp), %rdx	# %sfp, D.10524
	vmovsd	8(%rax), %xmm3	# MEM[base: _160, offset: 8B], MEM[base: _160, offset: 8B]
	cmpl	$2, %r10d	#, prologue_after_cost_adjust.315
	vmulsd	(%r12,%rdx,8), %xmm3, %xmm4	# MEM[base: _240, index: _142, step: 8, offset: 0B], MEM[base: _160, offset: 8B], D.10526
	vaddsd	%xmm4, %xmm0, %xmm0	# D.10526, t, t
	je	.L285	#,
	movq	-104(%rsp), %rcx	# %sfp, D.10523
	vmovsd	16(%rax), %xmm5	# MEM[base: _160, offset: 16B], MEM[base: _160, offset: 16B]
	cmpl	$3, %r10d	#, prologue_after_cost_adjust.315
	vmulsd	(%r12,%rcx,8), %xmm5, %xmm6	# MEM[base: _240, index: _128, step: 8, offset: 0B], MEM[base: _160, offset: 16B], D.10526
	vaddsd	%xmm6, %xmm0, %xmm0	# D.10526, t, t
	je	.L286	#,
	movq	-96(%rsp), %rdi	# %sfp, D.10523
	vmovsd	24(%rax), %xmm7	# MEM[base: _160, offset: 24B], MEM[base: _160, offset: 24B]
	cmpl	$4, %r10d	#, prologue_after_cost_adjust.315
	vmulsd	(%r12,%rdi,8), %xmm7, %xmm8	# MEM[base: _240, index: _12, step: 8, offset: 0B], MEM[base: _160, offset: 24B], D.10526
	vaddsd	%xmm8, %xmm0, %xmm0	# D.10526, t, t
	je	.L287	#,
	movq	-112(%rsp), %r8	# %sfp, D.10523
	vmovsd	32(%rax), %xmm9	# MEM[base: _160, offset: 32B], MEM[base: _160, offset: 32B]
	cmpl	$6, %r10d	#, prologue_after_cost_adjust.315
	vmulsd	(%r12,%r8,8), %xmm9, %xmm10	# MEM[base: _240, index: _205, step: 8, offset: 0B], MEM[base: _160, offset: 32B], D.10526
	vaddsd	%xmm10, %xmm0, %xmm0	# D.10526, t, t
	jne	.L288	#,
	movq	-88(%rsp), %r11	# %sfp, D.10523
	vmovsd	40(%rax), %xmm11	# MEM[base: _160, offset: 40B], MEM[base: _160, offset: 40B]
	movl	$6, %ecx	#, k
	vmulsd	(%r12,%r11,8), %xmm11, %xmm12	# MEM[base: _240, index: _11, step: 8, offset: 0B], MEM[base: _160, offset: 40B], D.10526
	vaddsd	%xmm12, %xmm0, %xmm0	# D.10526, t, t
.L271:
	cmpl	%r10d, %r14d	# prologue_after_cost_adjust.315, n
	je	.L272	#,
.L270:
	movl	%r14d, %r9d	# n, niters.317
	movl	%r10d, %edx	# prologue_after_cost_adjust.315, prolog_loop_adjusted_niters.316
	subl	%r10d, %r9d	# prologue_after_cost_adjust.315, niters.317
	movl	%r9d, %edi	# niters.317, niters.317
	movl	%r9d, -44(%rsp)	# niters.317, %sfp
	shrl	$2, %edi	#, bnd.318
	leal	0(,%rdi,4), %r10d	#, ratio_mult_vf.319
	testl	%r10d, %r10d	# ratio_mult_vf.319
	je	.L273	#,
	leaq	(%rax,%rdx,8), %r8	#, ivtmp.337
	leal	-1(%rdi), %r11d	#, tmp259
	imulq	-56(%rsp), %rdx	# %sfp, D.10523
	movq	%r8, %r9	# ivtmp.337, ivtmp.337
	movq	%r8, -80(%rsp)	# ivtmp.337, %sfp
	movl	%r11d, -64(%rsp)	# tmp259, %sfp
	addq	$32, %r9	#, ivtmp.337
	andl	$3, -64(%rsp)	#, %sfp
	addq	-72(%rsp), %rdx	# %sfp, D.10523
	leaq	0(%r13,%rdx,8), %r8	#, D.10525
	leaq	(%r8,%r15), %rdx	#, ivtmp.341
	vmovsd	(%r8,%r15,2), %xmm13	# MEM[base: _231, index: _132, offset: 0B], tmp385
	movq	-32(%rsp), %r8	# %sfp, D.10524
	vmovhpd	(%rdx,%r15,2), %xmm13, %xmm14	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp385, tmp218
	vmovsd	(%rdx,%r8), %xmm15	# MEM[base: _231, index: _230, offset: 0B], tmp387
	movl	$1, %r8d	#, ivtmp.332
	vmovhpd	(%rdx), %xmm15, %xmm1	# MEM[base: _231, offset: 0B], tmp387, tmp221
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm2	# tmp218, tmp221, vect_cst_.321
	vmulpd	-32(%r9), %ymm2, %ymm1	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_t.328
	cmpl	%edi, %r8d	# bnd.318, ivtmp.332
	jnb	.L308	#,
	movl	-64(%rsp), %r11d	# %sfp, tmp259
	testl	%r11d, %r11d	# tmp259
	je	.L310	#,
	cmpl	$1, %r11d	#, tmp259
	je	.L302	#,
	cmpl	$2, %r11d	#, tmp259
	je	.L303	#,
	movq	-32(%rsp), %r9	# %sfp, D.10524
	vmovsd	(%rdx,%r15), %xmm3	# MEM[base: _231, index: _132, offset: 0B], tmp409
	movq	-80(%rsp), %r11	# %sfp, ivtmp.337
	movl	$2, %r8d	#, ivtmp.332
	vmovhpd	(%rdx,%r15,2), %xmm3, %xmm4	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp409, tmp317
	vmovsd	(%rdx,%r9), %xmm5	# MEM[base: _231, index: _230, offset: 0B], tmp411
	leaq	64(%r11), %r9	#, ivtmp.337
	vmovhpd	(%rdx), %xmm5, %xmm6	# MEM[base: _231, offset: 0B], tmp411, tmp320
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7	# tmp317, tmp320, vect_cst_.321
	vmulpd	32(%r11), %ymm7, %ymm8	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.327, vect_t.328, vect_t.328
.L303:
	movq	-32(%rsp), %r11	# %sfp, D.10524
	vmovsd	(%rdx,%r15), %xmm9	# MEM[base: _231, index: _132, offset: 0B], tmp414
	addl	$1, %r8d	#, ivtmp.332
	addq	$32, %r9	#, ivtmp.337
	vmovhpd	(%rdx,%r15,2), %xmm9, %xmm10	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp414, tmp326
	vmovsd	(%rdx,%r11), %xmm11	# MEM[base: _231, index: _230, offset: 0B], tmp416
	vmovhpd	(%rdx), %xmm11, %xmm12	# MEM[base: _231, offset: 0B], tmp416, tmp329
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp326, tmp329, vect_cst_.321
	vmulpd	-32(%r9), %ymm13, %ymm14	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	vaddpd	%ymm14, %ymm1, %ymm1	# vect_var_.327, vect_t.328, vect_t.328
.L302:
	movq	-32(%rsp), %r11	# %sfp, D.10524
	vmovsd	(%rdx,%r15), %xmm15	# MEM[base: _231, index: _132, offset: 0B], tmp417
	addl	$1, %r8d	#, ivtmp.332
	addq	$32, %r9	#, ivtmp.337
	vmovhpd	(%rdx,%r15,2), %xmm15, %xmm2	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp417, tmp335
	vmovsd	(%rdx,%r11), %xmm3	# MEM[base: _231, index: _230, offset: 0B], tmp419
	vmovhpd	(%rdx), %xmm3, %xmm4	# MEM[base: _231, offset: 0B], tmp419, tmp338
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm2, %ymm4, %ymm5	# tmp335, tmp338, vect_cst_.321
	vmulpd	-32(%r9), %ymm5, %ymm6	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	cmpl	%edi, %r8d	# bnd.318, ivtmp.332
	vaddpd	%ymm6, %ymm1, %ymm1	# vect_var_.327, vect_t.328, vect_t.328
	jnb	.L308	#,
.L310:
	movq	%rax, -64(%rsp)	# ivtmp.349, %sfp
	movl	-12(%rsp), %r11d	# %sfp, j
	movq	-32(%rsp), %rax	# %sfp, D.10524
.L279:
	vmovsd	(%rdx,%r15), %xmm7	# MEM[base: _231, index: _132, offset: 0B], tmp390
	addl	$4, %r8d	#, ivtmp.332
	subq	$-128, %r9	#, ivtmp.337
	vmovsd	(%rdx,%rax), %xmm9	# MEM[base: _231, index: _230, offset: 0B], tmp392
	vmovhpd	(%rdx,%r15,2), %xmm7, %xmm8	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp390, tmp269
	vmovhpd	(%rdx), %xmm9, %xmm10	# MEM[base: _231, offset: 0B], tmp392, tmp272
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp269, tmp272, vect_cst_.321
	vmovsd	(%rdx,%r15), %xmm14	# MEM[base: _231, index: _132, offset: 0B], tmp393
	vmovsd	(%rdx,%rax), %xmm2	# MEM[base: _231, index: _230, offset: 0B], tmp395
	vmulpd	-128(%r9), %ymm11, %ymm12	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	vmovhpd	(%rdx,%r15,2), %xmm14, %xmm15	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp393, tmp282
	vmovhpd	(%rdx), %xmm2, %xmm3	# MEM[base: _231, offset: 0B], tmp395, tmp285
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4	# tmp282, tmp285, vect_cst_.321
	vmovsd	(%rdx,%r15), %xmm6	# MEM[base: _231, index: _132, offset: 0B], tmp396
	vmulpd	-96(%r9), %ymm4, %ymm5	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	vaddpd	%ymm12, %ymm1, %ymm13	# vect_var_.327, vect_t.328, vect_t.328
	vmovsd	(%rdx,%rax), %xmm7	# MEM[base: _231, index: _230, offset: 0B], tmp398
	vmovhpd	(%rdx,%r15,2), %xmm6, %xmm1	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp396, tmp295
	vmovhpd	(%rdx), %xmm7, %xmm9	# MEM[base: _231, offset: 0B], tmp398, tmp298
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm1, %ymm9, %ymm10	# tmp295, tmp298, vect_cst_.321
	vaddpd	%ymm5, %ymm13, %ymm8	# vect_var_.327, vect_t.328, vect_t.328
	vmovsd	(%rdx,%rax), %xmm15	# MEM[base: _231, index: _230, offset: 0B], tmp401
	vmovsd	(%rdx,%r15), %xmm13	# MEM[base: _231, index: _132, offset: 0B], tmp399
	vmulpd	-64(%r9), %ymm10, %ymm11	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	vmovhpd	(%rdx), %xmm15, %xmm2	# MEM[base: _231, offset: 0B], tmp401, tmp311
	vmovhpd	(%rdx,%r15,2), %xmm13, %xmm14	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp399, tmp308
	addq	-24(%rsp), %rdx	# %sfp, ivtmp.341
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm3	# tmp308, tmp311, vect_cst_.321
	vmulpd	-32(%r9), %ymm3, %ymm4	# MEM[base: _212, offset: 0B], vect_cst_.321, vect_var_.327
	cmpl	%edi, %r8d	# bnd.318, ivtmp.332
	vaddpd	%ymm11, %ymm8, %ymm12	# vect_var_.327, vect_t.328, vect_t.328
	vaddpd	%ymm4, %ymm12, %ymm1	# vect_var_.327, vect_t.328, vect_t.328
	jb	.L279	#,
	movq	-64(%rsp), %rax	# %sfp, ivtmp.349
	movl	%r11d, -12(%rsp)	# j, %sfp
	.p2align 4,,10
	.p2align 3
.L308:
	vhaddpd	%ymm1, %ymm1, %ymm5	# vect_t.328, vect_t.328, tmp233
	addl	%r10d, %ecx	# ratio_mult_vf.319, k
	cmpl	-44(%rsp), %r10d	# %sfp, ratio_mult_vf.319
	vperm2f128	$1, %ymm5, %ymm5, %ymm8	#, tmp233, tmp233, tmp234
	vaddpd	%ymm8, %ymm5, %ymm6	# tmp234, tmp233, vect_t.330
	vaddsd	%xmm6, %xmm0, %xmm0	# stmp_t.329, t, t
	je	.L272	#,
.L273:
	movl	%ecx, %edi	# k, D.10522
	movl	-16(%rsp), %r8d	# %sfp, i
	leal	(%rcx,%rbx), %edx	#, D.10522
	imull	%r14d, %edi	# n, D.10522
	movq	-40(%rsp), %r10	# %sfp, B
	movslq	%edx, %r11	# D.10522, D.10524
	addl	%r8d, %edi	# i, D.10522
	movslq	%edi, %r9	# D.10522, D.10524
	vmovsd	0(%r13,%r9,8), %xmm1	# *_17, *_17
	leal	1(%rcx), %r9d	#, k
	vmulsd	(%r10,%r11,8), %xmm1, %xmm7	# *_22, *_17, D.10526
	cmpl	%r9d, %r14d	# k, n
	vaddsd	%xmm7, %xmm0, %xmm0	# D.10526, t, t
	jle	.L272	#,
	movl	%r14d, %edx	# n, D.10522
	addl	$2, %ecx	#, k
	imull	%r9d, %edx	# k, D.10522
	addl	%ebx, %r9d	# ivtmp.355, D.10522
	movslq	%r9d, %r11	# D.10522, D.10524
	addl	%r8d, %edx	# i, D.10522
	cmpl	%ecx, %r14d	# k, n
	movslq	%edx, %r8	# D.10522, D.10524
	vmovsd	0(%r13,%r8,8), %xmm9	# *_147, *_147
	vmulsd	(%r10,%r11,8), %xmm9, %xmm10	# *_152, *_147, D.10526
	vaddsd	%xmm10, %xmm0, %xmm0	# D.10526, t, t
	jle	.L272	#,
	movl	%r14d, %edi	# n, D.10522
	movq	-40(%rsp), %rdx	# %sfp, B
	imull	%ecx, %edi	# k, D.10522
	addl	-16(%rsp), %edi	# %sfp, D.10522
	addl	%ebx, %ecx	# ivtmp.355, D.10522
	movslq	%ecx, %rcx	# D.10522, D.10524
	movslq	%edi, %r9	# D.10522, D.10524
	vmovsd	0(%r13,%r9,8), %xmm11	# *_44, *_44
	vmulsd	(%rdx,%rcx,8), %xmm11, %xmm12	# *_38, *_44, D.10526
	vaddsd	%xmm12, %xmm0, %xmm0	# D.10526, t, t
.L272:
	addl	$1, -12(%rsp)	#, %sfp
	vmovsd	%xmm0, (%rsi)	# t, MEM[base: _176, offset: 0B]
	addq	%r15, %rax	# D.10524, ivtmp.349
	addq	%r15, %rsi	# D.10524, ivtmp.347
	addl	%r14d, %ebx	# n, ivtmp.355
	cmpl	%r14d, -12(%rsp)	# n, %sfp
	je	.L314	#,
.L281:
	movq	%rax, %r9	# ivtmp.349, D.10528
	vmovsd	(%rsi), %xmm0	# MEM[base: _176, offset: 0B], t
	andl	$31, %r9d	#, D.10528
	movl	%r14d, %r10d	# n, prologue_after_cost_adjust.315
	shrq	$3, %r9	#, D.10528
	negq	%r9	# D.10528
	andl	$3, %r9d	#, D.10527
	cmpl	%r9d, %r14d	# D.10527, n
	cmovbe	%r14d, %r9d	# n,, prolog_loop_niters.314
	cmpl	$6, %r14d	#, n
	jbe	.L269	#,
	testl	%r9d, %r9d	# prolog_loop_niters.314
	jne	.L315	#,
	xorl	%r10d, %r10d	# prologue_after_cost_adjust.315
	xorl	%ecx, %ecx	# k
	jmp	.L270	#
	.p2align 4,,10
	.p2align 3
.L288:
	movl	$5, %ecx	#, k
	jmp	.L271	#
	.p2align 4,,10
	.p2align 3
.L287:
	movl	$4, %ecx	#, k
	jmp	.L271	#
	.p2align 4,,10
	.p2align 3
.L286:
	movl	$3, %ecx	#, k
	jmp	.L271	#
	.p2align 4,,10
	.p2align 3
.L285:
	movl	$2, %ecx	#, k
	jmp	.L271	#
	.p2align 4,,10
	.p2align 3
.L284:
	movl	$1, %ecx	#, k
	jmp	.L271	#
	.p2align 4,,10
	.p2align 3
.L314:
	addq	$1, -72(%rsp)	#, %sfp
	addq	$8, %r12	#, ivtmp.361
	addq	$8, -120(%rsp)	#, %sfp
	cmpl	-72(%rsp), %r14d	# %sfp, n
	jg	.L268	#,
	vzeroupper
.L312:
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L315:
	.cfi_restore_state
	movl	%r9d, %r10d	# prolog_loop_niters.314, prologue_after_cost_adjust.315
	jmp	.L269	#
	.cfi_endproc
.LFE1059:
	.size	naive_dgemm, .-naive_dgemm
	.p2align 4,,15
	.globl	do_4x4_block
	.type	do_4x4_block, @function
do_4x4_block:
.LFB1060:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%edi, %r10	# n, D.10577
	leaq	0(,%r10,8), %r9	#, D.10577
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$8, %rsp	#,
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	leaq	8(%rsp), %r11	#, D.10574
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	(%r8), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	8(%r8), %rbx	# MEM[(void *)_15], MEM[(void *)_15]
	movq	24(%r8), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	16(%r8), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%rax, -120(%rsp)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	-120(%rsp), %rax	#, tmp217
	movq	%rbx, -112(%rsp)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%r13, -96(%rsp)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%r12, -104(%rsp)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	(%r8,%r9), %r13	#, ivtmp.401
	leaq	32(%rax), %rbx	#, tmp149
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	0(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	8(%r13), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r12, (%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 8(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	24(%r13), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	addq	%r9, %r13	# D.10577, ivtmp.401
	movq	%r12, 16(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 24(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	-120(%rsp), %rbx	#, tmp218
	addq	$64, %rbx	#, ivtmp.399
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	0(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	8(%r13), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r12, (%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 8(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	24(%r13), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	addq	%r9, %r13	# D.10577, ivtmp.401
	movq	%r12, 16(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 24(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	-120(%rsp), %rbx	#, tmp219
	addq	$96, %rbx	#, ivtmp.399
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	0(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	8(%r13), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	testl	%esi, %esi	# kdepth
	movq	%r12, (%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%r13), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	24(%r13), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%rax, 8(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%r12, 16(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%r13, 24(%rbx)	# MEM[(void *)_15], MEM[(void *)_18]
	jle	.L319	#,
	leaq	8(%rcx), %rax	#, D.10574
	subl	$1, %esi	#, D.10574
	leal	(%rdi,%rdi), %r12d	#, D.10579
	vmovapd	-120(%rsp), %ymm2	# c, D.10578
	leaq	(%rax,%rsi,8), %rbx	#, D.10574
	leal	(%r12,%rdi), %r13d	#, tmp126
	movslq	%r12d, %rdi	# D.10579, D.10581
	vmovapd	-88(%rsp), %ymm3	# c, D.10578
	movq	%rbx, %r12	# D.10574, tmp151
	vmovapd	-56(%rsp), %ymm4	# c, D.10578
	movslq	%r13d, %rsi	# tmp126, D.10581
	subq	%rcx, %r12	# ivtmp.388, tmp151
	vmovapd	-24(%rsp), %ymm1	# c, D.10578
	andl	$8, %r12d	#, tmp151
	jne	.L321	#,
	vmovupd	(%rdx), %xmm0	# MEM[base: _45, offset: 0B], tmp199
	vinsertf128	$0x1, 16(%rdx), %ymm0, %ymm9	# MEM[base: _45, offset: 0B], tmp199, tmp200
	addq	%r9, %rdx	# D.10577, ivtmp.386
	vbroadcastsd	(%rcx), %ymm5	# MEM[base: _43, offset: 0B], b
	vbroadcastsd	(%rcx,%r10,8), %ymm6	# MEM[base: _43, index: _107, step: 8, offset: 0B], b
	vbroadcastsd	(%rcx,%rdi,8), %ymm7	# MEM[base: _43, index: _215, step: 8, offset: 0B], b
	vbroadcastsd	(%rcx,%rsi,8), %ymm8	# MEM[base: _43, index: _213, step: 8, offset: 0B], b
	movq	%rax, %rcx	# D.10574, ivtmp.388
	vmulpd	%ymm5, %ymm9, %ymm10	# b, tmp200, D.10576
	vmulpd	%ymm6, %ymm9, %ymm11	# b, tmp200, D.10576
	vmulpd	%ymm7, %ymm9, %ymm12	# b, tmp200, D.10576
	vaddpd	%ymm10, %ymm2, %ymm2	# D.10576, D.10578, D.10578
	vmulpd	%ymm8, %ymm9, %ymm13	# b, tmp200, D.10576
	vaddpd	%ymm11, %ymm3, %ymm3	# D.10576, D.10578, D.10578
	vaddpd	%ymm12, %ymm4, %ymm4	# D.10576, D.10578, D.10578
	vaddpd	%ymm13, %ymm1, %ymm1	# D.10576, D.10578, D.10578
	jmp	.L321	#
	.p2align 4,,10
	.p2align 3
.L320:
	vmovupd	(%rdx), %xmm1	# MEM[base: _45, offset: 0B], tmp181
	addq	$16, %rcx	#, ivtmp.388
	vinsertf128	$0x1, 16(%rdx), %ymm1, %ymm2	# MEM[base: _45, offset: 0B], tmp181, tmp182
	addq	%r9, %rdx	# D.10577, ivtmp.386
	vbroadcastsd	-8(%rcx), %ymm14	# MEM[base: _43, offset: 0B], b
	vbroadcastsd	0(%r13,%r10,8), %ymm0	# MEM[base: _43, index: _107, step: 8, offset: 0B], b
	vbroadcastsd	0(%r13,%rdi,8), %ymm5	# MEM[base: _43, index: _215, step: 8, offset: 0B], b
	vbroadcastsd	0(%r13,%rsi,8), %ymm7	# MEM[base: _43, index: _213, step: 8, offset: 0B], b
	vmulpd	%ymm0, %ymm2, %ymm9	# b, tmp182, D.10576
	vmulpd	%ymm5, %ymm2, %ymm6	# b, tmp182, D.10576
	vmulpd	%ymm7, %ymm2, %ymm12	# b, tmp182, D.10576
	vmulpd	%ymm14, %ymm2, %ymm15	# b, tmp182, D.10576
	vaddpd	%ymm6, %ymm13, %ymm4	# D.10576, D.10576, D.10578
	vaddpd	%ymm12, %ymm3, %ymm1	# D.10576, D.10576, D.10578
	vaddpd	%ymm15, %ymm10, %ymm2	# D.10576, D.10576, D.10578
	vaddpd	%ymm9, %ymm11, %ymm3	# D.10576, D.10576, D.10578
.L321:
	vmovupd	(%rdx), %xmm14	# MEM[base: _45, offset: 0B], tmp132
	leaq	8(%rcx), %r13	#, tmp154
	vinsertf128	$0x1, 16(%rdx), %ymm14, %ymm15	# MEM[base: _45, offset: 0B], tmp132, tmp131
	addq	%r9, %rdx	# D.10577, ivtmp.386
	cmpq	%rbx, %r13	# D.10574, tmp154
	vbroadcastsd	(%rcx,%rdi,8), %ymm7	# MEM[base: _43, index: _215, step: 8, offset: 0B], b
	vbroadcastsd	(%rcx), %ymm0	# MEM[base: _43, offset: 0B], b
	vbroadcastsd	(%rcx,%r10,8), %ymm5	# MEM[base: _43, index: _107, step: 8, offset: 0B], b
	vmulpd	%ymm7, %ymm15, %ymm12	# b, tmp131, D.10576
	vbroadcastsd	(%rcx,%rsi,8), %ymm8	# MEM[base: _43, index: _213, step: 8, offset: 0B], b
	vmulpd	%ymm0, %ymm15, %ymm9	# b, tmp131, D.10576
	vmulpd	%ymm5, %ymm15, %ymm6	# b, tmp131, D.10576
	vaddpd	%ymm12, %ymm4, %ymm13	# D.10576, D.10578, D.10576
	vmulpd	%ymm8, %ymm15, %ymm4	# b, tmp131, D.10576
	vaddpd	%ymm9, %ymm2, %ymm10	# D.10576, D.10578, D.10576
	vaddpd	%ymm6, %ymm3, %ymm11	# D.10576, D.10578, D.10576
	vaddpd	%ymm4, %ymm1, %ymm3	# D.10576, D.10578, D.10576
	jne	.L320	#,
	vmovapd	%ymm10, -120(%rsp)	# D.10576, c
	vmovapd	%ymm11, -88(%rsp)	# D.10576, c
	vmovapd	%ymm13, -56(%rsp)	# D.10576, c
	vmovapd	%ymm3, -24(%rsp)	# D.10576, c
	vzeroupper
.L319:
	leaq	-120(%rsp), %rcx	#, tmp221
.L323:
#APP
# 89 "matmul.c" 1
	# final memcopy
# 0 "" 2
#NO_APP
	movq	(%rcx), %rdx	# MEM[(void *)_46], MEM[(void *)_46]
	movq	8(%rcx), %r10	# MEM[(void *)_46], MEM[(void *)_46]
	addq	$32, %rcx	#, ivtmp.381
	movq	-16(%rcx), %rax	# MEM[(void *)_46], MEM[(void *)_46]
	movq	-8(%rcx), %rbx	# MEM[(void *)_46], MEM[(void *)_46]
	movq	%rdx, (%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%r10, 8(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%rax, 16(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%rbx, 24(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	addq	%r9, %r8	# D.10577, ivtmp.379
	cmpq	%rcx, %r11	# ivtmp.381, D.10574
	jne	.L323	#,
	leaq	-24(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1060:
	.size	do_4x4_block, .-do_4x4_block
	.p2align 4,,15
	.globl	avx_dgemm_slow
	.type	avx_dgemm_slow, @function
avx_dgemm_slow:
.LFB1063:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rsi, %r14	# A, A
	movq	%rcx, %rsi	# C, C
	pushq	%r13	#
	pushq	%r12	#
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movl	%edi, %r12d	# n, n
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$464, %rsp	#,
	.cfi_offset 3, -56
	testl	%edi, %edi	# n
	movq	%rcx, 184(%rsp)	# C, %sfp
	jle	.L515	#,
	movl	%edi, %eax	# n, D.10836
	movq	%rdx, %r15	# B, B
	leal	0(,%rdi,4), %edx	#, tmp890
	sall	$5, %eax	#, D.10836
	leal	-1(%r12), %r11d	#, D.10836
	movq	%r15, %r10	# B, ivtmp.643
	movl	%eax, 152(%rsp)	# D.10836, %sfp
	cltq
	subq	%rsi, %r10	# C, ivtmp.643
	movq	%rax, %rbx	# D.10833, D.10833
	movq	%rax, 448(%rsp)	# D.10833, %sfp
	salq	$3, %rax	#, D.10835
	movq	%rax, 88(%rsp)	# D.10835, %sfp
	leal	(%rdx,%rdi), %eax	#, D.10832
	movq	%rbx, %rcx	# D.10833, tmp894
	negq	%rcx	# tmp894
	shrl	$5, %r11d	#, D.10836
	movslq	%edi, %rdi	# n, D.10835
	cltq
	salq	$3, %rcx	#, tmp895
	leaq	0(,%rdi,8), %r13	#, ivtmp.635
	salq	$3, %rax	#, ivtmp.631
	movq	%rcx, 32(%rsp)	# tmp895, %sfp
	movl	%r11d, %ecx	# D.10836, D.10833
	movq	%rax, 248(%rsp)	# ivtmp.631, %sfp
	leal	(%r12,%r12), %eax	#, D.10832
	movq	%rdi, 336(%rsp)	# D.10835, %sfp
	leaq	1(%rcx), %rdi	#, D.10833
	addl	$1, %r11d	#, D.10832
	movslq	%edx, %rdx	# tmp890, D.10834
	movslq	%eax, %r8	# D.10832, D.10835
	addl	%r12d, %eax	# n, D.10832
	movl	%r11d, 100(%rsp)	# D.10832, %sfp
	cltq
	movq	%rdi, 112(%rsp)	# D.10833, %sfp
	sall	$5, 100(%rsp)	#, %sfp
	salq	$3, %rax	#, ivtmp.639
	salq	$5, 112(%rsp)	#, %sfp
	leaq	0(,%r8,8), %r9	#, ivtmp.637
	movq	%rax, 240(%rsp)	# ivtmp.639, %sfp
	movq	%r13, %r8	# ivtmp.635, D.10833
	leaq	0(,%rdx,8), %rax	#, D.10834
	subq	%r14, %rsi	# A, D.10834
	movq	%rbx, 232(%rsp)	# D.10833, %sfp
	negq	%r8	# D.10833
	movl	%r12d, %ebx	# n, n
	movq	%r13, %r12	# ivtmp.635, ivtmp.635
	movq	%r13, 80(%rsp)	# ivtmp.635, %sfp
	movq	%r15, %r13	# B, B
	movq	%r14, %r15	# A, A
	movq	%r9, 72(%rsp)	# ivtmp.637, %sfp
	movq	%r10, 64(%rsp)	# ivtmp.643, %sfp
	movq	%r13, %r14	# B, B
	movq	%rax, 168(%rsp)	# D.10834, %sfp
	movq	$4, 368(%rsp)	#, %sfp
	movq	$3, 384(%rsp)	#, %sfp
	movq	$2, 392(%rsp)	#, %sfp
	movq	$1, 400(%rsp)	#, %sfp
	movq	$5, 376(%rsp)	#, %sfp
	movq	$0, 256(%rsp)	#, %sfp
	movq	$0, 192(%rsp)	#, %sfp
	movq	$0, 136(%rsp)	#, %sfp
	movl	$0, 104(%rsp)	#, %sfp
	movq	%rsi, 8(%rsp)	# D.10834, %sfp
	movq	%r8, 440(%rsp)	# D.10833, %sfp
.L399:
	movq	192(%rsp), %r9	# %sfp, ivtmp.624
	movq	256(%rsp), %rsi	# %sfp, ivtmp.633
	movslq	104(%rsp), %rcx	# %sfp, D.10835
	movq	184(%rsp), %rdi	# %sfp, ivtmp.616
	movq	8(%rsp), %rax	# %sfp, D.10834
	movl	$0, 156(%rsp)	#, %sfp
	movl	%r9d, %r10d	# ivtmp.624, tmp1652
	movq	%rsi, %r8	# ivtmp.633, D.10835
	movq	%rsi, %r13	# ivtmp.633, D.10835
	addl	$32, %r10d	#, D.10836
	movl	156(%rsp), %esi	# %sfp, j1
	movl	%r9d, 456(%rsp)	# tmp1652, %sfp
	cmpl	%r10d, %ebx	# D.10836, n
	movl	%r9d, 364(%rsp)	# tmp1653, %sfp
	movl	$0, 108(%rsp)	#, %sfp
	cmovle	%ebx, %r10d	# n,, kend
	addq	80(%rsp), %r8	# %sfp, D.10835
	addq	72(%rsp), %r13	# %sfp, D.10835
	salq	$3, %rcx	#, D.10834
	movl	%r10d, %r11d	# kend, kend
	movl	%r10d, 460(%rsp)	# kend, %sfp
	leaq	(%rcx,%r15), %rdx	#, ivtmp.607
	subl	%r9d, %r11d	# ivtmp.624, D.10836
	subq	%rcx, %rdi	# D.10834, ivtmp.616
	movq	%r14, %r9	# B, B
	subq	%rcx, %rax	# D.10834, D.10834
	movq	%rdi, 120(%rsp)	# ivtmp.616, %sfp
	addq	%r15, %r8	# A, D.10830
	subq	%r15, 120(%rsp)	# A, %sfp
	movq	%r13, 16(%rsp)	# D.10835, %sfp
	movl	%ebx, %r14d	# n, n
	movq	%r15, %r13	# A, A
	movq	%rdx, 56(%rsp)	# ivtmp.607, %sfp
	movq	%r12, %r15	# ivtmp.635, ivtmp.635
	movq	%rax, 24(%rsp)	# D.10834, %sfp
	movq	%r8, 344(%rsp)	# D.10830, %sfp
	movl	%r11d, %ebx	# D.10836, D.10836
	movq	%r9, %r12	# B, B
.L397:
	movl	%esi, %eax	# j1, j1
	movq	24(%rsp), %r11	# %sfp, D.10834
	addl	$32, %eax	#, j1
	movq	16(%rsp), %r9	# %sfp, D.10835
	movq	56(%rsp), %r8	# %sfp, ivtmp.607
	cmpl	%r14d, %eax	# n, j1
	movl	%eax, 96(%rsp)	# j1, %sfp
	movq	%r12, 424(%rsp)	# B, %sfp
	cmovg	%r14d, %eax	# jend,, n, jend
	movq	$0, 144(%rsp)	#, %sfp
	movl	%eax, %r10d	# jend, jend
	movl	%eax, 420(%rsp)	# jend, %sfp
	subl	%esi, %eax	# j1, D.10832
	cltd
	movq	64(%rsp), %rsi	# %sfp, ivtmp.643
	addq	%r13, %r9	# A, D.10830
	shrl	$30, %edx	#, tmp913
	movq	%r8, 128(%rsp)	# ivtmp.607, %sfp
	movq	%r9, 352(%rsp)	# D.10830, %sfp
	addl	%edx, %eax	# tmp913, tmp916
	andl	$3, %eax	#, tmp916
	movq	%rsi, 176(%rsp)	# ivtmp.643, %sfp
	subl	%edx, %eax	# tmp913, tmp916
	subl	%eax, %r10d	# tmp916, j1
	movl	%r10d, %eax	# j1, j1
	movl	%r10d, 220(%rsp)	# j1, %sfp
	imull	%r14d, %eax	# n, D.10836
	movl	%eax, 208(%rsp)	# D.10836, %sfp
	cltq
	leaq	(%r11,%rax,8), %rcx	#, D.10834
	movq	%rax, 48(%rsp)	# D.10833, %sfp
	addq	192(%rsp), %rax	# %sfp, D.10833
	movq	%rcx, 40(%rsp)	# D.10834, %sfp
	leaq	(%r12,%rax,8), %rdi	#, ivtmp.532
	movl	%r14d, %r12d	# n, n
	movl	%ebx, %r14d	# D.10836, D.10836
	movq	%r13, %rbx	# A, A
	movq	%rdi, 200(%rsp)	# ivtmp.532, %sfp
.L395:
	movq	144(%rsp), %r13	# %sfp, ivtmp.606
	movl	220(%rsp), %r11d	# %sfp, j1
	movl	%r13d, %eax	# ivtmp.606, tmp1679
	movl	%r13d, 416(%rsp)	# tmp1679, %sfp
	addl	$32, %eax	#, D.10836
	cmpl	%eax, %r12d	# D.10836, n
	cmovle	%r12d, %eax	# n,, iend
	movl	%eax, %r10d	# iend, iend
	movl	%eax, 216(%rsp)	# iend, %sfp
	subl	%r13d, %eax	# ivtmp.606, D.10832
	cltd
	shrl	$30, %edx	#, tmp925
	addl	%edx, %eax	# tmp925, tmp928
	andl	$3, %eax	#, tmp928
	subl	%edx, %eax	# tmp925, tmp928
	subl	%eax, %r10d	# tmp928, i1
	cmpl	%r11d, 156(%rsp)	# j1, %sfp
	movl	%r10d, 436(%rsp)	# i1, %sfp
	jge	.L359	#,
	movl	144(%rsp), %ecx	# %sfp, D.10836
	movq	128(%rsp), %r8	# %sfp, ivtmp.607
	movq	120(%rsp), %rdi	# %sfp, ivtmp.616
	movl	460(%rsp), %r13d	# %sfp, D.10832
	subl	456(%rsp), %r13d	# %sfp, D.10832
	movl	156(%rsp), %esi	# %sfp, j1
	notl	%ecx	# D.10836
	addl	436(%rsp), %ecx	# %sfp, D.10836
	movl	%r14d, 320(%rsp)	# D.10836, %sfp
	addq	%r8, %rdi	# ivtmp.607, ivtmp.596
	movq	%rbx, 304(%rsp)	# A, %sfp
	movq	%r8, %r14	# ivtmp.607, ivtmp.607
	movl	%esi, 360(%rsp)	# j1, %sfp
	movq	%r15, 312(%rsp)	# ivtmp.635, %sfp
	movq	%rdi, %rbx	# ivtmp.596, ivtmp.596
	movl	%r13d, 432(%rsp)	# D.10832, %sfp
	shrl	$2, %ecx	#,
	addq	$1, %rcx	#, D.10835
	movq	%rcx, 408(%rsp)	# D.10835, %sfp
	salq	$5, 408(%rsp)	#, %sfp
	.p2align 4,,10
	.p2align 3
.L341:
	movl	416(%rsp), %r15d	# %sfp, i1
	cmpl	%r15d, 436(%rsp)	# i1, %sfp
	jle	.L344	#,
	movq	408(%rsp), %r10	# %sfp, D.10835
	movq	176(%rsp), %rax	# %sfp, ivtmp.609
	movq	%rbx, %r8	# ivtmp.596,
	movl	432(%rsp), %esi	# %sfp,
	movl	%r12d, %edi	# n,
	leaq	-32(%r10), %rdx	#, tmp1263
	leaq	(%rbx,%rax), %r13	#, D.10830
	shrq	$5, %rdx	#, tmp1263
	movq	%r13, %rcx	# D.10830,
	andl	$3, %edx	#, tmp1263
	movq	%rdx, 328(%rsp)	# tmp1263, %sfp
	movq	%r14, %rdx	# ivtmp.607,
	vzeroupper
	movl	$32, %r15d	#, ivtmp.589
	call	do_4x4_block	#
	cmpq	408(%rsp), %r15	# %sfp, ivtmp.589
	movq	328(%rsp), %r11	# %sfp, tmp1263
	je	.L344	#,
	testq	%r11, %r11	# tmp1263
	je	.L345	#,
	cmpq	$1, %r11	#, tmp1263
	je	.L483	#,
	cmpq	$2, %r11	#, tmp1263
	je	.L484	#,
	movl	432(%rsp), %esi	# %sfp,
	leaq	32(%r14), %rdx	#, D.10834
	leaq	32(%rbx), %r8	#,
	movq	%r13, %rcx	# D.10830,
	movl	%r12d, %edi	# n,
	movl	$64, %r15d	#, ivtmp.589
	call	do_4x4_block	#
.L484:
	movl	432(%rsp), %esi	# %sfp,
	leaq	(%r15,%r14), %rdx	#, D.10834
	leaq	(%rbx,%r15), %r8	#,
	movq	%r13, %rcx	# D.10830,
	movl	%r12d, %edi	# n,
	addq	$32, %r15	#, ivtmp.589
	call	do_4x4_block	#
.L483:
	movl	432(%rsp), %esi	# %sfp,
	leaq	(%r15,%r14), %rdx	#, D.10834
	leaq	(%rbx,%r15), %r8	#,
	movq	%r13, %rcx	# D.10830,
	movl	%r12d, %edi	# n,
	addq	$32, %r15	#, ivtmp.589
	call	do_4x4_block	#
	cmpq	408(%rsp), %r15	# %sfp, ivtmp.589
	je	.L344	#,
.L345:
	movl	432(%rsp), %esi	# %sfp,
	leaq	(%r15,%r14), %rdx	#, D.10834
	leaq	(%rbx,%r15), %r8	#,
	movq	%r13, %rcx	# D.10830,
	movl	%r12d, %edi	# n,
	call	do_4x4_block	#
	leaq	32(%r15), %rcx	#, tmp1264
	movl	432(%rsp), %esi	# %sfp,
	movl	%r12d, %edi	# n,
	leaq	(%rcx,%r14), %rdx	#, D.10834
	leaq	(%rbx,%rcx), %r8	#,
	movq	%r13, %rcx	# D.10830,
	call	do_4x4_block	#
	leaq	64(%r15), %r8	#, ivtmp.589
	movl	432(%rsp), %esi	# %sfp,
	movq	%r13, %rcx	# D.10830,
	movl	%r12d, %edi	# n,
	leaq	(%r8,%r14), %rdx	#, D.10834
	leaq	(%rbx,%r8), %r8	#,
	call	do_4x4_block	#
	leaq	96(%r15), %rdi	#, ivtmp.589
	movl	432(%rsp), %esi	# %sfp,
	movq	%r13, %rcx	# D.10830,
	subq	$-128, %r15	#, ivtmp.589
	leaq	(%rdi,%r14), %rdx	#, D.10834
	leaq	(%rbx,%rdi), %r8	#,
	movl	%r12d, %edi	# n,
	call	do_4x4_block	#
	cmpq	408(%rsp), %r15	# %sfp, ivtmp.589
	jne	.L345	#,
.L344:
	addl	$4, 360(%rsp)	#, %sfp
	addq	168(%rsp), %rbx	# %sfp, ivtmp.596
	movl	220(%rsp), %r9d	# %sfp, j1
	cmpl	%r9d, 360(%rsp)	# j1, %sfp
	jl	.L341	#,
	movl	436(%rsp), %r11d	# %sfp, i1
	movq	136(%rsp), %r15	# %sfp, ivtmp.623
	movl	216(%rsp), %edi	# %sfp, iend
	movq	312(%rsp), %r13	# %sfp, ivtmp.635
	movl	108(%rsp), %r10d	# %sfp, ivtmp.581
	movl	156(%rsp), %esi	# %sfp, j1
	movslq	%r11d, %rax	# i1, D.10833
	movl	320(%rsp), %r14d	# %sfp, D.10836
	movq	304(%rsp), %rbx	# %sfp, A
	movq	%rax, %rdx	# D.10833, D.10833
	subl	$1, %edi	#, D.10836
	movq	%rax, 160(%rsp)	# D.10833, %sfp
	leaq	1(%r15,%rdx), %r8	#, D.10833
	subl	%r11d, %edi	# i1, D.10833
	movq	%r13, %r11	# ivtmp.635, ivtmp.635
	movq	424(%rsp), %r13	# %sfp, B
	addq	%r15, %rax	# ivtmp.623, ivtmp.576
	movl	%r12d, 408(%rsp)	# n, %sfp
	addq	%r8, %rdi	# D.10833, D.10833
	movl	%esi, 212(%rsp)	# j1, %sfp
	movq	%rax, 320(%rsp)	# ivtmp.576, %sfp
	movq	%rdi, 304(%rsp)	# D.10833, %sfp
	movl	%r10d, %r12d	# ivtmp.581, ivtmp.581
	.p2align 4,,10
	.p2align 3
.L360:
	movl	436(%rsp), %r9d	# %sfp, i1
	cmpl	%r9d, 216(%rsp)	# i1, %sfp
	jle	.L351	#,
	movq	192(%rsp), %r15	# %sfp, ivtmp.624
	movq	160(%rsp), %rsi	# %sfp, D.10833
	movslq	%r12d, %r10	# ivtmp.581, D.10833
	movq	184(%rsp), %rdx	# %sfp, C
	movl	400(%rsp), %edi	# %sfp, tmp1747
	leaq	(%r10,%rsi), %rax	#, D.10833
	addq	%r15, %r10	# ivtmp.624, D.10833
	leaq	0(%r13,%r10,8), %rcx	#, batmp.453
	leal	(%r12,%rdi), %r9d	#, D.10832
	leaq	(%rdx,%rax,8), %rsi	#, ivtmp.568
	movl	%r15d, %eax	# ivtmp.624, tmp1745
	movl	392(%rsp), %edx	# %sfp, tmp1749
	movq	%rcx, 224(%rsp)	# batmp.453, %sfp
	andl	$31, %ecx	#, D.10834
	movslq	%r9d, %r10	# D.10832, D.10833
	shrq	$3, %rcx	#, D.10834
	movq	%r10, 280(%rsp)	# D.10833, %sfp
	negq	%rcx	# D.10834
	leal	(%r12,%rdx), %r15d	#, D.10832
	andl	$3, %ecx	#, D.10836
	cmpl	%r14d, %ecx	# D.10836, D.10836
	cmova	%r14d, %ecx	# prolog_loop_niters.456,, D.10836, prolog_loop_niters.456
	addl	%r12d, %eax	# ivtmp.581, D.10836
	cltq
	movl	%ecx, 296(%rsp)	# prolog_loop_niters.456, %sfp
	movslq	%r15d, %rcx	# D.10832, D.10833
	leaq	0(%r13,%rax,8), %r8	#, D.10830
	movq	320(%rsp), %rax	# %sfp, ivtmp.576
	movq	%rcx, 272(%rsp)	# D.10833, %sfp
	movq	%r8, 288(%rsp)	# D.10830, %sfp
	movl	384(%rsp), %r8d	# %sfp, tmp1751
	leal	(%r12,%r8), %edi	#, D.10832
	movslq	%edi, %r9	# D.10832, D.10833
	movq	%r9, 264(%rsp)	# D.10833, %sfp
	.p2align 4,,10
	.p2align 3
.L363:
	movl	436(%rsp), %r10d	# %sfp, D.10836
	movl	456(%rsp), %edx	# %sfp, k1
	subl	320(%rsp), %r10d	# %sfp, D.10836
	cmpl	%edx, 460(%rsp)	# k1, %sfp
	leal	(%r10,%rax), %r10d	#, D.10832
	jle	.L352	#,
	movl	296(%rsp), %r15d	# %sfp, prologue_after_cost_adjust.457
	cmpl	$6, %r14d	#, D.10836
	vmovsd	(%rsi), %xmm0	# MEM[base: _1004, offset: 0B], D__lsm.407
	cmovbe	%r14d, %r15d	# prologue_after_cost_adjust.457,, D.10836, prologue_after_cost_adjust.457
	testl	%r15d, %r15d	# prologue_after_cost_adjust.457
	je	.L403	#,
	movq	288(%rsp), %rcx	# %sfp, D.10830
	vmovsd	(%rbx,%rax,8), %xmm1	# MEM[base: A_64(D), index: ivtmp.576_725, step: 8, offset: 0B], MEM[base: A_64(D), index: ivtmp.576_725, step: 8, offset: 0B]
	cmpl	$1, %r15d	#, prologue_after_cost_adjust.457
	movl	400(%rsp), %edx	# %sfp, k1
	vmulsd	(%rcx), %xmm1, %xmm2	# *_783, MEM[base: A_64(D), index: ivtmp.576_725, step: 8, offset: 0B], D.10831
	vaddsd	%xmm2, %xmm0, %xmm0	# D.10831, D__lsm.407, D.10831
	jbe	.L355	#,
	movq	280(%rsp), %r8	# %sfp, D.10833
	movq	344(%rsp), %rdi	# %sfp, D.10830
	cmpl	$2, %r15d	#, prologue_after_cost_adjust.457
	movl	392(%rsp), %edx	# %sfp, k1
	vmovsd	0(%r13,%r8,8), %xmm3	# *_802, *_802
	vmulsd	(%rdi,%rax,8), %xmm3, %xmm4	# MEM[base: _976, index: ivtmp.576_725, step: 8, offset: 0B], *_802, D.10831
	vaddsd	%xmm4, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L355	#,
	movq	272(%rsp), %r9	# %sfp, D.10833
	movq	352(%rsp), %rdx	# %sfp, D.10830
	cmpl	$3, %r15d	#, prologue_after_cost_adjust.457
	vmovsd	0(%r13,%r9,8), %xmm5	# *_821, *_821
	vmulsd	(%rdx,%rax,8), %xmm5, %xmm6	# MEM[base: _985, index: ivtmp.576_725, step: 8, offset: 0B], *_821, D.10831
	movl	384(%rsp), %edx	# %sfp, k1
	vaddsd	%xmm6, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L355	#,
	movq	256(%rsp), %r8	# %sfp, ivtmp.633
	movq	264(%rsp), %rcx	# %sfp, D.10833
	movq	368(%rsp), %r9	# %sfp, ivtmp.642
	movq	%r8, %rdi	# ivtmp.633, D.10835
	addq	240(%rsp), %rdi	# %sfp, D.10835
	vmovsd	0(%r13,%rcx,8), %xmm7	# *_840, *_840
	movl	%r9d, %edx	# ivtmp.642, k1
	addq	%rbx, %rdi	# A, D.10830
	cmpl	$4, %r15d	#, prologue_after_cost_adjust.457
	vmulsd	(%rdi,%rax,8), %xmm7, %xmm8	# MEM[base: _994, index: ivtmp.576_725, step: 8, offset: 0B], *_840, D.10831
	vaddsd	%xmm8, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L355	#,
	leal	(%r12,%r9), %edx	#, D.10832
	movq	%r8, %rcx	# ivtmp.633, D.10835
	addq	232(%rsp), %rcx	# %sfp, D.10835
	movq	376(%rsp), %r9	# %sfp, ivtmp.634
	movslq	%edx, %rdi	# D.10832, D.10833
	vmovsd	0(%r13,%rdi,8), %xmm9	# *_859, *_859
	addq	%rbx, %rcx	# A, D.10830
	cmpl	$5, %r15d	#, prologue_after_cost_adjust.457
	movl	%r9d, %edx	# ivtmp.634, k1
	vmulsd	(%rcx,%rax,8), %xmm9, %xmm10	# MEM[base: _1003, index: ivtmp.576_725, step: 8, offset: 0B], *_859, D.10831
	vaddsd	%xmm10, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L355	#,
	leal	(%r12,%r9), %edx	#, D.10832
	movq	248(%rsp), %rcx	# %sfp, D.10835
	movslq	%edx, %rdi	# D.10832, D.10833
	movl	364(%rsp), %edx	# %sfp, D.10836
	addq	%r8, %rcx	# ivtmp.633, D.10835
	vmovsd	0(%r13,%rdi,8), %xmm11	# *_454, *_454
	addq	%rbx, %rcx	# A, D.10830
	vmulsd	(%rcx,%rax,8), %xmm11, %xmm12	# MEM[base: _967, index: ivtmp.576_725, step: 8, offset: 0B], *_454, D.10831
	addl	$6, %edx	#, k1
	vaddsd	%xmm0, %xmm12, %xmm0	# D.10831, D.10831, D__lsm.407
.L355:
	cmpl	%r15d, %r14d	# prologue_after_cost_adjust.457, D.10836
	je	.L356	#,
.L354:
	movl	%r14d, %r9d	# D.10836, niters.459
	movl	%r15d, %r8d	# prologue_after_cost_adjust.457, prolog_loop_adjusted_niters.458
	subl	%r15d, %r9d	# prologue_after_cost_adjust.457, niters.459
	movl	%r9d, %edi	# niters.459, niters.459
	movl	%r9d, 360(%rsp)	# niters.459, %sfp
	shrl	$2, %edi	#, bnd.460
	leal	0(,%rdi,4), %r9d	#, ratio_mult_vf.461
	testl	%r9d, %r9d	# ratio_mult_vf.461
	je	.L357	#,
	movq	224(%rsp), %r15	# %sfp, batmp.453
	movl	$1, 432(%rsp)	#, %sfp
	leaq	(%r15,%r8,8), %rcx	#, ivtmp.557
	leal	-1(%rdi), %r15d	#, tmp1257
	imulq	336(%rsp), %r8	# %sfp, D.10835
	movq	%rcx, 328(%rsp)	# ivtmp.557, %sfp
	movl	%r15d, 312(%rsp)	# tmp1257, %sfp
	movq	328(%rsp), %r15	# %sfp, ivtmp.557
	andl	$3, 312(%rsp)	#, %sfp
	addq	%rax, %r8	# ivtmp.576, D.10835
	leaq	(%rbx,%r8,8), %r8	#, D.10830
	leaq	(%r8,%r11), %rcx	#, ivtmp.561
	vmovsd	(%r8,%r11,2), %xmm13	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1727
	movq	440(%rsp), %r8	# %sfp, D.10833
	vmovhpd	(%rcx,%r11,2), %xmm13, %xmm14	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1727, tmp1323
	vmovsd	(%rcx,%r8), %xmm15	# MEM[base: _647, index: _724, offset: 0B], tmp1729
	leaq	32(%r15), %r8	#, ivtmp.557
	vmovhpd	(%rcx), %xmm15, %xmm1	# MEM[base: _647, offset: 0B], tmp1729, tmp1326
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	cmpl	$1, %edi	#, bnd.460
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm2	# tmp1323, tmp1326, vect_cst_.463
	vmulpd	(%r15), %ymm2, %ymm1	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.470
	jbe	.L500	#,
	movl	312(%rsp), %r15d	# %sfp, tmp1257
	testl	%r15d, %r15d	# tmp1257
	je	.L511	#,
	cmpl	$1, %r15d	#, tmp1257
	je	.L481	#,
	cmpl	$2, %r15d	#, tmp1257
	je	.L482	#,
	movq	440(%rsp), %r8	# %sfp, D.10833
	vmovsd	(%rcx,%r11), %xmm3	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1894
	movl	$2, 432(%rsp)	#, %sfp
	vmovhpd	(%rcx,%r11,2), %xmm3, %xmm4	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1894, tmp1490
	vmovsd	(%rcx,%r8), %xmm5	# MEM[base: _647, index: _724, offset: 0B], tmp1896
	movq	328(%rsp), %r8	# %sfp, ivtmp.557
	vmovhpd	(%rcx), %xmm5, %xmm6	# MEM[base: _647, offset: 0B], tmp1896, tmp1493
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	addq	$64, %r8	#, ivtmp.557
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7	# tmp1490, tmp1493, vect_cst_.463
	vmulpd	-32(%r8), %ymm7, %ymm8	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.469, vect_var_.470, vect_var_.470
.L482:
	movq	440(%rsp), %r15	# %sfp, D.10833
	vmovsd	(%rcx,%r11), %xmm9	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1897
	addl	$1, 432(%rsp)	#, %sfp
	addq	$32, %r8	#, ivtmp.557
	vmovhpd	(%rcx,%r11,2), %xmm9, %xmm10	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1897, tmp1499
	vmovsd	(%rcx,%r15), %xmm11	# MEM[base: _647, index: _724, offset: 0B], tmp1899
	vmovhpd	(%rcx), %xmm11, %xmm12	# MEM[base: _647, offset: 0B], tmp1899, tmp1502
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp1499, tmp1502, vect_cst_.463
	vmulpd	-32(%r8), %ymm13, %ymm14	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vaddpd	%ymm14, %ymm1, %ymm1	# vect_var_.469, vect_var_.470, vect_var_.470
.L481:
	movq	440(%rsp), %r15	# %sfp, D.10833
	vmovsd	(%rcx,%r11), %xmm15	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1900
	addl	$1, 432(%rsp)	#, %sfp
	addq	$32, %r8	#, ivtmp.557
	vmovhpd	(%rcx,%r11,2), %xmm15, %xmm2	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1900, tmp1508
	vmovsd	(%rcx,%r15), %xmm3	# MEM[base: _647, index: _724, offset: 0B], tmp1902
	vmovhpd	(%rcx), %xmm3, %xmm4	# MEM[base: _647, offset: 0B], tmp1902, tmp1511
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm2, %ymm4, %ymm5	# tmp1508, tmp1511, vect_cst_.463
	vmulpd	-32(%r8), %ymm5, %ymm6	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	cmpl	432(%rsp), %edi	# %sfp, bnd.460
	vaddpd	%ymm6, %ymm1, %ymm1	# vect_var_.469, vect_var_.470, vect_var_.470
	jbe	.L500	#,
.L358:
	vmovsd	(%rcx,%r11), %xmm7	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1697
	addl	$4, 432(%rsp)	#, %sfp
	vmovsd	(%rcx,%r15), %xmm9	# MEM[base: _647, index: _724, offset: 0B], tmp1698
	subq	$-128, %r8	#, ivtmp.557
	vmovhpd	(%rcx,%r11,2), %xmm7, %xmm8	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1697, tmp938
	vmovhpd	(%rcx), %xmm9, %xmm10	# MEM[base: _647, offset: 0B], tmp1698, tmp941
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp938, tmp941, vect_cst_.463
	vmovsd	(%rcx,%r11), %xmm14	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1699
	vmovsd	(%rcx,%r15), %xmm2	# MEM[base: _647, index: _724, offset: 0B], tmp1700
	vmulpd	-128(%r8), %ymm11, %ymm12	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vmovhpd	(%rcx,%r11,2), %xmm14, %xmm15	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1699, tmp1284
	vmovhpd	(%rcx), %xmm2, %xmm3	# MEM[base: _647, offset: 0B], tmp1700, tmp1287
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4	# tmp1284, tmp1287, vect_cst_.463
	vmovsd	(%rcx,%r11), %xmm6	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1701
	vmulpd	-96(%r8), %ymm4, %ymm5	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vaddpd	%ymm12, %ymm1, %ymm13	# vect_var_.469, vect_var_.470, vect_var_.470
	vmovsd	(%rcx,%r15), %xmm7	# MEM[base: _647, index: _724, offset: 0B], tmp1702
	vmovhpd	(%rcx,%r11,2), %xmm6, %xmm1	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1701, tmp1297
	vmovhpd	(%rcx), %xmm7, %xmm9	# MEM[base: _647, offset: 0B], tmp1702, tmp1300
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm1, %ymm9, %ymm10	# tmp1297, tmp1300, vect_cst_.463
	vaddpd	%ymm5, %ymm13, %ymm8	# vect_var_.469, vect_var_.470, vect_var_.470
	vmovsd	(%rcx,%r15), %xmm15	# MEM[base: _647, index: _724, offset: 0B], tmp1704
	vmovsd	(%rcx,%r11), %xmm13	# MEM[base: _647, index: ivtmp.635_1107, offset: 0B], tmp1703
	vmulpd	-64(%r8), %ymm10, %ymm11	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vmovhpd	(%rcx), %xmm15, %xmm2	# MEM[base: _647, offset: 0B], tmp1704, tmp1313
	vmovhpd	(%rcx,%r11,2), %xmm13, %xmm14	# MEM[base: _647, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1703, tmp1310
	addq	448(%rsp), %rcx	# %sfp, ivtmp.561
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm3	# tmp1310, tmp1313, vect_cst_.463
	vmulpd	-32(%r8), %ymm3, %ymm4	# MEM[base: _648, offset: 0B], vect_cst_.463, vect_var_.469
	vaddpd	%ymm11, %ymm8, %ymm12	# vect_var_.469, vect_var_.470, vect_var_.470
	cmpl	432(%rsp), %edi	# %sfp, bnd.460
	vaddpd	%ymm4, %ymm12, %ymm1	# vect_var_.469, vect_var_.470, vect_var_.470
	ja	.L358	#,
	.p2align 4,,10
	.p2align 3
.L500:
	addl	%r9d, %edx	# ratio_mult_vf.461, k1
	cmpl	%r9d, 360(%rsp)	# ratio_mult_vf.461, %sfp
	vhaddpd	%ymm1, %ymm1, %ymm5	# vect_var_.470, vect_var_.470, tmp953
	vperm2f128	$1, %ymm5, %ymm5, %ymm8	#, tmp953, tmp953, tmp954
	vaddpd	%ymm8, %ymm5, %ymm6	# tmp954, tmp953, vect_var_.472
	vaddsd	%xmm0, %xmm6, %xmm0	# D__lsm.407, stmp_var_.471, D__lsm.407
	je	.L356	#,
.L357:
	movl	408(%rsp), %r9d	# %sfp, n
	leal	(%r12,%rdx), %ecx	#, D.10832
	movslq	%ecx, %r15	# D.10832, D.10833
	movl	%r9d, %edi	# n, D.10832
	imull	%edx, %edi	# k1, D.10832
	addl	%r10d, %edi	# D.10832, D.10832
	movslq	%edi, %r8	# D.10832, D.10833
	vmovsd	(%rbx,%r8,8), %xmm1	# *_743, *_743
	leal	1(%rdx), %r8d	#, k1
	vmulsd	0(%r13,%r15,8), %xmm1, %xmm7	# *_748, *_743, D.10831
	movl	460(%rsp), %r15d	# %sfp, kend
	cmpl	%r8d, %r15d	# k1, kend
	vaddsd	%xmm0, %xmm7, %xmm0	# D__lsm.407, D.10831, D__lsm.407
	jle	.L356	#,
	imull	%r8d, %r9d	# k1, D.10832
	addl	%r12d, %r8d	# ivtmp.581, D.10832
	addl	$2, %edx	#, k1
	movslq	%r8d, %rcx	# D.10832, D.10833
	addl	%r10d, %r9d	# D.10832, D.10832
	cmpl	%edx, %r15d	# k1, kend
	movslq	%r9d, %rdi	# D.10832, D.10833
	vmovsd	(%rbx,%rdi,8), %xmm9	# *_760, *_760
	vmulsd	0(%r13,%rcx,8), %xmm9, %xmm10	# *_765, *_760, D.10831
	vaddsd	%xmm10, %xmm0, %xmm0	# D.10831, D__lsm.407, D.10831
	jle	.L356	#,
	movl	408(%rsp), %r8d	# %sfp, D.10832
	imull	%edx, %r8d	# k1, D.10832
	addl	%r12d, %edx	# ivtmp.581, D.10832
	movslq	%edx, %rdx	# D.10832, D.10833
	addl	%r10d, %r8d	# D.10832, D.10832
	movslq	%r8d, %r10	# D.10832, D.10833
	vmovsd	(%rbx,%r10,8), %xmm11	# *_490, *_490
	vmulsd	0(%r13,%rdx,8), %xmm11, %xmm12	# *_495, *_490, D.10831
	vaddsd	%xmm0, %xmm12, %xmm0	# D.10831, D.10831, D__lsm.407
.L356:
	vmovsd	%xmm0, (%rsi)	# D__lsm.407, MEM[base: _1004, offset: 0B]
.L352:
	addq	$8, %rsi	#, ivtmp.568
	addq	$1, %rax	#, ivtmp.576
	cmpq	304(%rsp), %rax	# %sfp, ivtmp.576
	jne	.L363	#,
.L351:
	addl	$1, 212(%rsp)	#, %sfp
	addl	408(%rsp), %r12d	# %sfp, ivtmp.581
	movl	220(%rsp), %esi	# %sfp, j1
	cmpl	%esi, 212(%rsp)	# j1, %sfp
	jne	.L360	#,
	movl	408(%rsp), %r12d	# %sfp, n
	movq	%r11, %r15	# ivtmp.635, ivtmp.635
.L359:
	movl	416(%rsp), %r11d	# %sfp, i1
	cmpl	%r11d, 436(%rsp)	# i1, %sfp
	jle	.L340	#,
	movq	256(%rsp), %r9	# %sfp, ivtmp.633
	movq	248(%rsp), %r8	# %sfp, D.10835
	movq	%rbx, %r10	# A, A
	movq	128(%rsp), %r13	# %sfp, ivtmp.607
	movq	40(%rsp), %rax	# %sfp, D.10834
	movq	144(%rsp), %rsi	# %sfp, ivtmp.551
	addq	136(%rsp), %rsi	# %sfp, ivtmp.551
	movq	%r9, %rdi	# ivtmp.633, D.10835
	movq	%r9, %rcx	# ivtmp.633, D.10835
	addq	240(%rsp), %rdi	# %sfp, D.10835
	addq	232(%rsp), %rcx	# %sfp, D.10835
	addq	%r9, %r8	# ivtmp.633, D.10835
	movl	%r12d, 408(%rsp)	# n, %sfp
	movq	192(%rsp), %r12	# %sfp, ivtmp.624
	addq	%rax, %r13	# D.10834, ivtmp.543
	addq	%rbx, %r8	# A, D.10830
	movq	%r13, 280(%rsp)	# ivtmp.543, %sfp
	movq	%r8, 288(%rsp)	# D.10830, %sfp
	addq	%rbx, %rdi	# A, D.10830
	addq	%rbx, %rcx	# A, D.10830
	movq	%rdi, 304(%rsp)	# D.10830, %sfp
	movq	%rcx, 296(%rsp)	# D.10830, %sfp
	.p2align 4,,10
	.p2align 3
.L377:
	movl	220(%rsp), %r13d	# %sfp, j1
	cmpl	%r13d, 420(%rsp)	# j1, %sfp
	jle	.L369	#,
	movl	%r13d, 432(%rsp)	# j1, %sfp
	movl	208(%rsp), %ebx	# %sfp, ivtmp.537
	movq	%r12, %r11	# ivtmp.624, ivtmp.624
	movq	200(%rsp), %rax	# %sfp, ivtmp.532
	movq	280(%rsp), %rdi	# %sfp, ivtmp.529
	movq	%r10, %r13	# A, A
	jmp	.L379	#
	.p2align 4,,10
	.p2align 3
.L517:
	vmovsd	(%rax), %xmm13	# MEM[base: _909, offset: 0B], MEM[base: _909, offset: 0B]
	movq	400(%rsp), %rcx	# %sfp, ivtmp.636
	cmpl	$1, %r8d	#, prologue_after_cost_adjust.435
	vmulsd	0(%r13,%rsi,8), %xmm13, %xmm14	# MEM[base: A_64(D), index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, offset: 0B], D.10831
	movl	%ecx, %edx	# ivtmp.636, k1
	vaddsd	%xmm14, %xmm0, %xmm0	# D.10831, D__lsm.406, D.10831
	jbe	.L373	#,
	movq	%rcx, %r12	# ivtmp.636, D.10835
	movq	344(%rsp), %r10	# %sfp, D.10830
	movq	392(%rsp), %r9	# %sfp, ivtmp.638
	subq	%r11, %r12	# ivtmp.624, D.10835
	cmpl	$2, %r8d	#, prologue_after_cost_adjust.435
	vmovsd	(%rax,%r12,8), %xmm15	# MEM[base: _909, index: _914, step: 8, offset: 0B], MEM[base: _909, index: _914, step: 8, offset: 0B]
	movl	%r9d, %edx	# ivtmp.638, k1
	vmulsd	(%r10,%rsi,8), %xmm15, %xmm2	# MEM[base: _71, index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, index: _914, step: 8, offset: 0B], D.10831
	vaddsd	%xmm2, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L373	#,
	movq	%r9, %rdx	# ivtmp.638, D.10835
	movq	352(%rsp), %rcx	# %sfp, D.10830
	movq	384(%rsp), %r12	# %sfp, ivtmp.640
	subq	%r11, %rdx	# ivtmp.624, D.10835
	cmpl	$3, %r8d	#, prologue_after_cost_adjust.435
	vmovsd	(%rax,%rdx,8), %xmm3	# MEM[base: _909, index: _919, step: 8, offset: 0B], MEM[base: _909, index: _919, step: 8, offset: 0B]
	movl	%r12d, %edx	# ivtmp.640, k1
	vmulsd	(%rcx,%rsi,8), %xmm3, %xmm4	# MEM[base: _936, index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, index: _919, step: 8, offset: 0B], D.10831
	vaddsd	%xmm4, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L373	#,
	movq	%r12, %r10	# ivtmp.640, D.10835
	movq	304(%rsp), %r9	# %sfp, D.10830
	movq	368(%rsp), %rcx	# %sfp, ivtmp.642
	subq	%r11, %r10	# ivtmp.624, D.10835
	cmpl	$4, %r8d	#, prologue_after_cost_adjust.435
	vmovsd	(%rax,%r10,8), %xmm5	# MEM[base: _909, index: _924, step: 8, offset: 0B], MEM[base: _909, index: _924, step: 8, offset: 0B]
	movl	%ecx, %edx	# ivtmp.642, k1
	vmulsd	(%r9,%rsi,8), %xmm5, %xmm8	# MEM[base: _945, index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, index: _924, step: 8, offset: 0B], D.10831
	vaddsd	%xmm8, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L373	#,
	movq	%rcx, %rdx	# ivtmp.642, D.10835
	movq	296(%rsp), %r12	# %sfp, D.10830
	movq	376(%rsp), %r10	# %sfp, ivtmp.634
	subq	%r11, %rdx	# ivtmp.624, D.10835
	cmpl	$5, %r8d	#, prologue_after_cost_adjust.435
	vmovsd	(%rax,%rdx,8), %xmm6	# MEM[base: _909, index: _929, step: 8, offset: 0B], MEM[base: _909, index: _929, step: 8, offset: 0B]
	movl	%r10d, %edx	# ivtmp.634, k1
	vmulsd	(%r12,%rsi,8), %xmm6, %xmm1	# MEM[base: _954, index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, index: _929, step: 8, offset: 0B], D.10831
	vaddsd	%xmm1, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L373	#,
	movq	%r10, %r9	# ivtmp.634, D.10835
	movq	288(%rsp), %rcx	# %sfp, D.10830
	movl	364(%rsp), %edx	# %sfp, D.10836
	subq	%r11, %r9	# ivtmp.624, D.10835
	vmovsd	(%rax,%r9,8), %xmm7	# MEM[base: _909, index: _908, step: 8, offset: 0B], MEM[base: _909, index: _908, step: 8, offset: 0B]
	addl	$6, %edx	#, k1
	vmulsd	(%rcx,%rsi,8), %xmm7, %xmm9	# MEM[base: _730, index: ivtmp.551_652, step: 8, offset: 0B], MEM[base: _909, index: _908, step: 8, offset: 0B], D.10831
	vaddsd	%xmm0, %xmm9, %xmm0	# D.10831, D.10831, D__lsm.406
.L373:
	cmpl	%r14d, %r8d	# D.10836, prologue_after_cost_adjust.435
	je	.L374	#,
.L372:
	movl	%r14d, %r10d	# D.10836, niters.437
	movl	%r8d, %r12d	# prologue_after_cost_adjust.435, prolog_loop_adjusted_niters.436
	subl	%r8d, %r10d	# prologue_after_cost_adjust.435, niters.437
	movl	%r10d, %r8d	# niters.437, bnd.438
	movl	%r10d, 328(%rsp)	# niters.437, %sfp
	shrl	$2, %r8d	#, bnd.438
	leal	0(,%r8,4), %r10d	#, ratio_mult_vf.439
	testl	%r10d, %r10d	# ratio_mult_vf.439
	je	.L375	#,
	leaq	(%rax,%r12,8), %r9	#, ivtmp.518
	movl	$1, 360(%rsp)	#, %sfp
	imulq	336(%rsp), %r12	# %sfp, D.10835
	movq	%r9, 320(%rsp)	# ivtmp.518, %sfp
	addq	%rsi, %r12	# ivtmp.551, D.10835
	leaq	0(%r13,%r12,8), %r9	#, D.10830
	leal	-1(%r8), %r12d	#, tmp1252
	leaq	(%r9,%r15), %rcx	#, ivtmp.522
	vmovsd	(%r9,%r15,2), %xmm10	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1788
	movq	440(%rsp), %r9	# %sfp, D.10833
	movl	%r12d, 312(%rsp)	# tmp1252, %sfp
	vmovhpd	(%rcx,%r15,2), %xmm10, %xmm11	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1788, tmp1375
	andl	$3, 312(%rsp)	#, %sfp
	vmovsd	(%rcx,%r9), %xmm12	# MEM[base: _595, index: _576, offset: 0B], tmp1790
	movq	320(%rsp), %r9	# %sfp, ivtmp.518
	vmovhpd	(%rcx), %xmm12, %xmm13	# MEM[base: _595, offset: 0B], tmp1790, tmp1378
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	addq	$32, %r9	#, ivtmp.518
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1375, tmp1378, vect_cst_.441
	vmulpd	-32(%r9), %ymm14, %ymm1	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.448
	cmpl	$1, %r8d	#, bnd.438
	jbe	.L501	#,
	movl	312(%rsp), %r12d	# %sfp, tmp1252
	testl	%r12d, %r12d	# tmp1252
	je	.L510	#,
	cmpl	$1, %r12d	#, tmp1252
	je	.L479	#,
	cmpl	$2, %r12d	#, tmp1252
	je	.L480	#,
	movq	440(%rsp), %r9	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm15	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1883
	movl	$2, 360(%rsp)	#, %sfp
	vmovhpd	(%rcx,%r15,2), %xmm15, %xmm2	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1883, tmp1463
	vmovsd	(%rcx,%r9), %xmm3	# MEM[base: _595, index: _576, offset: 0B], tmp1885
	movq	320(%rsp), %r9	# %sfp, ivtmp.518
	vmovhpd	(%rcx), %xmm3, %xmm4	# MEM[base: _595, offset: 0B], tmp1885, tmp1466
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	addq	$64, %r9	#, ivtmp.518
	vinsertf128	$0x1, %xmm2, %ymm4, %ymm5	# tmp1463, tmp1466, vect_cst_.441
	vmulpd	-32(%r9), %ymm5, %ymm8	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.447, vect_var_.448, vect_var_.448
.L480:
	movq	440(%rsp), %r12	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm6	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1888
	addl	$1, 360(%rsp)	#, %sfp
	addq	$32, %r9	#, ivtmp.518
	vmovhpd	(%rcx,%r15,2), %xmm6, %xmm7	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1888, tmp1472
	vmovsd	(%rcx,%r12), %xmm9	# MEM[base: _595, index: _576, offset: 0B], tmp1890
	vmovhpd	(%rcx), %xmm9, %xmm10	# MEM[base: _595, offset: 0B], tmp1890, tmp1475
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm7, %ymm10, %ymm11	# tmp1472, tmp1475, vect_cst_.441
	vmulpd	-32(%r9), %ymm11, %ymm12	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vaddpd	%ymm12, %ymm1, %ymm1	# vect_var_.447, vect_var_.448, vect_var_.448
.L479:
	movq	440(%rsp), %r12	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm13	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1891
	addl	$1, 360(%rsp)	#, %sfp
	addq	$32, %r9	#, ivtmp.518
	vmovhpd	(%rcx,%r15,2), %xmm13, %xmm14	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1891, tmp1481
	vmovsd	(%rcx,%r12), %xmm15	# MEM[base: _595, index: _576, offset: 0B], tmp1893
	vmovhpd	(%rcx), %xmm15, %xmm2	# MEM[base: _595, offset: 0B], tmp1893, tmp1484
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm3	# tmp1481, tmp1484, vect_cst_.441
	vmulpd	-32(%r9), %ymm3, %ymm4	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	cmpl	360(%rsp), %r8d	# %sfp, bnd.438
	vaddpd	%ymm4, %ymm1, %ymm1	# vect_var_.447, vect_var_.448, vect_var_.448
	jbe	.L501	#,
.L510:
	movq	%rax, 320(%rsp)	# ivtmp.532, %sfp
	movl	432(%rsp), %r12d	# %sfp, j1
	movq	440(%rsp), %rax	# %sfp, D.10833
.L376:
	vmovsd	(%rcx,%r15), %xmm5	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1753
	addl	$4, 360(%rsp)	#, %sfp
	subq	$-128, %r9	#, ivtmp.518
	vmovsd	(%rcx,%rax), %xmm6	# MEM[base: _595, index: _576, offset: 0B], tmp1755
	vmovhpd	(%rcx,%r15,2), %xmm5, %xmm8	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1753, tmp1027
	vmovhpd	(%rcx), %xmm6, %xmm7	# MEM[base: _595, offset: 0B], tmp1755, tmp1030
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm8, %ymm7, %ymm9	# tmp1027, tmp1030, vect_cst_.441
	vmovsd	(%rcx,%r15), %xmm12	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1756
	vmovsd	(%rcx,%rax), %xmm14	# MEM[base: _595, index: _576, offset: 0B], tmp1758
	vmulpd	-128(%r9), %ymm9, %ymm10	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vmovhpd	(%rcx,%r15,2), %xmm12, %xmm13	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1756, tmp1336
	vmovhpd	(%rcx), %xmm14, %xmm15	# MEM[base: _595, offset: 0B], tmp1758, tmp1339
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm2	# tmp1336, tmp1339, vect_cst_.441
	vmovsd	(%rcx,%rax), %xmm8	# MEM[base: _595, index: _576, offset: 0B], tmp1761
	vmulpd	-96(%r9), %ymm2, %ymm3	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vaddpd	%ymm10, %ymm1, %ymm11	# vect_var_.447, vect_var_.448, vect_var_.448
	vmovsd	(%rcx,%r15), %xmm1	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1759
	vmovhpd	(%rcx), %xmm8, %xmm6	# MEM[base: _595, offset: 0B], tmp1761, tmp1352
	vmovhpd	(%rcx,%r15,2), %xmm1, %xmm5	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1759, tmp1349
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm5, %ymm6, %ymm7	# tmp1349, tmp1352, vect_cst_.441
	vaddpd	%ymm3, %ymm11, %ymm4	# vect_var_.447, vect_var_.448, vect_var_.448
	vmovsd	(%rcx,%rax), %xmm13	# MEM[base: _595, index: _576, offset: 0B], tmp1764
	vmovsd	(%rcx,%r15), %xmm11	# MEM[base: _595, index: ivtmp.635_1107, offset: 0B], tmp1762
	vmulpd	-64(%r9), %ymm7, %ymm9	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vmovhpd	(%rcx), %xmm13, %xmm14	# MEM[base: _595, offset: 0B], tmp1764, tmp1365
	vmovhpd	(%rcx,%r15,2), %xmm11, %xmm12	# MEM[base: _595, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1762, tmp1362
	addq	448(%rsp), %rcx	# %sfp, ivtmp.522
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1362, tmp1365, vect_cst_.441
	vmulpd	-32(%r9), %ymm15, %ymm2	# MEM[base: _145, offset: 0B], vect_cst_.441, vect_var_.447
	vaddpd	%ymm9, %ymm4, %ymm10	# vect_var_.447, vect_var_.448, vect_var_.448
	cmpl	360(%rsp), %r8d	# %sfp, bnd.438
	vaddpd	%ymm2, %ymm10, %ymm1	# vect_var_.447, vect_var_.448, vect_var_.448
	ja	.L376	#,
	movq	320(%rsp), %rax	# %sfp, ivtmp.532
	movl	%r12d, 432(%rsp)	# j1, %sfp
	.p2align 4,,10
	.p2align 3
.L501:
	vhaddpd	%ymm1, %ymm1, %ymm3	# vect_var_.448, vect_var_.448, tmp1042
	addl	%r10d, %edx	# ratio_mult_vf.439, k1
	cmpl	328(%rsp), %r10d	# %sfp, ratio_mult_vf.439
	vperm2f128	$1, %ymm3, %ymm3, %ymm4	#, tmp1042, tmp1042, tmp1043
	vaddpd	%ymm4, %ymm3, %ymm1	# tmp1043, tmp1042, vect_var_.450
	vaddsd	%xmm0, %xmm1, %xmm0	# D__lsm.406, stmp_var_.449, D__lsm.406
	je	.L374	#,
.L375:
	movl	408(%rsp), %r10d	# %sfp, n
	leal	(%rbx,%rdx), %ecx	#, D.10832
	movslq	%ecx, %r12	# D.10832, D.10833
	leal	1(%rdx), %ecx	#, k1
	movl	%r10d, %r8d	# n, D.10832
	imull	%edx, %r8d	# k1, D.10832
	addl	416(%rsp), %r8d	# %sfp, D.10832
	movslq	%r8d, %r9	# D.10832, D.10833
	vmovsd	0(%r13,%r9,8), %xmm5	# *_614, *_614
	movq	424(%rsp), %r9	# %sfp, B
	vmulsd	(%r9,%r12,8), %xmm5, %xmm8	# *_619, *_614, D.10831
	movl	460(%rsp), %r12d	# %sfp, kend
	cmpl	%ecx, %r12d	# k1, kend
	vaddsd	%xmm0, %xmm8, %xmm0	# D__lsm.406, D.10831, D__lsm.406
	jle	.L374	#,
	imull	%ecx, %r10d	# k1, D.10832
	addl	416(%rsp), %r10d	# %sfp, D.10832
	addl	%ebx, %ecx	# ivtmp.537, D.10832
	movslq	%ecx, %rcx	# D.10832, D.10833
	addl	$2, %edx	#, k1
	cmpl	%edx, %r12d	# k1, kend
	movslq	%r10d, %r8	# D.10832, D.10833
	vmovsd	0(%r13,%r8,8), %xmm6	# *_631, *_631
	vmulsd	(%r9,%rcx,8), %xmm6, %xmm7	# *_636, *_631, D.10831
	vaddsd	%xmm7, %xmm0, %xmm0	# D.10831, D__lsm.406, D.10831
	jle	.L374	#,
	movl	408(%rsp), %r9d	# %sfp, D.10832
	movq	424(%rsp), %r10	# %sfp, B
	imull	%edx, %r9d	# k1, D.10832
	addl	416(%rsp), %r9d	# %sfp, D.10832
	addl	%ebx, %edx	# ivtmp.537, D.10832
	movslq	%edx, %rdx	# D.10832, D.10833
	movslq	%r9d, %r12	# D.10832, D.10833
	vmovsd	0(%r13,%r12,8), %xmm9	# *_241, *_241
	vmulsd	(%r10,%rdx,8), %xmm9, %xmm10	# *_365, *_241, D.10831
	vaddsd	%xmm0, %xmm10, %xmm0	# D.10831, D.10831, D__lsm.406
.L374:
	vmovsd	%xmm0, (%rdi)	# D__lsm.406, MEM[base: _930, offset: 0B]
.L370:
	addl	$1, 432(%rsp)	#, %sfp
	addq	%r15, %rdi	# ivtmp.635, ivtmp.529
	addq	%r15, %rax	# ivtmp.635, ivtmp.532
	addl	408(%rsp), %ebx	# %sfp, ivtmp.537
	movl	420(%rsp), %r8d	# %sfp, jend
	cmpl	%r8d, 432(%rsp)	# jend, %sfp
	je	.L504	#,
.L379:
	movl	456(%rsp), %r9d	# %sfp, k1
	cmpl	%r9d, 460(%rsp)	# k1, %sfp
	jle	.L370	#,
	movq	%rax, %r8	# ivtmp.532, D.10834
	vmovsd	(%rdi), %xmm0	# MEM[base: _930, offset: 0B], D__lsm.406
	andl	$31, %r8d	#, D.10834
	shrq	$3, %r8	#, D.10834
	negq	%r8	# D.10834
	andl	$3, %r8d	#, D.10836
	cmpl	%r14d, %r8d	# D.10836, D.10836
	cmova	%r14d, %r8d	# D.10836,, D.10836, prolog_loop_niters.434
	cmpl	$6, %r14d	#, D.10836
	cmovbe	%r14d, %r8d	# prolog_loop_niters.434,, D.10836, prologue_after_cost_adjust.435
	testl	%r8d, %r8d	# prologue_after_cost_adjust.435
	jne	.L517	#,
	movl	456(%rsp), %edx	# %sfp, k1
	jmp	.L372	#
	.p2align 4,,10
	.p2align 3
.L403:
	movl	456(%rsp), %edx	# %sfp, k1
	jmp	.L354	#
	.p2align 4,,10
	.p2align 3
.L504:
	movq	%r11, %r12	# ivtmp.624, ivtmp.624
	movq	%r13, %r10	# A, A
.L369:
	addl	$1, 416(%rsp)	#, %sfp
	addq	$8, 280(%rsp)	#, %sfp
	addq	$1, %rsi	#, ivtmp.551
	movl	436(%rsp), %ebx	# %sfp, i1
	cmpl	%ebx, 416(%rsp)	# i1, %sfp
	jne	.L377	#,
	movl	408(%rsp), %r12d	# %sfp, n
	movq	%r10, %rbx	# A, A
.L340:
	movl	436(%rsp), %esi	# %sfp, i1
	cmpl	%esi, 216(%rsp)	# i1, %sfp
	jle	.L362	#,
	movq	256(%rsp), %rcx	# %sfp, ivtmp.633
	movslq	436(%rsp), %rsi	# %sfp, D.10833
	movq	48(%rsp), %r11	# %sfp, D.10833
	movq	184(%rsp), %rdi	# %sfp, C
	movq	248(%rsp), %rdx	# %sfp, D.10835
	movl	%r12d, 408(%rsp)	# n, %sfp
	movq	%rcx, %rax	# ivtmp.633, D.10835
	movq	%rcx, %r9	# ivtmp.633, D.10835
	addq	240(%rsp), %rax	# %sfp, D.10835
	addq	232(%rsp), %r9	# %sfp, D.10835
	addq	%rsi, %r11	# D.10833, D.10833
	addq	136(%rsp), %rsi	# %sfp, ivtmp.512
	leaq	(%rdi,%r11,8), %r13	#, ivtmp.504
	addq	%rcx, %rdx	# ivtmp.633, D.10835
	movq	192(%rsp), %rcx	# %sfp, ivtmp.624
	addq	%rbx, %rdx	# A, D.10830
	addq	%rbx, %rax	# A, D.10830
	movq	%r13, 296(%rsp)	# ivtmp.504, %sfp
	movq	%rdx, 304(%rsp)	# D.10830, %sfp
	addq	%rbx, %r9	# A, D.10830
	movq	%rax, 320(%rsp)	# D.10830, %sfp
	movq	%rbx, %r13	# A, A
	movq	%r9, 312(%rsp)	# D.10830, %sfp
	.p2align 4,,10
	.p2align 3
.L378:
	movl	220(%rsp), %r10d	# %sfp, j1
	cmpl	%r10d, 420(%rsp)	# j1, %sfp
	jle	.L385	#,
	movq	%r13, %rbx	# A, A
	movl	208(%rsp), %r11d	# %sfp, ivtmp.498
	movq	200(%rsp), %rax	# %sfp, ivtmp.493
	movq	296(%rsp), %rdi	# %sfp, ivtmp.490
	movq	%rcx, %r13	# ivtmp.624, ivtmp.624
	movl	%r10d, 432(%rsp)	# j1, %sfp
	jmp	.L393	#
	.p2align 4,,10
	.p2align 3
.L518:
	vmovsd	(%rax), %xmm11	# MEM[base: _678, offset: 0B], MEM[base: _678, offset: 0B]
	movq	400(%rsp), %rcx	# %sfp, ivtmp.636
	cmpl	$1, %r9d	#, prologue_after_cost_adjust.413
	vmulsd	(%rbx,%rsi,8), %xmm11, %xmm12	# MEM[base: A_64(D), index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, offset: 0B], D.10831
	movl	%ecx, %edx	# ivtmp.636, k1
	vaddsd	%xmm0, %xmm12, %xmm0	# D__lsm.405, D.10831, D.10831
	jbe	.L389	#,
	movq	%rcx, %r10	# ivtmp.636, D.10835
	movq	344(%rsp), %r8	# %sfp, D.10830
	movq	392(%rsp), %r12	# %sfp, ivtmp.638
	subq	%r13, %r10	# ivtmp.624, D.10835
	cmpl	$2, %r9d	#, prologue_after_cost_adjust.413
	vmovsd	(%rax,%r10,8), %xmm13	# MEM[base: _678, index: _303, step: 8, offset: 0B], MEM[base: _678, index: _303, step: 8, offset: 0B]
	movl	%r12d, %edx	# ivtmp.638, k1
	vmulsd	(%r8,%rsi,8), %xmm13, %xmm14	# MEM[base: _198, index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, index: _303, step: 8, offset: 0B], D.10831
	vaddsd	%xmm0, %xmm14, %xmm0	# D.10831, D.10831, D.10831
	je	.L389	#,
	movq	%r12, %rdx	# ivtmp.638, D.10835
	movq	352(%rsp), %rcx	# %sfp, D.10830
	movq	384(%rsp), %r10	# %sfp, ivtmp.640
	subq	%r13, %rdx	# ivtmp.624, D.10835
	cmpl	$3, %r9d	#, prologue_after_cost_adjust.413
	vmovsd	(%rax,%rdx,8), %xmm15	# MEM[base: _678, index: _572, step: 8, offset: 0B], MEM[base: _678, index: _572, step: 8, offset: 0B]
	movl	%r10d, %edx	# ivtmp.640, k1
	vmulsd	(%rcx,%rsi,8), %xmm15, %xmm2	# MEM[base: _880, index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, index: _572, step: 8, offset: 0B], D.10831
	vaddsd	%xmm2, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L389	#,
	movq	%r10, %r8	# ivtmp.640, D.10835
	movq	320(%rsp), %r12	# %sfp, D.10830
	movq	368(%rsp), %rcx	# %sfp, ivtmp.642
	subq	%r13, %r8	# ivtmp.624, D.10835
	cmpl	$4, %r9d	#, prologue_after_cost_adjust.413
	vmovsd	(%rax,%r8,8), %xmm3	# MEM[base: _678, index: _226, step: 8, offset: 0B], MEM[base: _678, index: _226, step: 8, offset: 0B]
	movl	%ecx, %edx	# ivtmp.642, k1
	vmulsd	(%r12,%rsi,8), %xmm3, %xmm4	# MEM[base: _889, index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, index: _226, step: 8, offset: 0B], D.10831
	vaddsd	%xmm4, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L389	#,
	movq	%rcx, %rdx	# ivtmp.642, D.10835
	movq	312(%rsp), %r10	# %sfp, D.10830
	movq	376(%rsp), %r8	# %sfp, ivtmp.634
	subq	%r13, %rdx	# ivtmp.624, D.10835
	cmpl	$5, %r9d	#, prologue_after_cost_adjust.413
	vmovsd	(%rax,%rdx,8), %xmm1	# MEM[base: _678, index: _873, step: 8, offset: 0B], MEM[base: _678, index: _873, step: 8, offset: 0B]
	movl	%r8d, %edx	# ivtmp.634, k1
	vmulsd	(%r10,%rsi,8), %xmm1, %xmm5	# MEM[base: _898, index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, index: _873, step: 8, offset: 0B], D.10831
	vaddsd	%xmm5, %xmm0, %xmm0	# D.10831, D.10831, D.10831
	je	.L389	#,
	movq	%r8, %r12	# ivtmp.634, D.10835
	movq	304(%rsp), %rcx	# %sfp, D.10830
	movl	364(%rsp), %edx	# %sfp, D.10836
	subq	%r13, %r12	# ivtmp.624, D.10835
	vmovsd	(%rax,%r12,8), %xmm8	# MEM[base: _678, index: _682, step: 8, offset: 0B], MEM[base: _678, index: _682, step: 8, offset: 0B]
	addl	$6, %edx	#, k1
	vmulsd	(%rcx,%rsi,8), %xmm8, %xmm6	# MEM[base: _601, index: ivtmp.512_80, step: 8, offset: 0B], MEM[base: _678, index: _682, step: 8, offset: 0B], D.10831
	vaddsd	%xmm0, %xmm6, %xmm0	# D.10831, D.10831, D__lsm.405
.L389:
	cmpl	%r14d, %r9d	# D.10836, prologue_after_cost_adjust.413
	je	.L390	#,
.L388:
	movl	%r14d, %r10d	# D.10836, niters.415
	movl	%r9d, %r12d	# prologue_after_cost_adjust.413, prolog_loop_adjusted_niters.414
	subl	%r9d, %r10d	# prologue_after_cost_adjust.413, niters.415
	movl	%r10d, %r8d	# niters.415, bnd.416
	movl	%r10d, 360(%rsp)	# niters.415, %sfp
	shrl	$2, %r8d	#, bnd.416
	leal	0(,%r8,4), %r9d	#, ratio_mult_vf.417
	testl	%r9d, %r9d	# ratio_mult_vf.417
	movl	%r9d, 416(%rsp)	# ratio_mult_vf.417, %sfp
	je	.L391	#,
	leaq	(%rax,%r12,8), %r10	#, ivtmp.479
	imulq	336(%rsp), %r12	# %sfp, D.10835
	movq	%r10, 328(%rsp)	# ivtmp.479, %sfp
	addq	$32, %r10	#, ivtmp.479
	addq	%rsi, %r12	# ivtmp.512, D.10835
	leaq	(%rbx,%r12,8), %r9	#, D.10830
	leal	-1(%r8), %r12d	#, tmp1247
	leaq	(%r9,%r15), %rcx	#, ivtmp.483
	vmovsd	(%r9,%r15,2), %xmm7	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1851
	movq	440(%rsp), %r9	# %sfp, D.10833
	andl	$3, %r12d	#, tmp1247
	vmovhpd	(%rcx,%r15,2), %xmm7, %xmm9	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1851, tmp1427
	vmovsd	(%rcx,%r9), %xmm10	# MEM[base: _609, index: _608, offset: 0B], tmp1853
	movl	$1, %r9d	#, ivtmp.474
	vmovhpd	(%rcx), %xmm10, %xmm11	# MEM[base: _609, offset: 0B], tmp1853, tmp1430
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm9, %ymm11, %ymm12	# tmp1427, tmp1430, vect_cst_.419
	vmulpd	-32(%r10), %ymm12, %ymm1	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.426
	cmpl	%r8d, %r9d	# bnd.416, ivtmp.474
	jnb	.L502	#,
	testl	%r12d, %r12d	# tmp1247
	je	.L508	#,
	cmpl	$1, %r12d	#, tmp1247
	je	.L477	#,
	cmpl	$2, %r12d	#, tmp1247
	je	.L478	#,
	movq	440(%rsp), %r10	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm13	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1872
	movl	$2, %r9d	#, ivtmp.474
	vmovhpd	(%rcx,%r15,2), %xmm13, %xmm14	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1872, tmp1436
	vmovsd	(%rcx,%r10), %xmm15	# MEM[base: _609, index: _608, offset: 0B], tmp1874
	movq	328(%rsp), %r10	# %sfp, ivtmp.479
	vmovhpd	(%rcx), %xmm15, %xmm2	# MEM[base: _609, offset: 0B], tmp1874, tmp1439
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	addq	$64, %r10	#, ivtmp.479
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm3	# tmp1436, tmp1439, vect_cst_.419
	vmulpd	-32(%r10), %ymm3, %ymm4	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	vaddpd	%ymm4, %ymm1, %ymm1	# vect_var_.425, vect_var_.426, vect_var_.426
.L478:
	movq	440(%rsp), %r12	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm5	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1877
	addl	$1, %r9d	#, ivtmp.474
	addq	$32, %r10	#, ivtmp.479
	vmovhpd	(%rcx,%r15,2), %xmm5, %xmm8	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1877, tmp1445
	vmovsd	(%rcx,%r12), %xmm6	# MEM[base: _609, index: _608, offset: 0B], tmp1879
	vmovhpd	(%rcx), %xmm6, %xmm7	# MEM[base: _609, offset: 0B], tmp1879, tmp1448
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm8, %ymm7, %ymm9	# tmp1445, tmp1448, vect_cst_.419
	vmulpd	-32(%r10), %ymm9, %ymm10	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	vaddpd	%ymm10, %ymm1, %ymm1	# vect_var_.425, vect_var_.426, vect_var_.426
.L477:
	movq	440(%rsp), %r12	# %sfp, D.10833
	vmovsd	(%rcx,%r15), %xmm11	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1880
	addl	$1, %r9d	#, ivtmp.474
	addq	$32, %r10	#, ivtmp.479
	vmovhpd	(%rcx,%r15,2), %xmm11, %xmm12	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1880, tmp1454
	vmovsd	(%rcx,%r12), %xmm13	# MEM[base: _609, index: _608, offset: 0B], tmp1882
	vmovhpd	(%rcx), %xmm13, %xmm14	# MEM[base: _609, offset: 0B], tmp1882, tmp1457
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1454, tmp1457, vect_cst_.419
	vmulpd	-32(%r10), %ymm15, %ymm2	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	cmpl	%r8d, %r9d	# bnd.416, ivtmp.474
	vaddpd	%ymm2, %ymm1, %ymm1	# vect_var_.425, vect_var_.426, vect_var_.426
	jnb	.L502	#,
.L508:
	movq	%rax, 328(%rsp)	# ivtmp.493, %sfp
	movl	432(%rsp), %r12d	# %sfp, j1
	movq	440(%rsp), %rax	# %sfp, D.10833
.L392:
	vmovsd	(%rcx,%r15), %xmm3	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1814
	addl	$4, %r9d	#, ivtmp.474
	subq	$-128, %r10	#, ivtmp.479
	vmovsd	(%rcx,%rax), %xmm5	# MEM[base: _609, index: _608, offset: 0B], tmp1816
	vmovhpd	(%rcx,%r15,2), %xmm3, %xmm4	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1814, tmp1100
	vmovhpd	(%rcx), %xmm5, %xmm8	# MEM[base: _609, offset: 0B], tmp1816, tmp1103
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm4, %ymm8, %ymm6	# tmp1100, tmp1103, vect_cst_.419
	vmovsd	(%rcx,%r15), %xmm10	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1817
	vmovsd	(%rcx,%rax), %xmm12	# MEM[base: _609, index: _608, offset: 0B], tmp1819
	vmulpd	-128(%r10), %ymm6, %ymm7	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	vmovhpd	(%rcx,%r15,2), %xmm10, %xmm11	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1817, tmp1388
	vmovhpd	(%rcx), %xmm12, %xmm13	# MEM[base: _609, offset: 0B], tmp1819, tmp1391
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1388, tmp1391, vect_cst_.419
	vmovsd	(%rcx,%rax), %xmm3	# MEM[base: _609, index: _608, offset: 0B], tmp1822
	vmulpd	-96(%r10), %ymm14, %ymm15	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	vaddpd	%ymm7, %ymm1, %ymm9	# vect_var_.425, vect_var_.426, vect_var_.426
	vmovsd	(%rcx,%r15), %xmm1	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1820
	vmovhpd	(%rcx), %xmm3, %xmm5	# MEM[base: _609, offset: 0B], tmp1822, tmp1404
	vmovhpd	(%rcx,%r15,2), %xmm1, %xmm4	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1820, tmp1401
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm4, %ymm5, %ymm8	# tmp1401, tmp1404, vect_cst_.419
	vaddpd	%ymm15, %ymm9, %ymm2	# vect_var_.425, vect_var_.426, vect_var_.426
	vmovsd	(%rcx,%rax), %xmm11	# MEM[base: _609, index: _608, offset: 0B], tmp1825
	vmovsd	(%rcx,%r15), %xmm9	# MEM[base: _609, index: ivtmp.635_1107, offset: 0B], tmp1823
	vmulpd	-64(%r10), %ymm8, %ymm6	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	vmovhpd	(%rcx), %xmm11, %xmm12	# MEM[base: _609, offset: 0B], tmp1825, tmp1417
	vmovhpd	(%rcx,%r15,2), %xmm9, %xmm10	# MEM[base: _609, index: ivtmp.635_1107, step: 2, offset: 0B], tmp1823, tmp1414
	addq	448(%rsp), %rcx	# %sfp, ivtmp.483
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp1414, tmp1417, vect_cst_.419
	vmulpd	-32(%r10), %ymm13, %ymm14	# MEM[base: _770, offset: 0B], vect_cst_.419, vect_var_.425
	cmpl	%r8d, %r9d	# bnd.416, ivtmp.474
	vaddpd	%ymm6, %ymm2, %ymm7	# vect_var_.425, vect_var_.426, vect_var_.426
	vaddpd	%ymm14, %ymm7, %ymm1	# vect_var_.425, vect_var_.426, vect_var_.426
	jb	.L392	#,
	movq	328(%rsp), %rax	# %sfp, ivtmp.493
	movl	%r12d, 432(%rsp)	# j1, %sfp
	.p2align 4,,10
	.p2align 3
.L502:
	vhaddpd	%ymm1, %ymm1, %ymm15	# vect_var_.426, vect_var_.426, tmp1115
	movl	416(%rsp), %r8d	# %sfp, ratio_mult_vf.417
	movl	360(%rsp), %ecx	# %sfp, niters.415
	addl	%r8d, %edx	# ratio_mult_vf.417, k1
	cmpl	%ecx, %r8d	# niters.415, ratio_mult_vf.417
	vperm2f128	$1, %ymm15, %ymm15, %ymm2	#, tmp1115, tmp1115, tmp1116
	vaddpd	%ymm2, %ymm15, %ymm1	# tmp1116, tmp1115, vect_var_.428
	vaddsd	%xmm0, %xmm1, %xmm0	# D__lsm.405, stmp_var_.427, D__lsm.405
	je	.L390	#,
.L391:
	movl	408(%rsp), %r10d	# %sfp, n
	leal	(%rdx,%r11), %r8d	#, D.10832
	movslq	%r8d, %rcx	# D.10832, D.10833
	movl	%r10d, %r9d	# n, D.10832
	imull	%edx, %r9d	# k1, D.10832
	addl	436(%rsp), %r9d	# %sfp, D.10832
	movslq	%r9d, %r12	# D.10832, D.10833
	movq	424(%rsp), %r9	# %sfp, B
	vmovsd	(%rbx,%r12,8), %xmm4	# *_268, *_268
	movl	460(%rsp), %r12d	# %sfp, kend
	vmulsd	(%r9,%rcx,8), %xmm4, %xmm3	# *_13, *_268, D.10831
	leal	1(%rdx), %ecx	#, k1
	cmpl	%ecx, %r12d	# k1, kend
	vaddsd	%xmm0, %xmm3, %xmm0	# D__lsm.405, D.10831, D__lsm.405
	jle	.L390	#,
	imull	%ecx, %r10d	# k1, D.10832
	addl	436(%rsp), %r10d	# %sfp, D.10832
	addl	%r11d, %ecx	# ivtmp.498, D.10832
	movslq	%ecx, %rcx	# D.10832, D.10833
	addl	$2, %edx	#, k1
	cmpl	%edx, %r12d	# k1, kend
	movslq	%r10d, %r8	# D.10832, D.10833
	vmovsd	(%rbx,%r8,8), %xmm5	# *_308, *_308
	vmulsd	(%r9,%rcx,8), %xmm5, %xmm8	# *_339, *_308, D.10831
	vaddsd	%xmm0, %xmm8, %xmm0	# D__lsm.405, D.10831, D.10831
	jle	.L390	#,
	movl	408(%rsp), %r9d	# %sfp, D.10832
	movq	424(%rsp), %r10	# %sfp, B
	imull	%edx, %r9d	# k1, D.10832
	addl	436(%rsp), %r9d	# %sfp, D.10832
	addl	%r11d, %edx	# ivtmp.498, D.10832
	movslq	%edx, %rdx	# D.10832, D.10833
	movslq	%r9d, %r12	# D.10832, D.10833
	vmovsd	(%rbx,%r12,8), %xmm6	# *_282, *_282
	vmulsd	(%r10,%rdx,8), %xmm6, %xmm7	# *_277, *_282, D.10831
	vaddsd	%xmm7, %xmm0, %xmm0	# D.10831, D.10831, D__lsm.405
.L390:
	vmovsd	%xmm0, (%rdi)	# D__lsm.405, MEM[base: _874, offset: 0B]
.L386:
	addl	$1, 432(%rsp)	#, %sfp
	addq	%r15, %rdi	# ivtmp.635, ivtmp.490
	addq	%r15, %rax	# ivtmp.635, ivtmp.493
	addl	408(%rsp), %r11d	# %sfp, ivtmp.498
	movl	420(%rsp), %r8d	# %sfp, jend
	cmpl	%r8d, 432(%rsp)	# jend, %sfp
	je	.L505	#,
.L393:
	movl	456(%rsp), %r12d	# %sfp, k1
	cmpl	%r12d, 460(%rsp)	# k1, %sfp
	jle	.L386	#,
	movq	%rax, %r9	# ivtmp.493, D.10834
	vmovsd	(%rdi), %xmm0	# MEM[base: _874, offset: 0B], D__lsm.405
	andl	$31, %r9d	#, D.10834
	shrq	$3, %r9	#, D.10834
	negq	%r9	# D.10834
	andl	$3, %r9d	#, D.10836
	cmpl	%r14d, %r9d	# D.10836, D.10836
	cmova	%r14d, %r9d	# D.10836,, D.10836, prolog_loop_niters.412
	cmpl	$6, %r14d	#, D.10836
	cmovbe	%r14d, %r9d	# prolog_loop_niters.412,, D.10836, prologue_after_cost_adjust.413
	testl	%r9d, %r9d	# prologue_after_cost_adjust.413
	jne	.L518	#,
	movl	456(%rsp), %edx	# %sfp, k1
	jmp	.L388	#
	.p2align 4,,10
	.p2align 3
.L505:
	movq	%r13, %rcx	# ivtmp.624, ivtmp.624
	movq	%rbx, %r13	# A, A
.L385:
	addl	$1, 436(%rsp)	#, %sfp
	addq	$8, 296(%rsp)	#, %sfp
	addq	$1, %rsi	#, ivtmp.512
	movl	216(%rsp), %r11d	# %sfp, iend
	cmpl	%r11d, 436(%rsp)	# iend, %sfp
	jne	.L378	#,
	movl	408(%rsp), %r12d	# %sfp, n
	movq	%r13, %rbx	# A, A
.L362:
	addq	$32, 144(%rsp)	#, %sfp
	addq	$256, 128(%rsp)	#, %sfp
	movq	112(%rsp), %rdi	# %sfp, D.10833
	subq	$256, 176(%rsp)	#, %sfp
	cmpq	%rdi, 144(%rsp)	# D.10833, %sfp
	jne	.L395	#,
	movl	100(%rsp), %r9d	# %sfp, D.10832
	movl	96(%rsp), %edx	# %sfp, j1
	movq	%rbx, %r13	# A, A
	movl	152(%rsp), %eax	# %sfp, D.10836
	movq	88(%rsp), %rsi	# %sfp, D.10835
	movl	%r14d, %ebx	# D.10836, D.10836
	addl	%eax, 108(%rsp)	# D.10836, %sfp
	addq	%rsi, 120(%rsp)	# D.10835, %sfp
	movl	%r12d, %r14d	# n, n
	cmpl	%r9d, %edx	# D.10832, j1
	movq	424(%rsp), %r12	# %sfp, B
	je	.L396	#,
	movl	%edx, %esi	# j1, j1
	movl	%edx, 156(%rsp)	# j1, %sfp
	jmp	.L397	#
	.p2align 4,,10
	.p2align 3
.L511:
	movq	440(%rsp), %r15	# %sfp, D.10833
	jmp	.L358	#
.L396:
	addq	$32, 192(%rsp)	#, %sfp
	movq	88(%rsp), %rcx	# %sfp, D.10835
	movl	%r14d, %ebx	# n, n
	movl	152(%rsp), %r10d	# %sfp, D.10836
	movq	448(%rsp), %r8	# %sfp, D.10833
	movq	%r12, %r14	# B, B
	addl	%r10d, 104(%rsp)	# D.10836, %sfp
	addq	%r8, 136(%rsp)	# D.10833, %sfp
	movq	%r15, %r12	# ivtmp.635, ivtmp.635
	movq	32(%rsp), %r11	# %sfp, tmp895
	movq	%r13, %r15	# A, A
	addq	%rcx, 248(%rsp)	# D.10835, %sfp
	addq	%r11, 256(%rsp)	# tmp895, %sfp
	addq	$32, 376(%rsp)	#, %sfp
	addq	%rcx, 80(%rsp)	# D.10835, %sfp
	movq	112(%rsp), %rdi	# %sfp, D.10833
	addq	$32, 400(%rsp)	#, %sfp
	addq	%rcx, 72(%rsp)	# D.10835, %sfp
	addq	$32, 392(%rsp)	#, %sfp
	addq	%rcx, 240(%rsp)	# D.10835, %sfp
	addq	$32, 384(%rsp)	#, %sfp
	addq	%rcx, 232(%rsp)	# D.10835, %sfp
	addq	$32, 368(%rsp)	#, %sfp
	addq	$256, 64(%rsp)	#, %sfp
	cmpq	%rdi, 192(%rsp)	# D.10833, %sfp
	jne	.L399	#,
	vzeroupper
.L515:
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1063:
	.size	avx_dgemm_slow, .-avx_dgemm_slow
	.p2align 4,,15
	.globl	do_4x4_block_fast
	.type	do_4x4_block_fast, @function
do_4x4_block_fast:
.LFB1061:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%edi, %rdi	# n, D.10857
	salq	$3, %rdi	#, D.10857
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r14	#
	leaq	(%rcx,%rdi), %r11	#, B
	pushq	%r13	#
	leaq	(%r11,%rdi), %r10	#, B
	pushq	%r12	#
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	leaq	(%r8,%rdi), %r12	#, C
	pushq	%rbx	#
	leaq	(%r12,%rdi), %r13	#, C
	.cfi_offset 3, -48
	leaq	(%r10,%rdi), %rbx	#, B
	andq	$-32, %rsp	#,
	leaq	0(%r13,%rdi), %r14	#, C
	addq	$16, %rsp	#,
	testl	%esi, %esi	# kdepth
	vmovupd	(%r8), %ymm2	#* C, c0
	vmovupd	(%r12), %ymm3	#* C, c1
	vmovupd	0(%r13), %ymm4	#* C, c2
	vmovupd	(%r14), %ymm0	#* C, c3
	jle	.L520	#,
	vmovupd	(%rdx), %ymm1	#* A, tmp96
	leal	-1(%rsi), %r9d	#, tmp115
	addq	%rdi, %rdx	# D.10857, A
	vbroadcastsd	(%rcx), %ymm5	# MEM[base: B_20(D), index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	movl	$1, %eax	#, ivtmp.648
	vbroadcastsd	(%r11), %ymm7	# MEM[base: B_21, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	andl	$1, %r9d	#, tmp115
	vbroadcastsd	(%r10), %ymm9	# MEM[base: B_22, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	cmpl	$1, %esi	#, kdepth
	vbroadcastsd	(%rbx), %ymm11	# MEM[base: B_23, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vmulpd	%ymm5, %ymm1, %ymm6	# D.10859, tmp96, tmp98
	vmulpd	%ymm7, %ymm1, %ymm8	# D.10859, tmp96, tmp101
	vmulpd	%ymm9, %ymm1, %ymm10	# D.10859, tmp96, tmp104
	vaddpd	%ymm6, %ymm2, %ymm2	# tmp98, c0, c0
	vmulpd	%ymm11, %ymm1, %ymm12	# D.10859, tmp96, tmp107
	vaddpd	%ymm8, %ymm3, %ymm3	# tmp101, c1, c1
	vaddpd	%ymm10, %ymm4, %ymm4	# tmp104, c2, c2
	vaddpd	%ymm12, %ymm0, %ymm0	# tmp107, c3, c3
	jle	.L520	#,
	testl	%r9d, %r9d	# tmp115
	je	.L521	#,
	vmovupd	(%rdx), %ymm13	#* A, tmp151
	addq	%rdi, %rdx	# D.10857, A
	cmpl	$2, %esi	#, kdepth
	vbroadcastsd	8(%rcx), %ymm14	# MEM[base: B_20(D), index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	movl	$2, %eax	#, ivtmp.648
	vbroadcastsd	8(%r11), %ymm1	# MEM[base: B_21, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vbroadcastsd	8(%r10), %ymm6	# MEM[base: B_22, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vbroadcastsd	8(%rbx), %ymm8	# MEM[base: B_23, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vmulpd	%ymm14, %ymm13, %ymm15	# D.10859, tmp151, tmp157
	vmulpd	%ymm1, %ymm13, %ymm5	# D.10859, tmp151, tmp159
	vmulpd	%ymm6, %ymm13, %ymm7	# D.10859, tmp151, tmp161
	vaddpd	%ymm15, %ymm2, %ymm2	# tmp157, c0, c0
	vmulpd	%ymm8, %ymm13, %ymm9	# D.10859, tmp151, tmp163
	vaddpd	%ymm5, %ymm3, %ymm3	# tmp159, c1, c1
	vaddpd	%ymm7, %ymm4, %ymm4	# tmp161, c2, c2
	vaddpd	%ymm9, %ymm0, %ymm0	# tmp163, c3, c3
	jle	.L520	#,
	.p2align 4,,10
	.p2align 3
.L521:
	vmovupd	(%rdx), %ymm10	#* A, tmp119
	leaq	1(%rax), %r9	#, tmp116
	addq	%rdi, %rdx	# D.10857, A
	vbroadcastsd	(%rcx,%rax,8), %ymm11	# MEM[base: B_20(D), index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vbroadcastsd	(%rbx,%rax,8), %ymm5	# MEM[base: B_23, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vmulpd	%ymm11, %ymm10, %ymm12	# D.10859, tmp119, tmp126
	vmovupd	(%rdx), %ymm9	#* A, tmp138
	addq	%rdi, %rdx	# D.10857, A
	vmulpd	%ymm5, %ymm10, %ymm7	# D.10859, tmp119, tmp135
	vbroadcastsd	(%r11,%rax,8), %ymm14	# MEM[base: B_21, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vaddpd	%ymm12, %ymm2, %ymm13	# tmp126, c0, c0
	vbroadcastsd	(%r10,%rax,8), %ymm2	# MEM[base: B_22, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vmulpd	%ymm14, %ymm10, %ymm15	# D.10859, tmp119, tmp129
	addq	$2, %rax	#, ivtmp.648
	vaddpd	%ymm7, %ymm0, %ymm8	# tmp135, c3, c3
	cmpl	%eax, %esi	# ivtmp.648, kdepth
	vmulpd	%ymm2, %ymm10, %ymm1	# D.10859, tmp119, tmp132
	vbroadcastsd	(%r10,%r9,8), %ymm12	# MEM[base: B_22, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vbroadcastsd	(%r11,%r9,8), %ymm10	# MEM[base: B_21, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vaddpd	%ymm15, %ymm3, %ymm3	# tmp129, c1, c1
	vbroadcastsd	(%rbx,%r9,8), %ymm14	# MEM[base: B_23, index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vaddpd	%ymm1, %ymm4, %ymm6	# tmp132, c2, c2
	vbroadcastsd	(%rcx,%r9,8), %ymm4	# MEM[base: B_20(D), index: ivtmp.648_1, step: 8, offset: 0B], D.10859
	vmulpd	%ymm10, %ymm9, %ymm11	# D.10859, tmp138, tmp146
	vmulpd	%ymm4, %ymm9, %ymm0	# D.10859, tmp138, tmp144
	vmulpd	%ymm14, %ymm9, %ymm15	# D.10859, tmp138, tmp150
	vaddpd	%ymm11, %ymm3, %ymm3	# tmp146, c1, c1
	vaddpd	%ymm0, %ymm13, %ymm2	# tmp144, c0, c0
	vmulpd	%ymm12, %ymm9, %ymm13	# D.10859, tmp138, tmp148
	vaddpd	%ymm15, %ymm8, %ymm0	# tmp150, c3, c3
	vaddpd	%ymm13, %ymm6, %ymm4	# tmp148, c2, c2
	jg	.L521	#,
.L520:
	vmovupd	%ymm2, (%r8)	# c0,* C
	vmovupd	%ymm3, (%r12)	# c1,* C
	vmovupd	%ymm4, 0(%r13)	# c2,* C
	vmovupd	%ymm0, (%r14)	# c3,* C
	vzeroupper
	leaq	-32(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1061:
	.size	do_4x4_block_fast, .-do_4x4_block_fast
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB1064:
	.cfi_startproc
	testl	%edi, %edi	# n
	jle	.L599	#,
	leaq	32(%rcx), %rax	#, D.10913
	leaq	32(%rsi), %r9	#, D.10913
	cmpq	%rax, %rsi	# D.10913, A
	setnb	%r8b	#, D.10910
	cmpq	%r9, %rcx	# D.10913, C
	setnb	%r10b	#, D.10910
	orl	%r10d, %r8d	# D.10910, D.10910
	cmpq	%rax, %rdx	# D.10913, B
	leaq	32(%rdx), %rax	#, D.10913
	setnb	%r11b	#, D.10910
	cmpq	%rax, %rcx	# D.10913, C
	setnb	%r9b	#, D.10910
	orl	%r9d, %r11d	# D.10910, D.10910
	testb	%r11b, %r8b	# D.10910, D.10910
	je	.L530	#,
	cmpl	$6, %edi	#, n
	jbe	.L530	#,
	vmovupd	(%rdx), %xmm1	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp131
	movl	%edi, %r8d	# n, bnd.673
	movl	$1, %r9d	#, ivtmp.698
	shrl	$2, %r8d	#, bnd.673
	movl	$32, %eax	#, ivtmp.701
	vmovupd	(%rsi), %xmm0	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp133
	leal	-1(%r8), %r10d	#, tmp152
	leal	0(,%r8,4), %r11d	#, ratio_mult_vf.674
	vinsertf128	$0x1, 16(%rdx), %ymm1, %ymm2	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp131, vect_var_.685
	andl	$3, %r10d	#, tmp152
	cmpl	%r8d, %r9d	# bnd.673, ivtmp.698
	vinsertf128	$0x1, 16(%rsi), %ymm0, %ymm3	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp133, vect_var_.680
	vaddpd	%ymm3, %ymm2, %ymm4	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm4, (%rcx)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm4, 16(%rcx)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	jnb	.L595	#,
	testl	%r10d, %r10d	# tmp152
	je	.L536	#,
	cmpl	$1, %r10d	#, tmp152
	je	.L581	#,
	cmpl	$2, %r10d	#, tmp152
	je	.L582	#,
	vmovupd	32(%rdx), %xmm5	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp221
	movl	$2, %r9d	#, ivtmp.698
	movl	$64, %eax	#, ivtmp.701
	vmovupd	32(%rsi), %xmm7	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp223
	vinsertf128	$0x1, 48(%rdx), %ymm5, %ymm6	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp221, vect_var_.685
	vinsertf128	$0x1, 48(%rsi), %ymm7, %ymm8	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp223, vect_var_.680
	vaddpd	%ymm8, %ymm6, %ymm9	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm9, 32(%rcx)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm9, 48(%rcx)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
.L582:
	addl	$1, %r9d	#, ivtmp.698
	vmovupd	(%rdx,%rax), %xmm10	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp226
	vmovupd	(%rsi,%rax), %xmm12	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp228
	vinsertf128	$0x1, 16(%rdx,%rax), %ymm10, %ymm11	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp226, vect_var_.685
	vinsertf128	$0x1, 16(%rsi,%rax), %ymm12, %ymm13	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp228, vect_var_.680
	vaddpd	%ymm13, %ymm11, %ymm14	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm14, (%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm14, 16(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	addq	$32, %rax	#, ivtmp.701
.L581:
	addl	$1, %r9d	#, ivtmp.698
	vmovupd	(%rdx,%rax), %xmm15	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp231
	vmovupd	(%rsi,%rax), %xmm2	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp233
	vinsertf128	$0x1, 16(%rdx,%rax), %ymm15, %ymm1	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp231, vect_var_.685
	vinsertf128	$0x1, 16(%rsi,%rax), %ymm2, %ymm0	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp233, vect_var_.680
	vaddpd	%ymm0, %ymm1, %ymm3	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm3, (%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm3, 16(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	addq	$32, %rax	#, ivtmp.701
	cmpl	%r8d, %r9d	# bnd.673, ivtmp.698
	jnb	.L595	#,
.L536:
	vmovupd	(%rdx,%rax), %xmm4	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp157
	addl	$4, %r9d	#, ivtmp.698
	vmovupd	(%rsi,%rax), %xmm6	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp159
	vinsertf128	$0x1, 16(%rdx,%rax), %ymm4, %ymm5	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp157, vect_var_.685
	vinsertf128	$0x1, 16(%rsi,%rax), %ymm6, %ymm7	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp159, vect_var_.680
	vaddpd	%ymm7, %ymm5, %ymm8	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm8, (%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm8, 16(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vmovupd	32(%rdx,%rax), %xmm9	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp164
	vmovupd	32(%rsi,%rax), %xmm11	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp166
	vinsertf128	$0x1, 48(%rdx,%rax), %ymm9, %ymm10	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp164, vect_var_.685
	vinsertf128	$0x1, 48(%rsi,%rax), %ymm11, %ymm12	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp166, vect_var_.680
	vaddpd	%ymm12, %ymm10, %ymm13	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm13, 32(%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm13, 48(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vmovupd	64(%rdx,%rax), %xmm14	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp171
	vmovupd	64(%rsi,%rax), %xmm1	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp173
	vinsertf128	$0x1, 80(%rdx,%rax), %ymm14, %ymm15	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp171, vect_var_.685
	vinsertf128	$0x1, 80(%rsi,%rax), %ymm1, %ymm2	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp173, vect_var_.680
	vaddpd	%ymm2, %ymm15, %ymm0	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm0, 64(%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm0, 80(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vmovupd	96(%rdx,%rax), %xmm3	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp178
	vmovupd	96(%rsi,%rax), %xmm5	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp180
	vinsertf128	$0x1, 112(%rdx,%rax), %ymm3, %ymm4	# MEM[base: B_12(D), index: ivtmp.701_41, offset: 0B], tmp178, vect_var_.685
	vinsertf128	$0x1, 112(%rsi,%rax), %ymm5, %ymm6	# MEM[base: A_9(D), index: ivtmp.701_41, offset: 0B], tmp180, vect_var_.680
	vaddpd	%ymm6, %ymm4, %ymm7	# vect_var_.680, vect_var_.685, vect_var_.686
	vmovupd	%xmm7, 96(%rcx,%rax)	#, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	vextractf128	$0x1, %ymm7, 112(%rcx,%rax)	# vect_var_.686, MEM[base: C_7(D), index: ivtmp.701_41, offset: 0B]
	subq	$-128, %rax	#, ivtmp.701
	cmpl	%r8d, %r9d	# bnd.673, ivtmp.698
	jb	.L536	#,
	.p2align 4,,10
	.p2align 3
.L595:
	cmpl	%r11d, %edi	# ratio_mult_vf.674, n
	je	.L598	#,
	movslq	%r11d, %r8	# ratio_mult_vf.674, D.10914
	leal	1(%r11), %eax	#, i
	vmovsd	(%rdx,%r8,8), %xmm8	# *_10, *_10
	cmpl	%eax, %edi	# i, n
	vaddsd	(%rsi,%r8,8), %xmm8, %xmm9	# *_6, *_10, D.10912
	vmovsd	%xmm9, (%rcx,%r8,8)	# D.10912, *_5
	jle	.L598	#,
	cltq
	addl	$2, %r11d	#, i
	vmovsd	(%rdx,%rax,8), %xmm10	# *_92, *_92
	cmpl	%r11d, %edi	# i, n
	vaddsd	(%rsi,%rax,8), %xmm10, %xmm11	# *_90, *_92, D.10912
	vmovsd	%xmm11, (%rcx,%rax,8)	# D.10912, *_89
	jle	.L598	#,
	movslq	%r11d, %rdi	# i, D.10914
	vmovsd	(%rdx,%rdi,8), %xmm12	# *_61, *_61
	vaddsd	(%rsi,%rdi,8), %xmm12, %xmm13	# *_59, *_61, D.10912
	vmovsd	%xmm13, (%rcx,%rdi,8)	# D.10912, *_58
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L598:
	vzeroupper
.L599:
	rep ret
	.p2align 4,,10
	.p2align 3
.L530:
	vmovsd	(%rdx), %xmm14	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	leal	-1(%rdi), %r10d	#, tmp148
	movl	$1, %r9d	#, ivtmp.692
	vaddsd	(%rsi), %xmm14, %xmm15	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	andl	$7, %r10d	#, tmp148
	cmpl	$1, %edi	#, n
	vmovsd	%xmm15, (%rcx)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	jle	.L600	#,
	testl	%r10d, %r10d	# tmp148
	je	.L538	#,
	cmpl	$1, %r10d	#, tmp148
	je	.L575	#,
	cmpl	$2, %r10d	#, tmp148
	je	.L576	#,
	cmpl	$3, %r10d	#, tmp148
	je	.L577	#,
	cmpl	$4, %r10d	#, tmp148
	je	.L578	#,
	cmpl	$5, %r10d	#, tmp148
	je	.L579	#,
	cmpl	$6, %r10d	#, tmp148
	je	.L580	#,
	vmovsd	8(%rdx), %xmm1	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	movl	$2, %r9d	#, ivtmp.692
	vaddsd	8(%rsi), %xmm1, %xmm2	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm2, 8(%rcx)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
.L580:
	vmovsd	(%rdx,%r9,8), %xmm0	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm0, %xmm3	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm3, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
.L579:
	vmovsd	(%rdx,%r9,8), %xmm4	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm4, %xmm5	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm5, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
.L578:
	vmovsd	(%rdx,%r9,8), %xmm6	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm6, %xmm7	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm7, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
.L577:
	vmovsd	(%rdx,%r9,8), %xmm8	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm8, %xmm9	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm9, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
.L576:
	vmovsd	(%rdx,%r9,8), %xmm10	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm10, %xmm11	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm11, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
.L575:
	vmovsd	(%rdx,%r9,8), %xmm12	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm12, %xmm13	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm13, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.692
	cmpl	%r9d, %edi	# ivtmp.692, n
	jle	.L601	#,
.L538:
	vmovsd	(%rdx,%r9,8), %xmm14	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	leaq	1(%r9), %r11	#, tmp149
	leaq	2(%r9), %r8	#, ivtmp.692
	leaq	3(%r9), %rax	#, ivtmp.692
	leaq	4(%r9), %r10	#, ivtmp.692
	vaddsd	(%rsi,%r9,8), %xmm14, %xmm15	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm15, (%rcx,%r9,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vmovsd	(%rdx,%r11,8), %xmm1	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r11,8), %xmm1, %xmm2	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm2, (%rcx,%r11,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	leaq	5(%r9), %r11	#, ivtmp.692
	vmovsd	(%rdx,%r8,8), %xmm0	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r8,8), %xmm0, %xmm3	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm3, (%rcx,%r8,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	leaq	6(%r9), %r8	#, ivtmp.692
	vmovsd	(%rdx,%rax,8), %xmm4	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%rax,8), %xmm4, %xmm5	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm5, (%rcx,%rax,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	leaq	7(%r9), %rax	#, ivtmp.692
	addq	$8, %r9	#, ivtmp.692
	cmpl	%r9d, %edi	# ivtmp.692, n
	vmovsd	(%rdx,%r10,8), %xmm6	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r10,8), %xmm6, %xmm7	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm7, (%rcx,%r10,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vmovsd	(%rdx,%r11,8), %xmm8	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r11,8), %xmm8, %xmm9	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm9, (%rcx,%r11,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vmovsd	(%rdx,%r8,8), %xmm10	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%r8,8), %xmm10, %xmm11	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm11, (%rcx,%r8,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vmovsd	(%rdx,%rax,8), %xmm12	# MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B]
	vaddsd	(%rsi,%rax,8), %xmm12, %xmm13	# MEM[base: A_9(D), index: ivtmp.692_71, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.692_71, step: 8, offset: 0B], D.10912
	vmovsd	%xmm13, (%rcx,%rax,8)	# D.10912, MEM[base: C_7(D), index: ivtmp.692_71, step: 8, offset: 0B]
	jg	.L538	#,
	rep ret
	.p2align 4,,10
	.p2align 3
.L600:
	rep ret
	.p2align 4,,10
	.p2align 3
.L601:
	.p2align 4,,11
	rep ret
	.cfi_endproc
.LFE1064:
	.size	test, .-test
	.section	.rodata.str1.1
.LC3:
	.string	"%s\nSize:\tGflops\n"
.LC6:
	.string	"%d\t%.3g\n"
.LC9:
	.string	"error in matrix multiply"
	.text
	.p2align 4,,15
	.globl	benchmark
	.type	benchmark, @function
benchmark:
.LFB1065:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax	#
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	.cfi_offset 15, -24
	movq	%r8, %r15	# A, A
	pushq	%r14	#
	pushq	%r13	#
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%r9, %r13	# B, B
	pushq	%r12	#
	.cfi_offset 12, -48
	movl	%ecx, %r12d	# nsizes, nsizes
	pushq	%rbx	#
	.cfi_offset 3, -56
	movq	%rdx, %rbx	# test_sizes, test_sizes
	movq	%rdi, %rdx	# desc,
	movl	$1, %edi	#,
	andq	$-32, %rsp	#,
	subq	$176, %rsp	#,
	movq	%rsi, 16(%rsp)	# f, %sfp
	movl	$.LC3, %esi	#,
	call	__printf_chk	#
	testl	%r12d, %r12d	# nsizes
	jle	.L949	#,
	leal	-1(%r12), %eax	#, D.11066
	movq	%rbx, 24(%rsp)	# ivtmp.816, %sfp
	movq	%r13, %r14	# B, B
	leaq	4(%rbx,%rax,4), %rdx	#, D.11066
	movq	%rdx, 8(%rsp)	# D.11066, %sfp
.L644:
	movq	24(%rsp), %rcx	# %sfp, ivtmp.816
	movl	(%rcx), %r13d	# MEM[base: _81, offset: 0B], n
	movl	%r13d, %edi	# n, D.11063
	imull	%r13d, %edi	# n, D.11063
	testl	%edi, %edi	# D.11063
	movl	%edi, 112(%rsp)	# D.11063, %sfp
	jle	.L604	#,
	leal	-1(%rdi), %r12d	#, tmp444
	movl	$1, %ebx	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	andl	$7, %r12d	#, tmp444
	cmpl	$1, 112(%rsp)	#, %sfp
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r15)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	jle	.L605	#,
	testl	%r12d, %r12d	# tmp444
	je	.L606	#,
	cmpl	$1, %r12d	#, tmp444
	je	.L857	#,
	cmpl	$2, %r12d	#, tmp444
	je	.L858	#,
	cmpl	$3, %r12d	#, tmp444
	je	.L859	#,
	cmpl	$4, %r12d	#, tmp444
	je	.L860	#,
	cmpl	$5, %r12d	#, tmp444
	je	.L861	#,
	cmpl	$6, %r12d	#, tmp444
	je	.L862	#,
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	movl	$2, %ebx	#, ivtmp.809
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, 8(%r15)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
.L862:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
.L861:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
.L860:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
.L859:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
.L858:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
.L857:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.809
	cmpl	%ebx, 112(%rsp)	# ivtmp.809, %sfp
	jle	.L605	#,
.L606:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	leaq	1(%rbx), %r12	#, tmp445
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r15,%rbx,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	2(%rbx), %r12	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	3(%rbx), %r12	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	4(%rbx), %r12	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	5(%rbx), %r12	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	6(%rbx), %r12	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	leaq	7(%rbx), %r12	#, ivtmp.809
	addq	$8, %rbx	#, ivtmp.809
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	cmpl	%ebx, 112(%rsp)	# ivtmp.809, %sfp
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r15,%r12,8)	# D.11061, MEM[base: A_22(D), index: ivtmp.809_230, step: 8, offset: 0B]
	jg	.L606	#,
.L605:
	movl	112(%rsp), %r8d	# %sfp, D.11063
	movl	$1, %ebx	#, ivtmp.804
	leal	-1(%r8), %r12d	#, tmp440
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	andl	$7, %r12d	#, tmp440
	cmpl	$1, 112(%rsp)	#, %sfp
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r14)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	jle	.L607	#,
	testl	%r12d, %r12d	# tmp440
	je	.L608	#,
	cmpl	$1, %r12d	#, tmp440
	je	.L851	#,
	cmpl	$2, %r12d	#, tmp440
	je	.L852	#,
	cmpl	$3, %r12d	#, tmp440
	je	.L853	#,
	cmpl	$4, %r12d	#, tmp440
	je	.L854	#,
	cmpl	$5, %r12d	#, tmp440
	je	.L855	#,
	cmpl	$6, %r12d	#, tmp440
	je	.L856	#,
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	movl	$2, %ebx	#, ivtmp.804
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, 8(%r14)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
.L856:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
.L855:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
.L854:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
.L853:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
.L852:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
.L851:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.804
	cmpl	%ebx, 112(%rsp)	# ivtmp.804, %sfp
	jle	.L607	#,
.L608:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	leaq	1(%rbx), %r12	#, tmp441
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r14,%rbx,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	2(%rbx), %r12	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	3(%rbx), %r12	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	4(%rbx), %r12	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	5(%rbx), %r12	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	6(%rbx), %r12	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	leaq	7(%rbx), %r12	#, ivtmp.804
	addq	$8, %rbx	#, ivtmp.804
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	cmpl	%ebx, 112(%rsp)	# ivtmp.804, %sfp
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r14,%r12,8)	# D.11061, MEM[base: B_24(D), index: ivtmp.804_231, step: 8, offset: 0B]
	jg	.L608	#,
.L607:
	movl	112(%rsp), %r9d	# %sfp, D.11063
	movl	$1, %ebx	#, ivtmp.799
	leal	-1(%r9), %r12d	#, tmp436
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	andl	$7, %r12d	#, tmp436
	cmpl	$1, 112(%rsp)	#, %sfp
	movq	16(%rbp), %r10	# C, tmp841
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r10)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	jle	.L604	#,
	testl	%r12d, %r12d	# tmp436
	je	.L943	#,
	cmpl	$1, %r12d	#, tmp436
	je	.L845	#,
	cmpl	$2, %r12d	#, tmp436
	je	.L846	#,
	cmpl	$3, %r12d	#, tmp436
	je	.L847	#,
	cmpl	$4, %r12d	#, tmp436
	je	.L848	#,
	cmpl	$5, %r12d	#, tmp436
	je	.L849	#,
	cmpl	$6, %r12d	#, tmp436
	je	.L850	#,
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	movq	16(%rbp), %r11	# C, tmp922
	movl	$2, %ebx	#, ivtmp.799
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, 8(%r11)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
.L850:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	movq	16(%rbp), %rsi	# C, tmp923
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%rsi,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
.L849:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	movq	16(%rbp), %rax	# C, tmp924
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%rax,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
.L848:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	movq	16(%rbp), %rdx	# C, tmp925
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%rdx,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
.L847:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	movq	16(%rbp), %rcx	# C, tmp926
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%rcx,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
.L846:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	movq	16(%rbp), %rdi	# C, tmp927
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%rdi,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
.L845:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	movq	16(%rbp), %r8	# C, tmp928
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r8,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.799
	cmpl	%ebx, 112(%rsp)	# ivtmp.799, %sfp
	jle	.L604	#,
	movq	%r14, 152(%rsp)	# B, %sfp
	movq	%r8, %r12	# tmp928, C
	movl	%r13d, %r14d	# n, n
.L609:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.11061, D.11061, D.11061
	leaq	1(%rbx), %r13	#, tmp437
	vsubsd	.LC1(%rip), %xmm0, %xmm1	#, D.11061, D.11061
	vmovsd	%xmm1, (%r12,%rbx,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vmovsd	%xmm3, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	2(%rbx), %r13	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vmovsd	%xmm5, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	3(%rbx), %r13	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm6, %xmm7	#, D.11061, D.11061
	vmovsd	%xmm7, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	4(%rbx), %r13	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vmovsd	%xmm9, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	5(%rbx), %r13	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm10, %xmm11	#, D.11061, D.11061
	vmovsd	%xmm11, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	6(%rbx), %r13	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.11061, D.11061, D.11061
	vsubsd	.LC1(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmovsd	%xmm13, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	leaq	7(%rbx), %r13	#, ivtmp.799
	addq	$8, %rbx	#, ivtmp.799
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.11061, D.11061, D.11061
	cmpl	%ebx, 112(%rsp)	# ivtmp.799, %sfp
	vsubsd	.LC1(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vmovsd	%xmm15, (%r12,%r13,8)	# D.11061, MEM[base: C_26(D), index: ivtmp.799_389, step: 8, offset: 0B]
	jg	.L609	#,
	movl	%r14d, %r13d	# n, n
	movq	152(%rsp), %r14	# %sfp, B
.L604:
	vcvtsi2sd	%r13d, %xmm0, %xmm0	# n, D.11061
	movq	16(%rsp), %rbx	# %sfp, f
	movl	$1, %r9d	#, n_iterations
	movl	%r9d, 152(%rsp)	# n_iterations, %sfp
	vmovsd	%xmm0, 120(%rsp)	# D.11061, %sfp
	.p2align 4,,10
	.p2align 3
.L648:
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	movl	$1, %r12d	#, it
	call	*%rbx	# f
	leaq	160(%rsp), %rsi	#,
	movl	$1, %edi	#,
	call	clock_gettime	#
	vcvtsi2sdq	168(%rsp), %xmm2, %xmm2	# t.tv_nsec, D.11061
	vcvtsi2sdq	160(%rsp), %xmm1, %xmm1	# t.tv_sec, D.11061
	vmulsd	.LC0(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	movl	152(%rsp), %r10d	# %sfp, n_iterations
	movq	%r15, %rsi	# A,
	vmovsd	%xmm1, 144(%rsp)	# D.11061, %sfp
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movl	%r13d, %edi	# n,
	leal	-1(%r10), %r11d	#, tmp432
	andl	$7, %r11d	#, tmp432
	vmovsd	%xmm3, 136(%rsp)	# D.11061, %sfp
	movl	%r11d, 128(%rsp)	# tmp432, %sfp
	call	*%rbx	# f
	cmpl	152(%rsp), %r12d	# %sfp, it
	movl	128(%rsp), %esi	# %sfp, tmp432
	jge	.L610	#,
	testl	%esi, %esi	# tmp432
	je	.L611	#,
	cmpl	$1, %esi	#, tmp432
	je	.L839	#,
	cmpl	$2, %esi	#, tmp432
	.p2align 4,,3
	je	.L840	#,
	cmpl	$3, %esi	#, tmp432
	.p2align 4,,2
	je	.L841	#,
	cmpl	$4, %esi	#, tmp432
	.p2align 4,,2
	je	.L842	#,
	cmpl	$5, %esi	#, tmp432
	.p2align 4,,2
	je	.L843	#,
	cmpl	$6, %esi	#, tmp432
	.p2align 4,,2
	je	.L844	#,
	movl	$2, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L844:
	addl	$1, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L843:
	addl	$1, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L842:
	addl	$1, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L841:
	addl	$1, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L840:
	addl	$1, %r12d	#, it
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
.L839:
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	addl	$1, %r12d	#, it
	call	*%rbx	# f
	cmpl	152(%rsp), %r12d	# %sfp, it
	jge	.L610	#,
.L611:
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	addl	$8, %r12d	#, it
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	call	*%rbx	# f
	cmpl	152(%rsp), %r12d	# %sfp, it
	jl	.L611	#,
.L610:
	leaq	160(%rsp), %rsi	#,
	movl	$1, %edi	#,
	call	clock_gettime	#
	vcvtsi2sdq	168(%rsp), %xmm5, %xmm5	# t.tv_nsec, D.11061
	vcvtsi2sdq	160(%rsp), %xmm4, %xmm4	# t.tv_sec, D.11061
	vmulsd	.LC0(%rip), %xmm5, %xmm6	#, D.11061, D.11061
	movl	152(%rsp), %eax	# %sfp, n_iterations
	vmovsd	.LC4(%rip), %xmm10	#, tmp846
	addl	%eax, %eax	# n_iterations
	vsubsd	144(%rsp), %xmm6, %xmm7	# %sfp, D.11061, D.11061
	vaddsd	%xmm4, %xmm7, %xmm8	# D.11061, D.11061, D.11061
	vsubsd	136(%rsp), %xmm8, %xmm9	# %sfp, D.11061, seconds
	vcomisd	%xmm9, %xmm10	# seconds, tmp846
	jbe	.L951	#,
	movl	%eax, 152(%rsp)	# n_iterations, %sfp
	jmp	.L648	#
.L951:
	vmovsd	120(%rsp), %xmm11	# %sfp, D.11061
	movl	152(%rsp), %edx	# %sfp, n_iterations
	movl	$.LC6, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	vmulsd	%xmm11, %xmm11, %xmm12	# D.11061, D.11061, D.11061
	vcvtsi2sd	%edx, %xmm15, %xmm15	# n_iterations, D.11061
	movl	%r13d, %edx	# n,
	vmulsd	.LC5(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vmulsd	%xmm11, %xmm13, %xmm14	# D.11061, D.11061, D.11061
	vmulsd	%xmm15, %xmm14, %xmm0	# D.11061, D.11061, D.11061
	vdivsd	%xmm9, %xmm0, %xmm0	# seconds, D.11061, Gflops_s
	call	__printf_chk	#
	movslq	112(%rsp), %rbx	# %sfp, D.11064
	movq	16(%rbp), %rdi	# C,
	xorl	%esi, %esi	#
	salq	$3, %rbx	#, D.11064
	movq	%rbx, %rdx	# D.11064,
	call	memset	#
	movq	%rbx, %rdi	# D.11064,
	call	malloc	#
	xorl	%esi, %esi	#
	movq	%rbx, %rdx	# D.11064,
	movq	%rax, %rdi	# Co,
	movq	%rax, 32(%rsp)	# Co, %sfp
	call	memset	#
	testl	%r13d, %r13d	# n
	jle	.L628	#,
	leal	(%r13,%r13), %eax	#, D.11062
	movslq	%r13d, %rdi	# n, D.11064
	movq	32(%rsp), %rcx	# %sfp, Co
	leaq	0(,%rdi,8), %r12	#, D.11064
	movq	%rdi, %rsi	# D.11064, D.11064
	movq	%r14, 128(%rsp)	# B, %sfp
	movslq	%eax, %r9	# D.11062, D.11069
	addl	%r13d, %eax	# n, D.11062
	salq	$5, %rsi	#, D.11064
	cltq
	movq	%r12, %rdx	# D.11064, D.11064
	movq	%r15, %r11	# A, ivtmp.789
	movq	%rax, 64(%rsp)	# D.11069, %sfp
	leal	0(,%r13,4), %eax	#, D.11062
	negq	%rdx	# D.11064
	movq	%rcx, 40(%rsp)	# Co, %sfp
	movq	%rdi, 104(%rsp)	# D.11064, %sfp
	movq	%r15, %r14	# A, A
	movslq	%eax, %r10	# D.11062, D.11069
	addl	%r13d, %eax	# n, D.11062
	movq	%r9, 56(%rsp)	# D.11069, %sfp
	cltq
	movq	%r10, 72(%rsp)	# D.11069, %sfp
	movq	%rsi, 144(%rsp)	# D.11064, %sfp
	movq	%rax, 48(%rsp)	# D.11069, %sfp
	movq	$0, 88(%rsp)	#, %sfp
	movq	%rdx, 136(%rsp)	# D.11064, %sfp
	.p2align 4,,10
	.p2align 3
.L629:
	movl	88(%rsp), %r15d	# %sfp, tmp895
	xorl	%ebx, %ebx	# j
	movq	128(%rsp), %rax	# %sfp, ivtmp.777
	movq	40(%rsp), %rsi	# %sfp, ivtmp.775
	movl	%ebx, 152(%rsp)	# j, %sfp
	movl	%r15d, 120(%rsp)	# tmp895, %sfp
	xorl	%r15d, %r15d	# ivtmp.783
	jmp	.L647	#
	.p2align 4,,10
	.p2align 3
.L616:
	vmovsd	(%rax), %xmm1	# MEM[base: _406, offset: 0B], MEM[base: _406, offset: 0B]
	cmpl	$1, %edi	#, prologue_after_cost_adjust.715
	vmulsd	(%r11), %xmm1, %xmm2	# MEM[base: _379, offset: 0B], MEM[base: _406, offset: 0B], D.11061
	vaddsd	%xmm2, %xmm0, %xmm0	# D.11061, t, t
	je	.L651	#,
	movq	104(%rsp), %r8	# %sfp, D.11064
	vmovsd	8(%rax), %xmm3	# MEM[base: _406, offset: 8B], MEM[base: _406, offset: 8B]
	cmpl	$2, %edi	#, prologue_after_cost_adjust.715
	vmulsd	(%r11,%r8,8), %xmm3, %xmm4	# MEM[base: _379, index: _214, step: 8, offset: 0B], MEM[base: _406, offset: 8B], D.11061
	vaddsd	%xmm4, %xmm0, %xmm0	# D.11061, t, t
	je	.L652	#,
	movq	56(%rsp), %r9	# %sfp, D.11069
	vmovsd	16(%rax), %xmm5	# MEM[base: _406, offset: 16B], MEM[base: _406, offset: 16B]
	cmpl	$3, %edi	#, prologue_after_cost_adjust.715
	vmulsd	(%r11,%r9,8), %xmm5, %xmm6	# MEM[base: _379, index: _317, step: 8, offset: 0B], MEM[base: _406, offset: 16B], D.11061
	vaddsd	%xmm6, %xmm0, %xmm0	# D.11061, t, t
	je	.L653	#,
	movq	64(%rsp), %r10	# %sfp, D.11069
	vmovsd	24(%rax), %xmm7	# MEM[base: _406, offset: 24B], MEM[base: _406, offset: 24B]
	cmpl	$4, %edi	#, prologue_after_cost_adjust.715
	vmulsd	(%r11,%r10,8), %xmm7, %xmm8	# MEM[base: _379, index: _314, step: 8, offset: 0B], MEM[base: _406, offset: 24B], D.11061
	vaddsd	%xmm8, %xmm0, %xmm0	# D.11061, t, t
	je	.L654	#,
	movq	72(%rsp), %rdx	# %sfp, D.11069
	vmovsd	32(%rax), %xmm9	# MEM[base: _406, offset: 32B], MEM[base: _406, offset: 32B]
	cmpl	$6, %edi	#, prologue_after_cost_adjust.715
	vmulsd	(%r11,%rdx,8), %xmm9, %xmm10	# MEM[base: _379, index: _301, step: 8, offset: 0B], MEM[base: _406, offset: 32B], D.11061
	vaddsd	%xmm10, %xmm0, %xmm0	# D.11061, t, t
	jne	.L655	#,
	movq	48(%rsp), %rbx	# %sfp, D.11069
	vmovsd	40(%rax), %xmm11	# MEM[base: _406, offset: 40B], MEM[base: _406, offset: 40B]
	movl	$6, %ecx	#, k
	vmulsd	(%r11,%rbx,8), %xmm11, %xmm12	# MEM[base: _379, index: _397, step: 8, offset: 0B], MEM[base: _406, offset: 40B], D.11061
	vaddsd	%xmm12, %xmm0, %xmm0	# D.11061, t, t
.L618:
	cmpl	%edi, %r13d	# prologue_after_cost_adjust.715, n
	je	.L619	#,
.L617:
	movl	%r13d, %r9d	# n, niters.717
	movl	%edi, %r8d	# prologue_after_cost_adjust.715, prolog_loop_adjusted_niters.716
	subl	%edi, %r9d	# prologue_after_cost_adjust.715, niters.717
	movl	%r9d, %edi	# niters.717, niters.717
	movl	%r9d, 116(%rsp)	# niters.717, %sfp
	shrl	$2, %edi	#, bnd.718
	leal	0(,%rdi,4), %r10d	#, ratio_mult_vf.719
	testl	%r10d, %r10d	# ratio_mult_vf.719
	je	.L620	#,
	leaq	(%rax,%r8,8), %r9	#, ivtmp.765
	leal	-1(%rdi), %ebx	#, tmp427
	imulq	104(%rsp), %r8	# %sfp, D.11069
	movq	%r9, 80(%rsp)	# ivtmp.765, %sfp
	movl	%ebx, 96(%rsp)	# tmp427, %sfp
	addq	$32, %r9	#, ivtmp.765
	andl	$3, 96(%rsp)	#, %sfp
	addq	88(%rsp), %r8	# %sfp, D.11069
	leaq	(%r14,%r8,8), %r8	#, D.11068
	leaq	(%r8,%r12), %rdx	#, ivtmp.769
	vmovsd	(%r8,%r12,2), %xmm13	# MEM[base: _310, index: _208, offset: 0B], tmp859
	movq	136(%rsp), %r8	# %sfp, D.11064
	vmovhpd	(%rdx,%r12,2), %xmm13, %xmm14	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp859, tmp343
	vmovsd	(%rdx,%r8), %xmm15	# MEM[base: _310, index: _325, offset: 0B], tmp861
	movl	$1, %r8d	#, ivtmp.760
	vmovhpd	(%rdx), %xmm15, %xmm1	# MEM[base: _310, offset: 0B], tmp861, tmp346
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm2	# tmp343, tmp346, vect_cst_.721
	vmulpd	-32(%r9), %ymm2, %ymm1	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_t.728
	cmpl	%edi, %r8d	# bnd.718, ivtmp.760
	jnb	.L920	#,
	movl	96(%rsp), %ebx	# %sfp, tmp427
	testl	%ebx, %ebx	# tmp427
	je	.L942	#,
	cmpl	$1, %ebx	#, tmp427
	je	.L837	#,
	cmpl	$2, %ebx	#, tmp427
	je	.L838	#,
	movq	136(%rsp), %r9	# %sfp, D.11064
	vmovsd	(%rdx,%r12), %xmm3	# MEM[base: _310, index: _208, offset: 0B], tmp911
	movq	80(%rsp), %rbx	# %sfp, ivtmp.765
	movl	$2, %r8d	#, ivtmp.760
	vmovhpd	(%rdx,%r12,2), %xmm3, %xmm4	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp911, tmp686
	vmovsd	(%rdx,%r9), %xmm5	# MEM[base: _310, index: _325, offset: 0B], tmp913
	leaq	64(%rbx), %r9	#, ivtmp.765
	vmovhpd	(%rdx), %xmm5, %xmm6	# MEM[base: _310, offset: 0B], tmp913, tmp689
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7	# tmp686, tmp689, vect_cst_.721
	vmulpd	32(%rbx), %ymm7, %ymm8	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	vaddpd	%ymm8, %ymm1, %ymm1	# vect_var_.727, vect_t.728, vect_t.728
.L838:
	movq	136(%rsp), %rbx	# %sfp, D.11064
	vmovsd	(%rdx,%r12), %xmm9	# MEM[base: _310, index: _208, offset: 0B], tmp916
	addl	$1, %r8d	#, ivtmp.760
	addq	$32, %r9	#, ivtmp.765
	vmovhpd	(%rdx,%r12,2), %xmm9, %xmm10	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp916, tmp695
	vmovsd	(%rdx,%rbx), %xmm11	# MEM[base: _310, index: _325, offset: 0B], tmp918
	vmovhpd	(%rdx), %xmm11, %xmm12	# MEM[base: _310, offset: 0B], tmp918, tmp698
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp695, tmp698, vect_cst_.721
	vmulpd	-32(%r9), %ymm13, %ymm14	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	vaddpd	%ymm14, %ymm1, %ymm1	# vect_var_.727, vect_t.728, vect_t.728
.L837:
	movq	136(%rsp), %rbx	# %sfp, D.11064
	vmovsd	(%rdx,%r12), %xmm15	# MEM[base: _310, index: _208, offset: 0B], tmp919
	addl	$1, %r8d	#, ivtmp.760
	addq	$32, %r9	#, ivtmp.765
	vmovhpd	(%rdx,%r12,2), %xmm15, %xmm2	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp919, tmp704
	vmovsd	(%rdx,%rbx), %xmm3	# MEM[base: _310, index: _325, offset: 0B], tmp921
	vmovhpd	(%rdx), %xmm3, %xmm4	# MEM[base: _310, offset: 0B], tmp921, tmp707
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm2, %ymm4, %ymm5	# tmp704, tmp707, vect_cst_.721
	vmulpd	-32(%r9), %ymm5, %ymm6	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	cmpl	%edi, %r8d	# bnd.718, ivtmp.760
	vaddpd	%ymm6, %ymm1, %ymm1	# vect_var_.727, vect_t.728, vect_t.728
	jnb	.L920	#,
.L942:
	movq	%rax, 96(%rsp)	# ivtmp.777, %sfp
	movl	152(%rsp), %ebx	# %sfp, j
	movq	136(%rsp), %rax	# %sfp, D.11064
.L626:
	vmovsd	(%rdx,%r12), %xmm7	# MEM[base: _310, index: _208, offset: 0B], tmp864
	addl	$4, %r8d	#, ivtmp.760
	subq	$-128, %r9	#, ivtmp.765
	vmovsd	(%rdx,%rax), %xmm9	# MEM[base: _310, index: _325, offset: 0B], tmp866
	vmovhpd	(%rdx,%r12,2), %xmm7, %xmm8	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp864, tmp557
	vmovhpd	(%rdx), %xmm9, %xmm10	# MEM[base: _310, offset: 0B], tmp866, tmp560
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp557, tmp560, vect_cst_.721
	vmovsd	(%rdx,%r12), %xmm14	# MEM[base: _310, index: _208, offset: 0B], tmp867
	vmovsd	(%rdx,%rax), %xmm2	# MEM[base: _310, index: _325, offset: 0B], tmp869
	vmulpd	-128(%r9), %ymm11, %ymm12	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	vmovhpd	(%rdx,%r12,2), %xmm14, %xmm15	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp867, tmp570
	vmovhpd	(%rdx), %xmm2, %xmm3	# MEM[base: _310, offset: 0B], tmp869, tmp573
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4	# tmp570, tmp573, vect_cst_.721
	vmovsd	(%rdx,%r12), %xmm6	# MEM[base: _310, index: _208, offset: 0B], tmp870
	vmulpd	-96(%r9), %ymm4, %ymm5	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	vaddpd	%ymm12, %ymm1, %ymm13	# vect_var_.727, vect_t.728, vect_t.728
	vmovsd	(%rdx,%rax), %xmm8	# MEM[base: _310, index: _325, offset: 0B], tmp872
	vmovhpd	(%rdx,%r12,2), %xmm6, %xmm1	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp870, tmp583
	vmovhpd	(%rdx), %xmm8, %xmm9	# MEM[base: _310, offset: 0B], tmp872, tmp586
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm1, %ymm9, %ymm10	# tmp583, tmp586, vect_cst_.721
	vaddpd	%ymm5, %ymm13, %ymm7	# vect_var_.727, vect_t.728, vect_t.728
	vmovsd	(%rdx,%rax), %xmm15	# MEM[base: _310, index: _325, offset: 0B], tmp875
	vmovsd	(%rdx,%r12), %xmm13	# MEM[base: _310, index: _208, offset: 0B], tmp873
	vmulpd	-64(%r9), %ymm10, %ymm11	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	vmovhpd	(%rdx), %xmm15, %xmm2	# MEM[base: _310, offset: 0B], tmp875, tmp599
	vmovhpd	(%rdx,%r12,2), %xmm13, %xmm14	# MEM[base: _310, index: _208, step: 2, offset: 0B], tmp873, tmp596
	addq	144(%rsp), %rdx	# %sfp, ivtmp.769
	vinsertf128	$0x1, %xmm14, %ymm2, %ymm3	# tmp596, tmp599, vect_cst_.721
	vmulpd	-32(%r9), %ymm3, %ymm4	# MEM[base: _363, offset: 0B], vect_cst_.721, vect_var_.727
	cmpl	%edi, %r8d	# bnd.718, ivtmp.760
	vaddpd	%ymm11, %ymm7, %ymm12	# vect_var_.727, vect_t.728, vect_t.728
	vaddpd	%ymm4, %ymm12, %ymm1	# vect_var_.727, vect_t.728, vect_t.728
	jb	.L626	#,
	movq	96(%rsp), %rax	# %sfp, ivtmp.777
	movl	%ebx, 152(%rsp)	# j, %sfp
	.p2align 4,,10
	.p2align 3
.L920:
	vhaddpd	%ymm1, %ymm1, %ymm5	# vect_t.728, vect_t.728, tmp358
	addl	%r10d, %ecx	# ratio_mult_vf.719, k
	cmpl	116(%rsp), %r10d	# %sfp, ratio_mult_vf.719
	vperm2f128	$1, %ymm5, %ymm5, %ymm7	#, tmp358, tmp358, tmp359
	vaddpd	%ymm7, %ymm5, %ymm6	# tmp359, tmp358, vect_t.730
	vaddsd	%xmm6, %xmm0, %xmm0	# stmp_t.729, t, t
	je	.L619	#,
.L620:
	movl	%r13d, %edi	# n, D.11063
	movl	120(%rsp), %r8d	# %sfp, i
	leal	(%r15,%rcx), %edx	#, D.11063
	imull	%ecx, %edi	# k, D.11063
	movq	128(%rsp), %r10	# %sfp, B
	movslq	%edx, %rbx	# D.11063, D.11064
	addl	%r8d, %edi	# i, D.11063
	movslq	%edi, %r9	# D.11063, D.11064
	vmovsd	(%r14,%r9,8), %xmm1	# *_199, *_199
	leal	1(%rcx), %r9d	#, k
	vmulsd	(%r10,%rbx,8), %xmm1, %xmm8	# *_122, *_199, D.11061
	cmpl	%r9d, %r13d	# k, n
	vaddsd	%xmm8, %xmm0, %xmm0	# D.11061, t, t
	jle	.L619	#,
	movl	%r13d, %edx	# n, D.11063
	addl	$2, %ecx	#, k
	imull	%r9d, %edx	# k, D.11063
	addl	%r15d, %r9d	# ivtmp.783, D.11063
	movslq	%r9d, %rbx	# D.11063, D.11064
	addl	%r8d, %edx	# i, D.11063
	cmpl	%ecx, %r13d	# k, n
	movslq	%edx, %r8	# D.11063, D.11064
	vmovsd	(%r14,%r8,8), %xmm9	# *_133, *_133
	vmulsd	(%r10,%rbx,8), %xmm9, %xmm10	# *_131, *_133, D.11061
	vaddsd	%xmm10, %xmm0, %xmm0	# D.11061, t, t
	jle	.L619	#,
	movl	%r13d, %edi	# n, D.11063
	movq	128(%rsp), %rdx	# %sfp, B
	imull	%ecx, %edi	# k, D.11063
	addl	120(%rsp), %edi	# %sfp, D.11063
	addl	%r15d, %ecx	# ivtmp.783, D.11063
	movslq	%ecx, %rcx	# D.11063, D.11064
	movslq	%edi, %r9	# D.11063, D.11064
	vmovsd	(%r14,%r9,8), %xmm11	# *_267, *_267
	vmulsd	(%rdx,%rcx,8), %xmm11, %xmm12	# *_262, *_267, D.11061
	vaddsd	%xmm12, %xmm0, %xmm0	# D.11061, t, t
.L619:
	addl	$1, 152(%rsp)	#, %sfp
	vmovsd	%xmm0, (%rsi)	# t, MEM[base: _403, offset: 0B]
	addq	%r12, %rax	# D.11064, ivtmp.777
	addq	%r12, %rsi	# D.11064, ivtmp.775
	addl	%r13d, %r15d	# n, ivtmp.783
	cmpl	%r13d, 152(%rsp)	# n, %sfp
	je	.L952	#,
.L647:
	movq	%rax, %rcx	# ivtmp.777, D.11066
	vmovsd	(%rsi), %xmm0	# MEM[base: _403, offset: 0B], t
	andl	$31, %ecx	#, D.11066
	movl	%r13d, %edi	# n, prologue_after_cost_adjust.715
	shrq	$3, %rcx	#, D.11066
	negq	%rcx	# D.11066
	andl	$3, %ecx	#, D.11062
	cmpl	%ecx, %r13d	# D.11062, n
	cmovbe	%r13d, %ecx	# n,, prolog_loop_niters.714
	cmpl	$6, %r13d	#, n
	jbe	.L616	#,
	testl	%ecx, %ecx	# prolog_loop_niters.714
	jne	.L953	#,
	xorl	%edi, %edi	# prologue_after_cost_adjust.715
	xorl	%ecx, %ecx	# k
	jmp	.L617	#
	.p2align 4,,10
	.p2align 3
.L655:
	movl	$5, %ecx	#, k
	jmp	.L618	#
	.p2align 4,,10
	.p2align 3
.L654:
	movl	$4, %ecx	#, k
	jmp	.L618	#
	.p2align 4,,10
	.p2align 3
.L653:
	movl	$3, %ecx	#, k
	jmp	.L618	#
	.p2align 4,,10
	.p2align 3
.L652:
	movl	$2, %ecx	#, k
	jmp	.L618	#
	.p2align 4,,10
	.p2align 3
.L651:
	movl	$1, %ecx	#, k
	jmp	.L618	#
	.p2align 4,,10
	.p2align 3
.L952:
	addq	$1, 88(%rsp)	#, %sfp
	addq	$8, %r11	#, ivtmp.789
	addq	$8, 40(%rsp)	#, %sfp
	cmpl	88(%rsp), %r13d	# %sfp, n
	jg	.L629	#,
	movq	%r14, %r15	# A, A
	movq	128(%rsp), %r14	# %sfp, B
	vzeroupper
.L628:
	movq	16(%rbp), %rcx	# C,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r13d, %edi	# n,
	movq	16(%rsp), %r11	# %sfp, f
	call	*%r11	# f
	movl	112(%rsp), %r12d	# %sfp,
	testl	%r12d, %r12d	#
	jle	.L615	#,
	movq	16(%rbp), %rsi	# C, tmp882
	movq	32(%rsp), %rax	# %sfp, Co
	vmovsd	(%rsi), %xmm13	# *C_26(D), *C_26(D)
	vsubsd	(%rax), %xmm13, %xmm14	# *Co_50, *C_26(D), D.11061
	vandpd	.LC7(%rip), %xmm14, %xmm15	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm15	#, D.11061
	ja	.L940	#,
	movl	112(%rsp), %r8d	# %sfp, D.11063
	xorl	%r11d, %r11d	# ivtmp.756
	leal	-1(%r8), %ebx	#, D.11069
	leaq	0(,%rbx,8), %rcx	#, D.11069
	andl	$7, %ebx	#, tmp423
	je	.L928	#,
	movq	16(%rbp), %r10	# C, tmp897
	movq	32(%rsp), %rdi	# %sfp, Co
	movl	$8, %r11d	#, ivtmp.756
	vmovsd	8(%r10), %xmm2	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%rdi), %xmm2, %xmm3	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm3, %xmm4	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm4	#, D.11061
	ja	.L940	#,
	cmpq	$1, %rbx	#, tmp423
	je	.L928	#,
	cmpq	$2, %rbx	#, tmp423
	je	.L832	#,
	cmpq	$3, %rbx	#, tmp423
	je	.L833	#,
	cmpq	$4, %rbx	#, tmp423
	je	.L834	#,
	cmpq	$5, %rbx	#, tmp423
	je	.L835	#,
	cmpq	$6, %rbx	#, tmp423
	je	.L836	#,
	movq	16(%rbp), %rdx	# C, tmp899
	addq	$8, %r11	#, ivtmp.756
	vmovsd	16(%rdx), %xmm5	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	16(%rdi), %xmm5, %xmm7	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm7, %xmm6	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm6	#, D.11061
	ja	.L940	#,
.L836:
	movq	16(%rbp), %r12	# C, tmp901
	movq	32(%rsp), %rsi	# %sfp, Co
	vmovsd	8(%r12,%r11), %xmm1	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%rsi,%r11), %xmm1, %xmm8	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$8, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm8, %xmm9	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm9	#, D.11061
	ja	.L940	#,
.L835:
	movq	16(%rbp), %rax	# C, tmp903
	movq	32(%rsp), %r8	# %sfp, Co
	vmovsd	8(%rax,%r11), %xmm10	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%r8,%r11), %xmm10, %xmm0	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$8, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm0, %xmm11	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm11	#, D.11061
	ja	.L940	#,
.L834:
	movq	16(%rbp), %rbx	# C, tmp905
	movq	32(%rsp), %r10	# %sfp, Co
	vmovsd	8(%rbx,%r11), %xmm12	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%r10,%r11), %xmm12, %xmm13	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$8, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm13, %xmm14	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm14	#, D.11061
	ja	.L940	#,
.L833:
	movq	16(%rbp), %rdi	# C, tmp907
	movq	32(%rsp), %r9	# %sfp, Co
	vmovsd	8(%rdi,%r11), %xmm15	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%r9,%r11), %xmm15, %xmm2	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$8, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm2, %xmm3	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm3	#, D.11061
	ja	.L940	#,
.L832:
	movq	16(%rbp), %rdx	# C, tmp909
	movq	32(%rsp), %r12	# %sfp, Co
	vmovsd	8(%rdx,%r11), %xmm4	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%r12,%r11), %xmm4, %xmm5	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$8, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm5, %xmm7	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm7	#, D.11061
	ja	.L940	#,
	movq	%r12, %rax	# Co, Co
	movq	16(%rbp), %rsi	# C, C
	jmp	.L635	#
	.p2align 4,,10
	.p2align 3
.L642:
	vmovsd	8(%rsi,%r11), %xmm6	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	leaq	8(%r11), %r8	#, tmp424
	vsubsd	8(%rax,%r11), %xmm6, %xmm1	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm1, %xmm8	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm8	#, D.11061
	ja	.L940	#,
	vmovsd	8(%rsi,%r8), %xmm9	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	8(%rax,%r8), %xmm9, %xmm10	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm10, %xmm0	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm0	#, D.11061
	ja	.L940	#,
	vmovsd	24(%rsi,%r11), %xmm11	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	24(%rax,%r11), %xmm11, %xmm12	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm12, %xmm13	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm13	#, D.11061
	ja	.L940	#,
	vmovsd	32(%rsi,%r11), %xmm14	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	32(%rax,%r11), %xmm14, %xmm15	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm15, %xmm2	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm2	#, D.11061
	ja	.L940	#,
	vmovsd	40(%rsi,%r11), %xmm3	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	40(%rax,%r11), %xmm3, %xmm4	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm4, %xmm5	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm5	#, D.11061
	ja	.L940	#,
	vmovsd	48(%rsi,%r11), %xmm7	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	48(%rax,%r11), %xmm7, %xmm6	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm6, %xmm1	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm1	#, D.11061
	ja	.L940	#,
	vmovsd	56(%rsi,%r11), %xmm8	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	56(%rax,%r11), %xmm8, %xmm9	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	vandpd	.LC7(%rip), %xmm9, %xmm10	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm10	#, D.11061
	ja	.L940	#,
	vmovsd	64(%rsi,%r11), %xmm0	# MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B]
	vsubsd	64(%rax,%r11), %xmm0, %xmm11	# MEM[base: Co_50, index: ivtmp.756_387, offset: 8B], MEM[base: C_26(D), index: ivtmp.756_387, offset: 8B], D.11061
	addq	$64, %r11	#, ivtmp.756
	vandpd	.LC7(%rip), %xmm11, %xmm12	#, D.11061, D.11061
	vcomisd	.LC8(%rip), %xmm12	#, D.11061
	ja	.L940	#,
.L635:
	cmpq	%rcx, %r11	# D.11069, ivtmp.756
	jne	.L642	#,
.L615:
	addq	$4, 24(%rsp)	#, %sfp
	movq	8(%rsp), %r13	# %sfp, D.11066
	cmpq	%r13, 24(%rsp)	# D.11066, %sfp
	jne	.L644	#,
.L949:
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L928:
	.cfi_restore_state
	movq	32(%rsp), %rax	# %sfp, Co
	movq	16(%rbp), %rsi	# C, C
	jmp	.L635	#
.L943:
	movq	%r14, 152(%rsp)	# B, %sfp
	movq	16(%rbp), %r12	# C, C
	movl	%r13d, %r14d	# n, n
	jmp	.L609	#
.L953:
	movl	%ecx, %edi	# prolog_loop_niters.714, prologue_after_cost_adjust.715
	jmp	.L616	#
.L940:
	movl	$.LC9, %edi	#,
	movl	%r13d, %r14d	# n, n
	call	perror	#
	testl	%r13d, %r13d	# n
	jle	.L954	#,
	movq	16(%rbp), %r12	# C, ivtmp.750
	movslq	%r13d, %rbx	# n, D.11064
	movl	$0, 152(%rsp)	#, %sfp
	salq	$3, %rbx	#, D.11064
.L638:
	leal	-1(%r14), %r11d	#, tmp419
	vmovsd	(%r12), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	andl	$7, %r11d	#, tmp419
	movl	$1, %r15d	#, j
	leaq	(%r12,%rbx), %r13	#, ivtmp.745
	movl	%r11d, 144(%rsp)	# tmp419, %sfp
	call	__printf_chk	#
	cmpl	%r14d, %r15d	# n, j
	movl	144(%rsp), %r10d	# %sfp, tmp419
	je	.L926	#,
	testl	%r10d, %r10d	# tmp419
	je	.L646	#,
	cmpl	$1, %r10d	#, tmp419
	je	.L826	#,
	cmpl	$2, %r10d	#, tmp419
	je	.L827	#,
	cmpl	$3, %r10d	#, tmp419
	je	.L828	#,
	cmpl	$4, %r10d	#, tmp419
	je	.L829	#,
	cmpl	$5, %r10d	#, tmp419
	je	.L830	#,
	cmpl	$6, %r10d	#, tmp419
	je	.L831	#,
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L831:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L830:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L829:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L828:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L827:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
.L826:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	call	__printf_chk	#
	addq	%rbx, %r13	# D.11064, ivtmp.745
	cmpl	%r14d, %r15d	# n, j
	je	.L926	#,
.L646:
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$8, %r15d	#, j
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	0(%r13), %xmm0	# MEM[base: _383, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addq	%rbx, %r13	# D.11064, ivtmp.745
	call	__printf_chk	#
	cmpl	%r14d, %r15d	# n, j
	jne	.L646	#,
.L926:
	movl	$10, %edi	#,
	addq	$8, %r12	#, ivtmp.750
	call	putchar	#
	addl	$1, 152(%rsp)	#, %sfp
	cmpl	%r14d, 152(%rsp)	# n, %sfp
	jne	.L638	#,
	movl	$10, %edi	#,
	call	putchar	#
	movq	32(%rsp), %r13	# %sfp, ivtmp.740
	movl	$0, 152(%rsp)	#, %sfp
.L641:
	leal	-1(%r14), %edi	#, tmp415
	vmovsd	0(%r13), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %eax	#,
	movl	$1, %r15d	#, j
	andl	$7, %edi	#, tmp415
	leaq	0(%r13,%rbx), %r12	#, ivtmp.735
	movl	%edi, 144(%rsp)	# tmp415, %sfp
	movl	$1, %edi	#,
	call	__printf_chk	#
	cmpl	%r14d, %r15d	# n, j
	movl	144(%rsp), %r9d	# %sfp, tmp415
	je	.L925	#,
	testl	%r9d, %r9d	# tmp415
	je	.L645	#,
	cmpl	$1, %r9d	#, tmp415
	je	.L820	#,
	cmpl	$2, %r9d	#, tmp415
	je	.L821	#,
	cmpl	$3, %r9d	#, tmp415
	je	.L822	#,
	cmpl	$4, %r9d	#, tmp415
	je	.L823	#,
	cmpl	$5, %r9d	#, tmp415
	je	.L824	#,
	cmpl	$6, %r9d	#, tmp415
	je	.L825	#,
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L825:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L824:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L823:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L822:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L821:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
.L820:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$1, %r15d	#, j
	call	__printf_chk	#
	addq	%rbx, %r12	# D.11064, ivtmp.735
	cmpl	%r14d, %r15d	# n, j
	je	.L925	#,
.L645:
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addl	$8, %r15d	#, j
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _401, offset: 0B],
	movl	$.LC2, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	addq	%rbx, %r12	# D.11064, ivtmp.735
	call	__printf_chk	#
	cmpl	%r14d, %r15d	# n, j
	jne	.L645	#,
.L925:
	movl	$10, %edi	#,
	addq	$8, %r13	#, ivtmp.740
	call	putchar	#
	addl	$1, 152(%rsp)	#, %sfp
	cmpl	%r14d, 152(%rsp)	# n, %sfp
	jne	.L641	#,
	jmp	.L640	#
.L954:
	movl	$10, %edi	#,
	call	putchar	#
.L640:
	movl	$10, %edi	#,
	call	putchar	#
	movl	$1, %edi	#,
	call	exit	#
	.cfi_endproc
.LFE1065:
	.size	benchmark, .-benchmark
	.section	.rodata.str1.1
.LC10:
	.string	"avx_fast"
.LC11:
	.string	"avx_slow"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1066:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$17, %ecx	#,
	movl	$avx_dgemm_fast, %esi	#,
	movl	$.LC10, %edi	#,
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	leaq	-112(%rbp), %rdx	#, tmp105
	pushq	%r12	#
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movl	$4, -112(%rbp)	#, test_sizes
	movl	$6, -108(%rbp)	#, test_sizes
	subq	$919376, %rsp	#,
	movl	$7, -104(%rbp)	#, test_sizes
	movl	$8, -100(%rbp)	#, test_sizes
	leaq	8(%rsp), %rbx	#, tmp75
	subq	$919376, %rsp	#,
	movl	$16, -96(%rbp)	#, test_sizes
	leaq	8(%rsp), %r12	#, tmp85
	subq	$919376, %rsp	#,
	movl	$32, -92(%rbp)	#, test_sizes
	leaq	8(%rsp), %r13	#, tmp95
	movq	%rbx, %r8	# tmp75,
	movl	$64, -88(%rbp)	#, test_sizes
	movq	%r12, %r9	# tmp85,
	movl	$65, -84(%rbp)	#, test_sizes
	movl	$66, -80(%rbp)	#, test_sizes
	movq	%r13, (%rsp)	# tmp95,
	movl	$67, -76(%rbp)	#, test_sizes
	movl	$128, -72(%rbp)	#, test_sizes
	movl	$153, -68(%rbp)	#, test_sizes
	movl	$185, -64(%rbp)	#, test_sizes
	movl	$251, -60(%rbp)	#, test_sizes
	movl	$285, -56(%rbp)	#, test_sizes
	movl	$301, -52(%rbp)	#, test_sizes
	movl	$339, -48(%rbp)	#, test_sizes
	call	benchmark	#
	leaq	-112(%rbp), %rdx	#, tmp106
	movq	%r13, (%rsp)	# tmp95,
	movq	%r12, %r9	# tmp85,
	movq	%rbx, %r8	# tmp75,
	movl	$17, %ecx	#,
	movl	$avx_dgemm_slow, %esi	#,
	movl	$.LC11, %edi	#,
	call	benchmark	#
	leaq	-24(%rbp), %rsp	#,
	xorl	%eax, %eax	#
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1066:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	3894859413
	.long	1041313291
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	2576980378
	.long	1069128089
	.align 8
.LC5:
	.long	3894859413
	.long	1042361867
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	1202590843
	.long	1065646817
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
