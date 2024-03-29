	.file	"matmul.c"
# GNU C99 (GCC) version 6.1.0 (riscv64-unknown-elf)
#	compiled by GNU C version 4.8.4, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed matmul.i -mhard-float -O3 -Wall
# -std=gnu99 -ftree-vectorize -fopt-info-vec -ffast-math -fverbose-asm
# -fno-common -fno-builtin
# options enabled:  -faggressive-loop-optimizations -falign-functions
# -falign-jumps -falign-labels -falign-loops -fassociative-math
# -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
# -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
# -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers
# -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fcx-limited-range -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -ffinite-math-only -fforward-propagate
# -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm -fgnu-runtime
# -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
# -fif-conversion -fif-conversion2 -findirect-inlining -finline
# -finline-atomics -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-alignment -fipa-cp-clone
# -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeephole -fpeephole2 -fplt -fpredictive-commoning
# -fprefetch-loop-arrays -freciprocal-math -freg-struct-return
# -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns
# -fschedule-insns2 -fsection-anchors -fsemantic-interposition
# -fshow-column -fshrink-wrap -fsplit-ivs-in-unroller -fsplit-paths
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstdarg-opt
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp
# -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
# -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse
# -ftree-forwprop -ftree-fre -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vectorize -ftree-vrp -funit-at-a-time
# -funsafe-math-optimizations -funswitch-loops -fverbose-asm
# -fzero-initialized-in-bss -matomic -mexplicit-relocs -mfdiv -mhard-float
# -mmuldiv -mplt

	.text
	.align	2
	.globl	rdcycle
	.type	rdcycle, @function
rdcycle:
	add	sp,sp,-32	#,,
	sd	s0,24(sp)	#,
	add	s0,sp,32	#,,
	sw	zero,-20(s0)	#, out
 #APP
# 12 "matmul.c" 1
	rdcycle a5	# out
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)	# out, out
	lw	a5,-20(s0)	# _3, out
	mv	a0,a5	#, <retval>
	ld	s0,24(sp)	#,
	add	sp,sp,32	#,,
	jr	ra	#
	.size	rdcycle, .-rdcycle
	.align	2
	.globl	rdinstret
	.type	rdinstret, @function
rdinstret:
	add	sp,sp,-32	#,,
	sd	s0,24(sp)	#,
	add	s0,sp,32	#,,
	sw	zero,-20(s0)	#, out
 #APP
# 18 "matmul.c" 1
	rdinstret a5	# out
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)	# out, out
	lw	a5,-20(s0)	# _3, out
	mv	a0,a5	#, <retval>
	ld	s0,24(sp)	#,
	add	sp,sp,32	#,,
	jr	ra	#
	.size	rdinstret, .-rdinstret
	.align	2
	.globl	fill
	.type	fill, @function
fill:
	blez	a1,.L14	#, n,
	add	sp,sp,-32	#,,
	sd	s2,8(sp)	#,
	addw	s2,a1,-1	# tmp119, n,
	sll	s2,s2,32	# tmp120, tmp119,
	srl	s2,s2,32	# tmp120, tmp120,
	add	s2,s2,1	# tmp121, tmp120,
	sd	s3,0(sp)	#,
	sll	s2,s2,3	# tmp122, tmp121,
	lui	s3,%hi(.LANCHOR0)	# tmp126,
	sd	s1,16(sp)	#,
	sd	ra,24(sp)	#,
	mv	s1,a0	# ivtmp.21, p
	add	s2,a0,s2	# _23, ivtmp.21, tmp122
	add	s3,s3,%lo(.LANCHOR0)	# tmp127, tmp126,
.L7:
	call	rand	#
	fld	fa5,0(s3)	# tmp125,
	add	s1,s1,8	# ivtmp.21, ivtmp.21,
	fsd	fa5,-8(s1)	# tmp125, MEM[base: _1, offset: 0B]
	bne	s1,s2,.L7	#, ivtmp.21, _23,
	ld	ra,24(sp)	#,
	ld	s1,16(sp)	#,
	ld	s2,8(sp)	#,
	ld	s3,0(sp)	#,
	add	sp,sp,32	#,,
.L14:
	jr	ra	#
	.size	fill, .-fill
	.align	2
	.globl	printmatrix
	.type	printmatrix, @function
printmatrix:
	add	sp,sp,-80	#,,
	sd	s7,16(sp)	#,
	lui	s7,%hi(.LC1)	# tmp93,
	sd	s8,8(sp)	#,
	mv	s8,a0	# m, m
	add	a0,s7,%lo(.LC1)	#, tmp93,
	sd	s3,48(sp)	#,
	sd	s6,24(sp)	#,
	sd	ra,72(sp)	#,
	sd	s1,64(sp)	#,
	sd	s2,56(sp)	#,
	sd	s4,40(sp)	#,
	sd	s5,32(sp)	#,
	sd	s9,0(sp)	#,
	mv	s3,a1	# n, n
	mv	s6,a2	# M, M
	call	printf	#
	blez	s8,.L17	#, m,
	mv	s4,s8	# m,
	sll	s4,s4,3	# _40, m,
	li	s9,0	# i,
	lui	s5,%hi(.LC2)	# tmp95,
.L18:
	mv	s2,s6	# ivtmp.30, ivtmp.35
	li	s1,0	# j,
	blez	s3,.L20	#, n,
.L19:
	ld	a1,0(s2)	#, MEM[base: _33, offset: 0B]
	add	a0,s5,%lo(.LC2)	#, tmp95,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s2,s2,s4	# ivtmp.30, ivtmp.30, _40
	bne	s3,s1,.L19	#, n, j,
.L20:
	add	a0,s7,%lo(.LC1)	#, tmp93,
	addw	s9,s9,1	# i, i,
	call	printf	#
	add	s6,s6,8	# ivtmp.35, ivtmp.35,
	bne	s8,s9,.L18	#, m, i,
.L17:
	add	a0,s7,%lo(.LC1)	#, tmp93,
	ld	ra,72(sp)	#,
	ld	s1,64(sp)	#,
	ld	s2,56(sp)	#,
	ld	s3,48(sp)	#,
	ld	s4,40(sp)	#,
	ld	s5,32(sp)	#,
	ld	s6,24(sp)	#,
	ld	s7,16(sp)	#,
	ld	s8,8(sp)	#,
	ld	s9,0(sp)	#,
	add	sp,sp,80	#,,
	tail	printf	#
	.size	printmatrix, .-printmatrix
	.align	2
	.globl	naive_dgemm
	.type	naive_dgemm, @function
naive_dgemm:
	blez	a0,.L40	#, M,
	blez	a1,.L38	#, N,
	add	sp,sp,-16	#,,
	sd	s1,8(sp)	#,
	mv	t0,a5	# ivtmp.55, C
	sll	t6,a0,3	# _78, M,
	li	s1,0	# ivtmp.56,
	li	t2,0	# m,
