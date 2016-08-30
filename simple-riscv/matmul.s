	.file	"matmul.c"
# GNU C (Gentoo 4.9.3 p1.5, pie-0.6.4) version 4.9.3 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 4.9.3, GMP version 6.0.0, MPFR version 3.1.3-p4, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed matmul.i -msse -msse2 -mavx -mavx2
# -march=ivybridge -O3 -Wall -std=gnu99 -ftree-vectorize -fopt-info-vec
# -ffast-math -fverbose-asm -funroll-loops -fstack-protector-strong
# options enabled:  -faggressive-loop-optimizations -fassociative-math
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole
# -fpeephole2 -fpredictive-commoning -fprefetch-loop-arrays
# -freciprocal-math -free -freg-struct-return -frename-registers
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
# -fshow-column -fshrink-wrap -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstack-protector-strong -fstrict-aliasing -fstrict-overflow
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
# -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename
# -ftree-cselim -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop
# -ftree-fre -ftree-loop-distribute-patterns -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-loop-vectorize -ftree-parallelize-loops= -ftree-partial-pre
# -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
# -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vectorize
# -ftree-vrp -funit-at-a-time -funroll-loops -funsafe-math-optimizations
# -funswitch-loops -funwind-tables -fverbose-asm -fweb
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387 -maes
# -malign-stringops -mavx -mavx2 -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mcx16 -mf16c -mfancy-math-387
# -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc -mlong-double-80 -mmmx -mpclmul
# -mpopcnt -mpush-args -mrdrnd -mred-zone -msahf -msse -msse2 -msse3 -msse4
# -msse4.1 -msse4.2 -mssse3 -mtls-direct-seg-refs -mvzeroupper -mxsave
# -mxsaveopt

	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	avx_dgemm_fast
	.type	avx_dgemm_fast, @function
avx_dgemm_fast:
.LFB2289:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	movslq	%edi, %rax	# n,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rcx, %r15	# C, C
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	subq	$392, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%eax, -56(%rbp)	# n, %sfp
	movq	%rsi, -400(%rbp)	# A, %sfp
	movq	%rcx, -304(%rbp)	# C, %sfp
	testl	%eax, %eax	# n
	jle	.L177	#,
	leaq	0(,%rax,8), %r12	#, D.17288
	movl	%eax, %esi	# n, n
	movq	%rax, -96(%rbp)	# D.17288, %sfp
	sall	$5, %eax	#, D.17289
	movl	%eax, -448(%rbp)	# D.17289, %sfp
	cltq
	movq	%rdx, %rbx	# B, B
	addq	%r12, %r15	# D.17288, ivtmp.249
	movq	%rax, -64(%rbp)	# D.17288, %sfp
	leal	(%rsi,%rsi), %r11d	#, D.17285
	movq	%rax, %rdi	# D.17288, D.17288
	negq	%rax	# tmp951
	salq	$3, %rax	#, tmp952
	movslq	%r11d, %r13	# D.17285, D.17290
	movq	%rdi, %rdx	# D.17288, D.17288
	movq	%rdi, -504(%rbp)	# D.17288, %sfp
	movq	%rax, -536(%rbp)	# tmp952, %sfp
	movl	%esi, %eax	# n, n
	addl	%esi, %r11d	# n, D.17285
	salq	$3, %rdx	#, D.17290
	sall	$2, %eax	#, tmp954
	movslq	%r11d, %r10	# D.17285, D.17290
	movq	%rdx, -424(%rbp)	# D.17290, %sfp
	leal	(%rax,%rsi), %ecx	#, D.17285
	cltq
	movq	%r12, -480(%rbp)	# D.17288, %sfp
	movq	%rax, -352(%rbp)	# D.17290, %sfp
	movslq	%ecx, %r8	# D.17285, D.17290
	salq	$3, %rax	#, D.17290
	movq	%r12, %rcx	# D.17288, D.17288
	leaq	(%rbx,%r12), %rdx	#, ivtmp.281
	movq	%rax, -360(%rbp)	# D.17290, %sfp
	negq	%rcx	# D.17288
	leaq	0(,%r13,8), %r14	#, ivtmp.274
	movq	%rdx, -512(%rbp)	# ivtmp.281, %sfp
	leaq	0(,%r10,8), %rsi	#, ivtmp.276
	movq	%r14, -232(%rbp)	# ivtmp.274, %sfp
	movq	%rbx, %r10	# B, B
	movq	%r12, %rbx	# D.17288, D.17288
	leaq	0(,%r8,8), %r9	#, ivtmp.269
	movq	%rsi, -496(%rbp)	# ivtmp.276, %sfp
	leaq	32(%r12), %rax	#, D.17290
	movq	%rcx, -72(%rbp)	# D.17288, %sfp
	movq	%r9, -432(%rbp)	# ivtmp.269, %sfp
	movq	%r14, -488(%rbp)	# ivtmp.274, %sfp
	movq	$4, -152(%rbp)	#, %sfp
	movq	$3, -128(%rbp)	#, %sfp
	movq	$2, -120(%rbp)	#, %sfp
	movq	$1, -112(%rbp)	#, %sfp
	movq	$5, -144(%rbp)	#, %sfp
	movq	$0, -456(%rbp)	#, %sfp
	movq	$0, -328(%rbp)	#, %sfp
	movq	$0, -336(%rbp)	#, %sfp
	movl	$0, -444(%rbp)	#, %sfp
	movq	%r15, -552(%rbp)	# ivtmp.249, %sfp
	movq	%rax, -376(%rbp)	# D.17290, %sfp
.L55:
	movq	-328(%rbp), %r12	# %sfp, ivtmp.261
	movq	$0, -472(%rbp)	#, %sfp
	movl	-56(%rbp), %r13d	# %sfp, n
	movl	$0, -392(%rbp)	#, %sfp
	movq	-552(%rbp), %rdi	# %sfp, ivtmp.249
	movl	$0, -388(%rbp)	#, %sfp
	movq	-456(%rbp), %r9	# %sfp, ivtmp.268
	movl	%r12d, %r11d	# ivtmp.261, tmp1792
	movq	-400(%rbp), %rcx	# %sfp, A
	movl	%r12d, -76(%rbp)	# tmp1790, %sfp
	addl	$32, %r11d	#, D.17289
	movslq	-444(%rbp), %r15	# %sfp, D.17290
	movl	%r12d, -104(%rbp)	# tmp1791, %sfp
	leaq	(%rbx,%r12,8), %rdx	#, D.17291
	cmpl	%r11d, %r13d	# D.17289, n
	movq	%rdi, -440(%rbp)	# ivtmp.249, %sfp
	movq	-432(%rbp), %rdi	# %sfp, D.17290
	cmovle	%r13d, %r11d	# n,, kend
	negq	%rdx	# ivtmp.247
	movq	%r9, %r13	# ivtmp.268, D.17290
	addq	-488(%rbp), %r13	# %sfp, D.17290
	movq	%rdx, -416(%rbp)	# ivtmp.247, %sfp
	movq	%r9, %rsi	# ivtmp.268, D.17290
	addq	-496(%rbp), %rsi	# %sfp, D.17290
	movl	%r11d, %r14d	# kend, D.17289
	movl	%r11d, -52(%rbp)	# kend, %sfp
	movq	%r9, %rdx	# ivtmp.268, D.17290
	addq	-504(%rbp), %rdx	# %sfp, D.17290
	movq	%r9, %r11	# ivtmp.268, D.17290
	addq	-480(%rbp), %r11	# %sfp, D.17290
	addq	%r9, %rdi	# ivtmp.268, D.17290
	movq	-512(%rbp), %r8	# %sfp, ivtmp.281
	subl	%r12d, %r14d	# ivtmp.261, D.17289
	negq	%r12	# tmp970
	leaq	(%rcx,%r15,8), %rax	#, ivtmp.242
	addq	%rcx, %r13	# A, D.17287
	salq	$3, %r12	#, tmp971
	movq	%rax, -528(%rbp)	# ivtmp.242, %sfp
	movq	%rdi, %rax	# D.17290, D.17290
	addq	%rcx, %rsi	# A, D.17287
	addq	%rcx, %rdx	# A, D.17287
	addq	%rcx, %r11	# A, D.17287
	addq	%rcx, %rax	# A, D.17287
	movq	%r13, -168(%rbp)	# D.17287, %sfp
	movq	%r10, %r13	# B, B
	movq	%r12, -544(%rbp)	# tmp971, %sfp
	movq	%rbx, %r10	# D.17288, D.17288
	movq	%r8, -464(%rbp)	# ivtmp.281, %sfp
	movq	%r11, -160(%rbp)	# D.17287, %sfp
	movq	%rsi, -176(%rbp)	# D.17287, %sfp
	movq	%rdx, -184(%rbp)	# D.17287, %sfp
	movq	%rax, -192(%rbp)	# D.17287, %sfp
.L54:
	movl	-388(%rbp), %r12d	# %sfp, j1
	movq	%r13, -88(%rbp)	# B, %sfp
	movq	$0, -384(%rbp)	#, %sfp
	movl	-56(%rbp), %ecx	# %sfp, n
	movq	-528(%rbp), %r8	# %sfp, ivtmp.242
	movl	%r12d, %ebx	# j1, j1
	addl	$32, %ebx	#, j1
	movl	%ecx, %r9d	# n, n
	cmpl	%ecx, %ebx	# n, j1
	movl	%ebx, -516(%rbp)	# j1, %sfp
	cmovle	%ebx, %r9d	# j1,, jend
	movq	%r8, -344(%rbp)	# ivtmp.242, %sfp
	movl	%r9d, %esi	# jend, D.17285
	movl	%r9d, %edi	# jend, j1
	movl	%r9d, -100(%rbp)	# jend, %sfp
	subl	%r12d, %esi	# j1, D.17285
	movl	%esi, %eax	# D.17285, D.17285
	cltd
	shrl	$30, %edx	#, tmp974
	addl	%edx, %eax	# tmp974, tmp975
	andl	$3, %eax	#, tmp976
	subl	%edx, %eax	# tmp974, tmp977
	subl	%eax, %edi	# tmp977, j1
	movl	%edi, -284(%rbp)	# j1, %sfp
	imull	%ecx, %edi	# n, ivtmp.151
	movq	-440(%rbp), %rcx	# %sfp, ivtmp.249
	movslq	%edi, %r12	# ivtmp.151, D.17288
	addq	-328(%rbp), %r12	# %sfp, D.17288
	movl	%edi, -296(%rbp)	# ivtmp.151, %sfp
	movq	%rcx, -408(%rbp)	# ivtmp.249, %sfp
	leaq	0(%r13,%r12,8), %rbx	#, ivtmp.144
	movq	%r12, -312(%rbp)	# D.17288, %sfp
	movl	%r14d, %r12d	# D.17289, D.17289
	movq	%r10, %r14	# D.17288, D.17288
	movq	%rbx, -320(%rbp)	# ivtmp.144, %sfp
.L53:
	movq	-384(%rbp), %r10	# %sfp, ivtmp.239
	movl	-56(%rbp), %r13d	# %sfp, n
	movl	-388(%rbp), %r11d	# %sfp, j1
	movl	-284(%rbp), %edi	# %sfp, j1
	movl	%r10d, %eax	# ivtmp.239, tmp1844
	movl	%r10d, -196(%rbp)	# tmp1844, %sfp
	addl	$32, %eax	#, D.17289
	cmpl	%eax, %r13d	# D.17289, n
	cmovle	%r13d, %eax	# n,, iend
	movl	%eax, %r9d	# iend, iend
	movl	%eax, -292(%rbp)	# iend, %sfp
	subl	%r10d, %eax	# ivtmp.239, D.17285
	cltd
	shrl	$30, %edx	#, tmp983
	addl	%edx, %eax	# tmp983, tmp984
	andl	$3, %eax	#, tmp985
	subl	%edx, %eax	# tmp983, tmp986
	subl	%eax, %r9d	# tmp986, i1
	movl	%r9d, -80(%rbp)	# i1, %sfp
	cmpl	%edi, %r11d	# j1, j1
	jge	.L3	#,
	movq	%r10, %r15	# ivtmp.239, ivtmp.226
	movl	%r10d, %ebx	# ivtmp.239, D.17289
	addq	-472(%rbp), %r15	# %sfp, ivtmp.226
	movl	%r11d, -200(%rbp)	# j1, %sfp
	movq	-408(%rbp), %r8	# %sfp, ivtmp.240
	notl	%ebx	# D.17289
	movq	-464(%rbp), %rsi	# %sfp, ivtmp.229
	addq	%r9, %rbx	# i1, D.17291
	andl	$4294967292, %ebx	#, D.17291
	movq	%r15, -216(%rbp)	# ivtmp.226, %sfp
	movq	%rbx, -224(%rbp)	# D.17291, %sfp
	movq	%r8, -208(%rbp)	# ivtmp.240, %sfp
	.p2align 4,,10
	.p2align 3
.L4:
	movl	-196(%rbp), %r10d	# %sfp, i1
	cmpl	%r10d, -80(%rbp)	# i1, %sfp
	jle	.L9	#,
	movq	-224(%rbp), %rax	# %sfp, D.17290
	movq	%rsi, %r9	# ivtmp.229, D.17287
	addq	-216(%rbp), %rax	# %sfp, D.17290
	leaq	(%rsi,%r14), %r8	#, D.17287
	subq	%r14, %r9	# D.17288, D.17287
	movq	-376(%rbp), %r13	# %sfp, D.17290
	movq	-232(%rbp), %r11	# %sfp, ivtmp.274
	movq	-208(%rbp), %r10	# %sfp, ivtmp.215
	leaq	0(%r13,%rax,8), %rdx	#, D.17290
	addq	-304(%rbp), %rdx	# %sfp, D.17291
	leaq	(%rsi,%r11), %rdi	#, D.17287
	movq	-344(%rbp), %r11	# %sfp, ivtmp.218
	movq	%rdx, -136(%rbp)	# D.17291, %sfp
	.p2align 4,,10
	.p2align 3
.L7:
	movq	-232(%rbp), %rcx	# %sfp, ivtmp.274
	leaq	(%r10,%r14), %r15	#, D.17287
	movq	%r10, %rbx	# ivtmp.215, D.17287
	subq	%r14, %rbx	# D.17288, D.17287
	vmovupd	(%r10), %ymm4	#* ivtmp.215, c1
	vmovupd	(%rbx), %ymm3	#* D.17287, c0
	vmovupd	(%r15), %ymm6	#* D.17287, c2
	leaq	(%r10,%rcx), %r13	#, D.17287
	vmovupd	0(%r13), %ymm2	#* D.17287, c3
	testl	%r12d, %r12d	# D.17289
	jle	.L5	#,
	vmovupd	(%r11), %ymm0	#* ivtmp.218, tmp995
	leal	-1(%r12), %ecx	#, tmp1359
	movl	$1, %eax	#, ivtmp.198
	vbroadcastsd	(%r9), %ymm1	# MEM[base: _1125, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	leaq	(%r11,%r14), %rdx	#, A
	andl	$1, %ecx	#, tmp1361
	vbroadcastsd	(%rsi), %ymm7	# MEM[base: _390, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	(%r8), %ymm9	# MEM[base: _1127, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm1, %ymm0, %ymm5	# D.17293, tmp995, tmp997
	vaddpd	%ymm5, %ymm3, %ymm3	# tmp997, c0, c0
	vbroadcastsd	(%rdi), %ymm11	# MEM[base: _1130, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm7, %ymm0, %ymm8	# D.17293, tmp995, tmp1000
	vaddpd	%ymm8, %ymm4, %ymm4	# tmp1000, c1, c1
	vmulpd	%ymm9, %ymm0, %ymm10	# D.17293, tmp995, tmp1003
	vaddpd	%ymm10, %ymm6, %ymm6	# tmp1003, c2, c2
	vmulpd	%ymm11, %ymm0, %ymm12	# D.17293, tmp995, tmp1006
	vaddpd	%ymm12, %ymm2, %ymm2	# tmp1006, c3, c3
	cmpl	$1, %r12d	#, D.17289
	jle	.L5	#,
	testl	%ecx, %ecx	# tmp1361
	je	.L6	#,
	vmovupd	(%rdx), %ymm13	#* A, tmp1636
	movl	$2, %eax	#, ivtmp.198
	addq	%r14, %rdx	# D.17288, A
	vbroadcastsd	8(%r9), %ymm14	# MEM[base: _1125, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	8(%rsi), %ymm0	# MEM[base: _390, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	8(%r8), %ymm5	# MEM[base: _1127, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm14, %ymm13, %ymm15	# D.17293, tmp1636, tmp1642
	vaddpd	%ymm15, %ymm3, %ymm3	# tmp1642, c0, c0
	vbroadcastsd	8(%rdi), %ymm8	# MEM[base: _1130, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm0, %ymm13, %ymm1	# D.17293, tmp1636, tmp1644
	vaddpd	%ymm1, %ymm4, %ymm4	# tmp1644, c1, c1
	vmulpd	%ymm5, %ymm13, %ymm7	# D.17293, tmp1636, tmp1646
	vaddpd	%ymm7, %ymm6, %ymm6	# tmp1646, c2, c2
	vmulpd	%ymm8, %ymm13, %ymm9	# D.17293, tmp1636, tmp1648
	vaddpd	%ymm9, %ymm2, %ymm2	# tmp1648, c3, c3
	cmpl	$2, %r12d	#, D.17289
	jle	.L5	#,
	.p2align 4,,10
	.p2align 3
.L6:
	vmovupd	(%rdx), %ymm10	#* A, tmp1365
	leaq	1(%rax), %rcx	#, tmp1362
	addq	%r14, %rdx	# D.17288, A
	vbroadcastsd	(%r9,%rax,8), %ymm11	# MEM[base: _1125, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	(%rsi,%rax,8), %ymm14	# MEM[base: _390, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm11, %ymm10, %ymm12	# D.17293, tmp1365, tmp1372
	vbroadcastsd	(%rdi,%rax,8), %ymm1	# MEM[base: _1130, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vaddpd	%ymm12, %ymm3, %ymm13	# tmp1372, c0, c0
	vbroadcastsd	(%r8,%rax,8), %ymm3	# MEM[base: _1127, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm14, %ymm10, %ymm15	# D.17293, tmp1365, tmp1375
	vaddpd	%ymm15, %ymm4, %ymm7	# tmp1375, c1, c1
	addq	$2, %rax	#, ivtmp.198
	vmulpd	%ymm1, %ymm10, %ymm4	# D.17293, tmp1365, tmp1381
	vaddpd	%ymm4, %ymm2, %ymm8	# tmp1381, c3, c3
	vmovupd	(%rdx), %ymm9	#* A, tmp1384
	addq	%r14, %rdx	# D.17288, A
	vmulpd	%ymm3, %ymm10, %ymm0	# D.17293, tmp1365, tmp1378
	vaddpd	%ymm0, %ymm6, %ymm6	# tmp1378, c2, c2
	vbroadcastsd	(%r9,%rcx,8), %ymm5	# MEM[base: _1125, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	(%rsi,%rcx,8), %ymm10	# MEM[base: _390, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vbroadcastsd	(%r8,%rcx,8), %ymm12	# MEM[base: _1127, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm5, %ymm9, %ymm2	# D.17293, tmp1384, tmp1390
	vaddpd	%ymm2, %ymm13, %ymm3	# tmp1390, c0, c0
	vbroadcastsd	(%rdi,%rcx,8), %ymm14	# MEM[base: _1130, index: ivtmp.198_402, step: 8, offset: 0B], D.17293
	vmulpd	%ymm10, %ymm9, %ymm11	# D.17293, tmp1384, tmp1392
	vaddpd	%ymm11, %ymm7, %ymm4	# tmp1392, c1, c1
	vmulpd	%ymm12, %ymm9, %ymm13	# D.17293, tmp1384, tmp1394
	vaddpd	%ymm13, %ymm6, %ymm6	# tmp1394, c2, c2
	vmulpd	%ymm14, %ymm9, %ymm15	# D.17293, tmp1384, tmp1396
	vaddpd	%ymm15, %ymm8, %ymm2	# tmp1396, c3, c3
	cmpl	%eax, %r12d	# ivtmp.198, D.17289
	jg	.L6	#,
.L5:
	vmovupd	%ymm3, (%rbx)	# c0,* D.17287
	addq	$32, %r10	#, ivtmp.215
	addq	$32, %r11	#, ivtmp.218
	vmovupd	%ymm4, -32(%r10)	# c1,
	vmovupd	%ymm6, (%r15)	# c2,* D.17287
	vmovupd	%ymm2, 0(%r13)	# c3,* D.17287
	cmpq	-136(%rbp), %r10	# %sfp, ivtmp.215
	jne	.L7	#,
.L9:
	movq	-360(%rbp), %r8	# %sfp, D.17290
	addl	$4, -200(%rbp)	#, %sfp
	movq	-352(%rbp), %rdi	# %sfp, D.17290
	movl	-200(%rbp), %r9d	# %sfp, j1
	addq	%r8, -208(%rbp)	# D.17290, %sfp
	addq	%r8, %rsi	# D.17290, ivtmp.229
	addq	%rdi, -216(%rbp)	# D.17290, %sfp
	cmpl	-284(%rbp), %r9d	# %sfp, j1
	jl	.L4	#,
	movl	-80(%rbp), %ebx	# %sfp, i1
	leal	-1(%r12), %r15d	#, D.17289
	movl	-292(%rbp), %r13d	# %sfp, iend
	movl	%r15d, -240(%rbp)	# D.17289, %sfp
	movl	%r12d, %r15d	# D.17289, D.17289
	movq	-336(%rbp), %rax	# %sfp, ivtmp.260
	movl	-392(%rbp), %r11d	# %sfp, ivtmp.195
	movslq	%ebx, %rdx	# i1,
	movl	-388(%rbp), %r10d	# %sfp, j1
	subl	$1, %r13d	#, D.17289
	movq	%rdx, -368(%rbp)	# D.17288, %sfp
	leaq	1(%rax,%rdx), %rsi	#, D.17288
	subl	%ebx, %r13d	# i1, D.17288
	addq	%rsi, %r13	# D.17288, D.17288
	movl	%r11d, %ebx	# ivtmp.195, ivtmp.195
	movq	-400(%rbp), %r11	# %sfp, A
	movq	%r13, -216(%rbp)	# D.17288, %sfp
	movq	-88(%rbp), %r13	# %sfp, B
	movl	%r10d, -288(%rbp)	# j1, %sfp
	.p2align 4,,10
	.p2align 3
.L8:
	movl	-80(%rbp), %r12d	# %sfp, i1
	cmpl	%r12d, -292(%rbp)	# i1, %sfp
	jle	.L15	#,
	movq	-368(%rbp), %rsi	# %sfp, D.17288
	movslq	%ebx, %r9	# ivtmp.195, D.17288
	movq	-328(%rbp), %rdi	# %sfp, ivtmp.261
	movq	-304(%rbp), %rcx	# %sfp, C
	leaq	(%r9,%rsi), %r8	#, D.17288
	addq	-336(%rbp), %rsi	# %sfp, ivtmp.190
	addq	%rdi, %r9	# ivtmp.261, D.17288
	movl	%edi, %eax	# ivtmp.261, tmp1951
	leaq	0(%r13,%r9,8), %r10	#, vectp.66
	movq	%r9, -280(%rbp)	# D.17288, %sfp
	leaq	(%rcx,%r8,8), %r8	#, ivtmp.182
	andl	$31, %r10d	#, D.17291
	shrq	$3, %r10	#, D.17291
	movq	%rsi, -208(%rbp)	# ivtmp.190, %sfp
	negq	%r10	# D.17291
	andl	$3, %r10d	#, D.17289
	cmpl	%r10d, %r15d	# D.17289, D.17289
	cmovbe	%r15d, %r10d	# D.17289,, prolog_loop_niters.67
	addl	%ebx, %eax	# ivtmp.195, D.17289
	cltq
	leaq	0(%r13,%rax,8), %rdx	#, D.17287
	movl	-112(%rbp), %eax	# %sfp, tmp1953
	movl	%r10d, -224(%rbp)	# prolog_loop_niters.67, %sfp
	movq	%rdx, -248(%rbp)	# D.17287, %sfp
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	movq	%rax, -256(%rbp)	# D.17288, %sfp
	movl	-120(%rbp), %eax	# %sfp, tmp1955
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	movq	%rax, -264(%rbp)	# D.17288, %sfp
	movl	-128(%rbp), %eax	# %sfp, tmp1957
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	movq	%rax, -272(%rbp)	# D.17288, %sfp
	.p2align 4,,10
	.p2align 3
.L22:
	movl	-80(%rbp), %r12d	# %sfp, D.17289
	subl	-208(%rbp), %r12d	# %sfp, D.17289
	movl	-76(%rbp), %r9d	# %sfp, k1
	leal	(%r12,%rsi), %r10d	#, D.17285
	cmpl	%r9d, -52(%rbp)	# k1, %sfp
	jle	.L16	#,
	movl	-224(%rbp), %edx	# %sfp, prologue_after_cost_adjust.68
	cmpl	$6, %r15d	#, D.17289
	vmovsd	(%r8), %xmm4	# MEM[base: _1076, offset: 0B], D__lsm.28
	cmovbe	%r15d, %edx	# prologue_after_cost_adjust.68,, D.17289, prologue_after_cost_adjust.68
	testl	%edx, %edx	# prologue_after_cost_adjust.68
	je	.L58	#,
	movq	-248(%rbp), %rcx	# %sfp, D.17287
	vmovsd	(%r11,%rsi,8), %xmm7	# MEM[base: A_64(D), index: ivtmp.190_725, step: 8, offset: 0B], MEM[base: A_64(D), index: ivtmp.190_725, step: 8, offset: 0B]
	movl	-112(%rbp), %eax	# %sfp, k1
	vmulsd	(%rcx), %xmm7, %xmm3	# *_841, MEM[base: A_64(D), index: ivtmp.190_725, step: 8, offset: 0B], D.17286
	vaddsd	%xmm3, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	$1, %edx	#, prologue_after_cost_adjust.68
	je	.L19	#,
	movq	-256(%rbp), %rdi	# %sfp, D.17288
	movq	-160(%rbp), %r12	# %sfp, D.17287
	movl	-120(%rbp), %eax	# %sfp, k1
	vmovsd	0(%r13,%rdi,8), %xmm0	# *_860, *_860
	vmulsd	(%r12,%rsi,8), %xmm0, %xmm6	# MEM[base: _1048, index: ivtmp.190_725, step: 8, offset: 0B], *_860, D.17286
	vaddsd	%xmm6, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	$2, %edx	#, prologue_after_cost_adjust.68
	je	.L19	#,
	movq	-168(%rbp), %rax	# %sfp, D.17287
	movq	-264(%rbp), %r9	# %sfp, D.17288
	vmovsd	0(%r13,%r9,8), %xmm1	# *_879, *_879
	vmulsd	(%rax,%rsi,8), %xmm1, %xmm8	# MEM[base: _1057, index: ivtmp.190_725, step: 8, offset: 0B], *_879, D.17286
	movl	-128(%rbp), %eax	# %sfp, k1
	vaddsd	%xmm8, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	$3, %edx	#, prologue_after_cost_adjust.68
	je	.L19	#,
	movq	-272(%rbp), %rcx	# %sfp, D.17288
	movq	-176(%rbp), %rdi	# %sfp, D.17287
	movq	-152(%rbp), %r12	# %sfp, ivtmp.279
	vmovsd	0(%r13,%rcx,8), %xmm9	# *_898, *_898
	vmulsd	(%rdi,%rsi,8), %xmm9, %xmm5	# MEM[base: _1066, index: ivtmp.190_725, step: 8, offset: 0B], *_898, D.17286
	movl	%r12d, %eax	# ivtmp.279, k1
	vaddsd	%xmm5, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	$4, %edx	#, prologue_after_cost_adjust.68
	je	.L19	#,
	movq	-184(%rbp), %r9	# %sfp, D.17287
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	vmovsd	0(%r13,%rax,8), %xmm2	# *_917, *_917
	movq	-144(%rbp), %rax	# %sfp, ivtmp.271
	vmulsd	(%r9,%rsi,8), %xmm2, %xmm10	# MEM[base: _1075, index: ivtmp.190_725, step: 8, offset: 0B], *_917, D.17286
	vaddsd	%xmm10, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	$6, %edx	#, prologue_after_cost_adjust.68
	jne	.L19	#,
	movq	-192(%rbp), %rcx	# %sfp, D.17287
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	vmovsd	0(%r13,%rax,8), %xmm11	# *_513, *_513
	movl	-104(%rbp), %eax	# %sfp, D.17289
	vmulsd	(%rcx,%rsi,8), %xmm11, %xmm12	# MEM[base: _1039, index: ivtmp.190_725, step: 8, offset: 0B], *_513, D.17286
	addl	$6, %eax	#, k1
	vaddsd	%xmm12, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
.L19:
	cmpl	%edx, %r15d	# prologue_after_cost_adjust.68, D.17289
	je	.L20	#,
.L18:
	movl	%r15d, %ecx	# D.17289, niters.70
	movl	%edx, %edi	# prologue_after_cost_adjust.68, prolog_loop_adjusted_niters.69
	subl	%edx, %ecx	# prologue_after_cost_adjust.68, niters.70
	movl	%ecx, -136(%rbp)	# niters.70, %sfp
	subl	$4, %ecx	#, D.17289
	shrl	$2, %ecx	#, D.17289
	leal	1(%rcx), %r9d	#, bnd.71
	leal	0(,%r9,4), %r12d	#, ratio_mult_vf.72
	movl	%r12d, -200(%rbp)	# ratio_mult_vf.72, %sfp
	movl	-240(%rbp), %r12d	# %sfp, D.17289
	subl	%edx, %r12d	# prologue_after_cost_adjust.68, D.17289
	cmpl	$2, %r12d	#, D.17289
	jbe	.L21	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17290
	andl	$3, %ecx	#, tmp1356
	movl	%ecx, -236(%rbp)	# tmp1356, %sfp
	movl	$1, %ecx	#, ivtmp.166
	imulq	%rdi, %rdx	# prolog_loop_adjusted_niters.69, D.17290
	addq	-280(%rbp), %rdi	# %sfp, D.17290
	leaq	0(%r13,%rdi,8), %r12	#, ivtmp.171
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	addq	%rsi, %rdx	# ivtmp.190, D.17290
	leaq	(%r14,%rdx,8), %rdx	#, D.17288
	addq	%r11, %rdx	# A, ivtmp.175
	vmovsd	(%rdx,%rdi), %xmm15	# MEM[base: _724, index: _705, offset: 0B], tmp1935
	leaq	32(%r12), %rdi	#, ivtmp.171
	vmovsd	(%rdx,%r14), %xmm13	# MEM[base: _724, index: _389, offset: 0B], tmp1933
	vmovhpd	(%rdx), %xmm15, %xmm7	# MEM[base: _724, offset: 0B], tmp1935, tmp1446
	vmovhpd	(%rdx,%r14,2), %xmm13, %xmm14	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp1933, tmp1443
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm14, %ymm7, %ymm3	# tmp1443, tmp1446, vect_cst_.74
	vmulpd	(%r12), %ymm3, %ymm0	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__92.79
	cmpl	$1, %r9d	#, bnd.71
	jbe	.L160	#,
	cmpl	$0, -236(%rbp)	#, %sfp
	je	.L173	#,
	cmpl	$1, -236(%rbp)	#, %sfp
	je	.L136	#,
	cmpl	$2, -236(%rbp)	#, %sfp
	je	.L137	#,
	movq	-72(%rbp), %rcx	# %sfp, D.17288
	leaq	64(%r12), %rdi	#, ivtmp.171
	vmovsd	(%rdx,%r14), %xmm6	# MEM[base: _724, index: _389, offset: 0B], tmp2182
	vmovhpd	(%rdx,%r14,2), %xmm6, %xmm1	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp2182, tmp1612
	vmovsd	(%rdx,%rcx), %xmm8	# MEM[base: _724, index: _705, offset: 0B], tmp2184
	movl	$2, %ecx	#, ivtmp.166
	vmovhpd	(%rdx), %xmm8, %xmm9	# MEM[base: _724, offset: 0B], tmp2184, tmp1615
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm1, %ymm9, %ymm5	# tmp1612, tmp1615, vect_cst_.74
	vmulpd	32(%r12), %ymm5, %ymm2	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm2, %ymm0, %ymm0	# vect__91.78, vect__92.79, vect__92.79
.L137:
	movq	-72(%rbp), %r12	# %sfp, D.17288
	addl	$1, %ecx	#, ivtmp.166
	addq	$32, %rdi	#, ivtmp.171
	vmovsd	(%rdx,%r14), %xmm10	# MEM[base: _724, index: _389, offset: 0B], tmp2186
	vmovhpd	(%rdx,%r14,2), %xmm10, %xmm11	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp2186, tmp1621
	vmovsd	(%rdx,%r12), %xmm12	# MEM[base: _724, index: _705, offset: 0B], tmp2188
	vmovhpd	(%rdx), %xmm12, %xmm13	# MEM[base: _724, offset: 0B], tmp2188, tmp1624
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1621, tmp1624, vect_cst_.74
	vmulpd	-32(%rdi), %ymm14, %ymm15	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm15, %ymm0, %ymm0	# vect__91.78, vect__92.79, vect__92.79
.L136:
	movq	-72(%rbp), %r12	# %sfp, D.17288
	addl	$1, %ecx	#, ivtmp.166
	addq	$32, %rdi	#, ivtmp.171
	vmovsd	(%rdx,%r14), %xmm7	# MEM[base: _724, index: _389, offset: 0B], tmp2190
	vmovhpd	(%rdx,%r14,2), %xmm7, %xmm1	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp2190, tmp1630
	vmovsd	(%rdx,%r12), %xmm3	# MEM[base: _724, index: _705, offset: 0B], tmp2192
	vmovhpd	(%rdx), %xmm3, %xmm6	# MEM[base: _724, offset: 0B], tmp2192, tmp1633
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm1, %ymm6, %ymm8	# tmp1630, tmp1633, vect_cst_.74
	vmulpd	-32(%rdi), %ymm8, %ymm9	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm9, %ymm0, %ymm0	# vect__91.78, vect__92.79, vect__92.79
	cmpl	%ecx, %r9d	# ivtmp.166, bnd.71
	jbe	.L160	#,