.L30:
	sll	t5,s1,3	# tmp118, ivtmp.56,
	add	t5,a3,t5	# ivtmp.42, A, tmp118
	mv	t1,t0	# ivtmp.49, ivtmp.55
	li	t4,0	# ivtmp.51,
	li	t3,0	# n,
.L29:
	fld	fa5,0(t1)	# t, MEM[base: _66, offset: 0B]
	blez	a2,.L27	#, K,
	sll	a5,t4,3	# tmp113, ivtmp.51,
	add	a5,a4,a5	# ivtmp.43, B, tmp113
	mv	a7,t5	# ivtmp.42, ivtmp.42
	li	a6,0	# k,
.L28:
	fld	fa3,0(a7)	# MEM[base: _83, offset: 0B], MEM[base: _83, offset: 0B]
	fld	fa4,0(a5)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a7,a7,8	# ivtmp.42, ivtmp.42,
	fmadd.d	fa5,fa3,fa4,fa5	# t, MEM[base: _83, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a5,a5,8	# ivtmp.43, ivtmp.43,
	bne	a2,a6,.L28	#, K, k,
.L27:
	fsd	fa5,0(t1)	# t, MEM[base: _66, offset: 0B]
	addw	t3,t3,1	# n, n,
	add	t1,t1,t6	# ivtmp.49, ivtmp.49, _78
	addw	t4,t4,a2	# ivtmp.51, ivtmp.51, K
	bne	a1,t3,.L29	#, N, n,
	addw	t2,t2,1	# m, m,
	add	t0,t0,8	# ivtmp.55, ivtmp.55,
	addw	s1,s1,a2	# ivtmp.56, ivtmp.56, K
	bne	a0,t2,.L30	#, M, m,
	ld	s1,8(sp)	#,
	add	sp,sp,16	#,,
.L38:
	jr	ra	#
.L40:
	ret
	.size	naive_dgemm, .-naive_dgemm
	.align	2
	.globl	opt1_2x2_dgemm
	.type	opt1_2x2_dgemm, @function
opt1_2x2_dgemm:
	add	t2,a6,16	# _74, ivtmp.81,
	sll	t0,a0,3	# _55, M,
	li	t6,0	# ivtmp.82,
.L42:
	sll	t5,t6,3	# tmp126, ivtmp.82,
	add	t5,a4,t5	# ivtmp.63, A, tmp126
	mv	t1,a6	# ivtmp.73, ivtmp.81
	li	t4,0	# ivtmp.74,
	li	t3,2	# ivtmp_84,
.L45:
	fld	fa5,0(t1)	# t, MEM[base: _36, offset: 0B]
	blez	a3,.L43	#, kdepth,
	sll	a1,t4,3	# tmp121, ivtmp.74,
	add	a1,a5,a1	# ivtmp.64, B, tmp121
	mv	a7,t5	# ivtmp.63, ivtmp.63
	li	a0,0	# k,
.L44:
	addw	a0,a0,1	# k, k,
	fld	fa4,0(a7)	# MEM[base: _60, offset: 0B], MEM[base: _60, offset: 0B]
	fld	fa3,0(a1)	# MEM[base: _59, offset: 0B], MEM[base: _59, offset: 0B]
	add	a7,a7,8	# ivtmp.63, ivtmp.63,
 #APP
# 67 "matmul.c" 1
	fmadd.d fa5, fa4, fa3, fa5	# t, MEM[base: _60, offset: 0B], MEM[base: _59, offset: 0B], t
	
# 0 "" 2
 #NO_APP
	add	a1,a1,8	# ivtmp.64, ivtmp.64,
	bne	a3,a0,.L44	#, kdepth, k,
.L43:
	fsd	fa5,0(t1)	# t, MEM[base: _36, offset: 0B]
	addw	t3,t3,-1	# ivtmp_84, ivtmp_84,
	add	t1,t1,t0	# ivtmp.73, ivtmp.73, _55
	addw	t4,t4,a2	# ivtmp.74, ivtmp.74, K
	bnez	t3,.L45	#, ivtmp_84,
	add	a6,a6,8	# ivtmp.81, ivtmp.81,
	addw	t6,t6,a2	# ivtmp.82, ivtmp.82, K
	bne	a6,t2,.L42	#, ivtmp.81, _74,
	ret
	.size	opt1_2x2_dgemm, .-opt1_2x2_dgemm
	.align	2
	.globl	opt2_2x2_dgemm
	.type	opt2_2x2_dgemm, @function
opt2_2x2_dgemm:
	sll	a0,a0,3	# _16, M,
	add	a7,a0,8	# tmp104, _16,
	sll	a2,a2,3	# _26, K,
	add	a0,a6,a0	# _17, C, _16
	add	a7,a6,a7	# _21, C, tmp104
	add	a1,a4,a2	# ar1, A, _26
	fld	ft1,0(a6)	# c00, *C_11(D)
	fld	ft0,8(a6)	# c10, MEM[(double *)C_11(D) + 8B]
	fld	fa0,0(a0)	# c01, *_17
	fld	fa1,0(a7)	# c11, *_21
	add	a2,a5,a2	# bc1, B, _26
 #APP
# 91 "matmul.c" 1
	# begin kloop
# 0 "" 2
 #NO_APP
	blez	a3,.L50	#, kdepth,
	addw	a3,a3,-1	# tmp106, kdepth,
	sll	a3,a3,32	# tmp107, tmp106,
	srl	a3,a3,32	# tmp107, tmp107,
	add	a3,a3,1	# tmp108, tmp107,
	sll	a3,a3,3	# tmp109, tmp108,
	add	a3,a4,a3	# _54, A, tmp109
.L51:
	add	a4,a4,8	# A, A,
	add	a1,a1,8	# ar1, ar1,
	add	a5,a5,8	# B, B,
	add	a2,a2,8	# bc1, bc1,
	fld	fa3,-8(a4)	# a0, MEM[base: ar0_31, offset: -8B]
	fld	fa4,-8(a1)	# a1, MEM[base: ar1_33, offset: -8B]
	fld	fa2,-8(a5)	# b0, MEM[base: bc0_35, offset: -8B]
	fld	fa5,-8(a2)	# b1, MEM[base: bc1_37, offset: -8B]
	fmadd.d	ft1,fa3,fa2,ft1	# c00, a0, b0, c00
	fmadd.d	ft0,fa4,fa2,ft0	# c10, a1, b0, c10
	fmadd.d	fa0,fa3,fa5,fa0	# c01, a0, b1, c01
	fmadd.d	fa1,fa4,fa5,fa1	# c11, a1, b1, c11
	bne	a4,a3,.L51	#, A, _54,
.L50:
	fsd	ft1,0(a6)	# c00, *C_11(D)
	fsd	ft0,8(a6)	# c10, MEM[(double *)C_11(D) + 8B]
	fsd	fa0,0(a0)	# c01, *_17
	fsd	fa1,0(a7)	# c11, *_21
	ret
	.size	opt2_2x2_dgemm, .-opt2_2x2_dgemm
	.align	2
	.globl	slow_2x2_dgemm
	.type	slow_2x2_dgemm, @function
slow_2x2_dgemm:
	add	sp,sp,-16	#,,
	sd	s1,8(sp)	#,
	sd	s2,0(sp)	#,
	li	s1,0	# ivtmp.123,
	li	t2,0	# m,
	li	s2,2	# tmp126,
.L54:
	sll	t6,s1,3	# tmp125, ivtmp.123,
	mv	t0,t2	# ivtmp.115, m
	add	t6,a4,t6	# ivtmp.105, A, tmp125
	li	t5,0	# ivtmp.116,
	li	t4,2	# ivtmp_82,
.L59:
	blez	a3,.L57	#, kdepth,
	sll	t3,t0,3	# tmp120, ivtmp.115,
	add	t3,a6,t3	# _81, C, tmp120
	fld	fa5,0(t3)	# D__lsm.100, *_81
	sll	a1,t5,3	# tmp122, ivtmp.116,
	add	a1,a5,a1	# ivtmp.106, B, tmp122
	mv	t1,t6	# ivtmp.105, ivtmp.105
	li	a7,0	# k,
.L55:
	fld	fa3,0(t1)	# MEM[base: _68, offset: 0B], MEM[base: _68, offset: 0B]
	fld	fa4,0(a1)	# MEM[base: _67, offset: 0B], MEM[base: _67, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	t1,t1,8	# ivtmp.105, ivtmp.105,
	fmadd.d	fa5,fa3,fa4,fa5	# D__lsm.100, MEM[base: _68, offset: 0B], MEM[base: _67, offset: 0B], D__lsm.100
	add	a1,a1,8	# ivtmp.106, ivtmp.106,
	bne	a3,a7,.L55	#, kdepth, k,
	fsd	fa5,0(t3)	# D__lsm.100, *_81
.L57:
	addw	t4,t4,-1	# ivtmp_82, ivtmp_82,
	addw	t0,t0,a0	# ivtmp.115, ivtmp.115, M
	addw	t5,t5,a2	# ivtmp.116, ivtmp.116, K
	bnez	t4,.L59	#, ivtmp_82,
	addw	t2,t2,1	# m, m,
	addw	s1,s1,a2	# ivtmp.123, ivtmp.123, K
	bne	t2,s2,.L54	#, m, tmp126,
	ld	s1,8(sp)	#,
	ld	s2,0(sp)	#,
	add	sp,sp,16	#,,
	jr	ra	#
	.size	slow_2x2_dgemm, .-slow_2x2_dgemm
	.align	2
	.globl	opt1_4x4_dgemm
	.type	opt1_4x4_dgemm, @function
opt1_4x4_dgemm:
	add	t2,a6,32	# _46, ivtmp.147,
	sll	t6,a0,3	# _68, M,
	li	t0,0	# ivtmp.148,
.L63:
	sll	t5,t0,3	# tmp125, ivtmp.148,
	add	t5,a4,t5	# ivtmp.129, A, tmp125
	mv	t1,a6	# ivtmp.139, ivtmp.147
	li	t4,0	# ivtmp.140,
	li	t3,4	# ivtmp_97,
.L66:
	fld	fa5,0(t1)	# t, MEM[base: _59, offset: 0B]
	blez	a3,.L64	#, kdepth,
	sll	a1,t4,3	# tmp121, ivtmp.140,
	add	a1,a5,a1	# ivtmp.130, B, tmp121
	mv	a7,t5	# ivtmp.129, ivtmp.129
	li	a0,0	# k,
.L65:
	fld	fa3,0(a7)	# MEM[base: _73, offset: 0B], MEM[base: _73, offset: 0B]
	fld	fa4,0(a1)	# MEM[base: _72, offset: 0B], MEM[base: _72, offset: 0B]
	addw	a0,a0,1	# k, k,
	add	a7,a7,8	# ivtmp.129, ivtmp.129,
	fmadd.d	fa5,fa3,fa4,fa5	# t, MEM[base: _73, offset: 0B], MEM[base: _72, offset: 0B], t
	add	a1,a1,8	# ivtmp.130, ivtmp.130,
	bne	a3,a0,.L65	#, kdepth, k,
.L64:
	fsd	fa5,0(t1)	# t, MEM[base: _59, offset: 0B]
	addw	t3,t3,-1	# ivtmp_97, ivtmp_97,
	add	t1,t1,t6	# ivtmp.139, ivtmp.139, _68
	addw	t4,t4,a2	# ivtmp.140, ivtmp.140, K
	bnez	t3,.L66	#, ivtmp_97,
	add	a6,a6,8	# ivtmp.147, ivtmp.147,
	addw	t0,t0,a2	# ivtmp.148, ivtmp.148, K
	bne	t2,a6,.L63	#, _46, ivtmp.147,
	ret
	.size	opt1_4x4_dgemm, .-opt1_4x4_dgemm
	.align	2
	.globl	opt2_4x4_dgemm
	.type	opt2_4x4_dgemm, @function
opt2_4x4_dgemm:
	sll	t3,a0,3	# _22, M,
	add	t5,a6,t3	# C1, C, _22
	add	t4,t5,t3	# C2, C1, _22
	add	sp,sp,-32	#,,
	add	t3,t4,t3	# C3, C2, _22
	fsd	fs0,24(sp)	#,
	fsd	fs1,16(sp)	#,
	fsd	fs2,8(sp)	#,
	fsd	fs3,0(sp)	#,
	fld	ft5,0(a6)	# c00, *C_18(D)
	fld	ft4,0(t5)	# c01, *C1_23
	fld	ft3,0(t4)	# c02, *C2_27
	fld	ft2,0(t3)	# c03, *C3_31
	fld	fa7,8(a6)	# c10, MEM[(double *)C_18(D) + 8B]
	fld	fa6,8(t5)	# c11, MEM[(double *)C1_23 + 8B]
	fld	ft7,8(t4)	# c12, MEM[(double *)C2_27 + 8B]
	fld	ft6,8(t3)	# c13, MEM[(double *)C3_31 + 8B]
	fld	ft11,16(a6)	# c20, MEM[(double *)C_18(D) + 16B]
	fld	ft10,16(t5)	# c21, MEM[(double *)C1_23 + 16B]
	fld	ft9,16(t4)	# c22, MEM[(double *)C2_27 + 16B]
	fld	ft8,16(t3)	# c23, MEM[(double *)C3_31 + 16B]
	fld	fs3,24(a6)	# c30, MEM[(double *)C_18(D) + 24B]
	fld	fs2,24(t5)	# c31, MEM[(double *)C1_23 + 24B]
	fld	fs1,24(t4)	# c32, MEM[(double *)C2_27 + 24B]
	fld	fs0,24(t3)	# c33, MEM[(double *)C3_31 + 24B]
 #APP
# 172 "matmul.c" 1
	# begin kloop