.L10:
	vmovsd	(%rdx,%r14), %xmm5	# MEM[base: _724, index: _389, offset: 0B], tmp1889
	addl	$4, %ecx	#, ivtmp.166
	subq	$-128, %rdi	#, ivtmp.171
	vmovsd	(%rdx,%r12), %xmm10	# MEM[base: _724, index: _705, offset: 0B], tmp1890
	vmovhpd	(%rdx,%r14,2), %xmm5, %xmm2	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp1889, tmp1018
	vmovhpd	(%rdx), %xmm10, %xmm11	# MEM[base: _724, offset: 0B], tmp1890, tmp1021
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm2, %ymm11, %ymm12	# tmp1018, tmp1021, vect_cst_.74
	vmulpd	-128(%rdi), %ymm12, %ymm13	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm13, %ymm0, %ymm14	# vect__91.78, vect__92.79, vect__92.79
	vmovsd	(%rdx,%r14), %xmm15	# MEM[base: _724, index: _389, offset: 0B], tmp1892
	vmovsd	(%rdx,%r12), %xmm1	# MEM[base: _724, index: _705, offset: 0B], tmp1893
	vmovhpd	(%rdx,%r14,2), %xmm15, %xmm7	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp1892, tmp1404
	vmovhpd	(%rdx), %xmm1, %xmm3	# MEM[base: _724, offset: 0B], tmp1893, tmp1407
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm7, %ymm3, %ymm6	# tmp1404, tmp1407, vect_cst_.74
	vmulpd	-96(%rdi), %ymm6, %ymm8	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm8, %ymm14, %ymm9	# vect__91.78, vect__92.79, vect__92.79
	vmovsd	(%rdx,%r14), %xmm0	# MEM[base: _724, index: _389, offset: 0B], tmp1895
	vmovsd	(%rdx,%r12), %xmm5	# MEM[base: _724, index: _705, offset: 0B], tmp1896
	vmovhpd	(%rdx,%r14,2), %xmm0, %xmm2	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp1895, tmp1417
	vmovhpd	(%rdx), %xmm5, %xmm10	# MEM[base: _724, offset: 0B], tmp1896, tmp1420
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm2, %ymm10, %ymm11	# tmp1417, tmp1420, vect_cst_.74
	vmulpd	-64(%rdi), %ymm11, %ymm12	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm12, %ymm9, %ymm13	# vect__91.78, vect__92.79, vect__92.79
	vmovsd	(%rdx,%r14), %xmm14	# MEM[base: _724, index: _389, offset: 0B], tmp1898
	vmovsd	(%rdx,%r12), %xmm7	# MEM[base: _724, index: _705, offset: 0B], tmp1899
	vmovhpd	(%rdx,%r14,2), %xmm14, %xmm15	# MEM[base: _724, index: _389, step: 2, offset: 0B], tmp1898, tmp1430
	vmovhpd	(%rdx), %xmm7, %xmm1	# MEM[base: _724, offset: 0B], tmp1899, tmp1433
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.175
	vinsertf128	$0x1, %xmm15, %ymm1, %ymm3	# tmp1430, tmp1433, vect_cst_.74
	vmulpd	-32(%rdi), %ymm3, %ymm6	# MEM[base: _744, offset: 0B], vect_cst_.74, vect__91.78
	vaddpd	%ymm6, %ymm13, %ymm0	# vect__91.78, vect__92.79, vect__92.79
	cmpl	%ecx, %r9d	# ivtmp.166, bnd.71
	ja	.L10	#,
	.p2align 4,,10
	.p2align 3
.L160:
	vhaddpd	%ymm0, %ymm0, %ymm8	# vect__92.79, vect__92.79, tmp1033
	movl	-200(%rbp), %r9d	# %sfp, ratio_mult_vf.72
	vperm2f128	$1, %ymm8, %ymm8, %ymm9	#, tmp1033, tmp1033, tmp1034
	vaddpd	%ymm9, %ymm8, %ymm0	# tmp1034, tmp1033, vect__92.81
	addl	%r9d, %eax	# ratio_mult_vf.72, k1
	vaddsd	%xmm0, %xmm4, %xmm4	# stmp__92.80, D__lsm.28, D__lsm.28
	cmpl	%r9d, -136(%rbp)	# ratio_mult_vf.72, %sfp
	je	.L20	#,
.L21:
	movl	-56(%rbp), %r9d	# %sfp, n
	leal	(%rbx,%rax), %r12d	#, D.17285
	movl	%r9d, %edx	# n, D.17285
	imull	%eax, %edx	# k1, D.17285
	leal	(%rdx,%r10), %ecx	#, D.17285
	movslq	%ecx, %rdi	# D.17285, D.17288
	movslq	%r12d, %rcx	# D.17285, D.17288
	movl	-52(%rbp), %r12d	# %sfp, kend
	vmovsd	(%r11,%rdi,8), %xmm2	# *_801, *_801
	vmulsd	0(%r13,%rcx,8), %xmm2, %xmm5	# *_806, *_801, D.17286
	leal	1(%rax), %ecx	#, k1
	vaddsd	%xmm5, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	%ecx, %r12d	# k1, kend
	jle	.L20	#,
	addl	%r9d, %edx	# n, D.17285
	addl	%ebx, %ecx	# ivtmp.195, D.17285
	addl	$2, %eax	#, k1
	leal	(%r10,%rdx), %edi	#, D.17285
	movslq	%ecx, %rcx	# D.17285, D.17288
	movslq	%edi, %r9	# D.17285, D.17288
	vmovsd	(%r11,%r9,8), %xmm10	# *_818, *_818
	vmulsd	0(%r13,%rcx,8), %xmm10, %xmm11	# *_823, *_818, D.17286
	vaddsd	%xmm11, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
	cmpl	%eax, %r12d	# k1, kend
	jle	.L20	#,
	addl	-56(%rbp), %edx	# %sfp, D.17285
	addl	%ebx, %eax	# ivtmp.195, D.17285
	cltq
	addl	%r10d, %edx	# D.17285, D.17285
	movslq	%edx, %r10	# D.17285, D.17288
	vmovsd	(%r11,%r10,8), %xmm12	# *_544, *_544
	vmulsd	0(%r13,%rax,8), %xmm12, %xmm13	# *_549, *_544, D.17286
	vaddsd	%xmm13, %xmm4, %xmm4	# D.17286, D__lsm.28, D__lsm.28
.L20:
	vmovsd	%xmm4, (%r8)	# D__lsm.28, MEM[base: _1076, offset: 0B]
.L16:
	addq	$8, %r8	#, ivtmp.182
	addq	$1, %rsi	#, ivtmp.190
	cmpq	-216(%rbp), %rsi	# %sfp, ivtmp.190
	jne	.L22	#,
.L15:
	addl	$1, -288(%rbp)	#, %sfp
	addl	-56(%rbp), %ebx	# %sfp, ivtmp.195
	movl	-288(%rbp), %esi	# %sfp, j1
	cmpl	-284(%rbp), %esi	# %sfp, j1
	jne	.L8	#,
	movl	%r15d, %r12d	# D.17289, D.17289
.L3:
	movl	-196(%rbp), %r8d	# %sfp, i1
	cmpl	%r8d, -80(%rbp)	# i1, %sfp
	jle	.L23	#,
	movq	-416(%rbp), %rax	# %sfp, ivtmp.157
	addq	-408(%rbp), %rax	# %sfp, ivtmp.157
	movq	-384(%rbp), %r15	# %sfp, ivtmp.165
	movq	-328(%rbp), %r10	# %sfp, ivtmp.261
	addq	-336(%rbp), %r15	# %sfp, ivtmp.165
	movq	-400(%rbp), %rbx	# %sfp, A
	movq	%rax, -136(%rbp)	# ivtmp.157, %sfp
	.p2align 4,,10
	.p2align 3
.L24:
	movl	-284(%rbp), %edx	# %sfp, j1
	cmpl	%edx, -100(%rbp)	# j1, %sfp
	jle	.L30	#,
	movl	-296(%rbp), %r9d	# %sfp, ivtmp.151
	movl	%edx, %r13d	# j1, j1
	movq	-312(%rbp), %rsi	# %sfp, ivtmp.149
	movq	-320(%rbp), %rcx	# %sfp, ivtmp.144
	.p2align 4,,10
	.p2align 3
.L37:
	movl	-76(%rbp), %edi	# %sfp, k1
	cmpl	%edi, -52(%rbp)	# k1, %sfp
	jle	.L31	#,
	movq	%rcx, %rdx	# ivtmp.144, D.17291
	movq	-136(%rbp), %r11	# %sfp, ivtmp.157
	andl	$31, %edx	#, D.17291
	shrq	$3, %rdx	#, D.17291
	negq	%rdx	# D.17291
	andl	$3, %edx	#, D.17289
	vmovsd	(%r11,%rsi,8), %xmm4	# MEM[base: _1001, index: ivtmp.149_18, step: 8, offset: 0B], D__lsm.27
	cmpl	%r12d, %edx	# D.17289, D.17289
	cmova	%r12d, %edx	# D.17289,, D.17289, prologue_after_cost_adjust.50
	cmpl	$6, %r12d	#, D.17289
	cmovbe	%r12d, %edx	# prologue_after_cost_adjust.50,, D.17289, prologue_after_cost_adjust.50
	testl	%edx, %edx	# prologue_after_cost_adjust.50
	je	.L59	#,
	vmovsd	(%rcx), %xmm14	# MEM[base: _975, offset: 0B], MEM[base: _975, offset: 0B]
	vmulsd	(%rbx,%r15,8), %xmm14, %xmm15	# MEM[base: A_64(D), index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, offset: 0B], D.17286
	movq	-112(%rbp), %r8	# %sfp, ivtmp.273
	vaddsd	%xmm15, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	movl	%r8d, %eax	# ivtmp.273, k1
	cmpl	$1, %edx	#, prologue_after_cost_adjust.50
	je	.L34	#,
	movq	-160(%rbp), %r11	# %sfp, D.17287
	movq	%r8, %rdi	# ivtmp.273, D.17290
	subq	%r10, %rdi	# ivtmp.261, D.17290
	movq	-120(%rbp), %r8	# %sfp, ivtmp.275
	vmovsd	(%rcx,%rdi,8), %xmm7	# MEM[base: _975, index: _980, step: 8, offset: 0B], MEM[base: _975, index: _980, step: 8, offset: 0B]
	vmulsd	(%r11,%r15,8), %xmm7, %xmm1	# MEM[base: _70, index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, index: _980, step: 8, offset: 0B], D.17286
	movl	%r8d, %eax	# ivtmp.275, k1
	vaddsd	%xmm1, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	$2, %edx	#, prologue_after_cost_adjust.50
	je	.L34	#,
	movq	-168(%rbp), %rdi	# %sfp, D.17287
	movq	%r8, %rax	# ivtmp.275, D.17290
	subq	%r10, %rax	# ivtmp.261, D.17290
	movq	-128(%rbp), %r11	# %sfp, ivtmp.277
	vmovsd	(%rcx,%rax,8), %xmm3	# MEM[base: _975, index: _985, step: 8, offset: 0B], MEM[base: _975, index: _985, step: 8, offset: 0B]
	vmulsd	(%rdi,%r15,8), %xmm3, %xmm6	# MEM[base: _1010, index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, index: _985, step: 8, offset: 0B], D.17286
	movl	%r11d, %eax	# ivtmp.277, k1
	vaddsd	%xmm6, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	$3, %edx	#, prologue_after_cost_adjust.50
	je	.L34	#,
	movq	-176(%rbp), %rax	# %sfp, D.17287
	movq	%r11, %r8	# ivtmp.277, D.17290
	subq	%r10, %r8	# ivtmp.261, D.17290
	movq	-152(%rbp), %rdi	# %sfp, ivtmp.279
	vmovsd	(%rcx,%r8,8), %xmm8	# MEM[base: _975, index: _990, step: 8, offset: 0B], MEM[base: _975, index: _990, step: 8, offset: 0B]
	vmulsd	(%rax,%r15,8), %xmm8, %xmm9	# MEM[base: _1019, index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, index: _990, step: 8, offset: 0B], D.17286
	movl	%edi, %eax	# ivtmp.279, k1
	vaddsd	%xmm9, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	$4, %edx	#, prologue_after_cost_adjust.50
	je	.L34	#,
	movq	-184(%rbp), %r8	# %sfp, D.17287
	movq	%rdi, %r11	# ivtmp.279, D.17290
	subq	%r10, %r11	# ivtmp.261, D.17290
	movq	-144(%rbp), %rdi	# %sfp, ivtmp.271
	vmovsd	(%rcx,%r11,8), %xmm0	# MEM[base: _975, index: _995, step: 8, offset: 0B], MEM[base: _975, index: _995, step: 8, offset: 0B]
	vmulsd	(%r8,%r15,8), %xmm0, %xmm2	# MEM[base: _1028, index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, index: _995, step: 8, offset: 0B], D.17286
	movl	%edi, %eax	# ivtmp.271, k1
	vaddsd	%xmm2, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	$6, %edx	#, prologue_after_cost_adjust.50
	jne	.L34	#,
	movq	-192(%rbp), %r11	# %sfp, D.17287
	movq	%rdi, %rax	# ivtmp.271, D.17290
	subq	%r10, %rax	# ivtmp.261, D.17290
	vmovsd	(%rcx,%rax,8), %xmm5	# MEM[base: _975, index: _974, step: 8, offset: 0B], MEM[base: _975, index: _974, step: 8, offset: 0B]
	movl	-104(%rbp), %eax	# %sfp, D.17289
	vmulsd	(%r11,%r15,8), %xmm5, %xmm10	# MEM[base: _211, index: ivtmp.165_710, step: 8, offset: 0B], MEM[base: _975, index: _974, step: 8, offset: 0B], D.17286
	addl	$6, %eax	#, k1
	vaddsd	%xmm10, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
.L34:
	cmpl	%r12d, %edx	# D.17289, prologue_after_cost_adjust.50
	je	.L35	#,
.L33:
	movl	%r12d, %edi	# D.17289, niters.52
	movl	%edx, %r11d	# prologue_after_cost_adjust.50, prolog_loop_adjusted_niters.51
	subl	%edx, %edi	# prologue_after_cost_adjust.50, niters.52
	movl	%edi, -224(%rbp)	# niters.52, %sfp
	subl	$4, %edi	#, D.17289
	shrl	$2, %edi	#, D.17289
	leal	1(%rdi), %r8d	#, bnd.53
	movl	%r8d, -208(%rbp)	# bnd.53, %sfp
	sall	$2, %r8d	#, ratio_mult_vf.54
	movl	%r8d, -216(%rbp)	# ratio_mult_vf.54, %sfp
	leal	-1(%r12), %r8d	#, D.17289
	subl	%edx, %r8d	# prologue_after_cost_adjust.50, D.17289
	cmpl	$2, %r8d	#, D.17289
	jbe	.L36	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17290
	andl	$3, %edi	#, tmp1351
	movl	$1, -200(%rbp)	#, %sfp
	movq	-88(%rbp), %r8	# %sfp, B
	imulq	%r11, %rdx	# prolog_loop_adjusted_niters.51, D.17290
	addq	%rsi, %r11	# ivtmp.149, D.17290
	leaq	(%r8,%r11,8), %r11	#, ivtmp.130
	movq	-72(%rbp), %r8	# %sfp, D.17288
	addq	%r15, %rdx	# ivtmp.165, D.17290
	leaq	(%r14,%rdx,8), %rdx	#, D.17288
	addq	%rbx, %rdx	# A, ivtmp.134
	vmovsd	(%rdx,%r8), %xmm13	# MEM[base: _113, index: _17, offset: 0B], tmp2022
	leaq	32(%r11), %r8	#, ivtmp.130
	vmovsd	(%rdx,%r14), %xmm11	# MEM[base: _113, index: _389, offset: 0B], tmp2020
	vmovhpd	(%rdx), %xmm13, %xmm14	# MEM[base: _113, offset: 0B], tmp2022, tmp1499
	vmovhpd	(%rdx,%r14,2), %xmm11, %xmm12	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp2020, tmp1496
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.134
	cmpl	$1, -208(%rbp)	#, %sfp
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1496, tmp1499, vect_cst_.56
	vmulpd	(%r11), %ymm15, %ymm0	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__119.61
	jbe	.L161	#,
	testl	%edi, %edi	# tmp1351
	je	.L172	#,
	cmpl	$1, %edi	#, tmp1351
	je	.L134	#,
	cmpl	$2, %edi	#, tmp1351
	je	.L135	#,
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	leaq	64(%r11), %r8	#, ivtmp.130
	movl	$2, -200(%rbp)	#, %sfp
	vmovsd	(%rdx,%r14), %xmm7	# MEM[base: _113, index: _389, offset: 0B], tmp2163
	vmovhpd	(%rdx,%r14,2), %xmm7, %xmm1	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp2163, tmp1585
	vmovsd	(%rdx,%rdi), %xmm3	# MEM[base: _113, index: _17, offset: 0B], tmp2165
	vmovhpd	(%rdx), %xmm3, %xmm6	# MEM[base: _113, offset: 0B], tmp2165, tmp1588
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.134
	vinsertf128	$0x1, %xmm1, %ymm6, %ymm8	# tmp1585, tmp1588, vect_cst_.56
	vmulpd	32(%r11), %ymm8, %ymm9	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm9, %ymm0, %ymm0	# vect__118.60, vect__119.61, vect__119.61