# 0 "" 2
 #NO_APP
	blez	a3,.L71	#, kdepth,
	addw	t6,a3,-1	# tmp144, kdepth,
	sll	t6,t6,32	# tmp145, tmp144,
	sll	a2,a2,3	# _53, K,
	srl	t6,t6,32	# tmp145, tmp145,
	add	a7,a4,a2	# ivtmp.156, ivtmp.155, _53
	add	a0,a5,a2	# ivtmp.160, ivtmp.159, _53
	add	t6,t6,1	# tmp146, tmp145,
	add	a1,a7,a2	# ivtmp.157, ivtmp.156, _53
	add	a3,a0,a2	# ivtmp.161, ivtmp.160, _53
	sll	t6,t6,3	# tmp147, tmp146,
	add	t1,a1,a2	# ivtmp.158, ivtmp.157, _53
	add	t6,a5,t6	# _209, ivtmp.159, tmp147
	add	a2,a3,a2	# ivtmp.162, ivtmp.161, _53
.L72:
	fld	ft1,0(a4)	# a0, MEM[base: _226, offset: 0B]
	fld	ft0,0(a7)	# a1, MEM[base: _225, offset: 0B]
	fld	fa0,0(a1)	# a2, MEM[base: _224, offset: 0B]
	fld	fa4,0(t1)	# a3, MEM[base: _223, offset: 0B]
	fld	fa1,0(a5)	# b0, MEM[base: _222, offset: 0B]
	fld	fa2,0(a0)	# b1, MEM[base: _221, offset: 0B]
	fld	fa3,0(a3)	# b2, MEM[base: _217, offset: 0B]
	fld	fa5,0(a2)	# b3, MEM[base: _216, offset: 0B]
	add	a5,a5,8	# ivtmp.159, ivtmp.159,
	fmadd.d	ft5,ft1,fa1,ft5	# c00, a0, b0, c00
	fmadd.d	ft4,ft1,fa2,ft4	# c01, a0, b1, c01
	fmadd.d	ft3,ft1,fa3,ft3	# c02, a0, b2, c02
	fmadd.d	ft2,ft1,fa5,ft2	# c03, a0, b3, c03
	fmadd.d	fa7,ft0,fa1,fa7	# c10, a1, b0, c10
	fmadd.d	fa6,ft0,fa2,fa6	# c11, a1, b1, c11
	fmadd.d	ft7,ft0,fa3,ft7	# c12, a1, b2, c12
	fmadd.d	ft6,ft0,fa5,ft6	# c13, a1, b3, c13
	fmadd.d	ft11,fa0,fa1,ft11	# c20, a2, b0, c20
	fmadd.d	ft10,fa0,fa2,ft10	# c21, a2, b1, c21
	fmadd.d	ft9,fa0,fa3,ft9	# c22, a2, b2, c22
	fmadd.d	ft8,fa0,fa5,ft8	# c23, a2, b3, c23
	fmadd.d	fs3,fa4,fa1,fs3	# c30, a3, b0, c30
	fmadd.d	fs2,fa4,fa2,fs2	# c31, a3, b1, c31
	fmadd.d	fs1,fa4,fa3,fs1	# c32, a3, b2, c32
	fmadd.d	fs0,fa4,fa5,fs0	# c33, a3, b3, c33
	add	a4,a4,8	# ivtmp.155, ivtmp.155,
	add	a7,a7,8	# ivtmp.156, ivtmp.156,
	add	a1,a1,8	# ivtmp.157, ivtmp.157,
	add	t1,t1,8	# ivtmp.158, ivtmp.158,
	add	a0,a0,8	# ivtmp.160, ivtmp.160,
	add	a3,a3,8	# ivtmp.161, ivtmp.161,
	add	a2,a2,8	# ivtmp.162, ivtmp.162,
	bne	t6,a5,.L72	#, _209, ivtmp.159,
.L71:
	fsd	fs3,24(a6)	# c30, MEM[(double *)C_18(D) + 24B]
	fsd	fs2,24(t5)	# c31, MEM[(double *)C1_23 + 24B]
	fsd	fs1,24(t4)	# c32, MEM[(double *)C2_27 + 24B]
	fsd	fs0,24(t3)	# c33, MEM[(double *)C3_31 + 24B]
	fsd	ft11,16(a6)	# c20, MEM[(double *)C_18(D) + 16B]
	fsd	ft10,16(t5)	# c21, MEM[(double *)C1_23 + 16B]
	fsd	ft9,16(t4)	# c22, MEM[(double *)C2_27 + 16B]
	fsd	ft8,16(t3)	# c23, MEM[(double *)C3_31 + 16B]
	fsd	fa7,8(a6)	# c10, MEM[(double *)C_18(D) + 8B]
	fsd	fa6,8(t5)	# c11, MEM[(double *)C1_23 + 8B]
	fsd	ft7,8(t4)	# c12, MEM[(double *)C2_27 + 8B]
	fsd	ft6,8(t3)	# c13, MEM[(double *)C3_31 + 8B]
	fsd	ft5,0(a6)	# c00, *C_18(D)
	fsd	ft4,0(t5)	# c01, *C1_23
	fsd	ft3,0(t4)	# c02, *C2_27
	fld	fs0,24(sp)	#,
	fld	fs1,16(sp)	#,
	fld	fs2,8(sp)	#,
	fld	fs3,0(sp)	#,
	fsd	ft2,0(t3)	# c03, *C3_31
	add	sp,sp,32	#,,
	jr	ra	#
	.size	opt2_4x4_dgemm, .-opt2_4x4_dgemm
	.align	2
	.globl	slow_4x4_dgemm
	.type	slow_4x4_dgemm, @function
slow_4x4_dgemm:
	add	sp,sp,-16	#,,
	sd	s1,8(sp)	#,
	sd	s2,0(sp)	#,
	li	s1,0	# ivtmp.193,
	li	t2,0	# m,
	li	s2,4	# tmp126,
.L76:
	sll	t0,s1,3	# tmp125, ivtmp.193,
	mv	t6,t2	# ivtmp.185, m
	add	t0,a4,t0	# ivtmp.175, A, tmp125
	li	t5,0	# ivtmp.186,
	li	t4,4	# ivtmp_82,
.L81:
	blez	a3,.L79	#, kdepth,
	sll	t3,t6,3	# tmp120, ivtmp.185,
	add	t3,a6,t3	# _81, C, tmp120
	fld	fa5,0(t3)	# D__lsm.170, *_81
	sll	a1,t5,3	# tmp122, ivtmp.186,
	add	a1,a5,a1	# ivtmp.176, B, tmp122
	mv	t1,t0	# ivtmp.175, ivtmp.175
	li	a7,0	# k,
.L77:
	fld	fa3,0(t1)	# MEM[base: _68, offset: 0B], MEM[base: _68, offset: 0B]
	fld	fa4,0(a1)	# MEM[base: _67, offset: 0B], MEM[base: _67, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	t1,t1,8	# ivtmp.175, ivtmp.175,
	fmadd.d	fa5,fa3,fa4,fa5	# D__lsm.170, MEM[base: _68, offset: 0B], MEM[base: _67, offset: 0B], D__lsm.170
	add	a1,a1,8	# ivtmp.176, ivtmp.176,
	bne	a3,a7,.L77	#, kdepth, k,
	fsd	fa5,0(t3)	# D__lsm.170, *_81
.L79:
	addw	t4,t4,-1	# ivtmp_82, ivtmp_82,
	addw	t6,t6,a0	# ivtmp.185, ivtmp.185, M
	addw	t5,t5,a2	# ivtmp.186, ivtmp.186, K
	bnez	t4,.L81	#, ivtmp_82,
	addw	t2,t2,1	# m, m,
	addw	s1,s1,a2	# ivtmp.193, ivtmp.193, K
	bne	t2,s2,.L76	#, m, tmp126,
	ld	s1,8(sp)	#,
	ld	s2,0(sp)	#,
	add	sp,sp,16	#,,
	jr	ra	#
	.size	slow_4x4_dgemm, .-slow_4x4_dgemm
	.align	2
	.globl	blocked_dgemm
	.type	blocked_dgemm, @function
blocked_dgemm:
	add	sp,sp,-128	#,,
	sd	ra,120(sp)	#,
	sd	s1,112(sp)	#,
	sd	s2,104(sp)	#,
	sd	s3,96(sp)	#,
	sd	s4,88(sp)	#,
	sd	s5,80(sp)	#,
	sd	s6,72(sp)	#,
	sd	s7,64(sp)	#,
	sd	s8,56(sp)	#,
	sd	s9,48(sp)	#,
	sd	s10,40(sp)	#,
	sd	s11,32(sp)	#,
	sd	a4,24(sp)	# A, %sfp
	sd	a6,0(sp)	# C, %sfp
	blez	a1,.L84	#, N,
	mv	s3,a5	# B, B
	mulw	a5,a0,a3	# tmp97, M, block
	mv	s2,a3	# block, block
	mv	s6,s2	# block,
	sw	zero,12(sp)	#, %sfp
	mv	s5,a1	# N, N
	mv	s11,a0	# M, M
	mv	s10,a2	# K, K
	mv	s7,a7	# f, f
	sll	s6,s6,3	# _2, block,
	mulw	s4,a2,a3	# tmp95, K, block
	sll	a5,a5,3	# _39, tmp98,
	sd	a5,16(sp)	# _39, %sfp
	sll	s4,s4,3	# _7, tmp96,
	blez	a0,.L84	#, M,
.L90:
	ld	s8,0(sp)	# Cp, %sfp
	ld	s1,24(sp)	# Ap, %sfp
	mv	s9,s2	# ivtmp.202, block
.L88:
	mv	a6,s8	#, Cp
	mv	a4,s1	#, Ap
	mv	a5,s3	#, B
	mv	a3,s10	#, K
	mv	a2,s10	#, K
	mv	a1,s5	#, N
	mv	a0,s11	#, M
	jalr	s7	# f
	mv	a5,s9	# m, ivtmp.202
	add	s1,s1,s4	# Ap, Ap, _7
	add	s8,s8,s6	# Cp, Cp, _2
	addw	s9,s2,s9	# ivtmp.202, block, ivtmp.202
	blt	a5,s11,.L88	#, m, M,
	lw	a5,12(sp)	#, %sfp
	ld	a4,0(sp)	# C, %sfp
	ld	a3,16(sp)	# _39, %sfp
	addw	a5,a5,s2	# n, n, block
	sw	a5,12(sp)	# n, %sfp
	add	a4,a4,a3	# C, C, _39
	sd	a4,0(sp)	# C, %sfp
	add	s3,s3,s4	# B, B, _7
	bgt	s5,a5,.L90	#, N, n,
.L84:
	ld	ra,120(sp)	#,
	ld	s1,112(sp)	#,
	ld	s2,104(sp)	#,
	ld	s3,96(sp)	#,
	ld	s4,88(sp)	#,
	ld	s5,80(sp)	#,
	ld	s6,72(sp)	#,
	ld	s7,64(sp)	#,
	ld	s8,56(sp)	#,
	ld	s9,48(sp)	#,
	ld	s10,40(sp)	#,
	ld	s11,32(sp)	#,
	add	sp,sp,128	#,,
	jr	ra	#
	.size	blocked_dgemm, .-blocked_dgemm
	.align	2
	.globl	benchmark_once
	.type	benchmark_once, @function
benchmark_once:
	remw	a5,a1,a4	# tmp242, m, block
	bnez	a5,.L95	#, tmp242,
	remw	a5,a2,a4	# tmp244, n, block
	bnez	a5,.L95	#, tmp244,
	remw	a5,a3,a4	# _7, k, block
	beqz	a5,.L96	#, _7,
.L95:
	lui	a0,%hi(.LC3)	# tmp245,
	add	a0,a0,%lo(.LC3)	#, tmp245,
	tail	printf	#
.L96:
	add	sp,sp,-176	#,,
	sd	s4,136(sp)	#,
	mulw	s4,a1,a3	# _13, m, k
	sd	s5,128(sp)	#,
	mv	s5,a0	# f, f
	sd	s6,120(sp)	#,
	sd	ra,168(sp)	#,
	sd	s1,160(sp)	#,
	sd	s2,152(sp)	#,
	mv	s1,a1	# m, m
	mv	s2,a2	# n, n
	sd	s3,144(sp)	#,
	mv	a0,s4	# _13,
	mulw	s6,a2,a3	# _17, n, k
	sll	a0,a0,3	#, _13,
	mv	s3,a4	# block, block
	sd	s7,112(sp)	#,
	sd	s11,80(sp)	#,
	sd	s8,104(sp)	#,
	mv	s11,a3	# k, k
	sd	s9,96(sp)	#,
	sd	s10,88(sp)	#,
	call	malloc	#
	mulw	a5,s1,s2	# _21, m, n
	sd	a0,16(sp)	#, %sfp
	mv	a0,s6	# _17,
	sll	a0,a0,3	#, _17,
	mv	s7,a5	# _21, _21
	sw	a5,60(sp)	# _21, %sfp
	call	malloc	#
	mv	a5,s7	# _21,
	sll	a5,a5,3	# _23, _21,
	sd	a0,0(sp)	#, %sfp
	mv	a0,a5	#, _23
	mv	s7,a5	# _23, _23
	sd	a5,64(sp)	# _23, %sfp
	call	malloc	#
	sd	a0,40(sp)	#, %sfp
	mv	a0,s7	#, _23
	call	malloc	#
	sd	a0,48(sp)	#, %sfp
	blez	s4,.L151	#, _13,
	addw	s4,s4,-1	# tmp251, _13,
	sll	s4,s4,32	# tmp252, tmp251,
	ld	a5,16(sp)	# A, %sfp
	srl	s4,s4,32	# tmp252, tmp252,
	add	s4,s4,1	# tmp253, tmp252,
	sll	s4,s4,3	# tmp254, tmp253,
	lui	s9,%hi(.LANCHOR0)	# tmp302,
	mv	s7,a5	# ivtmp.339, A
	add	s4,a5,s4	# _36, A, tmp254
	add	a5,s9,%lo(.LANCHOR0)	# tmp301, tmp302,
	sd	a5,8(sp)	# tmp301, %sfp