.L135:
	movq	-72(%rbp), %r11	# %sfp, D.17288
	addq	$32, %r8	#, ivtmp.130
	vmovsd	(%rdx,%r14), %xmm2	# MEM[base: _113, index: _389, offset: 0B], tmp2167
	addl	$1, -200(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm2, %xmm10	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp2167, tmp1594
	vmovsd	(%rdx,%r11), %xmm5	# MEM[base: _113, index: _17, offset: 0B], tmp2169
	vmovhpd	(%rdx), %xmm5, %xmm11	# MEM[base: _113, offset: 0B], tmp2169, tmp1597
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.134
	vinsertf128	$0x1, %xmm10, %ymm11, %ymm12	# tmp1594, tmp1597, vect_cst_.56
	vmulpd	-32(%r8), %ymm12, %ymm13	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm13, %ymm0, %ymm0	# vect__118.60, vect__119.61, vect__119.61
.L134:
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	addq	$32, %r8	#, ivtmp.130
	vmovsd	(%rdx,%r14), %xmm14	# MEM[base: _113, index: _389, offset: 0B], tmp2172
	addl	$1, -200(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm14, %xmm15	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp2172, tmp1603
	movl	-200(%rbp), %r11d	# %sfp, ivtmp.125
	vmovsd	(%rdx,%rdi), %xmm7	# MEM[base: _113, index: _17, offset: 0B], tmp2174
	vmovhpd	(%rdx), %xmm7, %xmm1	# MEM[base: _113, offset: 0B], tmp2174, tmp1606
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.134
	vinsertf128	$0x1, %xmm15, %ymm1, %ymm3	# tmp1603, tmp1606, vect_cst_.56
	vmulpd	-32(%r8), %ymm3, %ymm6	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm6, %ymm0, %ymm0	# vect__118.60, vect__119.61, vect__119.61
	cmpl	%r11d, -208(%rbp)	# ivtmp.125, %sfp
	jbe	.L161	#,
.L172:
	movq	-72(%rbp), %rdi	# %sfp, D.17288
.L25:
	movq	-64(%rbp), %r11	# %sfp, D.17288
	subq	$-128, %r8	#, ivtmp.130
	vmovsd	(%rdx,%r14), %xmm8	# MEM[base: _113, index: _389, offset: 0B], tmp1965
	vmovsd	(%rdx,%rdi), %xmm2	# MEM[base: _113, index: _17, offset: 0B], tmp1966
	addl	$4, -200(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm8, %xmm9	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp1965, tmp1109
	vmovhpd	(%rdx), %xmm2, %xmm10	# MEM[base: _113, offset: 0B], tmp1966, tmp1112
	addq	%r11, %rdx	# D.17288, ivtmp.134
	vinsertf128	$0x1, %xmm9, %ymm10, %ymm5	# tmp1109, tmp1112, vect_cst_.56
	vmovsd	(%rdx,%rdi), %xmm15	# MEM[base: _113, index: _17, offset: 0B], tmp1969
	vmulpd	-128(%r8), %ymm5, %ymm11	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm11, %ymm0, %ymm12	# vect__118.60, vect__119.61, vect__119.61
	vmovsd	(%rdx,%r14), %xmm13	# MEM[base: _113, index: _389, offset: 0B], tmp1968
	vmovhpd	(%rdx), %xmm15, %xmm7	# MEM[base: _113, offset: 0B], tmp1969, tmp1459
	vmovhpd	(%rdx,%r14,2), %xmm13, %xmm14	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp1968, tmp1456
	addq	%r11, %rdx	# D.17288, ivtmp.134
	vinsertf128	$0x1, %xmm14, %ymm7, %ymm1	# tmp1456, tmp1459, vect_cst_.56
	vmovsd	(%rdx,%rdi), %xmm9	# MEM[base: _113, index: _17, offset: 0B], tmp1972
	vmulpd	-96(%r8), %ymm1, %ymm3	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm3, %ymm12, %ymm8	# vect__118.60, vect__119.61, vect__119.61
	vmovsd	(%rdx,%r14), %xmm6	# MEM[base: _113, index: _389, offset: 0B], tmp1971
	vmovhpd	(%rdx), %xmm9, %xmm2	# MEM[base: _113, offset: 0B], tmp1972, tmp1472
	vmovhpd	(%rdx,%r14,2), %xmm6, %xmm0	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp1971, tmp1469
	addq	%r11, %rdx	# D.17288, ivtmp.134
	vinsertf128	$0x1, %xmm0, %ymm2, %ymm10	# tmp1469, tmp1472, vect_cst_.56
	vmovsd	(%rdx,%rdi), %xmm14	# MEM[base: _113, index: _17, offset: 0B], tmp1975
	vmulpd	-64(%r8), %ymm10, %ymm5	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm5, %ymm8, %ymm11	# vect__118.60, vect__119.61, vect__119.61
	vmovsd	(%rdx,%r14), %xmm12	# MEM[base: _113, index: _389, offset: 0B], tmp1974
	vmovhpd	(%rdx), %xmm14, %xmm15	# MEM[base: _113, offset: 0B], tmp1975, tmp1485
	vmovhpd	(%rdx,%r14,2), %xmm12, %xmm13	# MEM[base: _113, index: _389, step: 2, offset: 0B], tmp1974, tmp1482
	addq	%r11, %rdx	# D.17288, ivtmp.134
	movl	-200(%rbp), %r11d	# %sfp, ivtmp.125
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm7	# tmp1482, tmp1485, vect_cst_.56
	vmulpd	-32(%r8), %ymm7, %ymm1	# MEM[base: _615, offset: 0B], vect_cst_.56, vect__118.60
	vaddpd	%ymm1, %ymm11, %ymm0	# vect__118.60, vect__119.61, vect__119.61
	cmpl	%r11d, -208(%rbp)	# ivtmp.125, %sfp
	ja	.L25	#,
	.p2align 4,,10
	.p2align 3
.L161:
	vhaddpd	%ymm0, %ymm0, %ymm3	# vect__119.61, vect__119.61, tmp1124
	movl	-216(%rbp), %edx	# %sfp, ratio_mult_vf.54
	vperm2f128	$1, %ymm3, %ymm3, %ymm8	#, tmp1124, tmp1124, tmp1125
	vaddpd	%ymm8, %ymm3, %ymm6	# tmp1125, tmp1124, vect__119.63
	addl	%edx, %eax	# ratio_mult_vf.54, k1
	vaddsd	%xmm6, %xmm4, %xmm4	# stmp__119.62, D__lsm.27, D__lsm.27
	cmpl	-224(%rbp), %edx	# %sfp, ratio_mult_vf.54
	je	.L35	#,
.L36:
	movl	-56(%rbp), %r11d	# %sfp, n
	movl	-196(%rbp), %r8d	# %sfp, i1
	movl	%r11d, %edx	# n, D.17285
	imull	%eax, %edx	# k1, D.17285
	leal	(%rdx,%r8), %edi	#, D.17285
	movslq	%edi, %r8	# D.17285, D.17288
	vmovsd	(%rbx,%r8,8), %xmm0	# *_672, *_672
	leal	(%r9,%rax), %edi	#, D.17285
	movq	-88(%rbp), %r8	# %sfp, B
	movslq	%edi, %rdi	# D.17285, D.17288
	vmulsd	(%r8,%rdi,8), %xmm0, %xmm9	# *_677, *_672, D.17286
	leal	1(%rax), %edi	#, k1
	vaddsd	%xmm9, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	%edi, -52(%rbp)	# k1, %sfp
	jle	.L35	#,
	addl	%r11d, %edx	# n, D.17285
	movl	-196(%rbp), %r11d	# %sfp, i1
	addl	%r9d, %edi	# ivtmp.151, D.17285
	movslq	%edi, %rdi	# D.17285, D.17288
	addl	$2, %eax	#, k1
	leal	(%r11,%rdx), %r8d	#, D.17285
	movslq	%r8d, %r11	# D.17285, D.17288
	movq	-88(%rbp), %r8	# %sfp, B
	vmovsd	(%rbx,%r11,8), %xmm2	# *_689, *_689
	vmulsd	(%r8,%rdi,8), %xmm2, %xmm10	# *_694, *_689, D.17286
	vaddsd	%xmm10, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
	cmpl	%eax, -52(%rbp)	# k1, %sfp
	jle	.L35	#,
	addl	-56(%rbp), %edx	# %sfp, D.17285
	addl	%r9d, %eax	# ivtmp.151, D.17285
	addl	-196(%rbp), %edx	# %sfp, D.17285
	cltq
	movslq	%edx, %rdx	# D.17285, D.17288
	vmovsd	(%rbx,%rdx,8), %xmm5	# *_3, *_3
	vmulsd	(%r8,%rax,8), %xmm5, %xmm11	# *_394, *_3, D.17286
	vaddsd	%xmm11, %xmm4, %xmm4	# D.17286, D__lsm.27, D__lsm.27
.L35:
	movq	-136(%rbp), %rax	# %sfp, ivtmp.157
	vmovsd	%xmm4, (%rax,%rsi,8)	# D__lsm.27, MEM[base: _1001, index: ivtmp.149_18, step: 8, offset: 0B]
.L31:
	addl	$1, %r13d	#, j1
	addq	%r14, %rcx	# D.17288, ivtmp.144
	addq	-96(%rbp), %rsi	# %sfp, ivtmp.149
	addl	-56(%rbp), %r9d	# %sfp, ivtmp.151
	cmpl	-100(%rbp), %r13d	# %sfp, j1
	jne	.L37	#,
.L30:
	addl	$1, -196(%rbp)	#, %sfp
	addq	$1, %r15	#, ivtmp.165
	movl	-196(%rbp), %r9d	# %sfp, i1
	addq	$8, -136(%rbp)	#, %sfp
	cmpl	-80(%rbp), %r9d	# %sfp, i1
	jne	.L24	#,
.L23:
	movl	-80(%rbp), %esi	# %sfp, i1
	cmpl	%esi, -292(%rbp)	# i1, %sfp
	jle	.L38	#,
	movq	-544(%rbp), %rcx	# %sfp, tmp971
	movslq	%esi, %r15	# i1, D.17290
	movq	-328(%rbp), %r11	# %sfp, ivtmp.261
	movq	-400(%rbp), %rbx	# %sfp, A
	leaq	(%rcx,%r15,8), %r13	#, D.17290
	addq	-304(%rbp), %r13	# %sfp, ivtmp.116
	addq	-336(%rbp), %r15	# %sfp, ivtmp.124
	movq	%r13, -136(%rbp)	# ivtmp.116, %sfp
	.p2align 4,,10
	.p2align 3
.L39:
	movl	-284(%rbp), %edi	# %sfp, j1
	cmpl	%edi, -100(%rbp)	# j1, %sfp
	jle	.L45	#,
	movl	-296(%rbp), %r10d	# %sfp, ivtmp.110
	movl	%edi, %r13d	# j1, j1
	movq	-312(%rbp), %rsi	# %sfp, ivtmp.108
	movq	-320(%rbp), %rcx	# %sfp, ivtmp.103
	.p2align 4,,10
	.p2align 3
.L52:
	movl	-76(%rbp), %r8d	# %sfp, k1
	cmpl	%r8d, -52(%rbp)	# k1, %sfp
	jle	.L46	#,
	movq	-136(%rbp), %rdx	# %sfp, ivtmp.116
	vmovsd	(%rdx,%rsi,8), %xmm4	# MEM[base: _938, index: ivtmp.108_794, step: 8, offset: 0B], D__lsm.26
	movq	%rcx, %rdx	# ivtmp.103, D.17291
	andl	$31, %edx	#, D.17291
	shrq	$3, %rdx	#, D.17291
	negq	%rdx	# D.17291
	andl	$3, %edx	#, D.17289
	cmpl	%r12d, %edx	# D.17289, D.17289
	cmova	%r12d, %edx	# D.17289,, D.17289, prolog_loop_niters.31
	cmpl	$6, %r12d	#, D.17289
	cmovbe	%r12d, %edx	# prolog_loop_niters.31,, D.17289, prolog_loop_niters.31
	testl	%edx, %edx	# prolog_loop_niters.31
	je	.L60	#,
	vmovsd	(%rcx), %xmm12	# MEM[base: _721, offset: 0B], MEM[base: _721, offset: 0B]
	vmulsd	(%rbx,%r15,8), %xmm12, %xmm13	# MEM[base: A_64(D), index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, offset: 0B], D.17286
	movq	-112(%rbp), %r9	# %sfp, ivtmp.273
	vaddsd	%xmm13, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	movl	%r9d, %eax	# ivtmp.273, k1
	cmpl	$1, %edx	#, prolog_loop_niters.31
	je	.L49	#,
	movq	-160(%rbp), %r8	# %sfp, D.17287
	movq	%r9, %rdi	# ivtmp.273, D.17290
	subq	%r11, %rdi	# ivtmp.261, D.17290
	movq	-120(%rbp), %r9	# %sfp, ivtmp.275
	vmovsd	(%rcx,%rdi,8), %xmm14	# MEM[base: _721, index: _365, step: 8, offset: 0B], MEM[base: _721, index: _365, step: 8, offset: 0B]
	vmulsd	(%r8,%r15,8), %xmm14, %xmm15	# MEM[base: _61, index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, index: _365, step: 8, offset: 0B], D.17286
	movl	%r9d, %eax	# ivtmp.275, k1
	vaddsd	%xmm15, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	$2, %edx	#, prolog_loop_niters.31
	je	.L49	#,
	movq	-168(%rbp), %rdi	# %sfp, D.17287
	movq	%r9, %rax	# ivtmp.275, D.17290
	subq	%r11, %rax	# ivtmp.261, D.17290
	movq	-128(%rbp), %r8	# %sfp, ivtmp.277
	vmovsd	(%rcx,%rax,8), %xmm7	# MEM[base: _721, index: _626, step: 8, offset: 0B], MEM[base: _721, index: _626, step: 8, offset: 0B]
	vmulsd	(%rdi,%r15,8), %xmm7, %xmm1	# MEM[base: _947, index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, index: _626, step: 8, offset: 0B], D.17286
	movl	%r8d, %eax	# ivtmp.277, k1
	vaddsd	%xmm1, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	$3, %edx	#, prolog_loop_niters.31
	je	.L49	#,
	movq	-176(%rbp), %rax	# %sfp, D.17287
	movq	%r8, %r9	# ivtmp.277, D.17290
	subq	%r11, %r9	# ivtmp.261, D.17290
	movq	-152(%rbp), %rdi	# %sfp, ivtmp.279
	vmovsd	(%rcx,%r9,8), %xmm3	# MEM[base: _721, index: _465, step: 8, offset: 0B], MEM[base: _721, index: _465, step: 8, offset: 0B]
	vmulsd	(%rax,%r15,8), %xmm3, %xmm8	# MEM[base: _956, index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, index: _465, step: 8, offset: 0B], D.17286
	movl	%edi, %eax	# ivtmp.279, k1
	vaddsd	%xmm8, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	$4, %edx	#, prolog_loop_niters.31
	je	.L49	#,
	movq	-184(%rbp), %r9	# %sfp, D.17287
	movq	%rdi, %r8	# ivtmp.279, D.17290
	subq	%r11, %r8	# ivtmp.261, D.17290
	movq	-144(%rbp), %rdi	# %sfp, ivtmp.271
	vmovsd	(%rcx,%r8,8), %xmm6	# MEM[base: _721, index: _932, step: 8, offset: 0B], MEM[base: _721, index: _932, step: 8, offset: 0B]
	vmulsd	(%r9,%r15,8), %xmm6, %xmm0	# MEM[base: _965, index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, index: _932, step: 8, offset: 0B], D.17286
	movl	%edi, %eax	# ivtmp.271, k1
	vaddsd	%xmm0, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	$6, %edx	#, prolog_loop_niters.31
	jne	.L49	#,
	movq	-192(%rbp), %r8	# %sfp, D.17287
	movq	%rdi, %rax	# ivtmp.271, D.17290
	subq	%r11, %rax	# ivtmp.261, D.17290
	vmovsd	(%rcx,%rax,8), %xmm9	# MEM[base: _721, index: _736, step: 8, offset: 0B], MEM[base: _721, index: _736, step: 8, offset: 0B]
	movl	-104(%rbp), %eax	# %sfp, D.17289
	vmulsd	(%r8,%r15,8), %xmm9, %xmm2	# MEM[base: _121, index: ivtmp.124_620, step: 8, offset: 0B], MEM[base: _721, index: _736, step: 8, offset: 0B], D.17286
	addl	$6, %eax	#, k1
	vaddsd	%xmm2, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
.L49:
	cmpl	%r12d, %edx	# D.17289, prolog_loop_niters.31
	je	.L50	#,
.L48:
	movl	%r12d, %edi	# D.17289, niters.34
	movl	%edx, %r9d	# prolog_loop_niters.31, prolog_loop_adjusted_niters.33
	subl	%edx, %edi	# prolog_loop_niters.31, niters.34
	movl	%edi, -208(%rbp)	# niters.34, %sfp
	subl	$4, %edi	#, D.17289
	shrl	$2, %edi	#, D.17289
	leal	1(%rdi), %r8d	#, bnd.35
	movl	%r8d, -196(%rbp)	# bnd.35, %sfp
	sall	$2, %r8d	#, ratio_mult_vf.36
	movl	%r8d, -200(%rbp)	# ratio_mult_vf.36, %sfp
	leal	-1(%r12), %r8d	#, D.17289
	subl	%edx, %r8d	# prolog_loop_niters.31, D.17289
	cmpl	$2, %r8d	#, D.17289
	jbe	.L51	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17290
	andl	$3, %edi	#, tmp1346
	movq	-88(%rbp), %r8	# %sfp, B
	imulq	%r9, %rdx	# prolog_loop_adjusted_niters.33, D.17290
	addq	%rsi, %r9	# ivtmp.108, D.17290
	leaq	(%r8,%r9,8), %r9	#, ivtmp.88
	movq	-72(%rbp), %r8	# %sfp, D.17288
	movq	%r9, -216(%rbp)	# ivtmp.88, %sfp
	addq	$32, %r9	#, ivtmp.88
	addq	%r15, %rdx	# ivtmp.124, D.17290
	leaq	(%r14,%rdx,8), %rdx	#, D.17288
	addq	%rbx, %rdx	# A, ivtmp.92
	vmovsd	(%rdx,%r8), %xmm5	# MEM[base: _667, index: _666, offset: 0B], tmp2094
	movl	$1, %r8d	#, ivtmp.83
	vmovsd	(%rdx,%r14), %xmm10	# MEM[base: _667, index: _389, offset: 0B], tmp2092
	vmovhpd	(%rdx), %xmm5, %xmm12	# MEM[base: _667, offset: 0B], tmp2094, tmp1552
	vmovhpd	(%rdx,%r14,2), %xmm10, %xmm11	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2092, tmp1549
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm11, %ymm12, %ymm13	# tmp1549, tmp1552, vect_cst_.38
	vmulpd	-32(%r9), %ymm13, %ymm0	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__146.43
	cmpl	-196(%rbp), %r8d	# %sfp, ivtmp.83
	jnb	.L162	#,
	testl	%edi, %edi	# tmp1346
	je	.L169	#,
	cmpl	$1, %edi	#, tmp1346
	je	.L132	#,
	cmpl	$2, %edi	#, tmp1346
	je	.L133	#,
	movq	-72(%rbp), %r9	# %sfp, D.17288
	movl	$2, %r8d	#, ivtmp.83
	movq	-216(%rbp), %rdi	# %sfp, ivtmp.88
	vmovsd	(%rdx,%r14), %xmm14	# MEM[base: _667, index: _389, offset: 0B], tmp2148
	vmovsd	(%rdx,%r9), %xmm7	# MEM[base: _667, index: _666, offset: 0B], tmp2150
	vmovhpd	(%rdx,%r14,2), %xmm14, %xmm15	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2148, tmp1558
	leaq	64(%rdi), %r9	#, ivtmp.88
	vmovhpd	(%rdx), %xmm7, %xmm1	# MEM[base: _667, offset: 0B], tmp2150, tmp1561
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm15, %ymm1, %ymm3	# tmp1558, tmp1561, vect_cst_.38
	vmulpd	32(%rdi), %ymm3, %ymm8	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm8, %ymm0, %ymm0	# vect__145.42, vect__146.43, vect__146.43
.L133:
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	addl	$1, %r8d	#, ivtmp.83
	addq	$32, %r9	#, ivtmp.88
	vmovsd	(%rdx,%r14), %xmm6	# MEM[base: _667, index: _389, offset: 0B], tmp2154
	vmovhpd	(%rdx,%r14,2), %xmm6, %xmm9	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2154, tmp1567
	vmovsd	(%rdx,%rdi), %xmm2	# MEM[base: _667, index: _666, offset: 0B], tmp2156
	vmovhpd	(%rdx), %xmm2, %xmm10	# MEM[base: _667, offset: 0B], tmp2156, tmp1570
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm9, %ymm10, %ymm11	# tmp1567, tmp1570, vect_cst_.38
	vmulpd	-32(%r9), %ymm11, %ymm5	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm5, %ymm0, %ymm0	# vect__145.42, vect__146.43, vect__146.43
.L132:
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	addl	$1, %r8d	#, ivtmp.83
	addq	$32, %r9	#, ivtmp.88
	vmovsd	(%rdx,%r14), %xmm12	# MEM[base: _667, index: _389, offset: 0B], tmp2158
	vmovhpd	(%rdx,%r14,2), %xmm12, %xmm13	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2158, tmp1576
	vmovsd	(%rdx,%rdi), %xmm14	# MEM[base: _667, index: _666, offset: 0B], tmp2160
	vmovhpd	(%rdx), %xmm14, %xmm15	# MEM[base: _667, offset: 0B], tmp2160, tmp1579
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm7	# tmp1576, tmp1579, vect_cst_.38
	vmulpd	-32(%r9), %ymm7, %ymm1	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm1, %ymm0, %ymm0	# vect__145.42, vect__146.43, vect__146.43
	cmpl	-196(%rbp), %r8d	# %sfp, ivtmp.83
	jnb	.L162	#,
.L40:
	vmovsd	(%rdx,%r14), %xmm3	# MEM[base: _667, index: _389, offset: 0B], tmp2038
	addl	$4, %r8d	#, ivtmp.83
	subq	$-128, %r9	#, ivtmp.88
	vmovsd	(%rdx,%rdi), %xmm6	# MEM[base: _667, index: _666, offset: 0B], tmp2039
	vmovhpd	(%rdx,%r14,2), %xmm3, %xmm8	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2038, tmp1184
	vmovhpd	(%rdx), %xmm6, %xmm9	# MEM[base: _667, offset: 0B], tmp2039, tmp1187
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm8, %ymm9, %ymm2	# tmp1184, tmp1187, vect_cst_.38
	vmulpd	-128(%r9), %ymm2, %ymm10	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm10, %ymm0, %ymm11	# vect__145.42, vect__146.43, vect__146.43
	vmovsd	(%rdx,%r14), %xmm5	# MEM[base: _667, index: _389, offset: 0B], tmp2041
	vmovsd	(%rdx,%rdi), %xmm13	# MEM[base: _667, index: _666, offset: 0B], tmp2042
	vmovhpd	(%rdx,%r14,2), %xmm5, %xmm12	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2041, tmp1509
	vmovhpd	(%rdx), %xmm13, %xmm14	# MEM[base: _667, offset: 0B], tmp2042, tmp1512
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1509, tmp1512, vect_cst_.38
	vmulpd	-96(%r9), %ymm15, %ymm7	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm7, %ymm11, %ymm1	# vect__145.42, vect__146.43, vect__146.43
	vmovsd	(%rdx,%r14), %xmm0	# MEM[base: _667, index: _389, offset: 0B], tmp2044
	vmovsd	(%rdx,%rdi), %xmm3	# MEM[base: _667, index: _666, offset: 0B], tmp2045
	vmovhpd	(%rdx,%r14,2), %xmm0, %xmm8	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2044, tmp1522
	vmovhpd	(%rdx), %xmm3, %xmm6	# MEM[base: _667, offset: 0B], tmp2045, tmp1525
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm8, %ymm6, %ymm9	# tmp1522, tmp1525, vect_cst_.38
	vmulpd	-64(%r9), %ymm9, %ymm2	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm2, %ymm1, %ymm10	# vect__145.42, vect__146.43, vect__146.43
	vmovsd	(%rdx,%r14), %xmm11	# MEM[base: _667, index: _389, offset: 0B], tmp2047
	vmovsd	(%rdx,%rdi), %xmm12	# MEM[base: _667, index: _666, offset: 0B], tmp2048
	vmovhpd	(%rdx,%r14,2), %xmm11, %xmm5	# MEM[base: _667, index: _389, step: 2, offset: 0B], tmp2047, tmp1535
	vmovhpd	(%rdx), %xmm12, %xmm13	# MEM[base: _667, offset: 0B], tmp2048, tmp1538
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.92
	vinsertf128	$0x1, %xmm5, %ymm13, %ymm14	# tmp1535, tmp1538, vect_cst_.38
	vmulpd	-32(%r9), %ymm14, %ymm15	# MEM[base: _828, offset: 0B], vect_cst_.38, vect__145.42
	vaddpd	%ymm15, %ymm10, %ymm0	# vect__145.42, vect__146.43, vect__146.43
	cmpl	-196(%rbp), %r8d	# %sfp, ivtmp.83
	jb	.L40	#,
	.p2align 4,,10
	.p2align 3
.L162:
	vhaddpd	%ymm0, %ymm0, %ymm7	# vect__146.43, vect__146.43, tmp1199
	movl	-200(%rbp), %edx	# %sfp, ratio_mult_vf.36
	vperm2f128	$1, %ymm7, %ymm7, %ymm1	#, tmp1199, tmp1199, tmp1200
	vaddpd	%ymm1, %ymm7, %ymm0	# tmp1200, tmp1199, vect__146.45
	addl	%edx, %eax	# ratio_mult_vf.36, k1
	vaddsd	%xmm0, %xmm4, %xmm4	# stmp__146.44, D__lsm.26, D__lsm.26
	cmpl	-208(%rbp), %edx	# %sfp, ratio_mult_vf.36
	je	.L50	#,
.L51:
	movl	-56(%rbp), %r9d	# %sfp, n
	movl	-80(%rbp), %r8d	# %sfp, i1
	movl	%r9d, %edx	# n, D.17285
	imull	%eax, %edx	# k1, D.17285
	leal	(%rdx,%r8), %edi	#, D.17285
	movslq	%edi, %r8	# D.17285, D.17288
	vmovsd	(%rbx,%r8,8), %xmm8	# *_319, *_319
	leal	(%rax,%r10), %edi	#, D.17285
	movq	-88(%rbp), %r8	# %sfp, B
	movslq	%edi, %rdi	# D.17285, D.17288
	vmulsd	(%r8,%rdi,8), %xmm8, %xmm3	# *_39, *_319, D.17286
	leal	1(%rax), %edi	#, k1
	vaddsd	%xmm3, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	%edi, -52(%rbp)	# k1, %sfp
	jle	.L50	#,
	addl	%r9d, %edx	# n, D.17285
	movl	-80(%rbp), %r9d	# %sfp, i1
	addl	%r10d, %edi	# ivtmp.110, D.17285
	movslq	%edi, %rdi	# D.17285, D.17288
	addl	$2, %eax	#, k1
	leal	(%r9,%rdx), %r8d	#, D.17285
	movslq	%r8d, %r9	# D.17285, D.17288
	movq	-88(%rbp), %r8	# %sfp, B
	vmovsd	(%rbx,%r9,8), %xmm6	# *_369, *_369
	vmulsd	(%r8,%rdi,8), %xmm6, %xmm9	# *_398, *_369, D.17286
	vaddsd	%xmm9, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
	cmpl	%eax, -52(%rbp)	# k1, %sfp
	jle	.L50	#,
	addl	-56(%rbp), %edx	# %sfp, D.17285
	addl	%r10d, %eax	# ivtmp.110, D.17285
	addl	-80(%rbp), %edx	# %sfp, D.17285
	cltq
	movslq	%edx, %rdx	# D.17285, D.17288
	vmovsd	(%rbx,%rdx,8), %xmm2	# *_344, *_344
	vmulsd	(%r8,%rax,8), %xmm2, %xmm10	# *_339, *_344, D.17286
	vaddsd	%xmm10, %xmm4, %xmm4	# D.17286, D__lsm.26, D__lsm.26
.L50:
	movq	-136(%rbp), %rax	# %sfp, ivtmp.116
	vmovsd	%xmm4, (%rax,%rsi,8)	# D__lsm.26, MEM[base: _938, index: ivtmp.108_794, step: 8, offset: 0B]
.L46:
	addl	$1, %r13d	#, j1
	addq	%r14, %rcx	# D.17288, ivtmp.103
	addq	-96(%rbp), %rsi	# %sfp, ivtmp.108
	addl	-56(%rbp), %r10d	# %sfp, ivtmp.110
	cmpl	-100(%rbp), %r13d	# %sfp, j1
	jne	.L52	#,
.L45:
	addl	$1, -80(%rbp)	#, %sfp
	addq	$1, %r15	#, ivtmp.124
	movl	-80(%rbp), %r10d	# %sfp, i1
	addq	$8, -136(%rbp)	#, %sfp
	cmpl	-292(%rbp), %r10d	# %sfp, i1
	jne	.L39	#,
.L38:
	addq	$32, -384(%rbp)	#, %sfp
	addq	$256, -408(%rbp)	#, %sfp
	movq	-384(%rbp), %rsi	# %sfp, ivtmp.239
	addq	$256, -344(%rbp)	#, %sfp
	cmpl	%esi, -56(%rbp)	# tmp2109, %sfp
	jg	.L53	#,
	movl	-516(%rbp), %ebx	# %sfp, j1
	movq	%r14, %r10	# D.17288, D.17288
	movl	%r12d, %r14d	# D.17289, D.17289
	movq	-424(%rbp), %rcx	# %sfp, D.17290
	movl	-448(%rbp), %edi	# %sfp, D.17289
	movq	-64(%rbp), %r8	# %sfp, D.17288
	movq	-88(%rbp), %r13	# %sfp, B
	movl	%ebx, -388(%rbp)	# j1, %sfp
	subq	%rcx, -416(%rbp)	# D.17290, %sfp
	addq	%rcx, -440(%rbp)	# D.17290, %sfp
	addl	%edi, -392(%rbp)	# D.17289, %sfp
	addq	%rcx, -464(%rbp)	# D.17290, %sfp
	addq	%r8, -472(%rbp)	# D.17288, %sfp
	cmpl	%ebx, -56(%rbp)	# j1, %sfp
	jg	.L54	#,
	movq	-424(%rbp), %r9	# %sfp, D.17290
	movq	%r10, %rbx	# D.17288, D.17288
	movq	%r13, %r10	# B, B
	movq	-64(%rbp), %r11	# %sfp, D.17288
	addq	$32, -328(%rbp)	#, %sfp
	movq	-536(%rbp), %r15	# %sfp, tmp952
	addl	%edi, -444(%rbp)	# D.17289, %sfp
	addq	%r11, -336(%rbp)	# D.17288, %sfp
	movq	-328(%rbp), %r12	# %sfp, ivtmp.261
	addq	%r15, -456(%rbp)	# tmp952, %sfp
	addq	%r9, -432(%rbp)	# D.17290, %sfp
	addq	$32, -144(%rbp)	#, %sfp
	addq	%r9, -480(%rbp)	# D.17290, %sfp
	addq	$32, -112(%rbp)	#, %sfp
	addq	%r9, -488(%rbp)	# D.17290, %sfp
	addq	$32, -120(%rbp)	#, %sfp
	addq	%r9, -496(%rbp)	# D.17290, %sfp
	addq	$32, -128(%rbp)	#, %sfp
	addq	%r9, -504(%rbp)	# D.17290, %sfp
	addq	$32, -152(%rbp)	#, %sfp
	addq	$256, -512(%rbp)	#, %sfp
	cmpl	%r12d, -56(%rbp)	# tmp2147, %sfp
	jg	.L55	#,
	vzeroupper
.L177:
	addq	$392, %rsp	#,
	popq	%rbx	#
	popq	%rdx	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rdx), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L48	#
	.p2align 4,,10
	.p2align 3
.L58:
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L18	#
	.p2align 4,,10
	.p2align 3
.L59:
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L33	#
.L173:
	movq	-72(%rbp), %r12	# %sfp, D.17288
	jmp	.L10	#
.L169:
	movq	-72(%rbp), %rdi	# %sfp, D.17288
	jmp	.L40	#
	.cfi_endproc
.LFE2289:
	.size	avx_dgemm_fast, .-avx_dgemm_fast
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	wall_time
	.type	wall_time, @function
wall_time:
.LFB2283:
	.cfi_startproc
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 48
	movl	$1, %edi	#,
	movq	%fs:40, %rax	#, tmp96
	movq	%rax, 24(%rsp)	# tmp96, D.17303
	xorl	%eax, %eax	# tmp96
	movq	%rsp, %rsi	#,
	call	clock_gettime	#
	vxorpd	%xmm0, %xmm0, %xmm0	# D.17302
	vxorpd	%xmm3, %xmm3, %xmm3	# D.17302
	movq	24(%rsp), %rax	# D.17303, tmp97
	xorq	%fs:40, %rax	#, tmp97
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm1	# t.tv_nsec, D.17302, D.17302
	vmulsd	.LC1(%rip), %xmm1, %xmm2	#, D.17302, D.17302
	vcvtsi2sdq	(%rsp), %xmm3, %xmm4	# t.tv_sec, D.17302, D.17302
	vaddsd	%xmm4, %xmm2, %xmm0	# D.17302, D.17302, D.17302
	jne	.L184	#,
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L184:
	.cfi_restore_state
	call	__stack_chk_fail	#
	.cfi_endproc
.LFE2283:
	.size	wall_time, .-wall_time
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	fill
	.type	fill, @function
fill:
.LFB2284:
	.cfi_startproc
	testl	%esi, %esi	# n
	jle	.L229	#,
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13	# p, p
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leal	-1(%rsi), %ebp	#, D.17322
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	8(%rdi,%rbp,8), %r12	#, D.17324
	andl	$7, %ebp	#, tmp108
	leaq	8(%r13), %rbx	#, ivtmp.290
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17319, D.17319
	vmovsd	%xmm1, 0(%r13)	# D.17319, MEM[base: _20, offset: 0B]
	cmpq	%r12, %rbx	# D.17324, ivtmp.290
	je	.L226	#,
	testq	%rbp, %rbp	# tmp108
	je	.L187	#,
	cmpq	$1, %rbp	#, tmp108
	je	.L213	#,
	cmpq	$2, %rbp	#, tmp108
	je	.L214	#,
	cmpq	$3, %rbp	#, tmp108
	je	.L215	#,
	cmpq	$4, %rbp	#, tmp108
	je	.L216	#,
	cmpq	$5, %rbp	#, tmp108
	je	.L217	#,
	cmpq	$6, %rbp	#, tmp108
	je	.L218	#,
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17319, D.17319
	vmovsd	%xmm3, (%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	leaq	16(%r13), %rbx	#, ivtmp.290
.L218:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17319, D.17319
	vmovsd	%xmm5, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
.L217:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17319, D.17319
	vmovsd	%xmm7, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
.L216:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17319, D.17319
	vmovsd	%xmm9, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
.L215:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17319, D.17319
	vmovsd	%xmm11, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
.L214:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17319, D.17319
	vmovsd	%xmm13, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
.L213:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17319, D.17319
	vmovsd	%xmm15, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	cmpq	%r12, %rbx	# D.17324, ivtmp.290
	je	.L226	#,
.L187:
	call	drand48	#
	addq	$64, %rbx	#, ivtmp.290
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17319, D.17319
	vmovsd	%xmm1, -64(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17319, D.17319
	vmovsd	%xmm3, -56(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17319, D.17319
	vmovsd	%xmm5, -48(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17319, D.17319
	vmovsd	%xmm7, -40(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17319, D.17319
	vmovsd	%xmm9, -32(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17319, D.17319
	vmovsd	%xmm11, -24(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17319, D.17319
	vmovsd	%xmm13, -16(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17319, D.17319, D.17319
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17319, D.17319
	vmovsd	%xmm15, -8(%rbx)	# D.17319, MEM[base: _20, offset: 0B]
	cmpq	%r12, %rbx	# D.17324, ivtmp.290
	jne	.L187	#,
.L226:
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
.L229:
	ret
	.cfi_endproc
.LFE2284:
	.size	fill, .-fill
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"%.3f\t "
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.globl	printmatrix
	.type	printmatrix, @function
printmatrix:
.LFB2285:
	.cfi_startproc
	testl	%edi, %edi	# m
	jle	.L275	#,
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rdi), %eax	#, D.17349
	movslq	%edi, %rdi	# m, D.17351
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d	# n, n
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12	# M, M
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	8(%rdx,%rax,8), %rdx	#, D.17345
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	0(,%rdi,8), %rbp	#, D.17351
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
	movq	%rdx, 8(%rsp)	# D.17345, %sfp
	.p2align 4,,10
	.p2align 3
.L232:
	testl	%r13d, %r13d	# n
	jle	.L234	#,
	leal	-1(%r13), %ecx	#, tmp105
	vmovsd	(%r12), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	andl	$7, %ecx	#, tmp107
	movl	$1, %eax	#,
	movl	$1, %r15d	#, j
	leaq	(%r12,%rbp), %rbx	#, ivtmp.297
	movl	%ecx, %r14d	# tmp107, tmp107
	call	__printf_chk	#
	cmpl	%r13d, %r15d	# n, j
	je	.L234	#,
	testl	%r14d, %r14d	# tmp107
	je	.L236	#,
	cmpl	$1, %r14d	#, tmp107
	je	.L261	#,
	cmpl	$2, %r14d	#, tmp107
	je	.L262	#,
	cmpl	$3, %r14d	#, tmp107
	je	.L263	#,
	cmpl	$4, %r14d	#, tmp107
	je	.L264	#,
	cmpl	$5, %r14d	#, tmp107
	je	.L265	#,
	cmpl	$6, %r14d	#, tmp107
	je	.L266	#,
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	call	__printf_chk	#
.L266:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L265:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L264:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L263:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L262:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L261:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r15d	#, j
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r13d, %r15d	# n, j
	je	.L234	#,
.L236:
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %eax	#,
	addl	$8, %r15d	#, j
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _25, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbp, %rbx	# D.17351, ivtmp.297
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r13d, %r15d	# n, j
	jne	.L236	#,
.L234:
	movl	$10, %edi	#,
	addq	$8, %r12	#, ivtmp.302
	call	putchar	#
	cmpq	8(%rsp), %r12	# %sfp, ivtmp.302
	jne	.L232	#,
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 56
	movl	$10, %edi	#,
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	putchar	#
.L275:
	movl	$10, %edi	#,
	jmp	putchar	#
	.cfi_endproc
.LFE2285:
	.size	printmatrix, .-printmatrix
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.globl	naive_dgemm
	.type	naive_dgemm, @function
naive_dgemm:
.LFB2286:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	%edi, %r15d	# n, n
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	subq	$8, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rsi, -72(%rbp)	# A, %sfp
	testl	%edi, %edi	# n
	jle	.L319	#,
	movslq	%edi, %rax	# n, D.17431
	movq	%rdx, %r12	# B, B
	movq	%rcx, -64(%rbp)	# C, %sfp
	movq	%rsi, %r13	# A, ivtmp.355
	leaq	0(,%rax,8), %r14	#, D.17431
	movq	%rax, %rbx	# D.17431, D.17431
	movq	%rax, -56(%rbp)	# D.17431, %sfp
	leal	(%rdi,%rdi), %eax	#, D.17429
	movq	%rbx, %rcx	# D.17431, D.17431
	movq	%r14, %r8	# D.17431, D.17431
	movq	$0, -112(%rbp)	#, %sfp
	movslq	%eax, %rdi	# D.17429, D.17430
	addl	%r15d, %eax	# n, D.17429
	salq	$5, %rcx	#, D.17431
	cltq
	negq	%r8	# D.17431
	movq	%rdi, -136(%rbp)	# D.17430, %sfp
	movq	%r12, %rbx	# B, B
	movq	%rax, -152(%rbp)	# D.17430, %sfp
	leal	0(,%r15,4), %eax	#, D.17429
	leal	-1(%r15), %esi	#, D.17429
	movslq	%eax, %rdx	# D.17429, D.17430
	addl	%r15d, %eax	# n, D.17429
	movq	%rcx, -80(%rbp)	# D.17431, %sfp
	cltq
	movq	%rdx, -144(%rbp)	# D.17430, %sfp
	movq	%rax, -128(%rbp)	# D.17430, %sfp
	movl	%esi, -104(%rbp)	# D.17429, %sfp
	movq	%r8, -88(%rbp)	# D.17431, %sfp
	.p2align 4,,10
	.p2align 3
.L278:
	movl	-112(%rbp), %r9d	# %sfp, tmp458
	movq	%rbx, %rcx	# B, ivtmp.341
	xorl	%r11d, %r11d	# j
	xorl	%r12d, %r12d	# ivtmp.348
	movq	-64(%rbp), %rax	# %sfp, ivtmp.352
	movl	%r11d, %ebx	# j, j
	xorl	%edi, %edi	# ivtmp.347
	movq	%rcx, %r11	# B, B
	movl	%r9d, -100(%rbp)	# tmp458, %sfp
	.p2align 4,,10
	.p2align 3
.L289:
	vmovsd	(%rax,%rdi,8), %xmm2	# MEM[base: _192, index: ivtmp.347_143, step: 8, offset: 0B], t
	movq	%rcx, %rax	# ivtmp.341, D.17434
	andl	$31, %eax	#, D.17434
	shrq	$3, %rax	#, D.17434
	negq	%rax	# D.17434
	andl	$3, %eax	#, D.17429
	cmpl	%r15d, %eax	# n, D.17429
	cmova	%r15d, %eax	# D.17429,, n, prologue_after_cost_adjust.309
	cmpl	$6, %r15d	#, n
	jg	.L321	#,
	movl	%r15d, %eax	# n, prologue_after_cost_adjust.309
.L290:
	vmovsd	(%rcx), %xmm0	# MEM[base: _173, offset: 0B], MEM[base: _173, offset: 0B]
	vmulsd	0(%r13), %xmm0, %xmm1	# MEM[base: _240, offset: 0B], MEM[base: _173, offset: 0B], D.17433
	vaddsd	%xmm1, %xmm2, %xmm2	# D.17433, t, t
	cmpl	$1, %eax	#, prologue_after_cost_adjust.309
	je	.L292	#,
	movq	-56(%rbp), %rdx	# %sfp, D.17431
	vmovsd	8(%rcx), %xmm3	# MEM[base: _173, offset: 8B], MEM[base: _173, offset: 8B]
	vmulsd	0(%r13,%rdx,8), %xmm3, %xmm4	# MEM[base: _240, index: _142, step: 8, offset: 0B], MEM[base: _173, offset: 8B], D.17433
	vaddsd	%xmm4, %xmm2, %xmm2	# D.17433, t, t
	cmpl	$2, %eax	#, prologue_after_cost_adjust.309
	je	.L293	#,
	movq	-136(%rbp), %rsi	# %sfp, D.17430
	vmovsd	16(%rcx), %xmm5	# MEM[base: _173, offset: 16B], MEM[base: _173, offset: 16B]
	vmulsd	0(%r13,%rsi,8), %xmm5, %xmm6	# MEM[base: _240, index: _110, step: 8, offset: 0B], MEM[base: _173, offset: 16B], D.17433
	vaddsd	%xmm6, %xmm2, %xmm2	# D.17433, t, t
	cmpl	$3, %eax	#, prologue_after_cost_adjust.309
	je	.L294	#,
	movq	-152(%rbp), %r8	# %sfp, D.17430
	vmovsd	24(%rcx), %xmm7	# MEM[base: _173, offset: 24B], MEM[base: _173, offset: 24B]
	vmulsd	0(%r13,%r8,8), %xmm7, %xmm8	# MEM[base: _240, index: _241, step: 8, offset: 0B], MEM[base: _173, offset: 24B], D.17433
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17433, t, t
	cmpl	$4, %eax	#, prologue_after_cost_adjust.309
	je	.L295	#,
	movq	-144(%rbp), %r9	# %sfp, D.17430
	vmovsd	32(%rcx), %xmm9	# MEM[base: _173, offset: 32B], MEM[base: _173, offset: 32B]
	vmulsd	0(%r13,%r9,8), %xmm9, %xmm10	# MEM[base: _240, index: _187, step: 8, offset: 0B], MEM[base: _173, offset: 32B], D.17433
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17433, t, t
	cmpl	$6, %eax	#, prologue_after_cost_adjust.309
	jne	.L296	#,
	movq	-128(%rbp), %r10	# %sfp, D.17430
	movl	$6, %edx	#, k
	vmovsd	40(%rcx), %xmm11	# MEM[base: _173, offset: 40B], MEM[base: _173, offset: 40B]
	vmulsd	0(%r13,%r10,8), %xmm11, %xmm12	# MEM[base: _240, index: _11, step: 8, offset: 0B], MEM[base: _173, offset: 40B], D.17433
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17433, t, t
.L281:
	cmpl	%eax, %r15d	# prologue_after_cost_adjust.309, n
	je	.L282	#,
.L280:
	movl	%r15d, %esi	# n, niters.311
	movl	%eax, %r8d	# prologue_after_cost_adjust.309, prolog_loop_adjusted_niters.310
	subl	%eax, %esi	# prologue_after_cost_adjust.309, niters.311
	movl	%esi, -96(%rbp)	# niters.311, %sfp
	subl	$4, %esi	#, D.17429
	shrl	$2, %esi	#, D.17429
	leal	1(%rsi), %r10d	#, bnd.312
	leal	0(,%r10,4), %r9d	#, ratio_mult_vf.313
	movl	%r9d, -92(%rbp)	# ratio_mult_vf.313, %sfp
	movl	-104(%rbp), %r9d	# %sfp, D.17429
	subl	%eax, %r9d	# prologue_after_cost_adjust.309, D.17429
	cmpl	$2, %r9d	#, D.17429
	jbe	.L283	#,
	movq	-56(%rbp), %rax	# %sfp, D.17430
	andl	$3, %esi	#, tmp293
	imulq	%r8, %rax	# prolog_loop_adjusted_niters.310, D.17430
	addq	%rdi, %r8	# ivtmp.347, D.17430
	addq	-112(%rbp), %rax	# %sfp, D.17430
	leaq	(%r11,%r8,8), %r9	#, ivtmp.329
	movq	-88(%rbp), %r8	# %sfp, D.17431
	movq	%r9, -120(%rbp)	# ivtmp.329, %sfp
	addq	$32, %r9	#, ivtmp.329
	leaq	(%r14,%rax,8), %rax	#, D.17431
	addq	-72(%rbp), %rax	# %sfp, ivtmp.333
	vmovsd	(%rax,%r8), %xmm15	# MEM[base: _231, index: _230, offset: 0B], tmp428
	movl	$1, %r8d	#, ivtmp.324
	vmovsd	(%rax,%r14), %xmm13	# MEM[base: _231, index: _132, offset: 0B], tmp426
	vmovhpd	(%rax), %xmm15, %xmm0	# MEM[base: _231, offset: 0B], tmp428, tmp254
	vmovhpd	(%rax,%r14,2), %xmm13, %xmm14	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp426, tmp251
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm14, %ymm0, %ymm1	# tmp251, tmp254, vect_cst_.315
	vmulpd	-32(%r9), %ymm1, %ymm0	# MEM[base: _212, offset: 0B], vect_cst_.315, vect_t_30.320
	cmpl	%r10d, %r8d	# bnd.312, ivtmp.324
	jnb	.L315	#,
	testl	%esi, %esi	# tmp293
	je	.L316	#,
	cmpl	$1, %esi	#, tmp293
	je	.L310	#,
	cmpl	$2, %esi	#, tmp293
	je	.L311	#,
	movq	-88(%rbp), %rsi	# %sfp, D.17431
	movl	$2, %r8d	#, ivtmp.324
	movq	-120(%rbp), %r9	# %sfp, ivtmp.329
	vmovsd	(%rax,%r14), %xmm3	# MEM[base: _231, index: _132, offset: 0B], tmp459
	vmovsd	(%rax,%rsi), %xmm5	# MEM[base: _231, index: _230, offset: 0B], tmp461
	vmovhpd	(%rax,%r14,2), %xmm3, %xmm4	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp459, tmp351
	leaq	64(%r9), %r9	#, ivtmp.329
	vmovhpd	(%rax), %xmm5, %xmm6	# MEM[base: _231, offset: 0B], tmp461, tmp354
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7	# tmp351, tmp354, vect_cst_.315
	vmulpd	-32(%r9), %ymm7, %ymm8	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm8, %ymm0, %ymm0	# vect__29.319, vect_t_30.320, vect_t_30.320
.L311:
	movq	-88(%rbp), %rsi	# %sfp, D.17431
	addl	$1, %r8d	#, ivtmp.324
	addq	$32, %r9	#, ivtmp.329
	vmovsd	(%rax,%r14), %xmm9	# MEM[base: _231, index: _132, offset: 0B], tmp465
	vmovhpd	(%rax,%r14,2), %xmm9, %xmm10	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp465, tmp360
	vmovsd	(%rax,%rsi), %xmm11	# MEM[base: _231, index: _230, offset: 0B], tmp467
	vmovhpd	(%rax), %xmm11, %xmm12	# MEM[base: _231, offset: 0B], tmp467, tmp363
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp360, tmp363, vect_cst_.315
	vmulpd	-32(%r9), %ymm13, %ymm14	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm14, %ymm0, %ymm0	# vect__29.319, vect_t_30.320, vect_t_30.320
.L310:
	movq	-88(%rbp), %rsi	# %sfp, D.17431
	addl	$1, %r8d	#, ivtmp.324
	addq	$32, %r9	#, ivtmp.329
	vmovsd	(%rax,%r14), %xmm15	# MEM[base: _231, index: _132, offset: 0B], tmp469
	vmovhpd	(%rax,%r14,2), %xmm15, %xmm1	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp469, tmp369
	vmovsd	(%rax,%rsi), %xmm3	# MEM[base: _231, index: _230, offset: 0B], tmp471
	vmovhpd	(%rax), %xmm3, %xmm4	# MEM[base: _231, offset: 0B], tmp471, tmp372
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5	# tmp369, tmp372, vect_cst_.315
	vmulpd	-32(%r9), %ymm5, %ymm6	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm6, %ymm0, %ymm0	# vect__29.319, vect_t_30.320, vect_t_30.320
	cmpl	%r10d, %r8d	# bnd.312, ivtmp.324
	jnb	.L315	#,
.L284:
	vmovsd	(%rax,%r14), %xmm7	# MEM[base: _231, index: _132, offset: 0B], tmp432
	addl	$4, %r8d	#, ivtmp.324
	subq	$-128, %r9	#, ivtmp.329
	vmovsd	(%rax,%rsi), %xmm9	# MEM[base: _231, index: _230, offset: 0B], tmp433
	vmovhpd	(%rax,%r14,2), %xmm7, %xmm8	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp432, tmp303
	vmovhpd	(%rax), %xmm9, %xmm10	# MEM[base: _231, offset: 0B], tmp433, tmp306
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp303, tmp306, vect_cst_.315
	vmulpd	-128(%r9), %ymm11, %ymm12	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm12, %ymm0, %ymm13	# vect__29.319, vect_t_30.320, vect_t_30.320
	vmovsd	(%rax,%r14), %xmm14	# MEM[base: _231, index: _132, offset: 0B], tmp435
	vmovsd	(%rax,%rsi), %xmm1	# MEM[base: _231, index: _230, offset: 0B], tmp436
	vmovhpd	(%rax,%r14,2), %xmm14, %xmm15	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp435, tmp316
	vmovhpd	(%rax), %xmm1, %xmm3	# MEM[base: _231, offset: 0B], tmp436, tmp319
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4	# tmp316, tmp319, vect_cst_.315
	vmulpd	-96(%r9), %ymm4, %ymm5	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm5, %ymm13, %ymm8	# vect__29.319, vect_t_30.320, vect_t_30.320
	vmovsd	(%rax,%r14), %xmm6	# MEM[base: _231, index: _132, offset: 0B], tmp438
	vmovsd	(%rax,%rsi), %xmm7	# MEM[base: _231, index: _230, offset: 0B], tmp439
	vmovhpd	(%rax,%r14,2), %xmm6, %xmm0	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp438, tmp329
	vmovhpd	(%rax), %xmm7, %xmm9	# MEM[base: _231, offset: 0B], tmp439, tmp332
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm0, %ymm9, %ymm10	# tmp329, tmp332, vect_cst_.315
	vmulpd	-64(%r9), %ymm10, %ymm11	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm11, %ymm8, %ymm12	# vect__29.319, vect_t_30.320, vect_t_30.320
	vmovsd	(%rax,%r14), %xmm13	# MEM[base: _231, index: _132, offset: 0B], tmp441
	vmovsd	(%rax,%rsi), %xmm15	# MEM[base: _231, index: _230, offset: 0B], tmp442
	vmovhpd	(%rax,%r14,2), %xmm13, %xmm14	# MEM[base: _231, index: _132, step: 2, offset: 0B], tmp441, tmp342
	vmovhpd	(%rax), %xmm15, %xmm1	# MEM[base: _231, offset: 0B], tmp442, tmp345
	addq	-80(%rbp), %rax	# %sfp, ivtmp.333
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3	# tmp342, tmp345, vect_cst_.315
	vmulpd	-32(%r9), %ymm3, %ymm4	# MEM[base: _212, offset: 0B], vect_cst_.315, vect__29.319
	vaddpd	%ymm4, %ymm12, %ymm0	# vect__29.319, vect_t_30.320, vect_t_30.320
	cmpl	%r10d, %r8d	# bnd.312, ivtmp.324
	jb	.L284	#,
	.p2align 4,,10
	.p2align 3
.L315:
	vhaddpd	%ymm0, %ymm0, %ymm5	# vect_t_30.320, vect_t_30.320, tmp266
	movl	-92(%rbp), %r10d	# %sfp, ratio_mult_vf.313
	vperm2f128	$1, %ymm5, %ymm5, %ymm8	#, tmp266, tmp266, tmp267
	vaddpd	%ymm8, %ymm5, %ymm6	# tmp267, tmp266, vect_t_30.322
	addl	%r10d, %edx	# ratio_mult_vf.313, k
	vaddsd	%xmm6, %xmm2, %xmm2	# stmp_t_30.321, t, t
	cmpl	-96(%rbp), %r10d	# %sfp, ratio_mult_vf.313
	je	.L282	#,
.L283:
	movl	%edx, %eax	# k, D.17428
	movl	-100(%rbp), %r10d	# %sfp, i
	imull	%r15d, %eax	# n, D.17428
	leal	(%rdx,%r12), %esi	#, D.17428
	movslq	%esi, %rsi	# D.17428, D.17431
	leal	(%rax,%r10), %r9d	#, D.17428
	movslq	%r9d, %r8	# D.17428, D.17431
	movq	-72(%rbp), %r9	# %sfp, A
	vmovsd	(%r9,%r8,8), %xmm0	# *_17, *_17
	vmulsd	(%r11,%rsi,8), %xmm0, %xmm7	# *_22, *_17, D.17433
	leal	1(%rdx), %esi	#, k
	vaddsd	%xmm7, %xmm2, %xmm2	# D.17433, t, t
	cmpl	%esi, %r15d	# k, n
	jle	.L282	#,
	addl	%r15d, %eax	# n, D.17428
	addl	%r12d, %esi	# ivtmp.348, D.17428
	addl	$2, %edx	#, k
	leal	(%rax,%r10), %r10d	#, D.17428
	movslq	%esi, %rsi	# D.17428, D.17431
	movslq	%r10d, %r8	# D.17428, D.17431
	vmovsd	(%r9,%r8,8), %xmm9	# *_147, *_147
	vmulsd	(%r11,%rsi,8), %xmm9, %xmm10	# *_152, *_147, D.17433
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17433, t, t
	cmpl	%edx, %r15d	# k, n
	jle	.L282	#,
	addl	%r15d, %eax	# n, D.17428
	addl	-100(%rbp), %eax	# %sfp, D.17428
	addl	%r12d, %edx	# ivtmp.348, D.17428
	movq	-72(%rbp), %r9	# %sfp, A
	movslq	%edx, %rdx	# D.17428, D.17431
	cltq
	vmovsd	(%r9,%rax,8), %xmm11	# *_53, *_53
	vmulsd	(%r11,%rdx,8), %xmm11, %xmm12	# *_43, *_53, D.17433
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17433, t, t
.L282:
	movq	-64(%rbp), %rax	# %sfp, ivtmp.352
	addl	$1, %ebx	#, j
	addq	%r14, %rcx	# D.17431, ivtmp.341
	addl	%r15d, %r12d	# n, ivtmp.348
	vmovsd	%xmm2, (%rax,%rdi,8)	# t, MEM[base: _192, index: ivtmp.347_143, step: 8, offset: 0B]
	addq	-56(%rbp), %rdi	# %sfp, ivtmp.347
	cmpl	%r15d, %ebx	# n, j
	jne	.L289	#,
	addq	$1, -112(%rbp)	#, %sfp
	movq	%r11, %rbx	# B, B
	addq	$8, %r13	#, ivtmp.355
	movq	-112(%rbp), %rcx	# %sfp, ivtmp.350
	addq	$8, -64(%rbp)	#, %sfp
	cmpl	%ecx, %r15d	# ivtmp.350, n
	jg	.L278	#,
	vzeroupper
.L319:
	addq	$8, %rsp	#,
	popq	%rbx	#
	popq	%rdi	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rdi), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L321:
	.cfi_restore_state
	testl	%eax, %eax	# prologue_after_cost_adjust.309
	jne	.L290	#,
	xorl	%edx, %edx	# k
	jmp	.L280	#
	.p2align 4,,10
	.p2align 3
.L293:
	movl	$2, %edx	#, k
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L292:
	movl	$1, %edx	#, k
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L296:
	movl	$5, %edx	#, k
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L295:
	movl	$4, %edx	#, k
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L294:
	movl	$3, %edx	#, k
	jmp	.L281	#
	.p2align 4,,10
	.p2align 3
.L316:
	movq	-88(%rbp), %rsi	# %sfp, D.17431
	jmp	.L284	#
	.cfi_endproc
.LFE2286:
	.size	naive_dgemm, .-naive_dgemm
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.globl	do_4x4_block
	.type	do_4x4_block, @function
do_4x4_block:
.LFB2287:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	movslq	%edi, %r11	# n, D.17484
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	leaq	-208(%rbp), %r9	#, ivtmp.374
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	leaq	0(,%r11,8), %r10	#, D.17484
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	leaq	128(%r9), %rbx	#, D.17482
	subq	$176, %rsp	#,
	movq	%fs:40, %rax	#, tmp259
	movq	%rax, -56(%rbp)	# tmp259, D.17489
	xorl	%eax, %eax	# tmp259
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	(%r8), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	8(%r8), %r12	# MEM[(void *)_15], MEM[(void *)_15]
	movq	16(%r8), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%rax, (%r9)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	24(%r8), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r12, 8(%r9)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	32(%r9), %r12	#, tmp179
	movq	%r13, 16(%r9)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 24(%r9)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	(%r8,%r10), %rax	#, ivtmp.394
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, (%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	8(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 8(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 16(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	24(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	addq	%r10, %rax	# D.17484, ivtmp.394
	movq	%r13, 24(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	64(%r9), %r12	#, ivtmp.392
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, (%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	8(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 8(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 16(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	24(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	addq	%r10, %rax	# D.17484, ivtmp.394
	movq	%r13, 24(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	leaq	96(%r9), %r12	#, ivtmp.392
#APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
#NO_APP
	movq	(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, (%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	8(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 8(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	16(%rax), %r13	# MEM[(void *)_15], MEM[(void *)_15]
	movq	24(%rax), %rax	# MEM[(void *)_15], MEM[(void *)_15]
	movq	%r13, 16(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	movq	%rax, 24(%r12)	# MEM[(void *)_15], MEM[(void *)_18]
	testl	%esi, %esi	# kdepth
	jle	.L326	#,
	leal	(%rdi,%rdi), %r12d	#, D.17485
	vbroadcastsd	(%rcx,%r11,8), %ymm4	# MEM[base: _227, index: _108, step: 8, offset: 0B], b
	leal	(%r12,%rdi), %eax	#, tmp155
	movslq	%r12d, %rdi	# D.17485, D.17487
	vbroadcastsd	(%rcx), %ymm3	# MEM[base: _227, offset: 0B], b
	leal	-1(%rsi), %r13d	#, D.17487
	movslq	%eax, %rsi	# tmp155, D.17487
	vbroadcastsd	(%rcx,%rdi,8), %ymm6	# MEM[base: _227, index: _216, step: 8, offset: 0B], b
	vbroadcastsd	(%rcx,%rsi,8), %ymm8	# MEM[base: _227, index: _214, step: 8, offset: 0B], b
	leaq	8(%rcx,%r13,8), %r12	#, D.17482
	andl	$1, %r13d	#, tmp183
	leaq	8(%rcx), %rax	#, ivtmp.381
	vmovupd	(%rdx), %xmm0	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B]
	vinsertf128	$0x1, 16(%rdx), %ymm0, %ymm2	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B], tmp160
	addq	%r10, %rdx	# D.17484, ivtmp.379
	vmulpd	%ymm4, %ymm2, %ymm5	# b, tmp160, D.17483
	vmulpd	%ymm3, %ymm2, %ymm1	# b, tmp160, D.17483
	vmulpd	%ymm6, %ymm2, %ymm7	# b, tmp160, D.17483
	vaddpd	-176(%rbp), %ymm5, %ymm4	# c, D.17483, D.17483
	vmulpd	%ymm8, %ymm2, %ymm9	# b, tmp160, D.17483
	vaddpd	-208(%rbp), %ymm1, %ymm14	# c, D.17483, D.17483
	vaddpd	-144(%rbp), %ymm7, %ymm5	# c, D.17483, D.17483
	vaddpd	-112(%rbp), %ymm9, %ymm0	# c, D.17483, D.17483
	cmpq	%r12, %rax	# D.17482, ivtmp.381
	je	.L340	#,
	testq	%r13, %r13	# tmp183
	je	.L325	#,
	vbroadcastsd	(%rax), %ymm12	# MEM[base: _227, offset: 0B], b
	vbroadcastsd	(%rax,%r11,8), %ymm15	# MEM[base: _227, index: _108, step: 8, offset: 0B], b
	vbroadcastsd	(%rax,%rdi,8), %ymm3	# MEM[base: _227, index: _216, step: 8, offset: 0B], b
	vbroadcastsd	(%rax,%rsi,8), %ymm6	# MEM[base: _227, index: _214, step: 8, offset: 0B], b
	leaq	16(%rcx), %rax	#, ivtmp.381
	vmovupd	(%rdx), %xmm10	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B]
	vinsertf128	$0x1, 16(%rdx), %ymm10, %ymm11	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B], tmp247
	addq	%r10, %rdx	# D.17484, ivtmp.379
	vmulpd	%ymm12, %ymm11, %ymm13	# b, tmp247, D.17483
	vmulpd	%ymm15, %ymm11, %ymm2	# b, tmp247, D.17483
	vmulpd	%ymm3, %ymm11, %ymm1	# b, tmp247, D.17483
	vmulpd	%ymm6, %ymm11, %ymm7	# b, tmp247, D.17483
	vaddpd	%ymm13, %ymm14, %ymm14	# D.17483, D.17483, D.17483
	vaddpd	%ymm2, %ymm4, %ymm4	# D.17483, D.17483, D.17483
	vaddpd	%ymm1, %ymm5, %ymm5	# D.17483, D.17483, D.17483
	vaddpd	%ymm7, %ymm0, %ymm0	# D.17483, D.17483, D.17483
	cmpq	%r12, %rax	# D.17482, ivtmp.381
	je	.L340	#,
	.p2align 4,,10
	.p2align 3
.L325:
	vbroadcastsd	(%rax), %ymm10	# MEM[base: _227, offset: 0B], b
	leaq	8(%rax), %rcx	#, tmp184
	vbroadcastsd	(%rax,%r11,8), %ymm13	# MEM[base: _227, index: _108, step: 8, offset: 0B], b
	vmovupd	(%rdx), %xmm8	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B]
	vinsertf128	$0x1, 16(%rdx), %ymm8, %ymm9	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B], tmp213
	addq	%r10, %rdx	# D.17484, ivtmp.379
	vmulpd	%ymm10, %ymm9, %ymm11	# b, tmp213, D.17483
	vbroadcastsd	(%rax,%rdi,8), %ymm2	# MEM[base: _227, index: _216, step: 8, offset: 0B], b
	vaddpd	%ymm11, %ymm14, %ymm12	# D.17483, D.17483, D.17483
	vmulpd	%ymm13, %ymm9, %ymm14	# b, tmp213, D.17483
	vbroadcastsd	(%rax,%rsi,8), %ymm1	# MEM[base: _227, index: _214, step: 8, offset: 0B], b
	vaddpd	%ymm14, %ymm4, %ymm15	# D.17483, D.17483, D.17483
	addq	$16, %rax	#, ivtmp.381
	vbroadcastsd	-8(%rax), %ymm8	# MEM[base: _227, offset: 0B], b
	vmulpd	%ymm2, %ymm9, %ymm4	# b, tmp213, D.17483
	vaddpd	%ymm4, %ymm5, %ymm3	# D.17483, D.17483, D.17483
	vbroadcastsd	(%rcx,%r11,8), %ymm10	# MEM[base: _227, index: _108, step: 8, offset: 0B], b
	vmulpd	%ymm1, %ymm9, %ymm5	# b, tmp213, D.17483
	vaddpd	%ymm5, %ymm0, %ymm6	# D.17483, D.17483, D.17483
	vmovupd	(%rdx), %xmm7	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B]
	vinsertf128	$0x1, 16(%rdx), %ymm7, %ymm0	# MEM[base: _45, offset: 0B], MEM[base: _45, offset: 0B], tmp233
	vmulpd	%ymm8, %ymm0, %ymm9	# b, tmp233, D.17483
	vaddpd	%ymm9, %ymm12, %ymm14	# D.17483, D.17483, D.17483
	vmulpd	%ymm10, %ymm0, %ymm11	# b, tmp233, D.17483
	vbroadcastsd	(%rcx,%rdi,8), %ymm12	# MEM[base: _227, index: _216, step: 8, offset: 0B], b
	vaddpd	%ymm11, %ymm15, %ymm4	# D.17483, D.17483, D.17483
	addq	%r10, %rdx	# D.17484, ivtmp.379
	vbroadcastsd	(%rcx,%rsi,8), %ymm15	# MEM[base: _227, index: _214, step: 8, offset: 0B], b
	vmulpd	%ymm12, %ymm0, %ymm13	# b, tmp233, D.17483
	vaddpd	%ymm13, %ymm3, %ymm5	# D.17483, D.17483, D.17483
	vmulpd	%ymm15, %ymm0, %ymm2	# b, tmp233, D.17483
	vaddpd	%ymm2, %ymm6, %ymm0	# D.17483, D.17483, D.17483
	cmpq	%r12, %rax	# D.17482, ivtmp.381
	jne	.L325	#,
.L340:
	vmovapd	%ymm14, -208(%rbp)	# D.17483, c
	vmovapd	%ymm4, -176(%rbp)	# D.17483, c
	vmovapd	%ymm5, -144(%rbp)	# D.17483, c
	vmovapd	%ymm0, -112(%rbp)	# D.17483, c
	vzeroupper
.L326:
#APP
# 89 "matmul.c" 1
	# final memcopy
# 0 "" 2
#NO_APP
	movq	(%r9), %rdx	# MEM[(void *)_46], MEM[(void *)_46]
	addq	$32, %r9	#, ivtmp.374
	movq	-24(%r9), %r11	# MEM[(void *)_46], MEM[(void *)_46]
	movq	-16(%r9), %r13	# MEM[(void *)_46], MEM[(void *)_46]
	movq	-8(%r9), %rdi	# MEM[(void *)_46], MEM[(void *)_46]
	movq	%rdx, (%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%r11, 8(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%r13, 16(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	movq	%rdi, 24(%r8)	# MEM[(void *)_46], MEM[(void *)_50]
	addq	%r10, %r8	# D.17484, ivtmp.372
	cmpq	%r9, %rbx	# ivtmp.374, D.17482
	jne	.L326	#,
	movq	-56(%rbp), %rax	# D.17489, tmp260
	xorq	%fs:40, %rax	#, tmp260
	jne	.L343	#,
	addq	$176, %rsp	#,
	popq	%rbx	#
	popq	%r8	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	leaq	-8(%r8), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
.L343:
	.cfi_restore_state
	call	__stack_chk_fail	#
	.cfi_endproc
.LFE2287:
	.size	do_4x4_block, .-do_4x4_block
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	avx_dgemm_slow
	.type	avx_dgemm_slow, @function
avx_dgemm_slow:
.LFB2290:
	.cfi_startproc
	testl	%edi, %edi	# n
	jle	.L530	#,
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	movl	%edi, %eax	# n, D.17730
	pushq	-8(%r10)	#
	pushq	%rbp	#
	sall	$5, %eax	#, D.17730
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rsi, %r14	# A, A
	movl	%edi, %esi	# n, n
	pushq	%r13	#
	pushq	%r12	#
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdx, %r12	# B, B
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	leal	0(,%rsi,4), %edx	#, tmp872
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movslq	%esi, %rbx	# n,
	subq	$448, %rsp	#,
	movl	%ebx, %r10d	# n, n
	movl	%eax, -392(%rbp)	# D.17730, %sfp
	cltq
	movq	%rax, %r8	# D.17736, D.17736
	movq	%rax, -64(%rbp)	# D.17736, %sfp
	salq	$3, %rax	#, D.17734
	subl	$1, %r10d	#, D.17730
	movl	%edi, -52(%rbp)	# n, %sfp
	shrl	$5, %r10d	#, D.17730
	leaq	0(,%rbx,8), %r13	#, ivtmp.621
	movl	%r10d, %edi	# D.17730, D.17734
	movq	%rbx, -96(%rbp)	# D.17734, %sfp
	addl	$1, %r10d	#, D.17730
	movq	%rax, -408(%rbp)	# D.17734, %sfp
	movl	%esi, %eax	# n, n
	addq	$1, %rdi	#, D.17734
	sall	$5, %r10d	#, D.17735
	addl	%edx, %eax	# tmp872, D.17735
	movq	%rdi, %rsi	# D.17734, tmp887
	movq	%rcx, -344(%rbp)	# C, %sfp
	movq	%r8, %rcx	# D.17736, tmp876
	cltq
	negq	%rcx	# tmp876
	negq	%rsi	# tmp887
	movl	%r10d, -448(%rbp)	# D.17735, %sfp
	salq	$3, %rax	#, ivtmp.617
	salq	$3, %rcx	#, tmp877
	movslq	%edx, %rdx	# tmp872, D.17734
	movq	%r8, -280(%rbp)	# D.17736, %sfp
	movq	%rax, -264(%rbp)	# ivtmp.617, %sfp
	salq	$8, %rsi	#, tmp888
	movq	%rbx, %rax	#,
	salq	$5, %rdi	#, D.17736
	addl	%eax, %eax	# D.17735
	movq	%rcx, -480(%rbp)	# tmp877, %sfp
	movslq	%eax, %r11	# D.17735, D.17734
	addl	%ebx, %eax	# n, D.17735
	movq	%r13, %rbx	# ivtmp.621, D.17736
	movq	%rsi, -488(%rbp)	# tmp888, %sfp
	cltq
	negq	%rbx	# D.17736
	movq	%rdi, -464(%rbp)	# D.17736, %sfp
	leaq	0(,%r11,8), %r15	#, ivtmp.623
	salq	$3, %rax	#, ivtmp.625
	movq	%r13, -432(%rbp)	# ivtmp.621, %sfp
	leaq	0(,%rdx,8), %rcx	#, D.17734
	movq	%r15, -440(%rbp)	# ivtmp.623, %sfp
	movq	%rax, -272(%rbp)	# ivtmp.625, %sfp
	movq	%rcx, -360(%rbp)	# D.17734, %sfp
	movq	$4, -152(%rbp)	#, %sfp
	movq	$3, -128(%rbp)	#, %sfp
	movq	$2, -120(%rbp)	#, %sfp
	movq	$1, -112(%rbp)	#, %sfp
	movq	$5, -144(%rbp)	#, %sfp
	movq	$0, -256(%rbp)	#, %sfp
	movq	$0, -328(%rbp)	#, %sfp
	movq	$0, -336(%rbp)	#, %sfp
	movq	%rbx, -72(%rbp)	# D.17736, %sfp
	movq	%r14, %rbx	# A, A
	movq	%r12, %r14	# B, B
	movq	%r13, %r12	# ivtmp.621, ivtmp.621
	movq	$0, -376(%rbp)	#, %sfp
	movl	$0, -424(%rbp)	#, %sfp
.L396:
	movq	-328(%rbp), %r13	# %sfp, ivtmp.610
	movl	$0, -420(%rbp)	#, %sfp
	movl	$0, -388(%rbp)	#, %sfp
	movl	-52(%rbp), %r9d	# %sfp, n
	movslq	-424(%rbp), %r15	# %sfp, D.17734
	movq	-376(%rbp), %r8	# %sfp, D.17734
	movl	%r13d, %eax	# ivtmp.610, tmp1662
	movl	%r13d, -76(%rbp)	# tmp1662, %sfp
	addl	$32, %eax	#, D.17730
	movl	%r13d, -104(%rbp)	# tmp1663, %sfp
	cmpl	%eax, %r9d	# D.17730, n
	movq	%r15, %r10	# D.17734, tmp894
	cmovle	%r9d, %eax	# n,, kend
	movq	-256(%rbp), %r9	# %sfp, ivtmp.619
	salq	$3, %r15	#, ivtmp.592
	negq	%r10	# tmp894
	subq	%r15, %r8	# ivtmp.592, D.17734
	movq	%r15, -456(%rbp)	# ivtmp.592, %sfp
	movq	%rbx, %r15	# A, A
	movl	%eax, -56(%rbp)	# kend, %sfp
	movl	%eax, %esi	# kend, niters.437
	leaq	0(,%r10,8), %rdi	#, ivtmp.601
	subl	%r13d, %esi	# ivtmp.610, niters.437
	movq	%r14, %r10	# B, B
	movq	%r8, -472(%rbp)	# D.17734, %sfp
	movq	%r9, %rax	# ivtmp.619, D.17734
	movq	%r9, %r11	# ivtmp.619, D.17734
	addq	-432(%rbp), %rax	# %sfp, D.17734
	movq	%r12, %r14	# ivtmp.621, ivtmp.621
	addq	-440(%rbp), %r11	# %sfp, D.17734
	movq	%rdi, -416(%rbp)	# ivtmp.601, %sfp
	movq	%r10, %r12	# B, B
	movq	%r15, %r13	# A, A
	addq	%rbx, %rax	# A, D.17733
	addq	%rbx, %r11	# A, D.17733
	movq	%rax, -160(%rbp)	# D.17733, %sfp
	movl	%esi, %ebx	# niters.437, niters.437
	movq	%r11, -168(%rbp)	# D.17733, %sfp
.L395:
	movl	-388(%rbp), %edx	# %sfp, j1
	movq	%r12, -88(%rbp)	# B, %sfp
	movq	$0, -384(%rbp)	#, %sfp
	movl	-52(%rbp), %ecx	# %sfp, n
	movq	-376(%rbp), %r10	# %sfp, ivtmp.594
	movl	%edx, %edi	# j1, j1
	addl	$32, %edi	#, j1
	movl	%ecx, %r8d	# n, n
	cmpl	%ecx, %edi	# n, j1
	movl	%edi, -444(%rbp)	# j1, %sfp
	cmovle	%edi, %r8d	# j1,, jend
	negq	%r10	# ivtmp.594
	movq	%r10, -352(%rbp)	# ivtmp.594, %sfp
	movl	%r8d, %r11d	# jend, D.17735
	movl	%r8d, %r15d	# jend, j1
	movl	%r8d, -100(%rbp)	# jend, %sfp
	movq	-456(%rbp), %r8	# %sfp, ivtmp.592
	subl	%edx, %r11d	# j1, D.17735
	movl	%r11d, %eax	# D.17735, D.17735
	cltd
	shrl	$30, %edx	#, tmp898
	movq	%r8, -400(%rbp)	# ivtmp.592, %sfp
	addl	%edx, %eax	# tmp898, tmp899
	andl	$3, %eax	#, tmp900
	subl	%edx, %eax	# tmp898, tmp901
	subl	%eax, %r15d	# tmp901, j1
	movl	%r15d, -292(%rbp)	# j1, %sfp
	imull	%ecx, %r15d	# n, ivtmp.522
	movslq	%r15d, %rsi	# ivtmp.522, D.17736
	addq	-328(%rbp), %rsi	# %sfp, D.17736
	movl	%r15d, -304(%rbp)	# ivtmp.522, %sfp
	movl	%ebx, %r15d	# niters.437, niters.437
	leaq	(%r12,%rsi,8), %rcx	#, ivtmp.515
	movq	%rsi, -312(%rbp)	# D.17736, %sfp
	movq	%rcx, -320(%rbp)	# ivtmp.515, %sfp
.L394:
	movq	-384(%rbp), %r12	# %sfp, ivtmp.591
	movl	-52(%rbp), %ebx	# %sfp, n
	movl	-388(%rbp), %r11d	# %sfp, j1
	movl	-292(%rbp), %edi	# %sfp, j1
	movl	%r12d, %eax	# ivtmp.591, tmp1699
	movl	%r12d, -172(%rbp)	# tmp1699, %sfp
	addl	$32, %eax	#, D.17730
	cmpl	%eax, %ebx	# D.17730, n
	cmovle	%ebx, %eax	# n,, iend
	movl	%eax, %r9d	# iend, iend
	movl	%eax, -300(%rbp)	# iend, %sfp
	subl	%r12d, %eax	# ivtmp.591, D.17735
	cltd
	shrl	$30, %edx	#, tmp907
	addl	%edx, %eax	# tmp907, tmp908
	andl	$3, %eax	#, tmp909
	subl	%edx, %eax	# tmp907, tmp910
	subl	%eax, %r9d	# tmp910, i1
	movl	%r9d, -80(%rbp)	# i1, %sfp
	cmpl	%edi, %r11d	# j1, j1
	jge	.L346	#,
	movl	%r12d, %r8d	# ivtmp.591, D.17730
	movq	-400(%rbp), %rsi	# %sfp, ivtmp.592
	movl	%r15d, -208(%rbp)	# niters.437, %sfp
	notl	%r8d	# D.17730
	movl	-56(%rbp), %eax	# %sfp, D.17735
	movq	%r14, -216(%rbp)	# ivtmp.621, %sfp
	addl	%r9d, %r8d	# i1, D.17730
	subl	-76(%rbp), %eax	# %sfp, D.17735
	movl	%r11d, -192(%rbp)	# j1, %sfp
	shrl	$2, %r8d	#,
	movq	-344(%rbp), %r15	# %sfp, C
	movq	%r13, -136(%rbp)	# A, %sfp
	movq	%rsi, %rcx	# ivtmp.592, ivtmp.581
	addq	-416(%rbp), %rcx	# %sfp, ivtmp.581
	addq	$1, %r8	#, D.17734
	movq	%rsi, %r14	# ivtmp.592, ivtmp.592
	salq	$5, %r8	#, D.17734
	movq	%r8, -184(%rbp)	# D.17734, %sfp
	movl	%eax, -176(%rbp)	# D.17735, %sfp
	movq	%rcx, %rbx	# ivtmp.581, ivtmp.581
	.p2align 4,,10
	.p2align 3
.L347:
	movl	-172(%rbp), %r13d	# %sfp, i1
	cmpl	%r13d, -80(%rbp)	# i1, %sfp
	jle	.L350	#,
	movq	-352(%rbp), %r9	# %sfp, ivtmp.594
	movq	-184(%rbp), %rdx	# %sfp, D.17734
	leaq	(%r15,%rbx), %r8	#,
	movq	-136(%rbp), %r10	# %sfp, A
	movl	-176(%rbp), %esi	# %sfp,
	leaq	(%rbx,%r9), %r12	#, D.17734
	addq	-88(%rbp), %r12	# %sfp, D.17733
	movl	-52(%rbp), %edi	# %sfp,
	leaq	-32(%rdx), %r11	#, tmp1252
	leaq	(%r10,%r14), %rdx	#, D.17733
	shrq	$5, %r11	#, tmp1250
	andl	$3, %r11d	#, tmp1253
	movq	%r12, %rcx	# D.17733,
	movq	%r11, -200(%rbp)	# tmp1253, %sfp
	vzeroupper
	movl	$32, %r13d	#, ivtmp.574
	call	do_4x4_block	#
	cmpq	-184(%rbp), %r13	# %sfp, ivtmp.574
	movq	-200(%rbp), %rdi	# %sfp, tmp1253
	je	.L350	#,
	testq	%rdi, %rdi	# tmp1253
	je	.L348	#,
	cmpq	$1, %rdi	#, tmp1253
	je	.L484	#,
	cmpq	$2, %rdi	#, tmp1253
	je	.L485	#,
	movq	-136(%rbp), %rsi	# %sfp, A
	leaq	32(%r15,%rbx), %r8	#,
	movq	%r12, %rcx	# D.17733,
	movl	$64, %r13d	#, ivtmp.574
	movl	-52(%rbp), %edi	# %sfp,
	leaq	32(%rsi,%r14), %rdx	#, D.17733
	movl	-176(%rbp), %esi	# %sfp,
	call	do_4x4_block	#
.L485:
	leaq	(%r14,%r13), %rdx	#, D.17734
	movl	-176(%rbp), %esi	# %sfp,
	addq	-136(%rbp), %rdx	# %sfp, D.17733
	leaq	(%rbx,%r13), %rcx	#, D.17734
	addq	$32, %r13	#, ivtmp.574
	movl	-52(%rbp), %edi	# %sfp,
	leaq	(%r15,%rcx), %r8	#,
	movq	%r12, %rcx	# D.17733,
	call	do_4x4_block	#
.L484:
	leaq	(%r14,%r13), %rdx	#, D.17734
	movl	-176(%rbp), %esi	# %sfp,
	movq	%r12, %rcx	# D.17733,
	addq	-136(%rbp), %rdx	# %sfp, D.17733
	leaq	(%rbx,%r13), %r8	#, D.17734
	addq	$32, %r13	#, ivtmp.574
	movl	-52(%rbp), %edi	# %sfp,
	leaq	(%r15,%r8), %r8	#,
	call	do_4x4_block	#
	cmpq	-184(%rbp), %r13	# %sfp, ivtmp.574
	je	.L350	#,
.L348:
	movl	-176(%rbp), %esi	# %sfp,
	movq	%r12, %rcx	# D.17733,
	leaq	(%r14,%r13), %rdx	#, D.17734
	movl	-52(%rbp), %edi	# %sfp,
	addq	-136(%rbp), %rdx	# %sfp, D.17733
	leaq	(%rbx,%r13), %rax	#, D.17734
	leaq	(%r15,%rax), %r8	#,
	call	do_4x4_block	#
	movl	-52(%rbp), %edi	# %sfp,
	leaq	32(%r13), %r9	#, tmp1254
	movq	%r12, %rcx	# D.17733,
	movq	-136(%rbp), %rdx	# %sfp, A
	leaq	(%rbx,%r9), %r11	#, D.17734
	addq	%r14, %r9	# ivtmp.592, D.17734
	movl	-176(%rbp), %esi	# %sfp,
	leaq	(%r15,%r11), %r8	#,
	leaq	(%rdx,%r9), %rdx	#, D.17733
	call	do_4x4_block	#
	movq	-136(%rbp), %rsi	# %sfp, A
	leaq	64(%r13), %r10	#, ivtmp.574
	movq	%r12, %rcx	# D.17733,
	leaq	(%rbx,%r10), %rdi	#, D.17734
	addq	%r14, %r10	# ivtmp.592, D.17734
	leaq	(%r15,%rdi), %r8	#,
	movl	-52(%rbp), %edi	# %sfp,
	leaq	(%rsi,%r10), %rdx	#, D.17733
	movl	-176(%rbp), %esi	# %sfp,
	call	do_4x4_block	#
	movq	-136(%rbp), %rdx	# %sfp, A
	leaq	96(%r13), %r8	#, ivtmp.574
	subq	$-128, %r13	#, ivtmp.574
	movl	-176(%rbp), %esi	# %sfp,
	leaq	(%rbx,%r8), %rcx	#, D.17734
	addq	%r14, %r8	# ivtmp.592, D.17734
	movl	-52(%rbp), %edi	# %sfp,
	addq	%r8, %rdx	# D.17734, D.17733
	leaq	(%r15,%rcx), %r8	#,
	movq	%r12, %rcx	# D.17733,
	call	do_4x4_block	#
	cmpq	-184(%rbp), %r13	# %sfp, ivtmp.574
	jne	.L348	#,
.L350:
	addl	$4, -192(%rbp)	#, %sfp
	addq	-360(%rbp), %rbx	# %sfp, ivtmp.581
	movl	-192(%rbp), %r12d	# %sfp, j1
	cmpl	-292(%rbp), %r12d	# %sfp, j1
	jl	.L347	#,
	movl	-80(%rbp), %r9d	# %sfp, i1
	movl	-300(%rbp), %edi	# %sfp, iend
	movq	-336(%rbp), %rdx	# %sfp, ivtmp.609
	movl	-208(%rbp), %r15d	# %sfp, niters.437
	movq	-216(%rbp), %r14	# %sfp, ivtmp.621
	movslq	%r9d, %r11	# i1,
	movl	-388(%rbp), %eax	# %sfp, j1
	subl	$1, %edi	#, D.17730
	movq	%r11, -368(%rbp)	# D.17736, %sfp
	movq	-136(%rbp), %r13	# %sfp, A
	leaq	1(%rdx,%r11), %r10	#, D.17736
	subl	%r9d, %edi	# i1, D.17736
	movl	-420(%rbp), %ebx	# %sfp, ivtmp.566
	leal	-1(%r15), %esi	#, D.17730
	addq	%r10, %rdi	# D.17736, D.17736
	movq	-88(%rbp), %r12	# %sfp, B
	movq	%rdi, -192(%rbp)	# D.17736, %sfp
	movq	%r14, %r11	# ivtmp.621, ivtmp.621
	movl	%eax, -296(%rbp)	# j1, %sfp
	movl	%esi, -216(%rbp)	# D.17730, %sfp
	.p2align 4,,10
	.p2align 3
.L349:
	movl	-80(%rbp), %r8d	# %sfp, i1
	cmpl	%r8d, -300(%rbp)	# i1, %sfp
	jle	.L356	#,
	movq	-368(%rbp), %rsi	# %sfp, D.17736
	movslq	%ebx, %rcx	# ivtmp.566, D.17736
	movq	-328(%rbp), %r9	# %sfp, ivtmp.610
	movq	-344(%rbp), %rax	# %sfp, C
	leaq	(%rcx,%rsi), %r14	#, D.17736
	addq	-336(%rbp), %rsi	# %sfp, ivtmp.561
	addq	%r9, %rcx	# ivtmp.610, D.17736
	leaq	(%r12,%rcx,8), %rdx	#, vectp.438
	movq	%rcx, -288(%rbp)	# D.17736, %sfp
	leaq	(%rax,%r14,8), %r8	#, ivtmp.553
	andl	$31, %edx	#, D.17737
	movl	%r9d, %eax	# ivtmp.610, tmp1806
	shrq	$3, %rdx	#, D.17737
	movq	%rsi, -184(%rbp)	# ivtmp.561, %sfp
	negq	%rdx	# D.17737
	andl	$3, %edx	#, D.17730
	cmpl	%r15d, %edx	# niters.437, D.17730
	cmova	%r15d, %edx	# prolog_loop_niters.439,, niters.437, prolog_loop_niters.439
	addl	%ebx, %eax	# ivtmp.566, D.17730
	cltq
	leaq	(%r12,%rax,8), %r10	#, D.17733
	movl	-112(%rbp), %eax	# %sfp, tmp1808
	movl	%edx, -200(%rbp)	# prolog_loop_niters.439, %sfp
	movq	%r10, -224(%rbp)	# D.17733, %sfp
	addl	%ebx, %eax	# ivtmp.566, D.17735
	cltq
	movq	%rax, -232(%rbp)	# D.17736, %sfp
	movl	-120(%rbp), %eax	# %sfp, tmp1810
	addl	%ebx, %eax	# ivtmp.566, D.17735
	cltq
	movq	%rax, -240(%rbp)	# D.17736, %sfp
	movl	-128(%rbp), %eax	# %sfp, tmp1812
	addl	%ebx, %eax	# ivtmp.566, D.17735
	cltq
	movq	%rax, -248(%rbp)	# D.17736, %sfp
	.p2align 4,,10
	.p2align 3
.L363:
	movl	-80(%rbp), %edi	# %sfp, D.17730
	subl	-184(%rbp), %edi	# %sfp, D.17730
	movl	-76(%rbp), %ecx	# %sfp, k1
	leal	(%rdi,%rsi), %r10d	#, D.17735
	cmpl	%ecx, -56(%rbp)	# k1, %sfp
	jle	.L357	#,
	movl	-200(%rbp), %edx	# %sfp, prologue_after_cost_adjust.440
	cmpl	$6, %r15d	#, niters.437
	vmovsd	(%r8), %xmm2	# MEM[base: _1012, offset: 0B], D__lsm.400
	cmovbe	%r15d, %edx	# prologue_after_cost_adjust.440,, niters.437, prologue_after_cost_adjust.440
	testl	%edx, %edx	# prologue_after_cost_adjust.440
	je	.L399	#,
	movq	-224(%rbp), %r14	# %sfp, D.17733
	vmovsd	0(%r13,%rsi,8), %xmm0	# MEM[base: A_64(D), index: ivtmp.561_661, step: 8, offset: 0B], MEM[base: A_64(D), index: ivtmp.561_661, step: 8, offset: 0B]
	movl	-112(%rbp), %eax	# %sfp, k1
	vmulsd	(%r14), %xmm0, %xmm1	# *_777, MEM[base: A_64(D), index: ivtmp.561_661, step: 8, offset: 0B], D.17732
	vaddsd	%xmm1, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	$1, %edx	#, prologue_after_cost_adjust.440
	je	.L360	#,
	movq	-232(%rbp), %r9	# %sfp, D.17736
	movq	-160(%rbp), %rdi	# %sfp, D.17733
	movl	-120(%rbp), %eax	# %sfp, k1
	vmovsd	(%r12,%r9,8), %xmm3	# *_796, *_796
	vmulsd	(%rdi,%rsi,8), %xmm3, %xmm4	# MEM[base: _984, index: ivtmp.561_661, step: 8, offset: 0B], *_796, D.17732
	vaddsd	%xmm4, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	$2, %edx	#, prologue_after_cost_adjust.440
	je	.L360	#,
	movq	-168(%rbp), %rax	# %sfp, D.17733
	movq	-240(%rbp), %rcx	# %sfp, D.17736
	vmovsd	(%r12,%rcx,8), %xmm5	# *_815, *_815
	vmulsd	(%rax,%rsi,8), %xmm5, %xmm6	# MEM[base: _993, index: ivtmp.561_661, step: 8, offset: 0B], *_815, D.17732
	movl	-128(%rbp), %eax	# %sfp, k1
	vaddsd	%xmm6, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	$3, %edx	#, prologue_after_cost_adjust.440
	je	.L360	#,
	movq	-256(%rbp), %r14	# %sfp, ivtmp.619
	movq	-248(%rbp), %rdi	# %sfp, D.17736
	movq	-152(%rbp), %rcx	# %sfp, ivtmp.628
	movq	%r14, %r9	# ivtmp.619, D.17734
	addq	-272(%rbp), %r9	# %sfp, D.17734
	vmovsd	(%r12,%rdi,8), %xmm7	# *_834, *_834
	movl	%ecx, %eax	# ivtmp.628, k1
	addq	%r13, %r9	# A, D.17733
	vmulsd	(%r9,%rsi,8), %xmm7, %xmm8	# MEM[base: _1002, index: ivtmp.561_661, step: 8, offset: 0B], *_834, D.17732
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	$4, %edx	#, prologue_after_cost_adjust.440
	je	.L360	#,
	leal	(%rbx,%rcx), %eax	#, D.17735
	movq	%r14, %rdi	# ivtmp.619, D.17734
	addq	-280(%rbp), %rdi	# %sfp, D.17734
	movslq	%eax, %r9	# D.17735, D.17736
	movq	-144(%rbp), %rcx	# %sfp, ivtmp.620
	vmovsd	(%r12,%r9,8), %xmm9	# *_853, *_853
	addq	%r13, %rdi	# A, D.17733
	vmulsd	(%rdi,%rsi,8), %xmm9, %xmm10	# MEM[base: _1011, index: ivtmp.561_661, step: 8, offset: 0B], *_853, D.17732
	movl	%ecx, %eax	# ivtmp.620, k1
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	$6, %edx	#, prologue_after_cost_adjust.440
	jne	.L360	#,
	movq	-264(%rbp), %rdi	# %sfp, D.17734
	leal	(%rbx,%rcx), %eax	#, D.17735
	movslq	%eax, %r9	# D.17735, D.17736
	movl	-104(%rbp), %eax	# %sfp, D.17730
	vmovsd	(%r12,%r9,8), %xmm11	# *_449, *_449
	addq	%r14, %rdi	# ivtmp.619, D.17734
	addq	%r13, %rdi	# A, D.17733
	addl	$6, %eax	#, k1
	vmulsd	(%rdi,%rsi,8), %xmm11, %xmm12	# MEM[base: _975, index: ivtmp.561_661, step: 8, offset: 0B], *_449, D.17732
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
.L360:
	cmpl	%edx, %r15d	# prologue_after_cost_adjust.440, niters.437
	je	.L361	#,
.L359:
	movl	%r15d, %ecx	# niters.437, niters.442
	movl	%edx, %edi	# prologue_after_cost_adjust.440, prolog_loop_adjusted_niters.441
	subl	%edx, %ecx	# prologue_after_cost_adjust.440, niters.442
	movl	%ecx, -136(%rbp)	# niters.442, %sfp
	subl	$4, %ecx	#, D.17730
	shrl	$2, %ecx	#, D.17730
	leal	1(%rcx), %r9d	#, bnd.443
	leal	0(,%r9,4), %r14d	#, ratio_mult_vf.444
	movl	%r14d, -176(%rbp)	# ratio_mult_vf.444, %sfp
	movl	-216(%rbp), %r14d	# %sfp, D.17730
	subl	%edx, %r14d	# prologue_after_cost_adjust.440, D.17730
	cmpl	$2, %r14d	#, D.17730
	jbe	.L362	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17734
	andl	$3, %ecx	#, tmp1247
	movl	%ecx, -208(%rbp)	# tmp1247, %sfp
	movl	$1, %ecx	#, ivtmp.537
	imulq	%rdi, %rdx	# prolog_loop_adjusted_niters.441, D.17734
	addq	-288(%rbp), %rdi	# %sfp, D.17734
	leaq	(%r12,%rdi,8), %r14	#, ivtmp.542
	movq	-72(%rbp), %rdi	# %sfp, D.17736
	addq	%rsi, %rdx	# ivtmp.561, D.17734
	leaq	(%r11,%rdx,8), %rdx	#, D.17734
	addq	%r13, %rdx	# A, ivtmp.546
	vmovsd	(%rdx,%rdi), %xmm15	# MEM[base: _660, index: _641, offset: 0B], tmp1790
	leaq	32(%r14), %rdi	#, ivtmp.542
	vmovsd	(%rdx,%r11), %xmm13	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp1788
	vmovhpd	(%rdx), %xmm15, %xmm0	# MEM[base: _660, offset: 0B], tmp1790, tmp1324
	vmovhpd	(%rdx,%r11,2), %xmm13, %xmm14	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1788, tmp1321
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm14, %ymm0, %ymm1	# tmp1321, tmp1324, vect_cst_.446
	vmulpd	(%r14), %ymm1, %ymm0	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__92.451
	cmpl	$1, %r9d	#, bnd.443
	jbe	.L510	#,
	cmpl	$0, -208(%rbp)	#, %sfp
	je	.L523	#,
	cmpl	$1, -208(%rbp)	#, %sfp
	je	.L482	#,
	cmpl	$2, -208(%rbp)	#, %sfp
	je	.L483	#,
	movq	-72(%rbp), %rcx	# %sfp, D.17736
	leaq	64(%r14), %rdi	#, ivtmp.542
	vmovsd	(%rdx,%r11), %xmm3	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp2051
	vmovhpd	(%rdx,%r11,2), %xmm3, %xmm4	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2051, tmp1490
	vmovsd	(%rdx,%rcx), %xmm5	# MEM[base: _660, index: _641, offset: 0B], tmp2053
	movl	$2, %ecx	#, ivtmp.537
	vmovhpd	(%rdx), %xmm5, %xmm6	# MEM[base: _660, offset: 0B], tmp2053, tmp1493
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7	# tmp1490, tmp1493, vect_cst_.446
	vmulpd	32(%r14), %ymm7, %ymm8	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm8, %ymm0, %ymm0	# vect__91.450, vect__92.451, vect__92.451
.L483:
	movq	-72(%rbp), %r14	# %sfp, D.17736
	addl	$1, %ecx	#, ivtmp.537
	addq	$32, %rdi	#, ivtmp.542
	vmovsd	(%rdx,%r11), %xmm9	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp2055
	vmovhpd	(%rdx,%r11,2), %xmm9, %xmm10	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2055, tmp1499
	vmovsd	(%rdx,%r14), %xmm11	# MEM[base: _660, index: _641, offset: 0B], tmp2057
	vmovhpd	(%rdx), %xmm11, %xmm12	# MEM[base: _660, offset: 0B], tmp2057, tmp1502
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp1499, tmp1502, vect_cst_.446
	vmulpd	-32(%rdi), %ymm13, %ymm14	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm14, %ymm0, %ymm0	# vect__91.450, vect__92.451, vect__92.451
.L482:
	movq	-72(%rbp), %r14	# %sfp, D.17736
	addl	$1, %ecx	#, ivtmp.537
	addq	$32, %rdi	#, ivtmp.542
	vmovsd	(%rdx,%r11), %xmm15	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp2059
	vmovhpd	(%rdx,%r11,2), %xmm15, %xmm1	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2059, tmp1508
	vmovsd	(%rdx,%r14), %xmm3	# MEM[base: _660, index: _641, offset: 0B], tmp2061
	vmovhpd	(%rdx), %xmm3, %xmm4	# MEM[base: _660, offset: 0B], tmp2061, tmp1511
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5	# tmp1508, tmp1511, vect_cst_.446
	vmulpd	-32(%rdi), %ymm5, %ymm6	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm6, %ymm0, %ymm0	# vect__91.450, vect__92.451, vect__92.451
	cmpl	%ecx, %r9d	# ivtmp.537, bnd.443
	jbe	.L510	#,
.L351:
	vmovsd	(%rdx,%r11), %xmm7	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp1741
	addl	$4, %ecx	#, ivtmp.537
	subq	$-128, %rdi	#, ivtmp.542
	vmovsd	(%rdx,%r14), %xmm9	# MEM[base: _660, index: _641, offset: 0B], tmp1742
	vmovhpd	(%rdx,%r11,2), %xmm7, %xmm8	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1741, tmp923
	vmovhpd	(%rdx), %xmm9, %xmm10	# MEM[base: _660, offset: 0B], tmp1742, tmp926
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp923, tmp926, vect_cst_.446
	vmulpd	-128(%rdi), %ymm11, %ymm12	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm12, %ymm0, %ymm13	# vect__91.450, vect__92.451, vect__92.451
	vmovsd	(%rdx,%r11), %xmm14	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp1744
	vmovsd	(%rdx,%r14), %xmm1	# MEM[base: _660, index: _641, offset: 0B], tmp1745
	vmovhpd	(%rdx,%r11,2), %xmm14, %xmm15	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1744, tmp1282
	vmovhpd	(%rdx), %xmm1, %xmm3	# MEM[base: _660, offset: 0B], tmp1745, tmp1285
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4	# tmp1282, tmp1285, vect_cst_.446
	vmulpd	-96(%rdi), %ymm4, %ymm5	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm5, %ymm13, %ymm8	# vect__91.450, vect__92.451, vect__92.451
	vmovsd	(%rdx,%r11), %xmm6	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp1747
	vmovsd	(%rdx,%r14), %xmm7	# MEM[base: _660, index: _641, offset: 0B], tmp1748
	vmovhpd	(%rdx,%r11,2), %xmm6, %xmm0	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1747, tmp1295
	vmovhpd	(%rdx), %xmm7, %xmm9	# MEM[base: _660, offset: 0B], tmp1748, tmp1298
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm0, %ymm9, %ymm10	# tmp1295, tmp1298, vect_cst_.446
	vmulpd	-64(%rdi), %ymm10, %ymm11	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm11, %ymm8, %ymm12	# vect__91.450, vect__92.451, vect__92.451
	vmovsd	(%rdx,%r11), %xmm13	# MEM[base: _660, index: ivtmp.621_1095, offset: 0B], tmp1750
	vmovsd	(%rdx,%r14), %xmm15	# MEM[base: _660, index: _641, offset: 0B], tmp1751
	vmovhpd	(%rdx,%r11,2), %xmm13, %xmm14	# MEM[base: _660, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1750, tmp1308
	vmovhpd	(%rdx), %xmm15, %xmm1	# MEM[base: _660, offset: 0B], tmp1751, tmp1311
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.546
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3	# tmp1308, tmp1311, vect_cst_.446
	vmulpd	-32(%rdi), %ymm3, %ymm4	# MEM[base: _680, offset: 0B], vect_cst_.446, vect__91.450
	vaddpd	%ymm4, %ymm12, %ymm0	# vect__91.450, vect__92.451, vect__92.451
	cmpl	%ecx, %r9d	# ivtmp.537, bnd.443
	ja	.L351	#,
	.p2align 4,,10
	.p2align 3
.L510:
	vhaddpd	%ymm0, %ymm0, %ymm5	# vect__92.451, vect__92.451, tmp938
	movl	-176(%rbp), %r9d	# %sfp, ratio_mult_vf.444
	vperm2f128	$1, %ymm5, %ymm5, %ymm8	#, tmp938, tmp938, tmp939
	vaddpd	%ymm8, %ymm5, %ymm6	# tmp939, tmp938, vect__92.453
	addl	%r9d, %eax	# ratio_mult_vf.444, k1
	vaddsd	%xmm6, %xmm2, %xmm2	# stmp__92.452, D__lsm.400, D__lsm.400
	cmpl	%r9d, -136(%rbp)	# ratio_mult_vf.444, %sfp
	je	.L361	#,
.L362:
	movl	-52(%rbp), %r14d	# %sfp, n
	leal	(%rbx,%rax), %r9d	#, D.17735
	movl	%r14d, %edx	# n, D.17735
	imull	%eax, %edx	# k1, D.17735
	leal	(%rdx,%r10), %ecx	#, D.17735
	movslq	%ecx, %rdi	# D.17735, D.17736
	movslq	%r9d, %rcx	# D.17735, D.17736
	movl	-56(%rbp), %r9d	# %sfp, kend
	vmovsd	0(%r13,%rdi,8), %xmm0	# *_737, *_737
	vmulsd	(%r12,%rcx,8), %xmm0, %xmm7	# *_742, *_737, D.17732
	leal	1(%rax), %ecx	#, k1
	vaddsd	%xmm7, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	%ecx, %r9d	# k1, kend
	jle	.L361	#,
	addl	%r14d, %edx	# n, D.17735
	addl	%ebx, %ecx	# ivtmp.566, D.17735
	addl	$2, %eax	#, k1
	leal	(%rdx,%r10), %edi	#, D.17735
	movslq	%ecx, %rcx	# D.17735, D.17736
	movslq	%edi, %r14	# D.17735, D.17736
	vmovsd	0(%r13,%r14,8), %xmm9	# *_754, *_754
	vmulsd	(%r12,%rcx,8), %xmm9, %xmm10	# *_759, *_754, D.17732
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
	cmpl	%eax, %r9d	# k1, kend
	jle	.L361	#,
	addl	-52(%rbp), %edx	# %sfp, D.17735
	addl	%ebx, %eax	# ivtmp.566, D.17735
	cltq
	addl	%r10d, %edx	# D.17735, D.17735
	movslq	%edx, %r10	# D.17735, D.17736
	vmovsd	0(%r13,%r10,8), %xmm11	# *_480, *_480
	vmulsd	(%r12,%rax,8), %xmm11, %xmm12	# *_485, *_480, D.17732
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17732, D__lsm.400, D__lsm.400
.L361:
	vmovsd	%xmm2, (%r8)	# D__lsm.400, MEM[base: _1012, offset: 0B]
.L357:
	addq	$8, %r8	#, ivtmp.553
	addq	$1, %rsi	#, ivtmp.561
	cmpq	-192(%rbp), %rsi	# %sfp, ivtmp.561
	jne	.L363	#,
.L356:
	addl	$1, -296(%rbp)	#, %sfp
	addl	-52(%rbp), %ebx	# %sfp, ivtmp.566
	movl	-296(%rbp), %esi	# %sfp, j1
	cmpl	-292(%rbp), %esi	# %sfp, j1
	jne	.L349	#,
	movq	%r11, %r14	# ivtmp.621, ivtmp.621
.L346:
	movl	-172(%rbp), %r8d	# %sfp, i1
	cmpl	%r8d, -80(%rbp)	# i1, %sfp
	jle	.L364	#,
	movq	-256(%rbp), %rdx	# %sfp, ivtmp.619
	movq	-264(%rbp), %rbx	# %sfp, D.17734
	movq	-400(%rbp), %rax	# %sfp, D.17734
	addq	-472(%rbp), %rax	# %sfp, D.17734
	movq	%rdx, %rcx	# ivtmp.619, D.17734
	movq	%rdx, %r9	# ivtmp.619, D.17734
	addq	-272(%rbp), %rcx	# %sfp, D.17734
	addq	-280(%rbp), %r9	# %sfp, D.17734
	addq	%rdx, %rbx	# ivtmp.619, D.17734
	addq	-344(%rbp), %rax	# %sfp, ivtmp.528
	movq	%rbx, %r12	# D.17734, D.17734
	movq	-384(%rbp), %rdi	# %sfp, ivtmp.536
	addq	%r13, %r12	# A, D.17733
	addq	-336(%rbp), %rdi	# %sfp, ivtmp.536
	addq	%r13, %rcx	# A, D.17733
	movq	%r12, -224(%rbp)	# D.17733, %sfp
	movq	%r13, %r12	# A, A
	movq	-328(%rbp), %r11	# %sfp, ivtmp.610
	addq	%r13, %r9	# A, D.17733
	movq	%rcx, -208(%rbp)	# D.17733, %sfp
	movq	%rax, -136(%rbp)	# ivtmp.528, %sfp
	movq	%r9, -216(%rbp)	# D.17733, %sfp
	.p2align 4,,10
	.p2align 3
.L365:
	movl	-292(%rbp), %r13d	# %sfp, j1
	cmpl	%r13d, -100(%rbp)	# j1, %sfp
	jle	.L371	#,
	movl	-304(%rbp), %r10d	# %sfp, ivtmp.522
	movq	-312(%rbp), %rsi	# %sfp, ivtmp.520
	movq	-320(%rbp), %rcx	# %sfp, ivtmp.515
	.p2align 4,,10
	.p2align 3
.L378:
	movl	-76(%rbp), %r8d	# %sfp, k1
	cmpl	%r8d, -56(%rbp)	# k1, %sfp
	jle	.L372	#,
	movq	%rcx, %rdx	# ivtmp.515, D.17737
	movq	-136(%rbp), %rax	# %sfp, ivtmp.528
	andl	$31, %edx	#, D.17737
	shrq	$3, %rdx	#, D.17737
	negq	%rdx	# D.17737
	andl	$3, %edx	#, D.17730
	vmovsd	(%rax,%rsi,8), %xmm2	# MEM[base: _937, index: ivtmp.520_570, step: 8, offset: 0B], D__lsm.399
	cmpl	%r15d, %edx	# niters.437, D.17730
	cmova	%r15d, %edx	# D.17730,, niters.437, prologue_after_cost_adjust.422
	cmpl	$6, %r15d	#, niters.437
	cmovbe	%r15d, %edx	# prologue_after_cost_adjust.422,, niters.437, prologue_after_cost_adjust.422
	testl	%edx, %edx	# prologue_after_cost_adjust.422
	je	.L400	#,
	vmovsd	(%rcx), %xmm13	# MEM[base: _911, offset: 0B], MEM[base: _911, offset: 0B]
	vmulsd	(%r12,%rdi,8), %xmm13, %xmm14	# MEM[base: A_64(D), index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, offset: 0B], D.17732
	movq	-112(%rbp), %r9	# %sfp, ivtmp.622
	vaddsd	%xmm14, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	movl	%r9d, %eax	# ivtmp.622, k1
	cmpl	$1, %edx	#, prologue_after_cost_adjust.422
	je	.L375	#,
	movq	-160(%rbp), %r8	# %sfp, D.17733
	movq	%r9, %rbx	# ivtmp.622, D.17734
	subq	%r11, %rbx	# ivtmp.610, D.17734
	movq	-120(%rbp), %r9	# %sfp, ivtmp.624
	vmovsd	(%rcx,%rbx,8), %xmm15	# MEM[base: _911, index: _916, step: 8, offset: 0B], MEM[base: _911, index: _916, step: 8, offset: 0B]
	vmulsd	(%r8,%rdi,8), %xmm15, %xmm1	# MEM[base: _24, index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, index: _916, step: 8, offset: 0B], D.17732
	movl	%r9d, %eax	# ivtmp.624, k1
	vaddsd	%xmm1, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	$2, %edx	#, prologue_after_cost_adjust.422
	je	.L375	#,
	movq	-168(%rbp), %rbx	# %sfp, D.17733
	movq	%r9, %rax	# ivtmp.624, D.17734
	subq	%r11, %rax	# ivtmp.610, D.17734
	movq	-128(%rbp), %r8	# %sfp, ivtmp.626
	vmovsd	(%rcx,%rax,8), %xmm3	# MEM[base: _911, index: _921, step: 8, offset: 0B], MEM[base: _911, index: _921, step: 8, offset: 0B]
	vmulsd	(%rbx,%rdi,8), %xmm3, %xmm4	# MEM[base: _946, index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, index: _921, step: 8, offset: 0B], D.17732
	movl	%r8d, %eax	# ivtmp.626, k1
	vaddsd	%xmm4, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	$3, %edx	#, prologue_after_cost_adjust.422
	je	.L375	#,
	movq	-208(%rbp), %rax	# %sfp, D.17733
	movq	%r8, %r9	# ivtmp.626, D.17734
	subq	%r11, %r9	# ivtmp.610, D.17734
	movq	-152(%rbp), %rbx	# %sfp, ivtmp.628
	vmovsd	(%rcx,%r9,8), %xmm5	# MEM[base: _911, index: _926, step: 8, offset: 0B], MEM[base: _911, index: _926, step: 8, offset: 0B]
	vmulsd	(%rax,%rdi,8), %xmm5, %xmm8	# MEM[base: _955, index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, index: _926, step: 8, offset: 0B], D.17732
	movl	%ebx, %eax	# ivtmp.628, k1
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	$4, %edx	#, prologue_after_cost_adjust.422
	je	.L375	#,
	movq	-216(%rbp), %r9	# %sfp, D.17733
	movq	%rbx, %r8	# ivtmp.628, D.17734
	subq	%r11, %r8	# ivtmp.610, D.17734
	movq	-144(%rbp), %rbx	# %sfp, ivtmp.620
	vmovsd	(%rcx,%r8,8), %xmm6	# MEM[base: _911, index: _931, step: 8, offset: 0B], MEM[base: _911, index: _931, step: 8, offset: 0B]
	vmulsd	(%r9,%rdi,8), %xmm6, %xmm0	# MEM[base: _964, index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, index: _931, step: 8, offset: 0B], D.17732
	movl	%ebx, %eax	# ivtmp.620, k1
	vaddsd	%xmm0, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	$6, %edx	#, prologue_after_cost_adjust.422
	jne	.L375	#,
	movq	-224(%rbp), %r8	# %sfp, D.17733
	movq	%rbx, %rax	# ivtmp.620, D.17734
	subq	%r11, %rax	# ivtmp.610, D.17734
	vmovsd	(%rcx,%rax,8), %xmm7	# MEM[base: _911, index: _910, step: 8, offset: 0B], MEM[base: _911, index: _910, step: 8, offset: 0B]
	movl	-104(%rbp), %eax	# %sfp, D.17730
	vmulsd	(%r8,%rdi,8), %xmm7, %xmm9	# MEM[base: _152, index: ivtmp.536_646, step: 8, offset: 0B], MEM[base: _911, index: _910, step: 8, offset: 0B], D.17732
	addl	$6, %eax	#, k1
	vaddsd	%xmm9, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
.L375:
	cmpl	%r15d, %edx	# niters.437, prologue_after_cost_adjust.422
	je	.L376	#,
.L374:
	movl	%r15d, %r9d	# niters.437, niters.424
	movl	%edx, %ebx	# prologue_after_cost_adjust.422, prolog_loop_adjusted_niters.423
	subl	%edx, %r9d	# prologue_after_cost_adjust.422, niters.424
	leal	-4(%r9), %r8d	#, D.17730
	movl	%r9d, -200(%rbp)	# niters.424, %sfp
	shrl	$2, %r8d	#, D.17730
	leal	1(%r8), %r9d	#, bnd.425
	movl	%r9d, -184(%rbp)	# bnd.425, %sfp
	sall	$2, %r9d	#, ratio_mult_vf.426
	movl	%r9d, -192(%rbp)	# ratio_mult_vf.426, %sfp
	leal	-1(%r15), %r9d	#, D.17730
	subl	%edx, %r9d	# prologue_after_cost_adjust.422, D.17730
	cmpl	$2, %r9d	#, D.17730
	jbe	.L377	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17734
	andl	$3, %r8d	#, tmp1242
	movl	$1, -176(%rbp)	#, %sfp
	movq	-88(%rbp), %r9	# %sfp, B
	imulq	%rbx, %rdx	# prolog_loop_adjusted_niters.423, D.17734
	addq	%rsi, %rbx	# ivtmp.520, D.17734
	leaq	(%r9,%rbx,8), %rbx	#, ivtmp.501
	movq	-72(%rbp), %r9	# %sfp, D.17736
	addq	%rdi, %rdx	# ivtmp.536, D.17734
	leaq	(%r14,%rdx,8), %rdx	#, D.17734
	addq	%r12, %rdx	# A, ivtmp.505
	vmovsd	(%rdx,%r9), %xmm12	# MEM[base: _569, index: _550, offset: 0B], tmp1888
	leaq	32(%rbx), %r9	#, ivtmp.501
	vmovsd	(%rdx,%r14), %xmm10	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp1886
	vmovhpd	(%rdx), %xmm12, %xmm13	# MEM[base: _569, offset: 0B], tmp1888, tmp1377
	vmovhpd	(%rdx,%r14,2), %xmm10, %xmm11	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1886, tmp1374
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.505
	cmpl	$1, -184(%rbp)	#, %sfp
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1374, tmp1377, vect_cst_.428
	vmulpd	(%rbx), %ymm14, %ymm0	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__119.433
	jbe	.L511	#,
	testl	%r8d, %r8d	# tmp1242
	je	.L522	#,
	cmpl	$1, %r8d	#, tmp1242
	je	.L480	#,
	cmpl	$2, %r8d	#, tmp1242
	je	.L481	#,
	movq	-72(%rbp), %r8	# %sfp, D.17736
	leaq	64(%rbx), %r9	#, ivtmp.501
	movl	$2, -176(%rbp)	#, %sfp
	vmovsd	(%rdx,%r14), %xmm15	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp2032
	vmovhpd	(%rdx,%r14,2), %xmm15, %xmm1	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2032, tmp1463
	vmovsd	(%rdx,%r8), %xmm3	# MEM[base: _569, index: _550, offset: 0B], tmp2034
	vmovhpd	(%rdx), %xmm3, %xmm4	# MEM[base: _569, offset: 0B], tmp2034, tmp1466
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.505
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5	# tmp1463, tmp1466, vect_cst_.428
	vmulpd	32(%rbx), %ymm5, %ymm8	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm8, %ymm0, %ymm0	# vect__118.432, vect__119.433, vect__119.433
.L481:
	movq	-72(%rbp), %rbx	# %sfp, D.17736
	addq	$32, %r9	#, ivtmp.501
	vmovsd	(%rdx,%r14), %xmm6	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp2036
	addl	$1, -176(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm6, %xmm7	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2036, tmp1472
	vmovsd	(%rdx,%rbx), %xmm9	# MEM[base: _569, index: _550, offset: 0B], tmp2038
	vmovhpd	(%rdx), %xmm9, %xmm10	# MEM[base: _569, offset: 0B], tmp2038, tmp1475
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.505
	vinsertf128	$0x1, %xmm7, %ymm10, %ymm11	# tmp1472, tmp1475, vect_cst_.428
	vmulpd	-32(%r9), %ymm11, %ymm12	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm12, %ymm0, %ymm0	# vect__118.432, vect__119.433, vect__119.433
.L480:
	movq	-72(%rbp), %r8	# %sfp, D.17736
	addq	$32, %r9	#, ivtmp.501
	vmovsd	(%rdx,%r14), %xmm13	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp2041
	addl	$1, -176(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm13, %xmm14	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2041, tmp1481
	movl	-176(%rbp), %ebx	# %sfp, ivtmp.496
	vmovsd	(%rdx,%r8), %xmm15	# MEM[base: _569, index: _550, offset: 0B], tmp2043
	vmovhpd	(%rdx), %xmm15, %xmm1	# MEM[base: _569, offset: 0B], tmp2043, tmp1484
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.505
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3	# tmp1481, tmp1484, vect_cst_.428
	vmulpd	-32(%r9), %ymm3, %ymm4	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm4, %ymm0, %ymm0	# vect__118.432, vect__119.433, vect__119.433
	cmpl	%ebx, -184(%rbp)	# ivtmp.496, %sfp
	jbe	.L511	#,
.L522:
	movq	-72(%rbp), %r8	# %sfp, D.17736
.L366:
	movq	-64(%rbp), %rbx	# %sfp, D.17736
	subq	$-128, %r9	#, ivtmp.501
	vmovsd	(%rdx,%r14), %xmm5	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp1831
	vmovsd	(%rdx,%r8), %xmm6	# MEM[base: _569, index: _550, offset: 0B], tmp1832
	addl	$4, -176(%rbp)	#, %sfp
	vmovhpd	(%rdx,%r14,2), %xmm5, %xmm8	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1831, tmp1015
	vmovhpd	(%rdx), %xmm6, %xmm7	# MEM[base: _569, offset: 0B], tmp1832, tmp1018
	addq	%rbx, %rdx	# D.17736, ivtmp.505
	vinsertf128	$0x1, %xmm8, %ymm7, %ymm9	# tmp1015, tmp1018, vect_cst_.428
	vmovsd	(%rdx,%r14), %xmm12	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp1834
	vmulpd	-128(%r9), %ymm9, %ymm10	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm10, %ymm0, %ymm11	# vect__118.432, vect__119.433, vect__119.433
	vmovsd	(%rdx,%r8), %xmm14	# MEM[base: _569, index: _550, offset: 0B], tmp1835
	vmovhpd	(%rdx,%r14,2), %xmm12, %xmm13	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1834, tmp1334
	vmovhpd	(%rdx), %xmm14, %xmm15	# MEM[base: _569, offset: 0B], tmp1835, tmp1337
	addq	%rbx, %rdx	# D.17736, ivtmp.505
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm1	# tmp1334, tmp1337, vect_cst_.428
	vmovsd	(%rdx,%r14), %xmm0	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp1837
	vmulpd	-96(%r9), %ymm1, %ymm3	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm3, %ymm11, %ymm4	# vect__118.432, vect__119.433, vect__119.433
	vmovsd	(%rdx,%r8), %xmm8	# MEM[base: _569, index: _550, offset: 0B], tmp1838
	vmovhpd	(%rdx,%r14,2), %xmm0, %xmm5	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1837, tmp1347
	vmovhpd	(%rdx), %xmm8, %xmm6	# MEM[base: _569, offset: 0B], tmp1838, tmp1350
	addq	%rbx, %rdx	# D.17736, ivtmp.505
	vmovsd	(%rdx,%r14), %xmm11	# MEM[base: _569, index: ivtmp.621_1095, offset: 0B], tmp1840
	vinsertf128	$0x1, %xmm5, %ymm6, %ymm7	# tmp1347, tmp1350, vect_cst_.428
	vmulpd	-64(%r9), %ymm7, %ymm9	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm9, %ymm4, %ymm10	# vect__118.432, vect__119.433, vect__119.433
	vmovsd	(%rdx,%r8), %xmm13	# MEM[base: _569, index: _550, offset: 0B], tmp1841
	vmovhpd	(%rdx,%r14,2), %xmm11, %xmm12	# MEM[base: _569, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1840, tmp1360
	vmovhpd	(%rdx), %xmm13, %xmm14	# MEM[base: _569, offset: 0B], tmp1841, tmp1363
	addq	%rbx, %rdx	# D.17736, ivtmp.505
	movl	-176(%rbp), %ebx	# %sfp, ivtmp.496
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1360, tmp1363, vect_cst_.428
	vmulpd	-32(%r9), %ymm15, %ymm1	# MEM[base: _7, offset: 0B], vect_cst_.428, vect__118.432
	vaddpd	%ymm1, %ymm10, %ymm0	# vect__118.432, vect__119.433, vect__119.433
	cmpl	%ebx, -184(%rbp)	# ivtmp.496, %sfp
	ja	.L366	#,
	.p2align 4,,10
	.p2align 3
.L511:
	vhaddpd	%ymm0, %ymm0, %ymm3	# vect__119.433, vect__119.433, tmp1030
	movl	-192(%rbp), %edx	# %sfp, ratio_mult_vf.426
	vperm2f128	$1, %ymm3, %ymm3, %ymm4	#, tmp1030, tmp1030, tmp1031
	vaddpd	%ymm4, %ymm3, %ymm0	# tmp1031, tmp1030, vect__119.435
	addl	%edx, %eax	# ratio_mult_vf.426, k1
	vaddsd	%xmm0, %xmm2, %xmm2	# stmp__119.434, D__lsm.399, D__lsm.399
	cmpl	-200(%rbp), %edx	# %sfp, ratio_mult_vf.426
	je	.L376	#,
.L377:
	movl	-52(%rbp), %ebx	# %sfp, n
	movl	-172(%rbp), %r9d	# %sfp, i1
	movl	%ebx, %edx	# n, D.17735
	imull	%eax, %edx	# k1, D.17735
	leal	(%rdx,%r9), %r8d	#, D.17735
	movslq	%r8d, %r9	# D.17735, D.17736
	vmovsd	(%r12,%r9,8), %xmm5	# *_608, *_608
	leal	(%r10,%rax), %r8d	#, D.17735
	movq	-88(%rbp), %r9	# %sfp, B
	movslq	%r8d, %r8	# D.17735, D.17736
	vmulsd	(%r9,%r8,8), %xmm5, %xmm8	# *_613, *_608, D.17732
	leal	1(%rax), %r8d	#, k1
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	%r8d, -56(%rbp)	# k1, %sfp
	jle	.L376	#,
	addl	%ebx, %edx	# n, D.17735
	movl	-172(%rbp), %ebx	# %sfp, i1
	addl	%r10d, %r8d	# ivtmp.522, D.17735
	movslq	%r8d, %r8	# D.17735, D.17736
	addl	$2, %eax	#, k1
	leal	(%rbx,%rdx), %r9d	#, D.17735
	movslq	%r9d, %rbx	# D.17735, D.17736
	movq	-88(%rbp), %r9	# %sfp, B
	vmovsd	(%r12,%rbx,8), %xmm6	# *_625, *_625
	vmulsd	(%r9,%r8,8), %xmm6, %xmm7	# *_630, *_625, D.17732
	vaddsd	%xmm7, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
	cmpl	%eax, -56(%rbp)	# k1, %sfp
	jle	.L376	#,
	addl	-52(%rbp), %edx	# %sfp, D.17735
	addl	%r10d, %eax	# ivtmp.522, D.17735
	addl	-172(%rbp), %edx	# %sfp, D.17735
	cltq
	movslq	%edx, %rdx	# D.17735, D.17736
	vmovsd	(%r12,%rdx,8), %xmm9	# *_352, *_352
	vmulsd	(%r9,%rax,8), %xmm9, %xmm10	# *_357, *_352, D.17732
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17732, D__lsm.399, D__lsm.399
.L376:
	movq	-136(%rbp), %rax	# %sfp, ivtmp.528
	vmovsd	%xmm2, (%rax,%rsi,8)	# D__lsm.399, MEM[base: _937, index: ivtmp.520_570, step: 8, offset: 0B]
.L372:
	addl	$1, %r13d	#, j1
	addq	%r14, %rcx	# ivtmp.621, ivtmp.515
	addq	-96(%rbp), %rsi	# %sfp, ivtmp.520
	addl	-52(%rbp), %r10d	# %sfp, ivtmp.522
	cmpl	-100(%rbp), %r13d	# %sfp, j1
	jne	.L378	#,
.L371:
	addl	$1, -172(%rbp)	#, %sfp
	addq	$1, %rdi	#, ivtmp.536
	movl	-172(%rbp), %r10d	# %sfp, i1
	addq	$8, -136(%rbp)	#, %sfp
	cmpl	-80(%rbp), %r10d	# %sfp, i1
	jne	.L365	#,
	movq	%r12, %r13	# A, A
.L364:
	movl	-80(%rbp), %esi	# %sfp, i1
	cmpl	%esi, -300(%rbp)	# i1, %sfp
	jle	.L379	#,
	movq	-256(%rbp), %r9	# %sfp, ivtmp.619
	movslq	%esi, %rdi	# i1, D.17734
	movq	-376(%rbp), %rcx	# %sfp, ivtmp.608
	movq	-264(%rbp), %rdx	# %sfp, D.17734
	movq	%r9, %rbx	# ivtmp.619, D.17734
	addq	-280(%rbp), %rbx	# %sfp, D.17734
	movq	%r9, %r12	# ivtmp.619, D.17734
	addq	-272(%rbp), %r12	# %sfp, D.17734
	addq	%r9, %rdx	# ivtmp.619, D.17734
	leaq	(%rcx,%rdi,8), %r8	#, D.17734
	addq	-344(%rbp), %r8	# %sfp, ivtmp.487
	movq	%rdx, %r11	# D.17734, D.17734
	addq	%r13, %rbx	# A, D.17733
	addq	-336(%rbp), %rdi	# %sfp, ivtmp.495
	addq	%r13, %r11	# A, D.17733
	movq	%rbx, -208(%rbp)	# D.17733, %sfp
	movq	-328(%rbp), %rbx	# %sfp, ivtmp.610
	addq	%r13, %r12	# A, D.17733
	movq	%r12, -200(%rbp)	# D.17733, %sfp
	movq	%r13, %r12	# A, A
	movq	%r8, -136(%rbp)	# ivtmp.487, %sfp
	movq	%r11, -216(%rbp)	# D.17733, %sfp
	.p2align 4,,10
	.p2align 3
.L380:
	movl	-292(%rbp), %r13d	# %sfp, j1
	cmpl	%r13d, -100(%rbp)	# j1, %sfp
	jle	.L386	#,
	movl	-304(%rbp), %r11d	# %sfp, ivtmp.481
	movq	-312(%rbp), %rsi	# %sfp, ivtmp.479
	movq	-320(%rbp), %rcx	# %sfp, ivtmp.474
	.p2align 4,,10
	.p2align 3
.L393:
	movl	-76(%rbp), %r10d	# %sfp, k1
	cmpl	%r10d, -56(%rbp)	# k1, %sfp
	jle	.L387	#,
	movq	%rcx, %rdx	# ivtmp.474, D.17737
	movq	-136(%rbp), %r8	# %sfp, ivtmp.487
	andl	$31, %edx	#, D.17737
	shrq	$3, %rdx	#, D.17737
	negq	%rdx	# D.17737
	andl	$3, %edx	#, D.17730
	vmovsd	(%r8,%rsi,8), %xmm2	# MEM[base: _874, index: ivtmp.479_730, step: 8, offset: 0B], D__lsm.398
	cmpl	%r15d, %edx	# niters.437, D.17730
	cmova	%r15d, %edx	# D.17730,, niters.437, prolog_loop_niters.403
	cmpl	$6, %r15d	#, niters.437
	cmovbe	%r15d, %edx	# prolog_loop_niters.403,, niters.437, prolog_loop_niters.403
	testl	%edx, %edx	# prolog_loop_niters.403
	je	.L401	#,
	vmovsd	(%rcx), %xmm11	# MEM[base: _657, offset: 0B], MEM[base: _657, offset: 0B]
	vmulsd	(%r12,%rdi,8), %xmm11, %xmm12	# MEM[base: A_64(D), index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, offset: 0B], D.17732
	movq	-112(%rbp), %r9	# %sfp, ivtmp.622
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	movl	%r9d, %eax	# ivtmp.622, k1
	cmpl	$1, %edx	#, prolog_loop_niters.403
	je	.L390	#,
	movq	-160(%rbp), %r8	# %sfp, D.17733
	movq	%r9, %r10	# ivtmp.622, D.17734
	subq	%rbx, %r10	# ivtmp.610, D.17734
	movq	-120(%rbp), %r9	# %sfp, ivtmp.624
	vmovsd	(%rcx,%r10,8), %xmm13	# MEM[base: _657, index: _298, step: 8, offset: 0B], MEM[base: _657, index: _298, step: 8, offset: 0B]
	vmulsd	(%r8,%rdi,8), %xmm13, %xmm14	# MEM[base: _66, index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, index: _298, step: 8, offset: 0B], D.17732
	movl	%r9d, %eax	# ivtmp.624, k1
	vaddsd	%xmm14, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	$2, %edx	#, prolog_loop_niters.403
	je	.L390	#,
	movq	-168(%rbp), %r10	# %sfp, D.17733
	movq	%r9, %rax	# ivtmp.624, D.17734
	subq	%rbx, %rax	# ivtmp.610, D.17734
	movq	-128(%rbp), %r8	# %sfp, ivtmp.626
	vmovsd	(%rcx,%rax,8), %xmm15	# MEM[base: _657, index: _562, step: 8, offset: 0B], MEM[base: _657, index: _562, step: 8, offset: 0B]
	vmulsd	(%r10,%rdi,8), %xmm15, %xmm1	# MEM[base: _883, index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, index: _562, step: 8, offset: 0B], D.17732
	movl	%r8d, %eax	# ivtmp.626, k1
	vaddsd	%xmm1, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	$3, %edx	#, prolog_loop_niters.403
	je	.L390	#,
	movq	-200(%rbp), %rax	# %sfp, D.17733
	movq	%r8, %r9	# ivtmp.626, D.17734
	subq	%rbx, %r9	# ivtmp.610, D.17734
	movq	-152(%rbp), %r10	# %sfp, ivtmp.628
	vmovsd	(%rcx,%r9,8), %xmm3	# MEM[base: _657, index: _401, step: 8, offset: 0B], MEM[base: _657, index: _401, step: 8, offset: 0B]
	vmulsd	(%rax,%rdi,8), %xmm3, %xmm4	# MEM[base: _892, index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, index: _401, step: 8, offset: 0B], D.17732
	movl	%r10d, %eax	# ivtmp.628, k1
	vaddsd	%xmm4, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	$4, %edx	#, prolog_loop_niters.403
	je	.L390	#,
	movq	-208(%rbp), %r9	# %sfp, D.17733
	movq	%r10, %r8	# ivtmp.628, D.17734
	subq	%rbx, %r8	# ivtmp.610, D.17734
	movq	-144(%rbp), %r10	# %sfp, ivtmp.620
	vmovsd	(%rcx,%r8,8), %xmm0	# MEM[base: _657, index: _868, step: 8, offset: 0B], MEM[base: _657, index: _868, step: 8, offset: 0B]
	vmulsd	(%r9,%rdi,8), %xmm0, %xmm5	# MEM[base: _901, index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, index: _868, step: 8, offset: 0B], D.17732
	movl	%r10d, %eax	# ivtmp.620, k1
	vaddsd	%xmm5, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	$6, %edx	#, prolog_loop_niters.403
	jne	.L390	#,
	movq	-216(%rbp), %r8	# %sfp, D.17733
	movq	%r10, %rax	# ivtmp.620, D.17734
	subq	%rbx, %rax	# ivtmp.610, D.17734
	vmovsd	(%rcx,%rax,8), %xmm8	# MEM[base: _657, index: _672, step: 8, offset: 0B], MEM[base: _657, index: _672, step: 8, offset: 0B]
	movl	-104(%rbp), %eax	# %sfp, D.17730
	vmulsd	(%r8,%rdi,8), %xmm8, %xmm6	# MEM[base: _576, index: ivtmp.495_80, step: 8, offset: 0B], MEM[base: _657, index: _672, step: 8, offset: 0B], D.17732
	addl	$6, %eax	#, k1
	vaddsd	%xmm6, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
.L390:
	cmpl	%r15d, %edx	# niters.437, prolog_loop_niters.403
	je	.L391	#,
.L389:
	movl	%r15d, %r8d	# niters.437, niters.406
	movl	%edx, %r10d	# prolog_loop_niters.403, prolog_loop_adjusted_niters.405
	subl	%edx, %r8d	# prolog_loop_niters.403, niters.406
	movl	%r8d, -184(%rbp)	# niters.406, %sfp
	subl	$4, %r8d	#, D.17730
	shrl	$2, %r8d	#, D.17730
	leal	1(%r8), %r9d	#, bnd.407
	movl	%r9d, -172(%rbp)	# bnd.407, %sfp
	sall	$2, %r9d	#, ratio_mult_vf.408
	movl	%r9d, -176(%rbp)	# ratio_mult_vf.408, %sfp
	leal	-1(%r15), %r9d	#, D.17730
	subl	%edx, %r9d	# prolog_loop_niters.403, D.17730
	cmpl	$2, %r9d	#, D.17730
	jbe	.L392	#,
	movq	-96(%rbp), %rdx	# %sfp, D.17734
	andl	$3, %r8d	#, tmp1237
	movq	-88(%rbp), %r9	# %sfp, B
	imulq	%r10, %rdx	# prolog_loop_adjusted_niters.405, D.17734
	addq	%rsi, %r10	# ivtmp.479, D.17734
	leaq	(%r9,%r10,8), %r10	#, ivtmp.460
	movq	-72(%rbp), %r9	# %sfp, D.17736
	movq	%r10, -192(%rbp)	# ivtmp.460, %sfp
	addq	$32, %r10	#, ivtmp.460
	addq	%rdi, %rdx	# ivtmp.495, D.17734
	leaq	(%r14,%rdx,8), %rdx	#, D.17734
	addq	%r12, %rdx	# A, ivtmp.464
	vmovsd	(%rdx,%r9), %xmm10	# MEM[base: _603, index: _602, offset: 0B], tmp1969
	movl	$1, %r9d	#, ivtmp.455
	vmovsd	(%rdx,%r14), %xmm7	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp1967
	vmovhpd	(%rdx), %xmm10, %xmm11	# MEM[base: _603, offset: 0B], tmp1969, tmp1430
	vmovhpd	(%rdx,%r14,2), %xmm7, %xmm9	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1967, tmp1427
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm9, %ymm11, %ymm12	# tmp1427, tmp1430, vect_cst_.410
	vmulpd	-32(%r10), %ymm12, %ymm0	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__146.415
	cmpl	-172(%rbp), %r9d	# %sfp, ivtmp.455
	jnb	.L512	#,
	testl	%r8d, %r8d	# tmp1237
	je	.L519	#,
	cmpl	$1, %r8d	#, tmp1237
	je	.L478	#,
	cmpl	$2, %r8d	#, tmp1237
	je	.L479	#,
	movq	-72(%rbp), %r10	# %sfp, D.17736
	movl	$2, %r9d	#, ivtmp.455
	vmovsd	(%rdx,%r14), %xmm13	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp2017
	vmovhpd	(%rdx,%r14,2), %xmm13, %xmm14	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2017, tmp1436
	vmovsd	(%rdx,%r10), %xmm15	# MEM[base: _603, index: _602, offset: 0B], tmp2019
	movq	-192(%rbp), %r10	# %sfp, ivtmp.460
	vmovhpd	(%rdx), %xmm15, %xmm1	# MEM[base: _603, offset: 0B], tmp2019, tmp1439
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3	# tmp1436, tmp1439, vect_cst_.410
	vmulpd	32(%r10), %ymm3, %ymm4	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm4, %ymm0, %ymm0	# vect__145.414, vect__146.415, vect__146.415
	addq	$64, %r10	#, ivtmp.460
.L479:
	movq	-72(%rbp), %r8	# %sfp, D.17736
	addl	$1, %r9d	#, ivtmp.455
	addq	$32, %r10	#, ivtmp.460
	vmovsd	(%rdx,%r14), %xmm5	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp2023
	vmovhpd	(%rdx,%r14,2), %xmm5, %xmm8	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2023, tmp1445
	vmovsd	(%rdx,%r8), %xmm6	# MEM[base: _603, index: _602, offset: 0B], tmp2025
	vmovhpd	(%rdx), %xmm6, %xmm7	# MEM[base: _603, offset: 0B], tmp2025, tmp1448
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm8, %ymm7, %ymm9	# tmp1445, tmp1448, vect_cst_.410
	vmulpd	-32(%r10), %ymm9, %ymm10	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm10, %ymm0, %ymm0	# vect__145.414, vect__146.415, vect__146.415
.L478:
	movq	-72(%rbp), %r8	# %sfp, D.17736
	addl	$1, %r9d	#, ivtmp.455
	addq	$32, %r10	#, ivtmp.460
	vmovsd	(%rdx,%r14), %xmm11	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp2027
	vmovhpd	(%rdx,%r14,2), %xmm11, %xmm12	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp2027, tmp1454
	vmovsd	(%rdx,%r8), %xmm13	# MEM[base: _603, index: _602, offset: 0B], tmp2029
	vmovhpd	(%rdx), %xmm13, %xmm14	# MEM[base: _603, offset: 0B], tmp2029, tmp1457
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15	# tmp1454, tmp1457, vect_cst_.410
	vmulpd	-32(%r10), %ymm15, %ymm1	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm1, %ymm0, %ymm0	# vect__145.414, vect__146.415, vect__146.415
	cmpl	-172(%rbp), %r9d	# %sfp, ivtmp.455
	jnb	.L512	#,
.L381:
	vmovsd	(%rdx,%r14), %xmm3	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp1913
	addl	$4, %r9d	#, ivtmp.455
	subq	$-128, %r10	#, ivtmp.460
	vmovsd	(%rdx,%r8), %xmm5	# MEM[base: _603, index: _602, offset: 0B], tmp1914
	vmovhpd	(%rdx,%r14,2), %xmm3, %xmm4	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1913, tmp1090
	vmovhpd	(%rdx), %xmm5, %xmm8	# MEM[base: _603, offset: 0B], tmp1914, tmp1093
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm4, %ymm8, %ymm6	# tmp1090, tmp1093, vect_cst_.410
	vmulpd	-128(%r10), %ymm6, %ymm7	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm7, %ymm0, %ymm9	# vect__145.414, vect__146.415, vect__146.415
	vmovsd	(%rdx,%r14), %xmm10	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp1916
	vmovsd	(%rdx,%r8), %xmm12	# MEM[base: _603, index: _602, offset: 0B], tmp1917
	vmovhpd	(%rdx,%r14,2), %xmm10, %xmm11	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1916, tmp1387
	vmovhpd	(%rdx), %xmm12, %xmm13	# MEM[base: _603, offset: 0B], tmp1917, tmp1390
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm11, %ymm13, %ymm14	# tmp1387, tmp1390, vect_cst_.410
	vmulpd	-96(%r10), %ymm14, %ymm15	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm15, %ymm9, %ymm1	# vect__145.414, vect__146.415, vect__146.415
	vmovsd	(%rdx,%r14), %xmm0	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp1919
	vmovsd	(%rdx,%r8), %xmm3	# MEM[base: _603, index: _602, offset: 0B], tmp1920
	vmovhpd	(%rdx,%r14,2), %xmm0, %xmm4	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1919, tmp1400
	vmovhpd	(%rdx), %xmm3, %xmm5	# MEM[base: _603, offset: 0B], tmp1920, tmp1403
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm4, %ymm5, %ymm8	# tmp1400, tmp1403, vect_cst_.410
	vmulpd	-64(%r10), %ymm8, %ymm6	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm6, %ymm1, %ymm7	# vect__145.414, vect__146.415, vect__146.415
	vmovsd	(%rdx,%r14), %xmm9	# MEM[base: _603, index: ivtmp.621_1095, offset: 0B], tmp1922
	vmovsd	(%rdx,%r8), %xmm11	# MEM[base: _603, index: _602, offset: 0B], tmp1923
	vmovhpd	(%rdx,%r14,2), %xmm9, %xmm10	# MEM[base: _603, index: ivtmp.621_1095, step: 2, offset: 0B], tmp1922, tmp1413
	vmovhpd	(%rdx), %xmm11, %xmm12	# MEM[base: _603, offset: 0B], tmp1923, tmp1416
	addq	-64(%rbp), %rdx	# %sfp, ivtmp.464
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp1413, tmp1416, vect_cst_.410
	vmulpd	-32(%r10), %ymm13, %ymm14	# MEM[base: _764, offset: 0B], vect_cst_.410, vect__145.414
	vaddpd	%ymm14, %ymm7, %ymm0	# vect__145.414, vect__146.415, vect__146.415
	cmpl	-172(%rbp), %r9d	# %sfp, ivtmp.455
	jb	.L381	#,
	.p2align 4,,10
	.p2align 3
.L512:
	vhaddpd	%ymm0, %ymm0, %ymm15	# vect__146.415, vect__146.415, tmp1105
	movl	-176(%rbp), %edx	# %sfp, ratio_mult_vf.408
	vperm2f128	$1, %ymm15, %ymm15, %ymm1	#, tmp1105, tmp1105, tmp1106
	vaddpd	%ymm1, %ymm15, %ymm0	# tmp1106, tmp1105, vect__146.417
	addl	%edx, %eax	# ratio_mult_vf.408, k1
	vaddsd	%xmm0, %xmm2, %xmm2	# stmp__146.416, D__lsm.398, D__lsm.398
	cmpl	-184(%rbp), %edx	# %sfp, ratio_mult_vf.408
	je	.L391	#,
.L392:
	movl	-52(%rbp), %r10d	# %sfp, n
	movl	-80(%rbp), %r9d	# %sfp, i1
	movl	%r10d, %edx	# n, D.17735
	imull	%eax, %edx	# k1, D.17735
	leal	(%rdx,%r9), %r8d	#, D.17735
	movslq	%r8d, %r9	# D.17735, D.17736
	vmovsd	(%r12,%r9,8), %xmm4	# *_252, *_252
	leal	(%rax,%r11), %r8d	#, D.17735
	movq	-88(%rbp), %r9	# %sfp, B
	movslq	%r8d, %r8	# D.17735, D.17736
	vmulsd	(%r9,%r8,8), %xmm4, %xmm3	# *_40, *_252, D.17732
	leal	1(%rax), %r8d	#, k1
	vaddsd	%xmm3, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	%r8d, -56(%rbp)	# k1, %sfp
	jle	.L391	#,
	addl	%r10d, %edx	# n, D.17735
	movl	-80(%rbp), %r10d	# %sfp, i1
	addl	%r11d, %r8d	# ivtmp.481, D.17735
	movslq	%r8d, %r8	# D.17735, D.17736
	addl	$2, %eax	#, k1
	leal	(%r10,%rdx), %r9d	#, D.17735
	movslq	%r9d, %r10	# D.17735, D.17736
	movq	-88(%rbp), %r9	# %sfp, B
	vmovsd	(%r12,%r10,8), %xmm5	# *_302, *_302
	vmulsd	(%r9,%r8,8), %xmm5, %xmm8	# *_328, *_302, D.17732
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
	cmpl	%eax, -56(%rbp)	# k1, %sfp
	jle	.L391	#,
	addl	-52(%rbp), %edx	# %sfp, D.17735
	addl	%r11d, %eax	# ivtmp.481, D.17735
	addl	-80(%rbp), %edx	# %sfp, D.17735
	cltq
	movq	-88(%rbp), %r10	# %sfp, B
	movslq	%edx, %rdx	# D.17735, D.17736
	vmovsd	(%r12,%rdx,8), %xmm6	# *_277, *_277
	vmulsd	(%r10,%rax,8), %xmm6, %xmm7	# *_272, *_277, D.17732
	vaddsd	%xmm7, %xmm2, %xmm2	# D.17732, D__lsm.398, D__lsm.398
.L391:
	movq	-136(%rbp), %rax	# %sfp, ivtmp.487
	vmovsd	%xmm2, (%rax,%rsi,8)	# D__lsm.398, MEM[base: _874, index: ivtmp.479_730, step: 8, offset: 0B]
.L387:
	addl	$1, %r13d	#, j1
	addq	%r14, %rcx	# ivtmp.621, ivtmp.474
	addq	-96(%rbp), %rsi	# %sfp, ivtmp.479
	addl	-52(%rbp), %r11d	# %sfp, ivtmp.481
	cmpl	-100(%rbp), %r13d	# %sfp, j1
	jne	.L393	#,
.L386:
	addl	$1, -80(%rbp)	#, %sfp
	addq	$1, %rdi	#, ivtmp.495
	movl	-80(%rbp), %r11d	# %sfp, i1
	addq	$8, -136(%rbp)	#, %sfp
	cmpl	-300(%rbp), %r11d	# %sfp, i1
	jne	.L380	#,
	movq	%r12, %r13	# A, A
.L379:
	addq	$32, -384(%rbp)	#, %sfp
	addq	$256, -400(%rbp)	#, %sfp
	movq	-384(%rbp), %rsi	# %sfp, ivtmp.591
	subq	$256, -352(%rbp)	#, %sfp
	cmpq	-464(%rbp), %rsi	# %sfp, ivtmp.591
	jne	.L394	#,
	movl	-444(%rbp), %r9d	# %sfp, j1
	movl	%r15d, %ebx	# niters.437, niters.437
	movl	-448(%rbp), %edi	# %sfp, D.17735
	movl	-392(%rbp), %ecx	# %sfp, D.17730
	movq	-408(%rbp), %r8	# %sfp, D.17734
	movq	-88(%rbp), %r12	# %sfp, B
	movl	%r9d, -388(%rbp)	# j1, %sfp
	addl	%ecx, -420(%rbp)	# D.17730, %sfp
	addq	%r8, -416(%rbp)	# D.17734, %sfp
	cmpl	%edi, %r9d	# D.17735, j1
	jne	.L395	#,
	movq	%r12, %r15	# B, B
	movq	-64(%rbp), %rax	# %sfp, D.17736
	movq	%r13, %rbx	# A, A
	movq	%r14, %r12	# ivtmp.621, ivtmp.621
	movq	-408(%rbp), %r11	# %sfp, D.17734
	movq	%r15, %r14	# B, B
	movl	-392(%rbp), %edx	# %sfp, D.17730
	subq	$256, -376(%rbp)	#, %sfp
	movq	-480(%rbp), %r13	# %sfp, tmp877
	addl	%edx, -424(%rbp)	# D.17730, %sfp
	movq	-376(%rbp), %r10	# %sfp, ivtmp.608
	addq	%rax, -336(%rbp)	# D.17736, %sfp
	addq	$32, -328(%rbp)	#, %sfp
	addq	%r11, -264(%rbp)	# D.17734, %sfp
	addq	%r13, -256(%rbp)	# tmp877, %sfp
	addq	$32, -144(%rbp)	#, %sfp
	addq	%r11, -432(%rbp)	# D.17734, %sfp
	addq	$32, -112(%rbp)	#, %sfp
	addq	%r11, -440(%rbp)	# D.17734, %sfp
	addq	$32, -120(%rbp)	#, %sfp
	addq	%r11, -272(%rbp)	# D.17734, %sfp
	addq	$32, -128(%rbp)	#, %sfp
	addq	%r11, -280(%rbp)	# D.17734, %sfp
	addq	$32, -152(%rbp)	#, %sfp
	cmpq	-488(%rbp), %r10	# %sfp, ivtmp.608
	jne	.L396	#,
	vzeroupper
	addq	$448, %rsp	#,
	popq	%rbx	#
	.cfi_restore 3
	popq	%rcx	#
	.cfi_restore 10
	.cfi_def_cfa 10, 0
	popq	%r12	#
	.cfi_restore 12
	popq	%r13	#
	.cfi_restore 13
	popq	%r14	#
	.cfi_restore 14
	popq	%r15	#
	.cfi_restore 15
	popq	%rbp	#
	.cfi_restore 6
	leaq	-8(%rcx), %rsp	#,
	.cfi_def_cfa 7, 8
.L530:
	ret
	.p2align 4,,10
	.p2align 3
.L401:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L389	#
	.p2align 4,,10
	.p2align 3
.L399:
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L359	#
	.p2align 4,,10
	.p2align 3
.L400:
	movl	-76(%rbp), %eax	# %sfp, k1
	jmp	.L374	#
	.p2align 4,,10
	.p2align 3
.L523:
	movq	-72(%rbp), %r14	# %sfp, D.17736
	jmp	.L351	#
	.p2align 4,,10
	.p2align 3
.L519:
	movq	-72(%rbp), %r8	# %sfp, D.17736
	jmp	.L381	#
	.cfi_endproc
.LFE2290:
	.size	avx_dgemm_slow, .-avx_dgemm_slow
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	do_4x4_block_fast
	.type	do_4x4_block_fast, @function
do_4x4_block_fast:
.LFB2288:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	movslq	%edi, %rdi	# n, D.17758
	andq	$-32, %rsp	#,
	vmovupd	(%r8), %ymm3	#* C, c0
	pushq	-8(%r10)	#
	salq	$3, %rdi	#, D.17758
	pushq	%rbp	#
	leaq	(%rcx,%rdi), %r9	#, B
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	leaq	(%r9,%rdi), %r10	#, B
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	leaq	(%r8,%rdi), %rbx	#, C
	leaq	(%rbx,%rdi), %r12	#, C
	vmovupd	(%rbx), %ymm5	#* C, c1
	leaq	(%r12,%rdi), %r13	#, C
	vmovupd	(%r12), %ymm4	#* C, c2
	vmovupd	0(%r13), %ymm2	#* C, c3
	testl	%esi, %esi	# kdepth
	jle	.L532	#,
	leaq	(%r10,%rdi), %r11	#, D.17757
	vmovupd	(%rdx), %ymm0	#* A, tmp120
	addq	%rdi, %rdx	# D.17758, A
	leal	-1(%rsi), %eax	#, tmp140
	vbroadcastsd	(%rcx), %ymm1	# MEM[base: B_20(D), index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	(%r9), %ymm7	# MEM[base: B_21, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	andl	$1, %eax	#, tmp142
	vbroadcastsd	(%r10), %ymm9	# MEM[base: B_22, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	movl	%eax, %r14d	# tmp142, tmp142
	vmulpd	%ymm1, %ymm0, %ymm6	# D.17759, tmp120, tmp123
	movl	$1, %eax	#, ivtmp.633
	vbroadcastsd	(%r11), %ymm11	# MEM[base: _5, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm7, %ymm0, %ymm8	# D.17759, tmp120, tmp126
	vaddpd	%ymm6, %ymm3, %ymm3	# tmp123, c0, c0
	vmulpd	%ymm9, %ymm0, %ymm10	# D.17759, tmp120, tmp129
	vaddpd	%ymm8, %ymm5, %ymm5	# tmp126, c1, c1
	vmulpd	%ymm11, %ymm0, %ymm12	# D.17759, tmp120, tmp132
	vaddpd	%ymm10, %ymm4, %ymm4	# tmp129, c2, c2
	vaddpd	%ymm12, %ymm2, %ymm2	# tmp132, c3, c3
	cmpl	$1, %esi	#, kdepth
	jle	.L532	#,
	testl	%r14d, %r14d	# tmp142
	je	.L533	#,
	vmovupd	(%rdx), %ymm13	#* A, tmp178
	movl	$2, %eax	#, ivtmp.633
	addq	%rdi, %rdx	# D.17758, A
	vbroadcastsd	8(%rcx), %ymm14	# MEM[base: B_20(D), index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	8(%r9), %ymm0	# MEM[base: B_21, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	8(%r10), %ymm6	# MEM[base: B_22, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm14, %ymm13, %ymm15	# D.17759, tmp178, tmp184
	vaddpd	%ymm15, %ymm3, %ymm3	# tmp184, c0, c0
	vbroadcastsd	8(%r11), %ymm8	# MEM[base: _5, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm0, %ymm13, %ymm1	# D.17759, tmp178, tmp186
	vaddpd	%ymm1, %ymm5, %ymm5	# tmp186, c1, c1
	vmulpd	%ymm6, %ymm13, %ymm7	# D.17759, tmp178, tmp188
	vaddpd	%ymm7, %ymm4, %ymm4	# tmp188, c2, c2
	vmulpd	%ymm8, %ymm13, %ymm9	# D.17759, tmp178, tmp190
	vaddpd	%ymm9, %ymm2, %ymm2	# tmp190, c3, c3
	cmpl	$2, %esi	#, kdepth
	jle	.L532	#,
	.p2align 4,,10
	.p2align 3
.L533:
	vmovupd	(%rdx), %ymm10	#* A, tmp146
	leaq	1(%rax), %r14	#, tmp143
	addq	%rdi, %rdx	# D.17758, A
	vbroadcastsd	(%rcx,%rax,8), %ymm11	# MEM[base: B_20(D), index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	(%r9,%rax,8), %ymm14	# MEM[base: B_21, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm11, %ymm10, %ymm12	# D.17759, tmp146, tmp153
	vbroadcastsd	(%r11,%rax,8), %ymm1	# MEM[base: _5, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vaddpd	%ymm12, %ymm3, %ymm13	# tmp153, c0, c0
	vbroadcastsd	(%r10,%rax,8), %ymm3	# MEM[base: B_22, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm14, %ymm10, %ymm15	# D.17759, tmp146, tmp156
	vaddpd	%ymm15, %ymm5, %ymm6	# tmp156, c1, c1
	addq	$2, %rax	#, ivtmp.633
	vmulpd	%ymm1, %ymm10, %ymm5	# D.17759, tmp146, tmp162
	vaddpd	%ymm5, %ymm2, %ymm8	# tmp162, c3, c3
	vmovupd	(%rdx), %ymm9	#* A, tmp165
	addq	%rdi, %rdx	# D.17758, A
	vmulpd	%ymm3, %ymm10, %ymm0	# D.17759, tmp146, tmp159
	vaddpd	%ymm0, %ymm4, %ymm7	# tmp159, c2, c2
	vbroadcastsd	(%r9,%r14,8), %ymm10	# MEM[base: B_21, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	(%rcx,%r14,8), %ymm4	# MEM[base: B_20(D), index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vbroadcastsd	(%r10,%r14,8), %ymm12	# MEM[base: B_22, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm10, %ymm9, %ymm11	# D.17759, tmp165, tmp173
	vaddpd	%ymm11, %ymm6, %ymm5	# tmp173, c1, c1
	vbroadcastsd	(%r11,%r14,8), %ymm14	# MEM[base: _5, index: ivtmp.633_7, step: 8, offset: 0B], D.17759
	vmulpd	%ymm4, %ymm9, %ymm2	# D.17759, tmp165, tmp171
	vaddpd	%ymm2, %ymm13, %ymm3	# tmp171, c0, c0
	vmulpd	%ymm12, %ymm9, %ymm13	# D.17759, tmp165, tmp175
	vaddpd	%ymm13, %ymm7, %ymm4	# tmp175, c2, c2
	vmulpd	%ymm14, %ymm9, %ymm15	# D.17759, tmp165, tmp177
	vaddpd	%ymm15, %ymm8, %ymm2	# tmp177, c3, c3
	cmpl	%eax, %esi	# ivtmp.633, kdepth
	jg	.L533	#,
.L532:
	vmovupd	%ymm3, (%r8)	# c0,* C
	vmovupd	%ymm5, (%rbx)	# c1,* C
	vmovupd	%ymm4, (%r12)	# c2,* C
	vmovupd	%ymm2, 0(%r13)	# c3,* C
	vzeroupper
	popq	%rbx	#
	popq	%rdx	#
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%rbp	#
	leaq	-8(%rdx), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2288:
	.size	do_4x4_block_fast, .-do_4x4_block_fast
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	test
	.type	test, @function
test:
.LFB2291:
	.cfi_startproc
	testl	%edi, %edi	# n
	jle	.L645	#,
	leaq	32(%rcx), %r8	#, D.17798
	leaq	32(%rsi), %rax	#, D.17798
	cmpq	%r8, %rsi	# D.17798, A
	setnb	%r9b	#, D.17797
	cmpq	%rax, %rcx	# D.17798, C
	setnb	%r10b	#, D.17797
	orl	%r9d, %r10d	# D.17797, D.17797
	cmpl	$8, %edi	#, n
	seta	%r11b	#, D.17797
	testb	%r11b, %r10b	# D.17797, D.17797
	je	.L553	#,
	leaq	32(%rdx), %r9	#, D.17798
	cmpq	%r8, %rdx	# D.17798, B
	setnb	%r8b	#, D.17797
	cmpq	%r9, %rcx	# D.17798, C
	setnb	%al	#, D.17797
	orb	%al, %r8b	# D.17797, tmp316
	je	.L553	#,
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rsi, %r13	# A, D.17802
	andl	$31, %r13d	#, D.17802
	pushq	%r12	#
	shrq	$3, %r13	#, D.17802
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	negq	%r13	# D.17802
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	andl	$3, %r13d	#, D.17801
	cmpl	%r13d, %edi	# D.17801, n
	cmovbe	%edi, %r13d	# n,, prolog_loop_niters.647
	xorl	%r9d, %r9d	# i
	testl	%r13d, %r13d	# prolog_loop_niters.647
	je	.L545	#,
	vmovsd	(%rdx), %xmm0	# *B_12(D), *B_12(D)
	movb	$1, %r9b	#, i
	vaddsd	(%rsi), %xmm0, %xmm1	# *A_9(D), *B_12(D), D.17799
	vmovsd	%xmm1, (%rcx)	# D.17799, *C_7(D)
	cmpl	$1, %r13d	#, prolog_loop_niters.647
	je	.L545	#,
	vmovsd	8(%rdx), %xmm2	# MEM[(double *)B_12(D) + 8B], MEM[(double *)B_12(D) + 8B]
	movb	$2, %r9b	#, i
	vaddsd	8(%rsi), %xmm2, %xmm3	# MEM[(double *)A_9(D) + 8B], MEM[(double *)B_12(D) + 8B], D.17799
	vmovsd	%xmm3, 8(%rcx)	# D.17799, MEM[(double *)C_7(D) + 8B]
	cmpl	$3, %r13d	#, prolog_loop_niters.647
	jne	.L545	#,
	vmovsd	16(%rdx), %xmm4	# MEM[(double *)B_12(D) + 16B], MEM[(double *)B_12(D) + 16B]
	movb	$3, %r9b	#, i
	vaddsd	16(%rsi), %xmm4, %xmm5	# MEM[(double *)A_9(D) + 16B], MEM[(double *)B_12(D) + 16B], D.17799
	vmovsd	%xmm5, 16(%rcx)	# D.17799, MEM[(double *)C_7(D) + 16B]
.L545:
	movl	%r13d, %eax	# prolog_loop_niters.647, prolog_loop_adjusted_niters.648
	movl	%edi, %r11d	# n, niters.649
	movl	$32, %r8d	#, ivtmp.672
	salq	$3, %rax	#, D.17804
	subl	%r13d, %r11d	# prolog_loop_niters.647, niters.649
	leaq	(%rdx,%rax), %r10	#, vectp_B.657
	leaq	(%rsi,%rax), %r13	#, vectp_A.654
	vmovupd	(%r10), %xmm6	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10), %ymm6, %ymm7	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addq	%rcx, %rax	# C, vectp_C.661
	vaddpd	0(%r13), %ymm7, %ymm8	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	leal	-4(%r11), %r14d	#, D.17801
	shrl	$2, %r14d	#, D.17801
	leal	1(%r14), %r12d	#, bnd.650
	movl	%r14d, %r15d	# D.17801, tmp214
	movl	$1, %r14d	#, ivtmp.669
	leal	0(,%r12,4), %ebx	#, ratio_mult_vf.651
	andl	$7, %r15d	#, tmp214
	vmovups	%xmm8, (%rax)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm8, 16(%rax)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	cmpl	%r12d, %r14d	# bnd.650, ivtmp.669
	jnb	.L639	#,
	testl	%r15d, %r15d	# tmp214
	je	.L547	#,
	cmpl	$1, %r15d	#, tmp214
	je	.L615	#,
	cmpl	$2, %r15d	#, tmp214
	je	.L616	#,
	cmpl	$3, %r15d	#, tmp214
	je	.L617	#,
	cmpl	$4, %r15d	#, tmp214
	je	.L618	#,
	cmpl	$5, %r15d	#, tmp214
	je	.L619	#,
	cmpl	$6, %r15d	#, tmp214
	je	.L620	#,
	vmovupd	32(%r10), %xmm9	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 48(%r10), %ymm9, %ymm10	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	movl	$2, %r14d	#, ivtmp.669
	movl	$64, %r8d	#, ivtmp.672
	vaddpd	32(%r13), %ymm10, %ymm11	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm11, 32(%rax)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm11, 48(%rax)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
.L620:
	vmovupd	(%r10,%r8), %xmm12	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm12, %ymm13	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm13, %ymm14	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm14, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm14, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
.L619:
	vmovupd	(%r10,%r8), %xmm15	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm15, %ymm0	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm0, %ymm1	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm1, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm1, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
.L618:
	vmovupd	(%r10,%r8), %xmm2	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm2, %ymm3	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm3, %ymm4	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm4, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm4, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
.L617:
	vmovupd	(%r10,%r8), %xmm5	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm5, %ymm6	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm6, %ymm7	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm7, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm7, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
.L616:
	vmovupd	(%r10,%r8), %xmm8	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm8, %ymm9	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm9, %ymm10	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm10, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm10, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
.L615:
	vmovupd	(%r10,%r8), %xmm11	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm11, %ymm12	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$1, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm12, %ymm13	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm13, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm13, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$32, %r8	#, ivtmp.672
	cmpl	%r12d, %r14d	# bnd.650, ivtmp.669
	jnb	.L639	#,
.L547:
	vmovupd	(%r10,%r8), %xmm14	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 16(%r10,%r8), %ymm14, %ymm15	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	addl	$8, %r14d	#, ivtmp.669
	vaddpd	0(%r13,%r8), %ymm15, %ymm0	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm0, (%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm0, 16(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	32(%r10,%r8), %xmm1	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 48(%r10,%r8), %ymm1, %ymm2	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	32(%r13,%r8), %ymm2, %ymm3	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm3, 32(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm3, 48(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	64(%r10,%r8), %xmm4	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 80(%r10,%r8), %ymm4, %ymm5	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	64(%r13,%r8), %ymm5, %ymm6	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm6, 64(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm6, 80(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	96(%r10,%r8), %xmm7	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 112(%r10,%r8), %ymm7, %ymm8	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	96(%r13,%r8), %ymm8, %ymm9	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm9, 96(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm9, 112(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	128(%r10,%r8), %xmm10	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 144(%r10,%r8), %ymm10, %ymm11	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	128(%r13,%r8), %ymm11, %ymm12	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm12, 128(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm12, 144(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	160(%r10,%r8), %xmm13	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 176(%r10,%r8), %ymm13, %ymm14	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	160(%r13,%r8), %ymm14, %ymm15	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm15, 160(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm15, 176(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	192(%r10,%r8), %xmm0	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 208(%r10,%r8), %ymm0, %ymm1	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	192(%r13,%r8), %ymm1, %ymm2	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm2, 192(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm2, 208(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vmovupd	224(%r10,%r8), %xmm3	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B]
	vinsertf128	$0x1, 240(%r10,%r8), %ymm3, %ymm4	# MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], MEM[base: vectp_B.657_110, index: ivtmp.672_37, offset: 0B], vect__14.658
	vaddpd	224(%r13,%r8), %ymm4, %ymm5	# MEM[base: vectp_A.654_105, index: ivtmp.672_37, offset: 0B], vect__14.658, vect__15.659
	vmovups	%xmm5, 224(%rax,%r8)	#, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	vextractf128	$0x1, %ymm5, 240(%rax,%r8)	# vect__15.659, MEM[base: vectp_C.661_116, index: ivtmp.672_37, offset: 0B]
	addq	$256, %r8	#, ivtmp.672
	cmpl	%r12d, %r14d	# bnd.650, ivtmp.669
	jb	.L547	#,
	.p2align 4,,10
	.p2align 3
.L639:
	addl	%ebx, %r9d	# ratio_mult_vf.651, i
	cmpl	%ebx, %r11d	# ratio_mult_vf.651, niters.649
	je	.L641	#,
	leal	1(%r9), %eax	#, i
	movslq	%r9d, %r12	# i, D.17800
	vmovsd	(%rdx,%r12,8), %xmm6	# *_6, *_6
	vaddsd	(%rsi,%r12,8), %xmm6, %xmm7	# *_46, *_6, D.17799
	vmovsd	%xmm7, (%rcx,%r12,8)	# D.17799, *_73
	cmpl	%eax, %edi	# i, n
	jle	.L641	#,
	cltq
	addl	$2, %r9d	#, i
	vmovsd	(%rdx,%rax,8), %xmm8	# *_127, *_127
	vaddsd	(%rsi,%rax,8), %xmm8, %xmm9	# *_125, *_127, D.17799
	vmovsd	%xmm9, (%rcx,%rax,8)	# D.17799, *_124
	cmpl	%r9d, %edi	# i, n
	jle	.L641	#,
	movslq	%r9d, %rdi	# i, D.17800
	vmovsd	(%rdx,%rdi,8), %xmm10	# *_89, *_89
	vaddsd	(%rsi,%rdi,8), %xmm10, %xmm11	# *_87, *_89, D.17799
	vmovsd	%xmm11, (%rcx,%rdi,8)	# D.17799, *_86
	vzeroupper
.L642:
	popq	%rbx	#
	.cfi_restore 3
	popq	%rdx	#
	.cfi_restore 10
	.cfi_def_cfa 10, 0
	popq	%r12	#
	.cfi_restore 12
	popq	%r13	#
	.cfi_restore 13
	popq	%r14	#
	.cfi_restore 14
	popq	%r15	#
	.cfi_restore 15
	popq	%rbp	#
	.cfi_restore 6
	leaq	-8(%rdx), %rsp	#,
	.cfi_def_cfa 7, 8
.L645:
	ret
	.p2align 4,,10
	.p2align 3
.L641:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	vzeroupper
	jmp	.L642	#
	.p2align 4,,10
	.p2align 3
.L553:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	vmovsd	(%rdx), %xmm12	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	leal	-1(%rdi), %r10d	#, tmp208
	movl	$1, %r9d	#, ivtmp.663
	vaddsd	(%rsi), %xmm12, %xmm13	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	andl	$7, %r10d	#, tmp210
	vmovsd	%xmm13, (%rcx)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	cmpl	$1, %edi	#, n
	jle	.L646	#,
	testl	%r10d, %r10d	# tmp210
	je	.L544	#,
	cmpl	$1, %r10d	#, tmp210
	je	.L609	#,
	cmpl	$2, %r10d	#, tmp210
	je	.L610	#,
	cmpl	$3, %r10d	#, tmp210
	je	.L611	#,
	cmpl	$4, %r10d	#, tmp210
	je	.L612	#,
	cmpl	$5, %r10d	#, tmp210
	je	.L613	#,
	cmpl	$6, %r10d	#, tmp210
	je	.L614	#,
	vmovsd	8(%rdx), %xmm14	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	movl	$2, %r9d	#, ivtmp.663
	vaddsd	8(%rsi), %xmm14, %xmm15	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm15, 8(%rcx)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
.L614:
	vmovsd	(%rdx,%r9,8), %xmm0	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm0, %xmm1	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm1, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
.L613:
	vmovsd	(%rdx,%r9,8), %xmm2	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm2, %xmm3	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm3, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
.L612:
	vmovsd	(%rdx,%r9,8), %xmm4	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm4, %xmm5	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm5, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
.L611:
	vmovsd	(%rdx,%r9,8), %xmm6	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm6, %xmm7	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm7, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
.L610:
	vmovsd	(%rdx,%r9,8), %xmm8	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm8, %xmm9	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm9, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
.L609:
	vmovsd	(%rdx,%r9,8), %xmm10	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r9,8), %xmm10, %xmm11	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm11, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	addq	$1, %r9	#, ivtmp.663
	cmpl	%r9d, %edi	# ivtmp.663, n
	jle	.L647	#,
.L544:
	vmovsd	(%rdx,%r9,8), %xmm12	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	leaq	1(%r9), %r8	#, tmp211
	vaddsd	(%rsi,%r9,8), %xmm12, %xmm13	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	leaq	2(%r9), %r11	#, ivtmp.663
	leaq	3(%r9), %rax	#, ivtmp.663
	leaq	4(%r9), %r10	#, ivtmp.663
	vmovsd	%xmm13, (%rcx,%r9,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%r8,8), %xmm14	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r8,8), %xmm14, %xmm15	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm15, (%rcx,%r8,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%r11,8), %xmm0	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	leaq	5(%r9), %r8	#, ivtmp.663
	vaddsd	(%rsi,%r11,8), %xmm0, %xmm1	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm1, (%rcx,%r11,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%rax,8), %xmm2	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	leaq	6(%r9), %r11	#, ivtmp.663
	vaddsd	(%rsi,%rax,8), %xmm2, %xmm3	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm3, (%rcx,%rax,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%r10,8), %xmm4	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	leaq	7(%r9), %rax	#, ivtmp.663
	addq	$8, %r9	#, ivtmp.663
	vaddsd	(%rsi,%r10,8), %xmm4, %xmm5	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm5, (%rcx,%r10,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%r8,8), %xmm6	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r8,8), %xmm6, %xmm7	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm7, (%rcx,%r8,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%r11,8), %xmm8	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%r11,8), %xmm8, %xmm9	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm9, (%rcx,%r11,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vmovsd	(%rdx,%rax,8), %xmm10	# MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B]
	vaddsd	(%rsi,%rax,8), %xmm10, %xmm11	# MEM[base: A_9(D), index: ivtmp.663_102, step: 8, offset: 0B], MEM[base: B_12(D), index: ivtmp.663_102, step: 8, offset: 0B], D.17799
	vmovsd	%xmm11, (%rcx,%rax,8)	# D.17799, MEM[base: C_7(D), index: ivtmp.663_102, step: 8, offset: 0B]
	cmpl	%r9d, %edi	# ivtmp.663, n
	jg	.L544	#,
	ret
	.p2align 4,,10
	.p2align 3
.L646:
	ret
	.p2align 4,,10
	.p2align 3
.L647:
	ret
	.cfi_endproc
.LFE2291:
	.size	test, .-test
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.rodata.str1.1
.LC12:
	.string	"%s\nSize:\tGflops\n"
.LC15:
	.string	"%d\t%.3g\n"
.LC18:
	.string	"error in matrix multiply"
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.globl	benchmark
	.type	benchmark, @function
benchmark:
.LFB2292:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%r8, %r14	# A, A
	pushq	%r13	#
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%r9, %r13	# B, B
	pushq	%r12	#
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%ecx, %r12d	# nsizes, nsizes
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdx, %rbx	# test_sizes, test_sizes
	movq	%rdi, %rdx	# desc,
	movl	$1, %edi	#,
	subq	$192, %rsp	#,
	movq	(%r10), %rax	# C, C
	movq	%rsi, -224(%rbp)	# f, %sfp
	movl	$.LC12, %esi	#,
	movq	%rax, -104(%rbp)	# C, %sfp
	movq	%fs:40, %rax	#, tmp911
	movq	%rax, -56(%rbp)	# tmp911, D.17958
	xorl	%eax, %eax	# tmp911
	call	__printf_chk	#
	testl	%r12d, %r12d	# nsizes
	jle	.L648	#,
	leal	-1(%r12), %edx	#, D.17951
	movq	%r14, %r15	# A, A
	movq	%rbx, -216(%rbp)	# ivtmp.784, %sfp
	movq	%r13, %r14	# B, B
	leaq	4(%rbx,%rdx,4), %rcx	#, D.17955
	movq	%rbx, %r12	# ivtmp.784, ivtmp.784
	movq	%rcx, -232(%rbp)	# D.17955, %sfp
.L685:
	movl	(%r12), %r12d	# MEM[base: _77, offset: 0B], n
	movl	%r12d, %esi	# n, D.17949
	imull	%r12d, %esi	# n, D.17949
	movl	%esi, -204(%rbp)	# D.17949, %sfp
	testl	%esi, %esi	# D.17949
	je	.L650	#,
	leaq	8(%r15), %r13	#, ivtmp.779
	subl	$1, %esi	#, D.17951
	leaq	8(,%rsi,8), %rbx	#, D.17951
	leaq	-8(%rbx), %r9	#, tmp517
	leaq	(%r15,%rbx), %r8	#, D.17955
	shrq	$3, %r9	#, tmp515
	andl	$7, %r9d	#, tmp518
	movq	%r8, -88(%rbp)	# D.17955, %sfp
	movq	%r9, -96(%rbp)	# tmp518, %sfp
	call	drand48	#
	cmpq	-88(%rbp), %r13	# %sfp, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	movq	-96(%rbp), %r11	# %sfp, tmp518
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	vmovsd	%xmm1, (%r15)	# D.17947, MEM[base: _84, offset: 0B]
	je	.L976	#,
	testq	%r11, %r11	# tmp518
	je	.L651	#,
	cmpq	$1, %r11	#, tmp518
	je	.L917	#,
	cmpq	$2, %r11	#, tmp518
	je	.L918	#,
	cmpq	$3, %r11	#, tmp518
	je	.L919	#,
	cmpq	$4, %r11	#, tmp518
	je	.L920	#,
	cmpq	$5, %r11	#, tmp518
	je	.L921	#,
	cmpq	$6, %r11	#, tmp518
	je	.L922	#,
	call	drand48	#
	leaq	16(%r15), %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, 8(%r15)	# D.17947, MEM[base: _84, offset: 0B]
.L922:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
.L921:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
.L920:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
.L919:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
.L918:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
.L917:
	call	drand48	#
	addq	$8, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vmovsd	%xmm15, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	cmpq	-88(%rbp), %r13	# %sfp, ivtmp.779
	je	.L976	#,
.L651:
	call	drand48	#
	addq	$64, %r13	#, ivtmp.779
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	vmovsd	%xmm1, -64(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, -56(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, -48(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, -40(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, -32(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, -24(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, -16(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vmovsd	%xmm15, -8(%r13)	# D.17947, MEM[base: _84, offset: 0B]
	cmpq	-88(%rbp), %r13	# %sfp, ivtmp.779
	jne	.L651	#,
.L976:
	leaq	(%r14,%rbx), %r10	#, D.17955
	movq	%r10, -88(%rbp)	# D.17955, %sfp
	leaq	-8(%rbx), %r13	#, tmp512
	call	drand48	#
	leaq	8(%r14), %rbx	#, ivtmp.774
	shrq	$3, %r13	#, tmp510
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	andl	$7, %r13d	#, tmp513
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	vmovsd	%xmm1, (%r14)	# D.17947, MEM[base: _91, offset: 0B]
	cmpq	-88(%rbp), %rbx	# %sfp, ivtmp.774
	je	.L977	#,
	testq	%r13, %r13	# tmp513
	je	.L652	#,
	cmpq	$1, %r13	#, tmp513
	je	.L911	#,
	cmpq	$2, %r13	#, tmp513
	je	.L912	#,
	cmpq	$3, %r13	#, tmp513
	je	.L913	#,
	cmpq	$4, %r13	#, tmp513
	je	.L914	#,
	cmpq	$5, %r13	#, tmp513
	je	.L915	#,
	cmpq	$6, %r13	#, tmp513
	je	.L916	#,
	call	drand48	#
	leaq	16(%r14), %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, 8(%r14)	# D.17947, MEM[base: _91, offset: 0B]
.L916:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
.L915:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
.L914:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
.L913:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
.L912:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
.L911:
	call	drand48	#
	addq	$8, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vmovsd	%xmm15, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	cmpq	-88(%rbp), %rbx	# %sfp, ivtmp.774
	je	.L977	#,
.L652:
	call	drand48	#
	addq	$64, %rbx	#, ivtmp.774
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	vmovsd	%xmm1, -64(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, -56(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, -48(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, -40(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, -32(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, -24(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, -16(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vmovsd	%xmm15, -8(%rbx)	# D.17947, MEM[base: _91, offset: 0B]
	cmpq	-88(%rbp), %rbx	# %sfp, ivtmp.774
	jne	.L652	#,
.L977:
	movl	-204(%rbp), %eax	# %sfp, D.17949
	movl	$1, %ebx	#, ivtmp.767
	subl	$1, %eax	#, tmp506
	movl	%eax, %r13d	# tmp506, tmp508
	call	drand48	#
	andl	$7, %r13d	#, tmp508
	movq	-104(%rbp), %rdi	# %sfp, C
	cmpl	$1, -204(%rbp)	#, %sfp
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	vmovsd	%xmm1, (%rdi)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	jle	.L650	#,
	testl	%r13d, %r13d	# tmp508
	je	.L1003	#,
	cmpl	$1, %r13d	#, tmp508
	je	.L905	#,
	cmpl	$2, %r13d	#, tmp508
	je	.L906	#,
	cmpl	$3, %r13d	#, tmp508
	je	.L907	#,
	cmpl	$4, %r13d	#, tmp508
	je	.L908	#,
	cmpl	$5, %r13d	#, tmp508
	je	.L909	#,
	cmpl	$6, %r13d	#, tmp508
	je	.L910	#,
	call	drand48	#
	movq	-104(%rbp), %rdx	# %sfp, C
	movl	$2, %ebx	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, 8(%rdx)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
.L910:
	call	drand48	#
	movq	-104(%rbp), %rcx	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, (%rcx,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
.L909:
	call	drand48	#
	movq	-104(%rbp), %rsi	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, (%rsi,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
.L908:
	call	drand48	#
	movq	-104(%rbp), %r8	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, (%r8,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
.L907:
	call	drand48	#
	movq	-104(%rbp), %r9	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, (%r9,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
.L906:
	call	drand48	#
	movq	-104(%rbp), %r11	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, (%r11,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
.L905:
	call	drand48	#
	movq	-104(%rbp), %r10	# %sfp, C
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	movq	%r10, %r13	# C, C
	vmovsd	%xmm15, (%r10,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	addq	$1, %rbx	#, ivtmp.767
	cmpl	%ebx, -204(%rbp)	# ivtmp.767, %sfp
	jle	.L650	#,
.L653:
	call	drand48	#
	vaddsd	%xmm0, %xmm0, %xmm0	# D.17947, D.17947, D.17947
	leaq	1(%rbx), %rax	#, tmp509
	vsubsd	.LC3(%rip), %xmm0, %xmm1	#, D.17947, D.17947
	movq	%rax, -88(%rbp)	# tmp509, %sfp
	vmovsd	%xmm1, 0(%r13,%rbx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %rdi	# %sfp, tmp509
	leaq	2(%rbx), %rdx	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm2	# D.17947, D.17947, D.17947
	movq	%rdx, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vmovsd	%xmm3, 0(%r13,%rdi,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %rcx	# %sfp, ivtmp.767
	leaq	3(%rbx), %rsi	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm4	# D.17947, D.17947, D.17947
	movq	%rsi, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm4, %xmm5	#, D.17947, D.17947
	vmovsd	%xmm5, 0(%r13,%rcx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %r8	# %sfp, ivtmp.767
	leaq	4(%rbx), %r9	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm6	# D.17947, D.17947, D.17947
	movq	%r9, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm6, %xmm7	#, D.17947, D.17947
	vmovsd	%xmm7, 0(%r13,%r8,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %r11	# %sfp, ivtmp.767
	leaq	5(%rbx), %r10	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm8	# D.17947, D.17947, D.17947
	movq	%r10, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vmovsd	%xmm9, 0(%r13,%r11,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %rax	# %sfp, ivtmp.767
	leaq	6(%rbx), %rdi	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm10	# D.17947, D.17947, D.17947
	movq	%rdi, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vmovsd	%xmm11, 0(%r13,%rax,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %rdx	# %sfp, ivtmp.767
	leaq	7(%rbx), %rcx	#, ivtmp.767
	addq	$8, %rbx	#, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm12	# D.17947, D.17947, D.17947
	movq	%rcx, -88(%rbp)	# ivtmp.767, %sfp
	vsubsd	.LC3(%rip), %xmm12, %xmm13	#, D.17947, D.17947
	vmovsd	%xmm13, 0(%r13,%rdx,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	call	drand48	#
	movq	-88(%rbp), %rsi	# %sfp, ivtmp.767
	vaddsd	%xmm0, %xmm0, %xmm14	# D.17947, D.17947, D.17947
	vsubsd	.LC3(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vmovsd	%xmm15, 0(%r13,%rsi,8)	# D.17947, MEM[base: C_25(D), index: ivtmp.767_378, step: 8, offset: 0B]
	cmpl	%ebx, -204(%rbp)	# ivtmp.767, %sfp
	jg	.L653	#,
.L650:
	vxorpd	%xmm0, %xmm0, %xmm0	# D.17947
	vcvtsi2sd	%r12d, %xmm0, %xmm1	# n, D.17947, D.17947
	movq	-224(%rbp), %r13	# %sfp, f
	movl	$1, -88(%rbp)	#, %sfp
	vmovsd	%xmm1, -128(%rbp)	# D.17947, %sfp
	.p2align 4,,10
	.p2align 3
.L655:
	movq	-104(%rbp), %rbx	# %sfp, C
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	movq	%rbx, %rcx	# C,
	call	*%r13	# f
	leaq	-80(%rbp), %rsi	#, tmp931
	movl	$1, %edi	#,
	call	clock_gettime	#
	movl	-88(%rbp), %r8d	# %sfp, n_iterations
	vxorpd	%xmm4, %xmm4, %xmm4	# D.17947
	vxorpd	%xmm2, %xmm2, %xmm2	# D.17947
	vcvtsi2sdq	-72(%rbp), %xmm4, %xmm5	# t.tv_nsec, D.17947, D.17947
	movq	%rbx, %rcx	# C,
	vmulsd	.LC1(%rip), %xmm5, %xmm6	#, D.17947, D.17947
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	vcvtsi2sdq	-80(%rbp), %xmm2, %xmm3	# t.tv_sec, D.17947, D.17947
	movl	%r12d, %edi	# n,
	subl	$1, %r8d	#, tmp502
	movl	$1, %ebx	#, it
	andl	$7, %r8d	#, tmp504
	movl	%r8d, -120(%rbp)	# tmp504, %sfp
	vmovsd	%xmm3, -96(%rbp)	# D.17947, %sfp
	vmovsd	%xmm6, -112(%rbp)	# D.17947, %sfp
	call	*%r13	# f
	cmpl	-88(%rbp), %ebx	# %sfp, it
	movl	-120(%rbp), %r9d	# %sfp, tmp504
	je	.L978	#,
	testl	%r9d, %r9d	# tmp504
	je	.L654	#,
	cmpl	$1, %r9d	#, tmp504
	je	.L899	#,
	cmpl	$2, %r9d	#, tmp504
	je	.L900	#,
	cmpl	$3, %r9d	#, tmp504
	je	.L901	#,
	cmpl	$4, %r9d	#, tmp504
	je	.L902	#,
	cmpl	$5, %r9d	#, tmp504
	je	.L903	#,
	cmpl	$6, %r9d	#, tmp504
	je	.L904	#,
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movl	$2, %ebx	#, it
.L904:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
.L903:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
.L902:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
.L901:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
.L900:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
.L899:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	addl	$1, %ebx	#, it
	cmpl	-88(%rbp), %ebx	# %sfp, it
	je	.L978	#,
.L654:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	addl	$8, %ebx	#, it
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	call	*%r13	# f
	cmpl	-88(%rbp), %ebx	# %sfp, it
	jne	.L654	#,
.L978:
	leaq	-80(%rbp), %rsi	#, tmp937
	movl	$1, %edi	#,
	call	clock_gettime	#
	vxorpd	%xmm7, %xmm7, %xmm7	# D.17947
	vxorpd	%xmm9, %xmm9, %xmm9	# D.17947
	vmovsd	.LC13(%rip), %xmm15	#, tmp940
	vcvtsi2sdq	-80(%rbp), %xmm7, %xmm8	# t.tv_sec, D.17947, D.17947
	vcvtsi2sdq	-72(%rbp), %xmm9, %xmm10	# t.tv_nsec, D.17947, D.17947
	vmulsd	.LC1(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vsubsd	-96(%rbp), %xmm11, %xmm12	# %sfp, D.17947, D.17947
	leal	(%rbx,%rbx), %r11d	#, n_iterations
	vaddsd	%xmm8, %xmm12, %xmm13	# D.17947, D.17947, D.17947
	vsubsd	-112(%rbp), %xmm13, %xmm14	# %sfp, D.17947, seconds
	vcomisd	%xmm14, %xmm15	# seconds, tmp940
	jbe	.L1013	#,
	movl	%r11d, -88(%rbp)	# n_iterations, %sfp
	jmp	.L655	#
.L1013:
	vmovsd	-128(%rbp), %xmm0	# %sfp, D.17947
	vxorpd	%xmm4, %xmm4, %xmm4	# D.17947
	movl	%r12d, %edx	# n,
	movl	$.LC15, %esi	#,
	vcvtsi2sd	%ebx, %xmm4, %xmm5	# it, D.17947, D.17947
	movl	$1, %edi	#,
	vmulsd	%xmm0, %xmm0, %xmm1	# D.17947, D.17947, D.17947
	movl	$1, %eax	#,
	vmulsd	.LC14(%rip), %xmm1, %xmm2	#, D.17947, D.17947
	vmulsd	%xmm0, %xmm2, %xmm3	# D.17947, D.17947, D.17947
	vmulsd	%xmm5, %xmm3, %xmm6	# D.17947, D.17947, D.17947
	vdivsd	%xmm14, %xmm6, %xmm0	# seconds, D.17947, Gflops_s
	call	__printf_chk	#
	movslq	-204(%rbp), %r13	# %sfp, D.17953
	xorl	%esi, %esi	#
	movq	-104(%rbp), %rdi	# %sfp,
	salq	$3, %r13	#, D.17953
	movq	%r13, %rdx	# D.17953,
	call	memset	#
	movq	%r13, %rdi	# D.17953,
	call	malloc	#
	xorl	%esi, %esi	#
	movq	%r13, %rdx	# D.17953,
	movq	%rax, %rdi	# Co,
	movq	%rax, -200(%rbp)	# Co, %sfp
	call	memset	#
	testl	%r12d, %r12d	# n
	jle	.L671	#,
	leal	-1(%r12), %r9d	#, D.17948
	movslq	%r12d, %rax	# n, D.17953
	movq	%r15, %rbx	# A, ivtmp.758
	movq	%r15, -112(%rbp)	# A, %sfp
	movq	%rax, %rdi	# D.17953, D.17953
	movq	%rax, -88(%rbp)	# D.17953, %sfp
	movq	-200(%rbp), %r10	# %sfp, Co
	leaq	0(,%rax,8), %r13	#, D.17953
	movq	%rdi, %r8	# D.17953, D.17953
	movq	%r14, -96(%rbp)	# B, %sfp
	leal	(%r12,%r12), %eax	#, D.17948
	movq	%r13, %r11	# D.17953, D.17953
	salq	$5, %r8	#, D.17953
	movq	$0, -152(%rbp)	#, %sfp
	movslq	%eax, %rcx	# D.17948, D.17951
	addl	%r12d, %eax	# n, D.17948
	negq	%r11	# D.17953
	movq	%r8, -120(%rbp)	# D.17953, %sfp
	cltq
	movq	%r10, %rdx	# Co, ivtmp.755
	movq	%r11, -128(%rbp)	# D.17953, %sfp
	movq	%rax, -176(%rbp)	# D.17951, %sfp
	leal	0(,%r12,4), %eax	#, D.17948
	movslq	%eax, %rsi	# D.17948, D.17951
	addl	%r12d, %eax	# n, D.17948
	movq	%rcx, -184(%rbp)	# D.17951, %sfp
	cltq
	movq	%rsi, -168(%rbp)	# D.17951, %sfp
	movq	%rax, -192(%rbp)	# D.17951, %sfp
	movl	%r9d, -144(%rbp)	# D.17948, %sfp
	.p2align 4,,10
	.p2align 3
.L670:
	movl	-152(%rbp), %r15d	# %sfp, tmp1017
	xorl	%r14d, %r14d	# j
	xorl	%edi, %edi	# ivtmp.750
	movq	-96(%rbp), %rcx	# %sfp, ivtmp.744
	movl	%r14d, %r11d	# j, j
	movq	%rdx, %r14	# ivtmp.755, ivtmp.755
	movl	%r15d, -140(%rbp)	# tmp1017, %sfp
	xorl	%r15d, %r15d	# ivtmp.751
	.p2align 4,,10
	.p2align 3
.L669:
	movq	%rcx, %rax	# ivtmp.744, D.17955
	vmovsd	(%r14,%rdi,8), %xmm2	# MEM[base: _399, index: ivtmp.750_155, step: 8, offset: 0B], t
	andl	$31, %eax	#, D.17955
	shrq	$3, %rax	#, D.17955
	negq	%rax	# D.17955
	andl	$3, %eax	#, D.17948
	cmpl	%r12d, %eax	# n, D.17948
	cmova	%r12d, %eax	# D.17948,, n, prologue_after_cost_adjust.684
	cmpl	$6, %r12d	#, n
	jg	.L1014	#,
	movl	%r12d, %eax	# n, prologue_after_cost_adjust.684
.L687:
	vmovsd	(%rcx), %xmm7	# MEM[base: _404, offset: 0B], MEM[base: _404, offset: 0B]
	vmulsd	(%rbx), %xmm7, %xmm8	# MEM[base: _328, offset: 0B], MEM[base: _404, offset: 0B], D.17947
	vaddsd	%xmm8, %xmm2, %xmm2	# D.17947, t, t
	cmpl	$1, %eax	#, prologue_after_cost_adjust.684
	je	.L691	#,
	movq	-88(%rbp), %rdx	# %sfp, D.17953
	vmovsd	8(%rcx), %xmm9	# MEM[base: _404, offset: 8B], MEM[base: _404, offset: 8B]
	vmulsd	(%rbx,%rdx,8), %xmm9, %xmm10	# MEM[base: _328, index: _200, step: 8, offset: 0B], MEM[base: _404, offset: 8B], D.17947
	vaddsd	%xmm10, %xmm2, %xmm2	# D.17947, t, t
	cmpl	$2, %eax	#, prologue_after_cost_adjust.684
	je	.L692	#,
	movq	-184(%rbp), %rsi	# %sfp, D.17951
	vmovsd	16(%rcx), %xmm11	# MEM[base: _404, offset: 16B], MEM[base: _404, offset: 16B]
	vmulsd	(%rbx,%rsi,8), %xmm11, %xmm12	# MEM[base: _328, index: _305, step: 8, offset: 0B], MEM[base: _404, offset: 16B], D.17947
	vaddsd	%xmm12, %xmm2, %xmm2	# D.17947, t, t
	cmpl	$3, %eax	#, prologue_after_cost_adjust.684
	je	.L693	#,
	movq	-176(%rbp), %r8	# %sfp, D.17951
	vmovsd	24(%rcx), %xmm13	# MEM[base: _404, offset: 24B], MEM[base: _404, offset: 24B]
	vmulsd	(%rbx,%r8,8), %xmm13, %xmm14	# MEM[base: _328, index: _290, step: 8, offset: 0B], MEM[base: _404, offset: 24B], D.17947
	vaddsd	%xmm14, %xmm2, %xmm2	# D.17947, t, t
	cmpl	$4, %eax	#, prologue_after_cost_adjust.684
	je	.L694	#,
	movq	-168(%rbp), %r9	# %sfp, D.17951
	vmovsd	32(%rcx), %xmm15	# MEM[base: _404, offset: 32B], MEM[base: _404, offset: 32B]
	vmulsd	(%rbx,%r9,8), %xmm15, %xmm0	# MEM[base: _328, index: _236, step: 8, offset: 0B], MEM[base: _404, offset: 32B], D.17947
	vaddsd	%xmm0, %xmm2, %xmm2	# D.17947, t, t
	cmpl	$6, %eax	#, prologue_after_cost_adjust.684
	jne	.L695	#,
	movq	-192(%rbp), %r10	# %sfp, D.17951
	movl	$6, %edx	#, k
	vmovsd	40(%rcx), %xmm1	# MEM[base: _404, offset: 40B], MEM[base: _404, offset: 40B]
	vmulsd	(%rbx,%r10,8), %xmm1, %xmm3	# MEM[base: _328, index: _333, step: 8, offset: 0B], MEM[base: _404, offset: 40B], D.17947
	vaddsd	%xmm3, %xmm2, %xmm2	# D.17947, t, t
.L661:
	cmpl	%eax, %r12d	# prologue_after_cost_adjust.684, n
	je	.L662	#,
.L660:
	movl	%r12d, %esi	# n, niters.686
	movl	%eax, %r8d	# prologue_after_cost_adjust.684, prolog_loop_adjusted_niters.685
	subl	%eax, %esi	# prologue_after_cost_adjust.684, niters.686
	movl	%esi, -136(%rbp)	# niters.686, %sfp
	subl	$4, %esi	#, D.17948
	shrl	$2, %esi	#, D.17948
	leal	1(%rsi), %r10d	#, bnd.687
	leal	0(,%r10,4), %r9d	#, ratio_mult_vf.688
	movl	%r9d, -132(%rbp)	# ratio_mult_vf.688, %sfp
	movl	-144(%rbp), %r9d	# %sfp, D.17948
	subl	%eax, %r9d	# prologue_after_cost_adjust.684, D.17948
	cmpl	$2, %r9d	#, D.17948
	jbe	.L663	#,
	movq	-88(%rbp), %rax	# %sfp, D.17951
	andl	$3, %esi	#, tmp499
	movq	-96(%rbp), %r9	# %sfp, B
	imulq	%r8, %rax	# prolog_loop_adjusted_niters.685, D.17951
	addq	%rdi, %r8	# ivtmp.750, D.17951
	addq	-152(%rbp), %rax	# %sfp, D.17951
	leaq	(%r9,%r8,8), %r9	#, ivtmp.732
	movq	-128(%rbp), %r8	# %sfp, D.17953
	movq	%r9, -160(%rbp)	# ivtmp.732, %sfp
	addq	$32, %r9	#, ivtmp.732
	leaq	0(%r13,%rax,8), %rax	#, D.17953
	addq	-112(%rbp), %rax	# %sfp, ivtmp.736
	vmovsd	(%rax,%r8), %xmm5	# MEM[base: _40, index: _127, offset: 0B], tmp963
	movl	$1, %r8d	#, ivtmp.727
	vmovsd	(%rax,%r13), %xmm4	# MEM[base: _40, index: _193, offset: 0B], tmp961
	vmovhpd	(%rax), %xmm5, %xmm7	# MEM[base: _40, offset: 0B], tmp963, tmp406
	vmovhpd	(%rax,%r13,2), %xmm4, %xmm6	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp961, tmp403
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm6, %ymm7, %ymm8	# tmp403, tmp406, vect_cst_.690
	vmulpd	-32(%r9), %ymm8, %ymm0	# MEM[base: _394, offset: 0B], vect_cst_.690, vect_t_123.695
	cmpl	%r10d, %r8d	# bnd.687, ivtmp.727
	jnb	.L979	#,
	testl	%esi, %esi	# tmp499
	je	.L1001	#,
	cmpl	$1, %esi	#, tmp499
	je	.L897	#,
	cmpl	$2, %esi	#, tmp499
	je	.L898	#,
	movq	-128(%rbp), %rsi	# %sfp, D.17953
	movl	$2, %r8d	#, ivtmp.727
	movq	-160(%rbp), %r9	# %sfp, ivtmp.732
	vmovsd	(%rax,%r13), %xmm9	# MEM[base: _40, index: _193, offset: 0B], tmp1036
	vmovsd	(%rax,%rsi), %xmm11	# MEM[base: _40, index: _127, offset: 0B], tmp1038
	vmovhpd	(%rax,%r13,2), %xmm9, %xmm10	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp1036, tmp760
	leaq	64(%r9), %r9	#, ivtmp.732
	vmovhpd	(%rax), %xmm11, %xmm12	# MEM[base: _40, offset: 0B], tmp1038, tmp763
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13	# tmp760, tmp763, vect_cst_.690
	vmulpd	-32(%r9), %ymm13, %ymm14	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm14, %ymm0, %ymm0	# vect__121.694, vect_t_123.695, vect_t_123.695
.L898:
	movq	-128(%rbp), %rsi	# %sfp, D.17953
	addl	$1, %r8d	#, ivtmp.727
	addq	$32, %r9	#, ivtmp.732
	vmovsd	(%rax,%r13), %xmm15	# MEM[base: _40, index: _193, offset: 0B], tmp1042
	vmovhpd	(%rax,%r13,2), %xmm15, %xmm1	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp1042, tmp769
	vmovsd	(%rax,%rsi), %xmm3	# MEM[base: _40, index: _127, offset: 0B], tmp1044
	vmovhpd	(%rax), %xmm3, %xmm4	# MEM[base: _40, offset: 0B], tmp1044, tmp772
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm6	# tmp769, tmp772, vect_cst_.690
	vmulpd	-32(%r9), %ymm6, %ymm5	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm5, %ymm0, %ymm0	# vect__121.694, vect_t_123.695, vect_t_123.695
.L897:
	movq	-128(%rbp), %rsi	# %sfp, D.17953
	addl	$1, %r8d	#, ivtmp.727
	addq	$32, %r9	#, ivtmp.732
	vmovsd	(%rax,%r13), %xmm7	# MEM[base: _40, index: _193, offset: 0B], tmp1046
	vmovhpd	(%rax,%r13,2), %xmm7, %xmm8	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp1046, tmp778
	vmovsd	(%rax,%rsi), %xmm9	# MEM[base: _40, index: _127, offset: 0B], tmp1048
	vmovhpd	(%rax), %xmm9, %xmm10	# MEM[base: _40, offset: 0B], tmp1048, tmp781
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11	# tmp778, tmp781, vect_cst_.690
	vmulpd	-32(%r9), %ymm11, %ymm12	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm12, %ymm0, %ymm0	# vect__121.694, vect_t_123.695, vect_t_123.695
	cmpl	%r10d, %r8d	# bnd.687, ivtmp.727
	jnb	.L979	#,
.L664:
	vmovsd	(%rax,%r13), %xmm13	# MEM[base: _40, index: _193, offset: 0B], tmp967
	addl	$4, %r8d	#, ivtmp.727
	subq	$-128, %r9	#, ivtmp.732
	vmovsd	(%rax,%rsi), %xmm15	# MEM[base: _40, index: _127, offset: 0B], tmp968
	vmovhpd	(%rax,%r13,2), %xmm13, %xmm14	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp967, tmp631
	vmovhpd	(%rax), %xmm15, %xmm1	# MEM[base: _40, offset: 0B], tmp968, tmp634
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3	# tmp631, tmp634, vect_cst_.690
	vmulpd	-128(%r9), %ymm3, %ymm4	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm4, %ymm0, %ymm6	# vect__121.694, vect_t_123.695, vect_t_123.695
	vmovsd	(%rax,%r13), %xmm5	# MEM[base: _40, index: _193, offset: 0B], tmp970
	vmovsd	(%rax,%rsi), %xmm8	# MEM[base: _40, index: _127, offset: 0B], tmp971
	vmovhpd	(%rax,%r13,2), %xmm5, %xmm7	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp970, tmp644
	vmovhpd	(%rax), %xmm8, %xmm9	# MEM[base: _40, offset: 0B], tmp971, tmp647
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm7, %ymm9, %ymm10	# tmp644, tmp647, vect_cst_.690
	vmulpd	-96(%r9), %ymm10, %ymm11	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm11, %ymm6, %ymm12	# vect__121.694, vect_t_123.695, vect_t_123.695
	vmovsd	(%rax,%r13), %xmm0	# MEM[base: _40, index: _193, offset: 0B], tmp973
	vmovsd	(%rax,%rsi), %xmm14	# MEM[base: _40, index: _127, offset: 0B], tmp974
	vmovhpd	(%rax,%r13,2), %xmm0, %xmm13	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp973, tmp657
	vmovhpd	(%rax), %xmm14, %xmm15	# MEM[base: _40, offset: 0B], tmp974, tmp660
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm13, %ymm15, %ymm1	# tmp657, tmp660, vect_cst_.690
	vmulpd	-64(%r9), %ymm1, %ymm3	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm3, %ymm12, %ymm6	# vect__121.694, vect_t_123.695, vect_t_123.695
	vmovsd	(%rax,%r13), %xmm4	# MEM[base: _40, index: _193, offset: 0B], tmp976
	vmovsd	(%rax,%rsi), %xmm5	# MEM[base: _40, index: _127, offset: 0B], tmp977
	vmovhpd	(%rax,%r13,2), %xmm4, %xmm7	# MEM[base: _40, index: _193, step: 2, offset: 0B], tmp976, tmp670
	vmovhpd	(%rax), %xmm5, %xmm8	# MEM[base: _40, offset: 0B], tmp977, tmp673
	addq	-120(%rbp), %rax	# %sfp, ivtmp.736
	vinsertf128	$0x1, %xmm7, %ymm8, %ymm9	# tmp670, tmp673, vect_cst_.690
	vmulpd	-32(%r9), %ymm9, %ymm10	# MEM[base: _394, offset: 0B], vect_cst_.690, vect__121.694
	vaddpd	%ymm10, %ymm6, %ymm0	# vect__121.694, vect_t_123.695, vect_t_123.695
	cmpl	%r10d, %r8d	# bnd.687, ivtmp.727
	jb	.L664	#,
	.p2align 4,,10
	.p2align 3
.L979:
	vhaddpd	%ymm0, %ymm0, %ymm11	# vect_t_123.695, vect_t_123.695, tmp418
	movl	-132(%rbp), %r10d	# %sfp, ratio_mult_vf.688
	vperm2f128	$1, %ymm11, %ymm11, %ymm12	#, tmp418, tmp418, tmp419
	vaddpd	%ymm12, %ymm11, %ymm0	# tmp419, tmp418, vect_t_123.697
	addl	%r10d, %edx	# ratio_mult_vf.688, k
	vaddsd	%xmm0, %xmm2, %xmm2	# stmp_t_123.696, t, t
	cmpl	-136(%rbp), %r10d	# %sfp, ratio_mult_vf.688
	je	.L662	#,
.L663:
	movl	%r12d, %eax	# n, D.17949
	movl	-140(%rbp), %r10d	# %sfp, i
	imull	%edx, %eax	# k, D.17949
	leal	(%r15,%rdx), %esi	#, D.17949
	movslq	%esi, %rsi	# D.17949, D.17953
	leal	(%r10,%rax), %r9d	#, D.17949
	movslq	%r9d, %r8	# D.17949, D.17953
	movq	-112(%rbp), %r9	# %sfp, A
	vmovsd	(%r9,%r8,8), %xmm13	# *_198, *_198
	movq	-96(%rbp), %r8	# %sfp, B
	vmulsd	(%r8,%rsi,8), %xmm13, %xmm14	# *_112, *_198, D.17947
	leal	1(%rdx), %esi	#, k
	vaddsd	%xmm14, %xmm2, %xmm2	# D.17947, t, t
	cmpl	%esi, %r12d	# k, n
	jle	.L662	#,
	addl	%r12d, %eax	# n, D.17949
	addl	%r15d, %esi	# ivtmp.751, D.17949
	addl	$2, %edx	#, k
	leal	(%rax,%r10), %r10d	#, D.17949
	movslq	%esi, %rsi	# D.17949, D.17953
	movslq	%r10d, %r8	# D.17949, D.17953
	vmovsd	(%r9,%r8,8), %xmm15	# *_123, *_123
	movq	-96(%rbp), %r9	# %sfp, B
	vmulsd	(%r9,%rsi,8), %xmm15, %xmm1	# *_101, *_123, D.17947
	vaddsd	%xmm1, %xmm2, %xmm2	# D.17947, t, t
	cmpl	%edx, %r12d	# k, n
	jle	.L662	#,
	addl	%r12d, %eax	# n, D.17949
	addl	-140(%rbp), %eax	# %sfp, D.17949
	addl	%r15d, %edx	# ivtmp.751, D.17949
	movq	-112(%rbp), %r10	# %sfp, A
	movslq	%edx, %rdx	# D.17949, D.17953
	cltq
	vmovsd	(%r10,%rax,8), %xmm3	# *_259, *_259
	movq	-96(%rbp), %rax	# %sfp, B
	vmulsd	(%rax,%rdx,8), %xmm3, %xmm6	# *_254, *_259, D.17947
	vaddsd	%xmm6, %xmm2, %xmm2	# D.17947, t, t
.L662:
	addl	$1, %r11d	#, j
	vmovsd	%xmm2, (%r14,%rdi,8)	# t, MEM[base: _399, index: ivtmp.750_155, step: 8, offset: 0B]
	addq	%r13, %rcx	# D.17953, ivtmp.744
	addl	%r12d, %r15d	# n, ivtmp.751
	addq	-88(%rbp), %rdi	# %sfp, ivtmp.750
	cmpl	%r12d, %r11d	# n, j
	jne	.L669	#,
	addq	$1, -152(%rbp)	#, %sfp
	movq	%r14, %rdx	# ivtmp.755, ivtmp.755
	addq	$8, %rbx	#, ivtmp.758
	movq	-152(%rbp), %rcx	# %sfp, ivtmp.753
	addq	$8, %rdx	#, ivtmp.755
	cmpl	%ecx, %r12d	# ivtmp.753, n
	jg	.L670	#,
	movq	-112(%rbp), %r15	# %sfp, A
	movq	-96(%rbp), %r14	# %sfp, B
	vzeroupper
.L671:
	movq	-104(%rbp), %rcx	# %sfp,
	movq	%r14, %rdx	# B,
	movq	%r15, %rsi	# A,
	movl	%r12d, %edi	# n,
	movq	-224(%rbp), %rbx	# %sfp, f
	call	*%rbx	# f
	movl	-204(%rbp), %r13d	# %sfp,
	testl	%r13d, %r13d	#
	je	.L658	#,
	movq	-104(%rbp), %rdi	# %sfp, C
	movq	-200(%rbp), %r11	# %sfp, Co
	vmovsd	(%rdi), %xmm4	# *C_25(D), *C_25(D)
	vsubsd	(%r11), %xmm4, %xmm7	# *Co_47, *C_25(D), D.17947
	vandpd	.LC16(%rip), %xmm7, %xmm5	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm5	#, D.17947
	ja	.L1000	#,
	movl	-204(%rbp), %r8d	# %sfp, D.17949
	xorl	%ebx, %ebx	# ivtmp.723
	leal	-1(%r8), %esi	#, D.17951
	leaq	0(,%rsi,8), %rdx	#, D.17951
	andl	$7, %esi	#, tmp495
	je	.L988	#,
	movq	-104(%rbp), %r9	# %sfp, C
	movl	$8, %ebx	#, ivtmp.723
	movq	-200(%rbp), %rcx	# %sfp, Co
	vmovsd	8(%r9), %xmm8	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%rcx), %xmm8, %xmm9	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm9, %xmm10	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm10	#, D.17947
	ja	.L1000	#,
	cmpq	$1, %rsi	#, tmp495
	je	.L988	#,
	cmpq	$2, %rsi	#, tmp495
	je	.L892	#,
	cmpq	$3, %rsi	#, tmp495
	je	.L893	#,
	cmpq	$4, %rsi	#, tmp495
	je	.L894	#,
	cmpq	$5, %rsi	#, tmp495
	je	.L895	#,
	cmpq	$6, %rsi	#, tmp495
	je	.L896	#,
	vmovsd	16(%r9), %xmm11	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	addq	$8, %rbx	#, ivtmp.723
	vsubsd	16(%rcx), %xmm11, %xmm12	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm12, %xmm0	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm0	#, D.17947
	ja	.L1000	#,
.L896:
	movq	-104(%rbp), %rdi	# %sfp, C
	movq	-200(%rbp), %r11	# %sfp, Co
	vmovsd	8(%rdi,%rbx), %xmm13	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%r11,%rbx), %xmm13, %xmm14	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$8, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm14, %xmm15	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm15	#, D.17947
	ja	.L1000	#,
.L895:
	movq	-104(%rbp), %r8	# %sfp, C
	movq	-200(%rbp), %rsi	# %sfp, Co
	vmovsd	8(%r8,%rbx), %xmm1	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%rsi,%rbx), %xmm1, %xmm2	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$8, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm2, %xmm3	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm3	#, D.17947
	ja	.L1000	#,
.L894:
	movq	-104(%rbp), %r9	# %sfp, C
	movq	-200(%rbp), %r10	# %sfp, Co
	vmovsd	8(%r9,%rbx), %xmm6	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%r10,%rbx), %xmm6, %xmm4	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$8, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm4, %xmm7	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm7	#, D.17947
	ja	.L1000	#,
.L893:
	movq	-104(%rbp), %rcx	# %sfp, C
	movq	-200(%rbp), %rax	# %sfp, Co
	vmovsd	8(%rcx,%rbx), %xmm5	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%rax,%rbx), %xmm5, %xmm8	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$8, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm8, %xmm9	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm9	#, D.17947
	ja	.L1000	#,
.L892:
	movq	-104(%rbp), %r13	# %sfp, C
	movq	-200(%rbp), %rdi	# %sfp, Co
	vmovsd	8(%r13,%rbx), %xmm10	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%rdi,%rbx), %xmm10, %xmm11	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$8, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm11, %xmm12	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm12	#, D.17947
	ja	.L1000	#,
	movq	%rdi, %r11	# Co, Co
	movq	-104(%rbp), %r8	# %sfp, C
	jmp	.L677	#
	.p2align 4,,10
	.p2align 3
.L684:
	vmovsd	8(%r8,%rbx), %xmm0	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	leaq	8(%rbx), %r9	#, tmp496
	vsubsd	8(%r11,%rbx), %xmm0, %xmm13	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm13, %xmm14	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm14	#, D.17947
	ja	.L1000	#,
	vmovsd	8(%r8,%r9), %xmm15	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	8(%r11,%r9), %xmm15, %xmm1	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm1, %xmm2	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm2	#, D.17947
	ja	.L1000	#,
	vmovsd	24(%r8,%rbx), %xmm3	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	24(%r11,%rbx), %xmm3, %xmm6	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm6, %xmm4	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm4	#, D.17947
	ja	.L1000	#,
	vmovsd	32(%r8,%rbx), %xmm7	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	32(%r11,%rbx), %xmm7, %xmm5	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm5, %xmm8	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm8	#, D.17947
	ja	.L1000	#,
	vmovsd	40(%r8,%rbx), %xmm9	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	40(%r11,%rbx), %xmm9, %xmm10	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm10, %xmm11	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm11	#, D.17947
	ja	.L1000	#,
	vmovsd	48(%r8,%rbx), %xmm12	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	48(%r11,%rbx), %xmm12, %xmm0	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm0, %xmm13	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm13	#, D.17947
	ja	.L1000	#,
	vmovsd	56(%r8,%rbx), %xmm14	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	56(%r11,%rbx), %xmm14, %xmm15	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	vandpd	.LC16(%rip), %xmm15, %xmm1	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm1	#, D.17947
	ja	.L1000	#,
	vmovsd	64(%r8,%rbx), %xmm2	# MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B]
	vsubsd	64(%r11,%rbx), %xmm2, %xmm3	# MEM[base: Co_47, index: ivtmp.723_228, offset: 8B], MEM[base: C_25(D), index: ivtmp.723_228, offset: 8B], D.17947
	addq	$64, %rbx	#, ivtmp.723
	vandpd	.LC16(%rip), %xmm3, %xmm6	#, D.17947, D.17947
	vcomisd	.LC17(%rip), %xmm6	#, D.17947
	ja	.L1000	#,
.L677:
	cmpq	%rdx, %rbx	# D.17951, ivtmp.723
	jne	.L684	#,
.L658:
	addq	$4, -216(%rbp)	#, %sfp
	movq	-216(%rbp), %r12	# %sfp, ivtmp.784
	cmpq	-232(%rbp), %r12	# %sfp, ivtmp.784
	jne	.L685	#,
.L648:
	movq	-56(%rbp), %rax	# D.17958, tmp912
	xorq	%fs:40, %rax	#, tmp912
	jne	.L1015	#,
	addq	$192, %rsp	#,
	popq	%rbx	#
	popq	%rsi	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%rsi), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L1014:
	.cfi_restore_state
	testl	%eax, %eax	# prologue_after_cost_adjust.684
	jne	.L687	#,
	xorl	%edx, %edx	# k
	jmp	.L660	#
	.p2align 4,,10
	.p2align 3
.L695:
	movl	$5, %edx	#, k
	jmp	.L661	#
	.p2align 4,,10
	.p2align 3
.L694:
	movl	$4, %edx	#, k
	jmp	.L661	#
	.p2align 4,,10
	.p2align 3
.L693:
	movl	$3, %edx	#, k
	jmp	.L661	#
	.p2align 4,,10
	.p2align 3
.L692:
	movl	$2, %edx	#, k
	jmp	.L661	#
	.p2align 4,,10
	.p2align 3
.L691:
	movl	$1, %edx	#, k
	jmp	.L661	#
	.p2align 4,,10
	.p2align 3
.L1001:
	movq	-128(%rbp), %rsi	# %sfp, D.17953
	jmp	.L664	#
.L988:
	movq	-200(%rbp), %r11	# %sfp, Co
	movq	-104(%rbp), %r8	# %sfp, C
	jmp	.L677	#
.L1003:
	movq	-104(%rbp), %r13	# %sfp, C
	jmp	.L653	#
.L1000:
	movl	$.LC18, %edi	#,
	movl	%r12d, %r15d	# n, n
	call	perror	#
	testl	%r12d, %r12d	# n
	jle	.L1016	#,
	movq	-104(%rbp), %r13	# %sfp, ivtmp.717
	leal	-1(%r12), %ebx	#,
	movslq	%r12d, %rcx	# n, D.17953
	movl	%ebx, -104(%rbp)	# D.17948, %sfp
	leaq	0(,%rcx,8), %r12	#, D.17953
	movq	%rcx, -96(%rbp)	# D.17953, %sfp
	leaq	8(%r13,%rbx,8), %r10	#, D.17955
	movq	%r10, -88(%rbp)	# D.17955, %sfp
.L679:
	leal	-1(%r15), %eax	#, tmp489
	vmovsd	0(%r13), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$1, %edi	#,
	movl	$.LC5, %esi	#,
	leaq	0(%r13,%r12), %rbx	#, ivtmp.712
	andl	$7, %eax	#, tmp491
	movl	$1, %r14d	#, j
	movl	%eax, -112(%rbp)	# tmp491, %sfp
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	movl	-112(%rbp), %edi	# %sfp, tmp491
	je	.L986	#,
	testl	%edi, %edi	# tmp491
	je	.L678	#,
	cmpl	$1, %edi	#, tmp491
	je	.L886	#,
	cmpl	$2, %edi	#, tmp491
	je	.L887	#,
	cmpl	$3, %edi	#, tmp491
	je	.L888	#,
	cmpl	$4, %edi	#, tmp491
	je	.L889	#,
	cmpl	$5, %edi	#, tmp491
	je	.L890	#,
	cmpl	$6, %edi	#, tmp491
	je	.L891	#,
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	call	__printf_chk	#
.L891:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L890:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L889:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L888:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L887:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L886:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	je	.L986	#,
.L678:
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %eax	#,
	addl	$8, %r14d	#, j
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%rbx), %xmm0	# MEM[base: _300, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%r12, %rbx	# D.17953, ivtmp.712
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	jne	.L678	#,
.L986:
	movl	$10, %edi	#,
	addq	$8, %r13	#, ivtmp.717
	call	putchar	#
	cmpq	-88(%rbp), %r13	# %sfp, ivtmp.717
	jne	.L679	#,
	movl	$10, %edi	#,
	call	putchar	#
	movq	-200(%rbp), %r13	# %sfp, ivtmp.707
	movl	-104(%rbp), %edx	# %sfp, D.17951
	movq	-96(%rbp), %rbx	# %sfp, D.17953
	leaq	8(%r13,%rdx,8), %r11	#, D.17955
	movq	%r11, -88(%rbp)	# D.17955, %sfp
	salq	$3, %rbx	#, D.17953
.L682:
	leal	-1(%r15), %r8d	#, tmp485
	vmovsd	0(%r13), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	andl	$7, %r8d	#, tmp487
	movl	$1, %eax	#,
	movl	$1, %r14d	#, j
	movl	%r8d, -96(%rbp)	# tmp487, %sfp
	leaq	0(%r13,%rbx), %r12	#, ivtmp.702
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	movl	-96(%rbp), %esi	# %sfp, tmp487
	je	.L985	#,
	testl	%esi, %esi	# tmp487
	je	.L681	#,
	cmpl	$1, %esi	#, tmp487
	je	.L880	#,
	cmpl	$2, %esi	#, tmp487
	je	.L881	#,
	cmpl	$3, %esi	#, tmp487
	je	.L882	#,
	cmpl	$4, %esi	#, tmp487
	je	.L883	#,
	cmpl	$5, %esi	#, tmp487
	je	.L884	#,
	cmpl	$6, %esi	#, tmp487
	je	.L885	#,
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movl	$2, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	call	__printf_chk	#
.L885:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L884:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L883:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L882:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L881:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
.L880:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addl	$1, %r14d	#, j
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	je	.L985	#,
.L681:
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	movl	$1, %edi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %eax	#,
	addl	$8, %r14d	#, j
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	vmovsd	(%r12), %xmm0	# MEM[base: _390, offset: 0B],
	movl	$.LC5, %esi	#,
	addq	%rbx, %r12	# D.17953, ivtmp.702
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk	#
	cmpl	%r15d, %r14d	# n, j
	jne	.L681	#,
.L985:
	movl	$10, %edi	#,
	addq	$8, %r13	#, ivtmp.707
	call	putchar	#
	cmpq	-88(%rbp), %r13	# %sfp, ivtmp.707
	jne	.L682	#,
	jmp	.L683	#
.L1016:
	movl	$10, %edi	#,
	call	putchar	#
.L683:
	movl	$10, %edi	#,
	call	putchar	#
	movl	$1, %edi	#,
	call	exit	#
.L1015:
	call	__stack_chk_fail	#
	.cfi_endproc
.LFE2292:
	.size	benchmark, .-benchmark
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata.str1.1
.LC20:
	.string	"avx_fast"
.LC21:
	.string	"avx_slow"
	.section	.text.unlikely
.LCOLDB22:
	.section	.text.startup,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB2293:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$17, %ecx	#,
	movl	$avx_dgemm_fast, %esi	#,
	movl	$.LC20, %edi	#,
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	pushq	%r12	#
	leaq	-112(%rbp), %rdx	#, tmp131
	pushq	%rbx	#
	subq	$88, %rsp	#,
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movl	$4, -112(%rbp)	#, test_sizes
	movq	%fs:40, %rax	#, tmp129
	movq	%rax, -40(%rbp)	# tmp129, D.17976
	xorl	%eax, %eax	# tmp129
	subq	$919376, %rsp	#,
	movl	$6, -108(%rbp)	#, test_sizes
	movq	%rsp, %rbx	#, tmp99
	subq	$919376, %rsp	#,
	movl	$7, -104(%rbp)	#, test_sizes
	movq	%rsp, %r12	#, tmp109
	subq	$919376, %rsp	#,
	movq	%rbx, %r8	# tmp99,
	movl	$8, -100(%rbp)	#, test_sizes
	movq	%rsp, %r13	#, tmp119
	subq	$8, %rsp	#,
	movq	%r12, %r9	# tmp109,
	movl	$16, -96(%rbp)	#, test_sizes
	pushq	%r13	# tmp119
	movl	$32, -92(%rbp)	#, test_sizes
	movl	$64, -88(%rbp)	#, test_sizes
	movl	$65, -84(%rbp)	#, test_sizes
	movl	$66, -80(%rbp)	#, test_sizes
	movl	$67, -76(%rbp)	#, test_sizes
	movl	$128, -72(%rbp)	#, test_sizes
	movl	$153, -68(%rbp)	#, test_sizes
	movl	$185, -64(%rbp)	#, test_sizes
	movl	$251, -60(%rbp)	#, test_sizes
	movl	$285, -56(%rbp)	#, test_sizes
	movl	$301, -52(%rbp)	#, test_sizes
	movl	$339, -48(%rbp)	#, test_sizes
	call	benchmark	#
	movl	$17, %ecx	#,
	movq	%r12, %r9	# tmp109,
	movq	%rbx, %r8	# tmp99,
	leaq	-112(%rbp), %rdx	#, tmp132
	movl	$avx_dgemm_slow, %esi	#,
	movl	$.LC21, %edi	#,
	movq	%r13, (%rsp)	# tmp119,
	call	benchmark	#
	xorl	%eax, %eax	#
	movq	-40(%rbp), %rcx	# D.17976, tmp130
	xorq	%fs:40, %rcx	#, tmp130
	jne	.L1021	#,
	leaq	-24(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L1021:
	.cfi_restore_state
	call	__stack_chk_fail	#
	.cfi_endproc
.LFE2293:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE22:
	.section	.text.startup
.LHOTE22:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	3894859413
	.long	1041313291
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC13:
	.long	2576980378
	.long	1069128089
	.align 8
.LC14:
	.long	3894859413
	.long	1042361867
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC16:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC17:
	.long	1202590843
	.long	1065646817
	.ident	"GCC: (Gentoo 4.9.3 p1.5, pie-0.6.4) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