.L100:
	call	rand	#
	ld	a5,8(sp)	# tmp301, %sfp
	add	s7,s7,8	# ivtmp.339, ivtmp.339,
	fld	fa5,0(a5)	# tmp257,
	fsd	fa5,-8(s7)	# tmp257, MEM[base: _97, offset: 0B]
	bne	s4,s7,.L100	#, _36, ivtmp.339,
.L101:
	blez	s6,.L99	#, _17,
	addw	s4,s6,-1	# tmp258, _17,
	sll	s4,s4,32	# tmp259, tmp258,
	ld	a5,0(sp)	# B, %sfp
	srl	s4,s4,32	# tmp259, tmp259,
	add	s4,s4,1	# tmp260, tmp259,
	sll	s4,s4,3	# tmp261, tmp260,
	mv	s6,a5	# ivtmp.333, B
	add	s4,a5,s4	# _113, B, tmp261
.L104:
	call	rand	#
	ld	a5,8(sp)	# tmp301, %sfp
	add	s6,s6,8	# ivtmp.333, ivtmp.333,
	fld	fa5,0(a5)	# tmp264,
	fsd	fa5,-8(s6)	# tmp264, MEM[base: _141, offset: 0B]
	bne	s4,s6,.L104	#, _113, ivtmp.333,
.L99:
	lw	a5,60(sp)	#, %sfp
	blez	a5,.L103	#, _21,
	lw	a5,60(sp)	#, %sfp
	addw	s4,a5,-1	# tmp265, _21,
	sll	s4,s4,32	# tmp266, tmp265,
	ld	a5,40(sp)	# C, %sfp
	srl	s4,s4,32	# tmp266, tmp266,
	add	s4,s4,1	# tmp267, tmp266,
	sll	s4,s4,3	# tmp268, tmp267,
	mv	s6,a5	# ivtmp.327, C
	add	s4,a5,s4	# _162, C, tmp268
.L107:
	call	rand	#
	ld	a5,8(sp)	# tmp301, %sfp
	add	s6,s6,8	# ivtmp.327, ivtmp.327,
	fld	fa5,0(a5)	# tmp271,
	fsd	fa5,-8(s6)	# tmp271, MEM[base: _198, offset: 0B]
	bne	s4,s6,.L107	#, _162, ivtmp.327,
.L103:
	blez	s2,.L145	#, n,
	mulw	a5,s1,s3	# tmp274, m, block
	sll	s6,s3,3	# _259, block,
	mulw	s4,s3,s11	# tmp272, block, k
	sll	a5,a5,3	# _277, tmp275,
	sd	a5,24(sp)	# _277, %sfp
	sll	s4,s4,3	# _45, tmp273,
	blez	s1,.L145	#, m,
	ld	a5,40(sp)	# C, %sfp
	ld	s7,0(sp)	# B, %sfp
	sw	zero,56(sp)	#, %sfp
	sd	a5,32(sp)	# C, %sfp
.L111:
	ld	s9,32(sp)	# Cp, %sfp
	ld	s8,16(sp)	# Ap, %sfp
	mv	s10,s3	# ivtmp.310, block
.L110:
	mv	a6,s9	#, Cp
	mv	a4,s8	#, Ap
	mv	a5,s7	#, B
	mv	a3,s11	#, k
	mv	a2,s11	#, k
	mv	a1,s2	#, n
	mv	a0,s1	#, m
	jalr	s5	# f
	mv	a5,s10	# m, ivtmp.310
	add	s8,s8,s4	# Ap, Ap, _45
	add	s9,s9,s6	# Cp, Cp, _259
	addw	s10,s3,s10	# ivtmp.310, block, ivtmp.310
	bgt	s1,a5,.L110	#, m, m,
	lw	a5,56(sp)	#, %sfp
	ld	a4,32(sp)	# C, %sfp
	ld	a3,24(sp)	# _277, %sfp
	addw	a5,a5,s3	# n, n, block
	sw	a5,56(sp)	# n, %sfp
	add	a4,a4,a3	# C, C, _277
	sd	a4,32(sp)	# C, %sfp
	add	s7,s7,s4	# B, B, _45
	bgt	s2,a5,.L111	#, n, n,
	call	rdinstret	#
	ld	a5,40(sp)	# C, %sfp
	ld	s7,0(sp)	# B, %sfp
	sw	a0,72(sp)	#, %sfp
	sw	zero,56(sp)	#, %sfp
	sd	a5,32(sp)	# C, %sfp
.L129:
	ld	s9,32(sp)	# Cp, %sfp
	ld	s8,16(sp)	# Ap, %sfp
	mv	s10,s3	# ivtmp.290, block
.L113:
	mv	a6,s9	#, Cp
	mv	a4,s8	#, Ap
	mv	a5,s7	#, B
	mv	a3,s11	#, k
	mv	a2,s11	#, k
	mv	a1,s2	#, n
	mv	a0,s1	#, m
	jalr	s5	# f
	mv	a5,s10	# m, ivtmp.290
	add	s8,s8,s4	# Ap, Ap, _45
	add	s9,s9,s6	# Cp, Cp, _259
	addw	s10,s3,s10	# ivtmp.290, block, ivtmp.290
	bgt	s1,a5,.L113	#, m, m,
	lw	a5,56(sp)	#, %sfp
	ld	a4,32(sp)	# C, %sfp
	ld	a3,24(sp)	# _277, %sfp
	addw	a5,a5,s3	# n, n, block
	sw	a5,56(sp)	# n, %sfp
	add	a4,a4,a3	# C, C, _277
	sd	a4,32(sp)	# C, %sfp
	add	s7,s7,s4	# B, B, _45
	bgt	s2,a5,.L129	#, n, n,
	call	rdinstret	#
	lw	a5,72(sp)	#, %sfp
	sw	zero,56(sp)	#, %sfp
	subw	a5,a0,a5	# instructions,, instructions
	sw	a5,72(sp)	# instructions, %sfp
	call	rdcycle	#
	ld	a5,40(sp)	# C, %sfp
	ld	s7,0(sp)	# B, %sfp
	sw	a0,76(sp)	#, %sfp
	sd	a5,32(sp)	# C, %sfp
.L130:
	ld	s9,32(sp)	# Cp, %sfp
	ld	s8,16(sp)	# Ap, %sfp
	mv	s10,s3	# ivtmp.270, block
.L115:
	mv	a6,s9	#, Cp
	mv	a4,s8	#, Ap
	mv	a5,s7	#, B
	mv	a3,s11	#, k
	mv	a2,s11	#, k
	mv	a1,s2	#, n
	mv	a0,s1	#, m
	jalr	s5	# f
	mv	a5,s10	# m, ivtmp.270
	add	s8,s8,s4	# Ap, Ap, _45
	add	s9,s9,s6	# Cp, Cp, _259
	addw	s10,s3,s10	# ivtmp.270, block, ivtmp.270
	bgt	s1,a5,.L115	#, m, m,
	lw	a5,56(sp)	#, %sfp
	ld	a4,32(sp)	# C, %sfp
	ld	a3,24(sp)	# _277, %sfp
	addw	a5,a5,s3	# n, n, block
	sw	a5,56(sp)	# n, %sfp
	add	a4,a4,a3	# C, C, _277
	sd	a4,32(sp)	# C, %sfp
	add	s7,s7,s4	# B, B, _45
	bgt	s2,a5,.L130	#, n, n,
	call	rdcycle	#
	lw	a5,76(sp)	#, %sfp
	ld	s7,64(sp)	# _23, %sfp
	ld	s8,40(sp)	# C, %sfp
	subw	a5,a0,a5	# cycles,, cycles
	mv	a2,s7	#, _23
	li	a1,0	#,
	mv	a0,s8	#, C
	sw	a5,76(sp)	# cycles, %sfp
	call	memset	#
	ld	a0,48(sp)	#, %sfp
	mv	a2,s7	#, _23
	li	a1,0	#,
	call	memset	#
	ld	s7,0(sp)	# B, %sfp
	sw	s3,56(sp)	# block, %sfp
	sd	s8,32(sp)	# C, %sfp
	mv	s9,s8	# Cp, C
.L131:
	ld	s10,16(sp)	# Ap, %sfp
	mv	s8,s3	# ivtmp.250, block
.L117:
	mv	a6,s9	#, Cp
	mv	a4,s10	#, Ap
	mv	a5,s7	#, B
	mv	a3,s11	#, k
	mv	a2,s11	#, k
	mv	a1,s2	#, n
	mv	a0,s1	#, m
	jalr	s5	# f
	mv	a5,s8	# m, ivtmp.250
	add	s10,s10,s4	# Ap, Ap, _45
	add	s9,s9,s6	# Cp, Cp, _259
	addw	s8,s3,s8	# ivtmp.250, block, ivtmp.250
	bgt	s1,a5,.L117	#, m, m,
	ld	a5,32(sp)	# C, %sfp
	ld	a4,24(sp)	# _277, %sfp
	add	s7,s7,s4	# B, B, _45
	add	a5,a5,a4	# C, C, _277
	lw	a4,56(sp)	#, %sfp
	sd	a5,32(sp)	# C, %sfp
	addw	a5,s3,a4	# ivtmp.260, block, ivtmp.260
	ble	s2,a4,.L118	#, n, ivtmp.260,
	sw	a5,56(sp)	# ivtmp.260, %sfp
	ld	s9,32(sp)	# Cp, %sfp
	j	.L131	#
.L118:
	ld	t5,48(sp)	# ivtmp.241, %sfp
	mv	t1,s1	# m,
	sll	t1,t1,3	# _370, m,
	li	t4,0	# m,
	li	t3,0	# ivtmp.242,
.L128:
	ld	a5,16(sp)	# A, %sfp
	sll	a6,t3,3	# tmp282, ivtmp.242,
	mv	a2,t5	# ivtmp.235, ivtmp.241
	add	a6,a5,a6	# ivtmp.228, A, tmp282
	li	a1,0	# n,
	li	a0,0	# ivtmp.237,
.L121:
	fld	fa5,0(a2)	# t, MEM[base: _358, offset: 0B]
	blez	s11,.L119	#, k,
	ld	a4,0(sp)	# B, %sfp
	sll	a5,a0,3	# tmp278, ivtmp.237,
	mv	a3,a6	# ivtmp.228, ivtmp.228
	add	a5,a4,a5	# ivtmp.229, B, tmp278
	li	a4,0	# k,
.L120:
	fld	fa3,0(a3)	# MEM[base: _375, offset: 0B], MEM[base: _375, offset: 0B]
	fld	fa4,0(a5)	# MEM[base: _374, offset: 0B], MEM[base: _374, offset: 0B]
	addw	a4,a4,1	# k, k,
	add	a3,a3,8	# ivtmp.228, ivtmp.228,
	fmadd.d	fa5,fa3,fa4,fa5	# t, MEM[base: _375, offset: 0B], MEM[base: _374, offset: 0B], t
	add	a5,a5,8	# ivtmp.229, ivtmp.229,
	bne	s11,a4,.L120	#, k, k,
.L119:
	fsd	fa5,0(a2)	# t, MEM[base: _358, offset: 0B]
	addw	a1,a1,1	# n, n,
	add	a2,a2,t1	# ivtmp.235, ivtmp.235, _370
	addw	a0,a0,s11	# ivtmp.237, ivtmp.237, k
	bne	s2,a1,.L121	#, n, n,
	addw	t4,t4,1	# m, m,
	add	t5,t5,8	# ivtmp.241, ivtmp.241,
	addw	t3,t3,s11	# ivtmp.242, ivtmp.242, k
	bne	s1,t4,.L128	#, m, m,
.L122:
	lw	a5,60(sp)	#, %sfp
	blez	a5,.L127	#, _21,
	lw	a5,60(sp)	#, %sfp
	ld	s6,48(sp)	# ivtmp.222, %sfp
	addw	s4,a5,-1	# tmp286, _21,
	sll	s4,s4,32	# tmp287, tmp286,
	ld	a5,40(sp)	# C, %sfp
	srl	s4,s4,32	# tmp287, tmp287,
	add	s4,s4,1	# tmp288, tmp287,
	sll	s4,s4,3	# tmp289, tmp288,
	mv	s5,a5	# ivtmp.221, C
	add	s4,a5,s4	# _387, C, tmp289
.L126:
	fld	fa5,0(s6)	# MEM[base: _390, offset: 0B], MEM[base: _390, offset: 0B]
	fld	fa0,0(s5)	# MEM[base: _57, offset: 0B], MEM[base: _57, offset: 0B]
	fsub.d	fa0,fa0,fa5	#, MEM[base: _57, offset: 0B], MEM[base: _390, offset: 0B]
	call	fabs	#
	ld	a5,8(sp)	# tmp301, %sfp
	fld	fa5,56(a5)	# tmp293,
	fgt.d	a5,fa0,fa5	#, tmp296,, tmp293
	bnez	a5,.L152	#, tmp296,
	add	s5,s5,8	# ivtmp.221, ivtmp.221,
	add	s6,s6,8	# ivtmp.222, ivtmp.222,
	bne	s4,s5,.L126	#, _387, ivtmp.221,
.L127:
	ld	a0,16(sp)	#, %sfp
	call	free	#
	ld	a0,0(sp)	#, %sfp
	call	free	#
	ld	a0,40(sp)	#, %sfp
	call	free	#
	ld	a0,48(sp)	#, %sfp
	call	free	#
	ld	a0,8(sp)	# tmp301, %sfp
	lw	a6,72(sp)	#, %sfp
	lw	a5,76(sp)	#, %sfp
	mv	a4,s3	#, block
	mv	a3,s11	#, k
	mv	a2,s2	#, n
	mv	a1,s1	#, m
	ld	ra,168(sp)	#,
	ld	s1,160(sp)	#,
	ld	s2,152(sp)	#,
	ld	s3,144(sp)	#,
	ld	s4,136(sp)	#,
	ld	s5,128(sp)	#,
	ld	s6,120(sp)	#,
	ld	s7,112(sp)	#,
	ld	s8,104(sp)	#,
	ld	s9,96(sp)	#,
	ld	s10,88(sp)	#,
	ld	s11,80(sp)	#,
	add	a0,a0,32	#, tmp301,
	add	sp,sp,176	#,,
	tail	printf	#
.L151:
	lui	s9,%hi(.LANCHOR0)	# tmp302,
	add	a5,s9,%lo(.LANCHOR0)	# tmp301, tmp302,
	sd	a5,8(sp)	# tmp301, %sfp
	j	.L101	#
.L145:
	call	rdinstret	#
	mv	s4,a0	# instructions,
	call	rdinstret	#
	subw	a5,a0,s4	# instructions,, instructions
	sw	a5,72(sp)	# instructions, %sfp
	call	rdcycle	#
	mv	s4,a0	# cycles,
	call	rdcycle	#
	subw	a5,a0,s4	# cycles,, cycles
	ld	s4,64(sp)	# _23, %sfp
	ld	a0,40(sp)	#, %sfp
	li	a1,0	#,
	mv	a2,s4	#, _23
	sw	a5,76(sp)	# cycles, %sfp
	call	memset	#
	ld	a0,48(sp)	#, %sfp
	mv	a2,s4	#, _23
	li	a1,0	#,
	call	memset	#
	j	.L122	#
.L152:
	ld	a5,8(sp)	# tmp301, %sfp
	add	a0,a5,64	#, tmp301,
	call	perror	#
	ld	a2,40(sp)	#, %sfp
	mv	a1,s2	#, n
	mv	a0,s1	#, m
	call	printmatrix	#
	ld	a2,48(sp)	#, %sfp
	mv	a0,s1	#, m
	mv	a1,s2	#, n
	call	printmatrix	#
	li	a0,1	#,
	call	exit	#
	.size	benchmark_once, .-benchmark_once
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	add	sp,sp,-48	#,,
	sd	s1,32(sp)	#,
	sd	ra,40(sp)	#,
	sd	s2,24(sp)	#,
	sd	s3,16(sp)	#,
	sd	s4,8(sp)	#,
	li	a5,2	# tmp77,
	li	s1,16	# c,
	beq	a0,a5,.L157	#, argc, tmp77,
.L154:
	lui	a0,%hi(.LANCHOR0+96)	# tmp95,
	add	a0,a0,%lo(.LANCHOR0+96)	#, tmp95,
	call	printf	#
	lui	s4,%hi(.LC8)	# tmp82,
	add	a0,s4,%lo(.LC8)	#, tmp82,
	call	printf	#
	lui	a0,%hi(slow_2x2_dgemm)	# tmp83,
	mv	a3,s1	#, c
	mv	a2,s1	#, c
	mv	a1,s1	#, c
	li	a4,2	#,
	add	a0,a0,%lo(slow_2x2_dgemm)	#, tmp83,
	call	benchmark_once	#
	lui	s3,%hi(.LC9)	# tmp84,
	add	a0,s3,%lo(.LC9)	#, tmp84,
	call	printf	#
	lui	a0,%hi(opt1_2x2_dgemm)	# tmp85,
	mv	a3,s1	#, c
	mv	a2,s1	#, c
	mv	a1,s1	#, c
	li	a4,2	#,
	add	a0,a0,%lo(opt1_2x2_dgemm)	#, tmp85,
	call	benchmark_once	#
	lui	s2,%hi(.LC10)	# tmp86,
	add	a0,s2,%lo(.LC10)	#, tmp86,
	call	printf	#
	lui	a0,%hi(opt2_2x2_dgemm)	# tmp87,
	mv	a3,s1	#, c
	mv	a2,s1	#, c
	mv	a1,s1	#, c
	li	a4,2	#,
	add	a0,a0,%lo(opt2_2x2_dgemm)	#, tmp87,
	call	benchmark_once	#
	add	a0,s4,%lo(.LC8)	#, tmp82,
	call	printf	#
	lui	a0,%hi(slow_4x4_dgemm)	# tmp89,
	mv	a3,s1	#, c
	mv	a2,s1	#, c
	mv	a1,s1	#, c
	li	a4,4	#,
	add	a0,a0,%lo(slow_4x4_dgemm)	#, tmp89,
	call	benchmark_once	#
	add	a0,s3,%lo(.LC9)	#, tmp84,
	call	printf	#
	lui	a0,%hi(opt1_4x4_dgemm)	# tmp91,
	mv	a3,s1	#, c
	mv	a2,s1	#, c
	mv	a1,s1	#, c
	li	a4,4	#,
	add	a0,a0,%lo(opt1_4x4_dgemm)	#, tmp91,
	call	benchmark_once	#
	add	a0,s2,%lo(.LC10)	#, tmp86,
	call	printf	#
	lui	a0,%hi(opt2_4x4_dgemm)	# tmp93,
	add	a0,a0,%lo(opt2_4x4_dgemm)	#, tmp93,
	mv	a3,s1	#, c
	mv	a2,s1	#, tmp13
	mv	a1,s1	#, tmp13
	li	a4,4	#,
	call	benchmark_once	#
	ld	ra,40(sp)	#,
	li	a0,0	#,
	ld	s1,32(sp)	#,
	ld	s2,24(sp)	#,
	ld	s3,16(sp)	#,
	ld	s4,8(sp)	#,
	add	sp,sp,48	#,,
	jr	ra	#
.L157:
	ld	a0,8(a1)	#, MEM[(char * *)argv_5(D) + 8B]
	call	atoi	#
	mv	s1,a0	# c,
	j	.L154	#
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	0
	.word	1072693248
.LC1:
	.string	"\n"
	.zero	6
.LC2:
	.string	"%.3f\t "
	.zero	1
.LC3:
	.string	"Error\n"
	.zero	1
.LC4:
	.string	"%d\t%d\t%d\t%d\t%d\t%d\n"
	.zero	5
.LC5:
	.word	1202590843
	.word	1065646817
.LC6:
	.string	"error in matrix multiply"
	.zero	7
.LC7:
	.string	"Name\tM\tN\tK\tBlock\tCycles\tInstructions\n"
	.zero	2
.LC8:
	.string	"Slow\t"
	.zero	2
.LC9:
	.string	"Opt1\t"
	.zero	2
.LC10:
	.string	"Opt2\t"
	.ident	"GCC: (GNU) 6.1.0"
