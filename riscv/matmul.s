	.file	"matmul.c"
# GNU C99 (GCC) version 6.1.0 (riscv64-unknown-elf)
#	compiled by GNU C version 4.8.4, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed matmul.i -mhard-float -O3 -Wall
# -std=gnu99 -ftree-vectorize -fopt-info-vec -ffast-math -fverbose-asm
# -funroll-loops -fno-common -fno-builtin
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
# -frename-registers -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns -fschedule-insns2 -fsection-anchors
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstdarg-opt -fstrict-aliasing -fstrict-overflow
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
# -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vectorize
# -ftree-vrp -funit-at-a-time -funroll-loops -funsafe-math-optimizations
# -funswitch-loops -fverbose-asm -fweb -fzero-initialized-in-bss -matomic
# -mexplicit-relocs -mfdiv -mhard-float -mmuldiv -mplt

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
# 25 "matmul.c" 1
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
# 31 "matmul.c" 1
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
	blez	a1,.L44	#, n,
	add	sp,sp,-64	#,,
	sd	s2,40(sp)	#,
	addw	s2,a1,-1	# tmp119, n,
	sd	ra,56(sp)	#,
	sll	ra,s2,32	# tmp120, tmp119,
	srl	t0,ra,32	# tmp120, tmp120,
	sd	s3,32(sp)	#,
	add	t1,t0,1	# tmp121, tmp120,
	lui	s3,%hi(.LANCHOR0)	# tmp126,
	sll	t2,t1,3	# tmp122, tmp121,
	add	s3,s3,%lo(.LANCHOR0)	# tmp127, tmp126,
	sd	s1,48(sp)	#,
	sd	s4,24(sp)	#,
	sd	s5,16(sp)	#,
	add	s4,t2,-8	# tmp131, tmp122,
	mv	s5,a0	# p, p
	fsd	fs0,8(sp)	#,
	add	s2,a0,t2	# _23, p, tmp122
	call	rand	#
	fld	fs0,0(s3)	# tmp125,
	srl	s1,s4,3	# tmp129, tmp131,
	and	s4,s1,7	# tmp132, tmp129,
	fsd	fs0,0(s5)	# tmp125, MEM[base: _1, offset: 0B]
	add	s1,s5,8	# ivtmp.22, p,
	beq	s1,s2,.L5	#, ivtmp.22, _23,
	beqz	s4,.L7	#, tmp132,
	li	a5,1	# tmp138,
	beq	s4,a5,.L33	#, tmp132, tmp138,
	li	a0,2	# tmp137,
	beq	s4,a0,.L34	#, tmp132, tmp137,
	li	a1,3	# tmp136,
	beq	s4,a1,.L35	#, tmp132, tmp136,
	li	a2,4	# tmp135,
	beq	s4,a2,.L36	#, tmp132, tmp135,
	li	a3,5	# tmp134,
	beq	s4,a3,.L37	#, tmp132, tmp134,
	li	a4,6	# tmp133,
	beq	s4,a4,.L38	#, tmp132, tmp133,
	call	rand	#
	fsd	fs0,0(s1)	# tmp125, MEM[base: _1, offset: 0B]
	add	s1,s5,16	# ivtmp.22, p,
.L38:
	call	rand	#
	fld	fa5,0(s3)	# tmp157,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	fa5,-8(s1)	# tmp157, MEM[base: _1, offset: 0B]
.L37:
	call	rand	#
	fld	ft0,0(s3)	# tmp158,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	ft0,-8(s1)	# tmp158, MEM[base: _1, offset: 0B]
.L36:
	call	rand	#
	fld	ft1,0(s3)	# tmp159,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	ft1,-8(s1)	# tmp159, MEM[base: _1, offset: 0B]
.L35:
	call	rand	#
	fld	ft2,0(s3)	# tmp160,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	ft2,-8(s1)	# tmp160, MEM[base: _1, offset: 0B]
.L34:
	call	rand	#
	fld	ft3,0(s3)	# tmp161,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	ft3,-8(s1)	# tmp161, MEM[base: _1, offset: 0B]
.L33:
	call	rand	#
	fld	ft4,0(s3)	# tmp162,
	add	s1,s1,8	# ivtmp.22, ivtmp.22,
	fsd	ft4,-8(s1)	# tmp162, MEM[base: _1, offset: 0B]
	beq	s1,s2,.L5	#, ivtmp.22, _23,
.L7:
	call	rand	#
	fld	fs0,0(s3)	# tmp141,
	add	s1,s1,64	# ivtmp.22, ivtmp.22,
	fsd	fs0,-64(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-56(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-48(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-40(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-32(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-24(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-16(s1)	# tmp141, MEM[base: _1, offset: 0B]
	call	rand	#
	fsd	fs0,-8(s1)	# tmp141, MEM[base: _1, offset: 0B]
	bne	s1,s2,.L7	#, ivtmp.22, _23,
.L5:
	ld	ra,56(sp)	#,
	ld	s1,48(sp)	#,
	ld	s2,40(sp)	#,
	ld	s3,32(sp)	#,
	ld	s4,24(sp)	#,
	ld	s5,16(sp)	#,
	fld	fs0,8(sp)	#,
	add	sp,sp,64	#,,
.L44:
	jr	ra	#
	.size	fill, .-fill
	.align	2
	.globl	printmatrix
	.type	printmatrix, @function
printmatrix:
	add	sp,sp,-96	#,,
	sd	s9,16(sp)	#,
	sd	ra,88(sp)	#,
	sd	s1,80(sp)	#,
	sd	s2,72(sp)	#,
	sd	s3,64(sp)	#,
	sd	s4,56(sp)	#,
	sd	s5,48(sp)	#,
	sd	s6,40(sp)	#,
	sd	s7,32(sp)	#,
	sd	s8,24(sp)	#,
	sd	s10,8(sp)	#,
	lui	s9,%hi(.LC2)	# tmp93,
	blez	a0,.L47	#, m,
	mv	s8,a0	# m, m
	mv	s3,s8	# m,
	mv	s5,a1	# n, n
	mv	s6,a2	# ivtmp.36, M
	sll	s3,s3,3	# _39, m,
	li	s7,0	# i,
	lui	s9,%hi(.LC2)	# tmp93,
	lui	s4,%hi(.LC1)	# tmp94,
.L48:
	blez	s5,.L50	#, n,
	ld	a1,0(s6)	#, MEM[base: _32, offset: 0B]
	addw	s10,s5,-1	# tmp95, n,
	li	s2,1	# j,
	add	a0,s4,%lo(.LC1)	#, tmp94,
	and	s10,s10,7	# tmp97, tmp95,
	add	s1,s6,s3	# ivtmp.31, ivtmp.36, _39
	call	printf	#
	beq	s5,s2,.L50	#, n, j,
	beqz	s10,.L49	#, tmp97,
	beq	s10,s2,.L77	#, tmp97, j,
	li	a5,2	# tmp102,
	beq	s10,a5,.L78	#, tmp97, tmp102,
	li	a4,3	# tmp101,
	beq	s10,a4,.L79	#, tmp97, tmp101,
	li	ra,4	# tmp100,
	beq	s10,ra,.L80	#, tmp97, tmp100,
	li	t0,5	# tmp99,
	beq	s10,t0,.L81	#, tmp97, tmp99,
	li	t1,6	# tmp98,
	beq	s10,t1,.L82	#, tmp97, tmp98,
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	mv	s2,a5	# j, tmp102
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
.L82:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
.L81:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
.L80:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
.L79:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
.L78:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
.L77:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,1	# j, j,
	call	printf	#
	add	s1,s1,s3	# ivtmp.31, ivtmp.31, _39
	beq	s5,s2,.L50	#, n, j,
.L49:
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s10,s1,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s10)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s1,s10,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s10,s1,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s10)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s1,s10,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s10,s1,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s10)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s1,s10,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s1)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	add	s10,s1,s3	# ivtmp.31, ivtmp.31, _39
	call	printf	#
	ld	a1,0(s10)	#, MEM[base: _32, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp94,
	addw	s2,s2,8	# j, j,
	call	printf	#
	add	s1,s10,s3	# ivtmp.31, ivtmp.31, _39
	bne	s5,s2,.L49	#, n, j,
.L50:
	add	a0,s9,%lo(.LC2)	#, tmp93,
	addw	s7,s7,1	# i, i,
	call	printf	#
	add	s6,s6,8	# ivtmp.36, ivtmp.36,
	bne	s8,s7,.L48	#, m, i,
.L47:
	add	a0,s9,%lo(.LC2)	#, tmp93,
	ld	ra,88(sp)	#,
	ld	s1,80(sp)	#,
	ld	s2,72(sp)	#,
	ld	s3,64(sp)	#,
	ld	s4,56(sp)	#,
	ld	s5,48(sp)	#,
	ld	s6,40(sp)	#,
	ld	s7,32(sp)	#,
	ld	s8,24(sp)	#,
	ld	s9,16(sp)	#,
	ld	s10,8(sp)	#,
	add	sp,sp,96	#,,
	tail	printf	#
	.size	printmatrix, .-printmatrix
	.align	2
	.globl	naive_dgemm
	.type	naive_dgemm, @function
naive_dgemm:
	blez	a0,.L139	#, M,
	blez	a1,.L135	#, N,
	mv	t0,a5	# ivtmp.55, C
	mv	t6,a3	# ivtmp.56, A
	sll	a7,a0,3	# _78, M,
	li	t2,0	# m,
.L132:
	mv	t3,t0	# ivtmp.49, ivtmp.55
	li	t5,0	# ivtmp.51,
	li	t4,0	# n,
.L130:
	fld	fa5,0(t3)	# t, MEM[base: _66, offset: 0B]
	blez	a2,.L140	#, K,
	add	sp,sp,-32	#,,
	sd	s1,24(sp)	#,
	sd	s2,16(sp)	#,
	sd	s3,8(sp)	#,
.L128:
	sll	t1,t5,3	# tmp108, ivtmp.51,
	add	s1,a4,t1	# ivtmp.44, B, tmp108
	fld	fa3,0(t6)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa4,0(s1)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a3,a2,-1	# tmp112, K,
	li	a6,1	# k,
	and	t1,a3,7	# tmp114, tmp112,
	fmadd.d	fa5,fa3,fa4,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a5,t6,a7	# ivtmp.43, ivtmp.56, _78
	add	a3,s1,8	# ivtmp.44, ivtmp.44,
	beq	a2,a6,.L89	#, K, k,
	beqz	t1,.L90	#, tmp114,
	beq	t1,a6,.L119	#, tmp114, k,
	li	s2,2	# tmp119,
	beq	t1,s2,.L120	#, tmp114, tmp119,
	li	s3,3	# tmp118,
	beq	t1,s3,.L121	#, tmp114, tmp118,
	li	s3,4	# tmp117,
	beq	t1,s3,.L122	#, tmp114, tmp117,
	li	s3,5	# tmp116,
	beq	t1,s3,.L123	#, tmp114, tmp116,
	li	s3,6	# tmp115,
	beq	t1,s3,.L124	#, tmp114, tmp115,
	fld	ft0,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft1,8(s1)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	mv	a6,s2	# k, tmp119
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,ft0,ft1,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,s1,16	# ivtmp.44, ivtmp.44,
.L124:
	fld	ft2,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft3,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,ft2,ft3,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
.L123:
	fld	ft4,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft5,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,ft4,ft5,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
.L122:
	fld	ft6,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft7,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,ft6,ft7,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
.L121:
	fld	fa0,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa1,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,fa0,fa1,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
.L120:
	fld	fa2,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa6,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,fa2,fa6,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
.L119:
	fld	fa7,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft8,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	addw	a6,a6,1	# k, k,
	add	a5,a5,a7	# ivtmp.43, ivtmp.43, _78
	fmadd.d	fa5,fa7,ft8,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	add	a3,a3,8	# ivtmp.44, ivtmp.44,
	beq	a2,a6,.L89	#, K, k,
.L90:
	fld	ft9,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft10,0(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	add	s1,a5,a7	# ivtmp.43, ivtmp.43, _78
	fld	ft11,8(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fmadd.d	fa4,ft9,ft10,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fld	fa5,0(s1)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t1,s1,a7	# ivtmp.43, ivtmp.43, _78
	fld	fa3,16(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fld	ft0,0(t1)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	s2,t1,a7	# ivtmp.43, ivtmp.43, _78
	fld	ft4,24(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fmadd.d	ft1,fa5,ft11,fa4	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fld	ft5,0(s2)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	s3,s2,a7	# ivtmp.43, ivtmp.43, _78
	fld	ft3,32(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fld	ft6,0(s3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	a5,s3,a7	# ivtmp.43, ivtmp.43, _78
	fld	ft2,40(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fmadd.d	ft7,ft0,fa3,ft1	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fld	fa0,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	s1,a5,a7	# ivtmp.43, ivtmp.43, _78
	fld	fa6,48(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fld	fa7,0(s1)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t1,s1,a7	# ivtmp.43, ivtmp.43, _78
	fld	ft8,56(a3)	# MEM[base: _82, offset: 0B], MEM[base: _82, offset: 0B]
	fmadd.d	fa1,ft5,ft4,ft7	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fld	ft9,0(t1)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	addw	a6,a6,8	# k, k,
	add	a5,t1,a7	# ivtmp.43, ivtmp.43, _78
	add	a3,a3,64	# ivtmp.44, ivtmp.44,
	fmadd.d	fa2,ft6,ft3,fa1	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fmadd.d	ft10,fa0,ft2,fa2	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fmadd.d	ft11,fa7,fa6,ft10	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	fmadd.d	fa5,ft9,ft8,ft11	# t, MEM[base: _86, offset: 0B], MEM[base: _82, offset: 0B], t
	bne	a2,a6,.L90	#, K, k,
.L89:
	fsd	fa5,0(t3)	# t, MEM[base: _66, offset: 0B]
	addw	t4,t4,1	# n, n,
	add	t3,t3,a7	# ivtmp.49, ivtmp.49, _78
	addw	t5,t5,a2	# ivtmp.51, ivtmp.51, K
	beq	a1,t4,.L141	#, N, n,
.L91:
	fld	fa5,0(t3)	# t, MEM[base: _66, offset: 0B]
	bgtz	a2,.L128	#, K,
	fsd	fa5,0(t3)	# t, MEM[base: _66, offset: 0B]
	addw	t4,t4,1	# n, n,
	add	t3,t3,a7	# ivtmp.49, ivtmp.49, _78
	addw	t5,t5,a2	# ivtmp.51, ivtmp.51, K
	bne	a1,t4,.L91	#, N, n,
.L141:
	addw	t2,t2,1	# m, m,
	add	t0,t0,8	# ivtmp.55, ivtmp.55,
	add	t6,t6,8	# ivtmp.56, ivtmp.56,
	beq	a0,t2,.L142	#, M, m,
	mv	t3,t0	# ivtmp.49, ivtmp.55
	li	t5,0	# ivtmp.51,
	li	t4,0	# n,
	j	.L91	#
.L140:
	fsd	fa5,0(t3)	# t, MEM[base: _66, offset: 0B]
	addw	t4,t4,1	# n, n,
	add	t3,t3,a7	# ivtmp.49, ivtmp.49, _78
	addw	t5,t5,a2	# ivtmp.51, ivtmp.51, K
	bne	a1,t4,.L130	#, N, n,
	addw	t2,t2,1	# m, m,
	add	t0,t0,8	# ivtmp.55, ivtmp.55,
	add	t6,t6,8	# ivtmp.56, ivtmp.56,
	bne	a0,t2,.L132	#, M, m,
	ret
.L142:
	ld	s1,24(sp)	#,
	ld	s2,16(sp)	#,
	ld	s3,8(sp)	#,
	add	sp,sp,32	#,,
.L135:
	jr	ra	#
.L139:
	ret
	.size	naive_dgemm, .-naive_dgemm
	.align	2
	.globl	naive_4x4_dgemm
	.type	naive_4x4_dgemm, @function
naive_4x4_dgemm:
	fld	ft8,0(a4)	# pretmp_273, *B_28(D)
	fld	ft11,0(a3)	# a, *A_20(D)
	fld	fa5,0(a5)	# t, *C_13(D)
	sll	t0,a0,3	# _227, M,
	add	sp,sp,-128	#,,
	fmadd.d	ft0,ft11,ft8,fa5	# t, a, pretmp_273, t
	add	a1,a3,t0	# tmp305, A, _227
	fld	fa7,8(a4)	# pretmp_275, MEM[(double *)B_28(D) + 8B]
	fsd	fs0,72(sp)	#,
	fld	fs0,0(a1)	# a, *_226
	sllw	t2,a0,1	# tmp306, M,
	mv	a7,t2	# tmp307,
	fmadd.d	ft1,fs0,fa7,ft0	# t, a, pretmp_275, t
	sd	s1,120(sp)	#,
	sll	s1,a7,3	# _213, tmp307,
	add	a6,a3,s1	# tmp308, A, _213
	fld	ft10,0(a6)	# a, *_212
	fld	fa6,16(a4)	# pretmp_278, MEM[(double *)B_28(D) + 16B]
	sd	s2,112(sp)	#,
	addw	s2,t2,a0	# tmp312, tmp306, M
	fmadd.d	ft2,ft10,fa6,ft1	# t, a, pretmp_278, t
	sd	s3,104(sp)	#,
	sll	s3,s2,3	# _199, tmp312,
	sd	s4,96(sp)	#,
	add	s4,a3,s3	# tmp313, A, _199
	fld	ft9,0(s4)	# a, *_198
	fld	ft7,24(a4)	# pretmp_288, MEM[(double *)B_28(D) + 24B]
	fsd	fs1,64(sp)	#,
	sd	s5,88(sp)	#,
	fmadd.d	fs1,ft9,ft7,ft2	# t, a, pretmp_288, t
	sll	s5,a2,3	# _291, K,
	add	t1,a5,t0	# _193, C, _227
	sd	s6,80(sp)	#,
	add	s6,a4,s5	# _292, B, _291
	fld	ft6,0(s6)	# pretmp_304, *_292
	fld	ft5,8(s6)	# pretmp_312, *_311
	fsd	fs1,0(a5)	# t, *C_13(D)
	fld	fa0,0(t1)	# t, *_193
	fld	ft4,16(s6)	# pretmp_325, *_324
	fld	ft3,24(s6)	# pretmp_338, *_337
	fmadd.d	fa1,ft11,ft6,fa0	# t, a, pretmp_304, t
	fsd	fs2,56(sp)	#,
	sllw	t3,a2,1	# _340, K,
	addw	t5,t3,1	# tmp287, _340,
	mv	a1,t3	# _340,
	add	a7,a5,s1	# _124, C, _213
	sll	t6,t5,3	# _355, tmp287,
	fmadd.d	fa2,fs0,ft5,fa1	# t, a, pretmp_312, t
	sll	s1,a1,3	# tmp291, _340,
	add	t0,a4,t6	# tmp288, B, _355
	add	t2,s6,s5	# _343, _292, _291
	add	a6,a4,s1	# tmp290, B, tmp291
	fld	ft2,0(t0)	# pretmp_357, *_356
	fld	ft1,0(t2)	# pretmp_351, *_343
	fmadd.d	fa3,ft10,ft4,fa2	# t, a, pretmp_325, t
	fsd	fs3,48(sp)	#,
	fsd	fs4,40(sp)	#,
	fsd	fs5,32(sp)	#,
	fsd	fs6,24(sp)	#,
	fsd	fs7,16(sp)	#,
	fsd	fs8,8(sp)	#,
	fmadd.d	fs2,ft9,ft3,fa3	# t, a, pretmp_338, t
	fld	ft0,16(a6)	# pretmp_238, *_303
	fld	fa0,16(t0)	# pretmp_12, *_11
	addw	a2,t3,a2	# tmp295, _340, K
	addw	s2,a2,1	# tmp298, tmp295,
	sll	s4,s2,3	# _49, tmp298,
	add	t4,a4,s4	# tmp299, B, _49
	fsd	fs2,0(t1)	# t, *_193
	fld	fs3,0(a7)	# *_124, *_124
	add	a1,a5,s3	# _83, C, _199
	fld	fa1,0(t4)	# pretmp_51, *_50
	fmadd.d	fs4,fs0,ft2,fs3	# _6, a, pretmp_357, *_124
	add	s3,t2,s5	# tmp296, _343, _291
	fld	fa2,0(s3)	# pretmp_45, *_44
	fld	fa3,8(t4)	# pretmp_60, *_59
	sll	s5,a2,3	# tmp303, _15,
	add	a4,a4,s5	# tmp302, B, tmp303
	fld	fa4,24(a4)	# pretmp_66, *_65
	fmadd.d	fs5,ft11,ft1,fs4	# t, a, pretmp_351, _6
	fld	fs2,8(a3)	# a, MEM[(double *)A_20(D) + 8B]
	addw	s6,a0,1	# _313, M,
	mv	t1,s6	# _313,
	sll	t3,t1,3	# _339, _313,
	add	t5,a3,t3	# tmp321, A, _339
	fld	fs3,0(t5)	# a, *_352
	fmadd.d	fs6,ft10,ft0,fs5	# t, a, pretmp_238, t
	addw	t6,a0,s6	# _46, M, _313
	mv	t0,t6	# _46,
	sll	t2,t0,3	# _61, _46,
	add	s1,a3,t2	# tmp323, A, _61
	fld	fs1,0(s1)	# a, *_67
	addw	a6,a0,t6	# tmp325, M, _46
	fmadd.d	fs7,fa0,ft9,fs6	# t, pretmp_12, a, t
	sll	a2,a6,3	# _167, tmp325,
	add	t0,a3,a2	# tmp326, A, _167
	add	t5,a5,t3	# _201, C, _339
	add	t4,a5,t2	# _230, C, _61
	add	a2,a5,a2	# _268, C, _167
	addw	s2,a0,2	# _346, M,
	fsd	fs7,0(a7)	# t, *_124
	fld	fs8,0(a1)	# *_83, *_83
	mv	s4,s2	# _346,
	sll	s3,s4,3	# _348, _346,
	fmadd.d	fa5,fa1,fs0,fs8	# _1, pretmp_51, a, *_83
	fld	fs8,0(t0)	# a, *_187
	add	t2,a3,s3	# tmp334, A, _348
	addw	s5,a0,s2	# _362, M, _346
	mv	a4,s5	# _362,
	sll	s6,a4,3	# _94, _362,
	add	t6,a3,s6	# tmp336, A, _94
	fmadd.d	ft11,fa2,ft11,fa5	# t, pretmp_45, a, _1
	addw	t1,a0,s5	# tmp338, M, _362
	sll	a7,t1,3	# _101, tmp338,
	add	s2,a3,a7	# tmp339, A, _101
	addw	s1,a0,3	# _129, M,
	addw	s5,a0,s1	# _143, M, _129
	mv	a6,s1	# _129,
	fmadd.d	fs0,fa3,ft10,ft11	# t, pretmp_60, a, t
	fld	ft11,16(a3)	# a, MEM[(double *)A_20(D) + 16B]
	mv	s4,s5	# _143,
	addw	a0,a0,s5	# tmp351, M, _143
	add	t1,a5,s6	# _163, C, _94
	sll	s4,s4,3	# _145, _143,
	sll	s6,a6,3	# _131, _129,
	fmadd.d	ft10,fa4,ft9,fs0	# t, pretmp_66, a, t
	fld	fs0,0(t2)	# a, *_358
	sll	a4,a0,3	# _159, tmp351,
	add	t3,a5,s3	# _36, C, _348
	add	s1,a3,s4	# tmp349, A, _145
	add	s3,a3,s6	# tmp347, A, _131
	add	s5,a3,a4	# tmp352, A, _159
	fsd	ft10,0(a1)	# t, *_83
	fld	ft9,8(a5)	# t, MEM[(double *)C_13(D) + 8B]
	fld	ft10,0(t6)	# a, *_95
	fld	fs5,0(s3)	# a, *_132
	fmadd.d	fs7,ft8,fs2,ft9	# t, pretmp_273, a, t
	fld	ft9,0(s2)	# a, *_102
	fld	fs6,0(s1)	# a, *_146
	fld	fs4,24(a3)	# a, MEM[(double *)A_20(D) + 24B]
	add	a7,a5,a7	# _122, C, _101
	add	a6,a5,s6	# _178, C, _131
	add	s6,a5,s4	# _243, C, _145
	fmadd.d	fa5,fs3,fa7,fs7	# t, a, pretmp_275, t
	fld	fs7,0(s5)	# a, *_160
	add	s4,a5,a4	# _308, C, _159
	fmadd.d	fa5,fs1,fa6,fa5	# t, a, pretmp_278, t
	fmadd.d	fa5,fs8,ft7,fa5	# t, a, pretmp_288, t
	fsd	fa5,8(a5)	# t, MEM[(double *)C_13(D) + 8B]
	fld	fa5,0(t5)	# t, *_201
	fmadd.d	fa5,fs2,ft6,fa5	# t, a, pretmp_304, t
	fmadd.d	fa5,fs3,ft5,fa5	# t, a, pretmp_312, t
	fmadd.d	fa5,fs1,ft4,fa5	# t, a, pretmp_325, t
	fmadd.d	fa5,fs8,ft3,fa5	# t, a, pretmp_338, t
	fsd	fa5,0(t5)	# t, *_201
	fld	fa5,0(t4)	# *_230, *_230
	fmadd.d	fa5,fs3,ft2,fa5	# _317, a, pretmp_357, *_230
	fmadd.d	fa5,fs2,ft1,fa5	# t, a, pretmp_351, _317
	fmadd.d	fa5,fs1,ft0,fa5	# t, a, pretmp_238, t
	fmadd.d	fa5,fa0,fs8,fa5	# t, pretmp_12, a, t
	fsd	fa5,0(t4)	# t, *_230
	fld	fa5,0(a2)	# *_268, *_268
	fmadd.d	fs3,fa1,fs3,fa5	# _318, pretmp_51, a, *_268
	fmadd.d	fs2,fa2,fs2,fs3	# t, pretmp_45, a, _318
	fmadd.d	fs1,fa3,fs1,fs2	# t, pretmp_60, a, t
	fmadd.d	fs8,fa4,fs8,fs1	# t, pretmp_66, a, t
	fsd	fs8,0(a2)	# t, *_268
	fld	fa5,16(a5)	# t, MEM[(double *)C_13(D) + 16B]
	fmadd.d	fs3,ft8,ft11,fa5	# t, pretmp_273, a, t
	fmadd.d	fs2,fa7,fs0,fs3	# t, pretmp_275, a, t
	fmadd.d	fs1,ft10,fa6,fs2	# t, a, pretmp_278, t
	fmadd.d	fs8,ft9,ft7,fs1	# t, a, pretmp_288, t
	fsd	fs8,16(a5)	# t, MEM[(double *)C_13(D) + 16B]
	fld	fa5,0(t3)	# t, *_36
	ld	s1,120(sp)	#,
	ld	s2,112(sp)	#,
	fmadd.d	fs3,ft6,ft11,fa5	# t, pretmp_304, a, t
	ld	s3,104(sp)	#,
	ld	s5,88(sp)	#,
	fmadd.d	fs2,ft5,fs0,fs3	# t, pretmp_312, a, t
	fmadd.d	fs1,ft10,ft4,fs2	# t, a, pretmp_325, t
	fmadd.d	fs8,ft9,ft3,fs1	# t, a, pretmp_338, t
	fsd	fs8,0(t3)	# t, *_36
	fld	fa5,0(t1)	# *_163, *_163
	fmadd.d	fs3,ft2,fs0,fa5	# _319, pretmp_357, a, *_163
	fmadd.d	fs2,ft11,ft1,fs3	# t, a, pretmp_351, _319
	fmadd.d	fs1,ft10,ft0,fs2	# t, a, pretmp_238, t
	fmadd.d	fs8,fa0,ft9,fs1	# t, pretmp_12, a, t
	fsd	fs8,0(t1)	# t, *_163
	fld	fa5,0(a7)	# *_122, *_122
	fmadd.d	fs0,fa1,fs0,fa5	# _176, pretmp_51, a, *_122
	fmadd.d	ft11,fa2,ft11,fs0	# t, pretmp_45, a, _176
	fld	fs0,72(sp)	#,
	fmadd.d	ft10,fa3,ft10,ft11	# t, pretmp_60, a, t
	fmadd.d	ft9,fa4,ft9,ft10	# t, pretmp_66, a, t
	fsd	ft9,0(a7)	# t, *_122
	fld	fs3,24(a5)	# t, MEM[(double *)C_13(D) + 24B]
	fmadd.d	ft8,fs4,ft8,fs3	# t, a, pretmp_273, t
	fld	fs3,48(sp)	#,
	fmadd.d	fa7,fs5,fa7,ft8	# t, a, pretmp_275, t
	fmadd.d	fa6,fs6,fa6,fa7	# t, a, pretmp_278, t
	fmadd.d	ft7,fs7,ft7,fa6	# t, a, pretmp_288, t
	fsd	ft7,24(a5)	# t, MEM[(double *)C_13(D) + 24B]
	fld	fs2,0(a6)	# t, *_178
	fmadd.d	ft6,fs4,ft6,fs2	# t, a, pretmp_304, t
	fld	fs2,56(sp)	#,
	fmadd.d	ft5,fs5,ft5,ft6	# t, a, pretmp_312, t
	fmadd.d	ft4,fs6,ft4,ft5	# t, a, pretmp_325, t
	fmadd.d	ft3,fs7,ft3,ft4	# t, a, pretmp_338, t
	fsd	ft3,0(a6)	# t, *_178
	fld	fs1,0(s6)	# *_243, *_243
	fmadd.d	ft2,fs5,ft2,fs1	# _177, a, pretmp_357, *_243
	fld	fs1,64(sp)	#,
	fmadd.d	ft1,fs4,ft1,ft2	# t, a, pretmp_351, _177
	fmadd.d	ft0,fs6,ft0,ft1	# t, a, pretmp_238, t
	fmadd.d	fa0,fa0,fs7,ft0	# t, pretmp_12, a, t
	fsd	fa0,0(s6)	# t, *_243
	fld	fs8,0(s4)	# *_308, *_308
	ld	s6,80(sp)	#,
	fmadd.d	fa1,fa1,fs5,fs8	# _262, pretmp_51, a, *_308
	fld	fs5,32(sp)	#,
	fld	fs8,8(sp)	#,
	fmadd.d	fa2,fa2,fs4,fa1	# t, pretmp_45, a, _262
	fld	fs4,40(sp)	#,
	fmadd.d	fa3,fa3,fs6,fa2	# t, pretmp_60, a, t
	fld	fs6,24(sp)	#,
	fmadd.d	fa4,fa4,fs7,fa3	# t, pretmp_66, a, t
	fld	fs7,16(sp)	#,
	fsd	fa4,0(s4)	# t, *_308
	ld	s4,96(sp)	#,
	add	sp,sp,128	#,,
	jr	ra	#
	.size	naive_4x4_dgemm, .-naive_4x4_dgemm
	.align	2
	.globl	slow_dgemm
	.type	slow_dgemm, @function
slow_dgemm:
	blez	a0,.L192	#, M,
	blez	a1,.L190	#, N,
	add	sp,sp,-32	#,,
	sd	s1,24(sp)	#,
	sd	s2,16(sp)	#,
	mv	s1,a5	# C, C
	sd	s3,8(sp)	#,
	sd	s4,0(sp)	#,
	mv	a5,a3	# ivtmp.78, A
	sll	t1,a0,3	# _80, M,
	li	s2,0	# m,
.L151:
	mv	t2,s2	# ivtmp.73, m
	li	t0,0	# ivtmp.74,
	li	t6,0	# n,
.L152:
	blez	a2,.L150	#, K,
	sll	a3,t2,3	# tmp112, ivtmp.73,
	sll	a6,t0,3	# tmp114, ivtmp.74,
	add	t3,a4,a6	# ivtmp.68, B, tmp114
	add	t5,s1,a3	# _79, C, tmp112
	fld	fa4,0(t5)	# D__lsm.62, *_79
	fld	fa5,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa3,0(t3)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	t4,a2,-1	# tmp116, K,
	li	a7,1	# k,
	and	t4,t4,7	# tmp118, tmp116,
	fmadd.d	ft9,fa5,fa3,fa4	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a3,a5,t1	# ivtmp.67, ivtmp.78, _80
	add	a6,t3,8	# ivtmp.68, ivtmp.68,
	beq	a2,a7,.L185	#, K, k,
	beqz	t4,.L148	#, tmp118,
	beq	t4,a7,.L178	#, tmp118, k,
	li	s3,2	# tmp123,
	beq	t4,s3,.L179	#, tmp118, tmp123,
	li	s4,3	# tmp122,
	beq	t4,s4,.L180	#, tmp118, tmp122,
	li	s4,4	# tmp121,
	beq	t4,s4,.L181	#, tmp118, tmp121,
	li	s4,5	# tmp120,
	beq	t4,s4,.L182	#, tmp118, tmp120,
	li	s4,6	# tmp119,
	beq	t4,s4,.L183	#, tmp118, tmp119,
	fld	ft0,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft1,8(t3)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	mv	a7,s3	# k, tmp123
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,ft0,ft1,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,t3,16	# ivtmp.68, ivtmp.68,
.L183:
	fld	ft2,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft3,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,ft2,ft3,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
.L182:
	fld	ft4,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft5,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,ft4,ft5,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
.L181:
	fld	ft6,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft7,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,ft6,ft7,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
.L180:
	fld	fa0,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa1,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,fa0,fa1,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
.L179:
	fld	fa2,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa6,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,fa2,fa6,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
.L178:
	fld	fa7,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft8,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a7,a7,1	# k, k,
	add	a3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fmadd.d	ft9,fa7,ft8,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	add	a6,a6,8	# ivtmp.68, ivtmp.68,
	beq	a2,a7,.L185	#, K, k,
.L148:
	fld	ft10,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft11,0(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	add	t3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fld	ft0,8(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa4,ft10,ft11,ft9	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fld	fa5,0(t3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t4,t3,t1	# ivtmp.67, ivtmp.67, _80
	fld	fa3,16(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	ft1,0(t4)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	s3,t4,t1	# ivtmp.67, ivtmp.67, _80
	fld	ft4,24(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	ft5,fa5,ft0,fa4	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fld	ft6,0(s3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	s4,s3,t1	# ivtmp.67, ivtmp.67, _80
	fld	ft3,32(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	ft7,0(s4)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	a3,s4,t1	# ivtmp.67, ivtmp.67, _80
	fld	ft2,40(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa0,ft1,fa3,ft5	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fld	fa6,0(a3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t3,a3,t1	# ivtmp.67, ivtmp.67, _80
	fld	fa7,48(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	ft8,0(t3)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t4,t3,t1	# ivtmp.67, ivtmp.67, _80
	fld	ft9,56(a6)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa1,ft6,ft4,fa0	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fld	ft10,0(t4)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	addw	a7,a7,8	# k, k,
	add	a3,t4,t1	# ivtmp.67, ivtmp.67, _80
	add	a6,a6,64	# ivtmp.68, ivtmp.68,
	fmadd.d	fa2,ft7,ft3,fa1	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fmadd.d	ft11,fa6,ft2,fa2	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fmadd.d	ft0,ft8,fa7,ft11	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	fmadd.d	ft9,ft10,ft9,ft0	# D__lsm.62, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], D__lsm.62
	bne	a2,a7,.L148	#, K, k,
.L185:
	fsd	ft9,0(t5)	# D__lsm.62, *_79
.L150:
	addw	t6,t6,1	# n, n,
	addw	t2,t2,a0	# ivtmp.73, ivtmp.73, M
	addw	t0,t0,a2	# ivtmp.74, ivtmp.74, K
	bne	a1,t6,.L152	#, N, n,
	addw	s2,s2,1	# m, m,
	add	a5,a5,8	# ivtmp.78, ivtmp.78,
	bne	a0,s2,.L151	#, M, m,
	ld	s1,24(sp)	#,
	ld	s2,16(sp)	#,
	ld	s3,8(sp)	#,
	ld	s4,0(sp)	#,
	add	sp,sp,32	#,,
.L190:
	jr	ra	#
.L192:
	ret
	.size	slow_dgemm, .-slow_dgemm
	.align	2
	.globl	slow_4x4_dgemm
	.type	slow_4x4_dgemm, @function
slow_4x4_dgemm:
	fld	ft6,0(a4)	# pretmp_259, *B_30(D)
	fld	ft11,0(a3)	# _426, *A_22(D)
	fld	fa5,0(a5)	# *C_13(D), *C_13(D)
	sll	t0,a0,3	# _421, M,
	add	sp,sp,-128	#,,
	fmadd.d	ft0,ft6,ft11,fa5	# tmp314, pretmp_259, _426, *C_13(D)
	add	a1,a3,t0	# tmp305, A, _421
	fld	ft5,8(a4)	# pretmp_269, MEM[(double *)B_30(D) + 8B]
	fsd	fs0,72(sp)	#,
	fld	fs0,0(a1)	# _413, *_420
	sllw	t2,a0,1	# tmp306, M,
	mv	a6,t2	# tmp307,
	fmadd.d	ft1,ft5,fs0,ft0	# tmp316, pretmp_269, _413, tmp314
	sd	s1,120(sp)	#,
	sll	s1,a6,3	# _375, tmp307,
	add	t1,a3,s1	# tmp308, A, _375
	fld	ft4,16(a4)	# pretmp_272, MEM[(double *)B_30(D) + 16B]
	fld	ft10,0(t1)	# _333, *_354
	addw	t3,t2,a0	# tmp312, tmp306, M
	sd	s2,112(sp)	#,
	fmadd.d	ft2,ft4,ft10,ft1	# tmp317, pretmp_272, _333, tmp316
	sll	s2,t3,3	# _253, tmp312,
	sd	s3,104(sp)	#,
	add	s3,a3,s2	# tmp313, A, _253
	fld	ft3,24(a4)	# pretmp_275, MEM[(double *)B_30(D) + 24B]
	fld	ft9,0(s3)	# _251, *_252
	sd	s4,96(sp)	#,
	sll	s4,a2,3	# _278, K,
	fmadd.d	ft7,ft9,ft3,ft2	# tmp318, _251, pretmp_275, tmp317
	add	a7,a5,t0	# _247, C, _421
	sd	s5,88(sp)	#,
	add	s5,a4,s4	# _279, B, _278
	fld	ft2,0(s5)	# pretmp_280, *_279
	fsd	fs1,64(sp)	#,
	fld	ft1,8(s5)	# pretmp_294, *_293
	fsd	ft7,0(a5)	# tmp318, *C_13(D)
	fld	fs1,0(a7)	# *_247, *_247
	fld	ft0,16(s5)	# pretmp_300, *_299
	fld	fa0,24(s5)	# pretmp_320, *_317
	fmadd.d	fa3,ft2,ft11,fs1	# tmp319, pretmp_280, _426, *_247
	fsd	fs2,56(sp)	#,
	sllw	t0,a2,1	# _322, K,
	add	a6,a5,s1	# _228, C, _375
	addw	t5,t0,1	# tmp287, _322,
	mv	s1,t0	# _322,
	sll	t6,t5,3	# _338, tmp287,
	fmadd.d	fa6,ft1,fs0,fa3	# tmp321, pretmp_294, _413, tmp319
	sll	t1,s1,3	# tmp291, _322,
	add	t2,a4,t6	# tmp288, B, _338
	add	a1,s5,s4	# _326, _279, _278
	add	t3,a4,t1	# tmp290, B, tmp291
	fld	fa1,0(t2)	# pretmp_340, *_339
	fld	fa2,0(a1)	# pretmp_334, *_326
	fmadd.d	fa7,ft0,ft10,fa6	# tmp322, pretmp_300, _333, tmp321
	fld	fa3,16(t3)	# pretmp_346, *_345
	fsd	fs3,48(sp)	#,
	fsd	fs4,40(sp)	#,
	fsd	fs5,32(sp)	#,
	fsd	fs6,24(sp)	#,
	fsd	fs7,16(sp)	#,
	fmadd.d	fs2,ft9,fa0,fa7	# tmp323, _251, pretmp_320, tmp322
	fsd	fs8,8(sp)	#,
	fld	fa4,16(t2)	# pretmp_360, *_359
	addw	a2,t0,a2	# tmp295, _322, K
	addw	s3,a2,1	# tmp298, tmp295,
	sll	t4,s3,3	# _378, tmp298,
	add	s5,a4,t4	# tmp299, B, _378
	fsd	fs2,0(a7)	# tmp323, *_247
	fld	fs3,0(a6)	# *_228, *_228
	add	t3,a5,s2	# _183, C, _253
	fld	ft8,0(s5)	# pretmp_380, *_379
	fmadd.d	fs4,fa1,fs0,fs3	# tmp324, pretmp_340, _413, *_228
	add	s2,a1,s4	# tmp296, _326, _278
	fld	fa7,0(s2)	# pretmp_366, *_365
	fld	fa6,8(s5)	# pretmp_386, *_385
	sll	s4,a2,3	# tmp303, _362,
	add	a4,a4,s4	# tmp302, B, tmp303
	fld	ft7,24(a4)	# pretmp_404, *_403
	fmadd.d	fs8,fa2,ft11,fs4	# tmp326, pretmp_334, _426, tmp324
	fld	fs6,8(a3)	# _273, MEM[(double *)A_22(D) + 8B]
	addw	a7,a0,1	# _295, M,
	sll	t2,a7,3	# _321, _295,
	add	t1,a3,t2	# tmp335, A, _321
	fld	fs7,0(t1)	# _341, *_335
	addw	t0,a0,a7	# _367, M, _295
	fmadd.d	fa5,ft10,fa3,fs8	# tmp327, _333, pretmp_346, tmp326
	mv	t5,t0	# _367,
	sll	s1,t5,3	# _387, _367,
	add	a1,a3,s1	# tmp337, A, _387
	fld	fs5,0(a1)	# _156, *_407
	addw	t6,a0,t0	# tmp339, M, _367
	sll	a2,t6,3	# _219, tmp339,
	fmadd.d	fs1,ft9,fa4,fa5	# tmp328, _251, pretmp_360, tmp327
	add	s3,a3,a2	# tmp340, A, _219
	fld	fs4,0(s3)	# _241, *_240
	add	a7,a5,t2	# _261, C, _321
	add	t1,a5,s1	# _304, C, _387
	add	a2,a5,a2	# _350, C, _219
	addw	t4,a0,2	# _457, M,
	fsd	fs1,0(a6)	# tmp328, *_228
	fld	fs2,0(t3)	# *_183, *_183
	fld	fs1,16(a3)	# _438, MEM[(double *)A_22(D) + 16B]
	mv	s5,t4	# _457,
	fmadd.d	fs0,ft8,fs0,fs2	# tmp329, pretmp_380, _413, *_183
	sll	s2,s5,3	# _459, _457,
	add	t0,a3,s2	# tmp362, A, _459
	fld	fs2,0(t0)	# _477, *_476
	addw	s4,a0,t4	# _480, M, _457
	mv	a4,s4	# _480,
	sll	t2,a4,3	# _444, _480,
	fmadd.d	ft11,fa7,ft11,fs0	# tmp331, pretmp_366, _426, tmp329
	add	t6,a3,t2	# tmp364, A, _444
	addw	a6,a0,s4	# tmp366, M, _480
	sll	a1,a6,3	# _451, tmp366,
	add	s1,a3,a1	# tmp367, A, _451
	fld	fs0,0(s1)	# _453, *_452
	addw	s3,a0,3	# _167, M,
	fmadd.d	ft10,ft10,fa6,ft11	# tmp332, _333, pretmp_386, tmp331
	addw	s4,a0,s3	# _188, M, _167
	mv	a4,s4	# _188,
	mv	s5,s3	# _167,
	addw	a0,a0,s4	# tmp393, M, _188
	add	a6,a5,a1	# _138, C, _451
	sll	s3,a0,3	# _211, tmp393,
	fmadd.d	ft9,ft9,ft7,ft10	# tmp333, _251, pretmp_404, tmp332
	sll	a1,a4,3	# _190, _188,
	sll	s5,s5,3	# _169, _167,
	add	t5,a5,s2	# _465, C, _459
	add	t4,a5,t2	# _218, C, _444
	add	s2,a3,s5	# tmp389, A, _169
	add	s4,a3,s3	# tmp394, A, _211
	fsd	ft9,0(t3)	# tmp333, *_183
	fld	fs3,8(a5)	# MEM[(double *)C_13(D) + 8B], MEM[(double *)C_13(D) + 8B]
	add	t2,a3,a1	# tmp391, A, _190
	fld	fs8,0(s4)	# _213, *_212
	fmadd.d	fa5,ft6,fs6,fs3	# tmp341, pretmp_259, _273, MEM[(double *)C_13(D) + 8B]
	fld	fs3,0(t6)	# _446, *_445
	fld	ft11,0(s2)	# _171, *_170
	fld	ft10,24(a3)	# _150, MEM[(double *)A_22(D) + 24B]
	fld	ft9,0(t2)	# _192, *_191
	add	s5,a5,s5	# _231, C, _169
	add	a1,a5,a1	# _318, C, _190
	fmadd.d	fa5,ft5,fs7,fa5	# tmp343, pretmp_269, _341, tmp341
	add	a4,a5,s3	# _405, C, _211
	fmadd.d	fa5,fs5,ft4,fa5	# tmp344, _156, pretmp_272, tmp343
	fmadd.d	fa5,fs4,ft3,fa5	# tmp345, _241, pretmp_275, tmp344
	fsd	fa5,8(a5)	# tmp345, MEM[(double *)C_13(D) + 8B]
	fld	fa5,0(a7)	# *_261, *_261
	fmadd.d	fa5,fs6,ft2,fa5	# tmp346, _273, pretmp_280, *_261
	fmadd.d	fa5,ft1,fs7,fa5	# tmp348, pretmp_294, _341, tmp346
	fmadd.d	fa5,fs5,ft0,fa5	# tmp349, _156, pretmp_300, tmp348
	fmadd.d	fa5,fs4,fa0,fa5	# tmp350, _241, pretmp_320, tmp349
	fsd	fa5,0(a7)	# tmp350, *_261
	fld	fa5,0(t1)	# *_304, *_304
	fmadd.d	fa5,fa1,fs7,fa5	# tmp351, pretmp_340, _341, *_304
	fmadd.d	fa5,fs6,fa2,fa5	# tmp353, _273, pretmp_334, tmp351
	fmadd.d	fa5,fs5,fa3,fa5	# tmp354, _156, pretmp_346, tmp353
	fmadd.d	fa5,fs4,fa4,fa5	# tmp355, _241, pretmp_360, tmp354
	fsd	fa5,0(t1)	# tmp355, *_304
	fld	fa5,0(a2)	# *_350, *_350
	fmadd.d	fs7,fs7,ft8,fa5	# tmp356, _341, pretmp_380, *_350
	fmadd.d	fs6,fs6,fa7,fs7	# tmp358, _273, pretmp_366, tmp356
	fmadd.d	fs5,fs5,fa6,fs6	# tmp359, _156, pretmp_386, tmp358
	fmadd.d	fs4,fs4,ft7,fs5	# tmp360, _241, pretmp_404, tmp359
	fsd	fs4,0(a2)	# tmp360, *_350
	fld	fa5,16(a5)	# MEM[(double *)C_13(D) + 16B], MEM[(double *)C_13(D) + 16B]
	fmadd.d	fs7,ft6,fs1,fa5	# tmp368, pretmp_259, _438, MEM[(double *)C_13(D) + 16B]
	fmadd.d	fs6,ft5,fs2,fs7	# tmp370, pretmp_269, _477, tmp368
	fmadd.d	fs5,ft4,fs3,fs6	# tmp371, pretmp_272, _446, tmp370
	fmadd.d	fs4,ft3,fs0,fs5	# tmp372, pretmp_275, _453, tmp371
	fsd	fs4,16(a5)	# tmp372, MEM[(double *)C_13(D) + 16B]
	fld	fa5,0(t5)	# *_465, *_465
	ld	s1,120(sp)	#,
	ld	s2,112(sp)	#,
	fmadd.d	fs7,ft2,fs1,fa5	# tmp373, pretmp_280, _438, *_465
	ld	s3,104(sp)	#,
	ld	s4,96(sp)	#,
	fmadd.d	fs6,ft1,fs2,fs7	# tmp375, pretmp_294, _477, tmp373
	fmadd.d	fs5,ft0,fs3,fs6	# tmp376, pretmp_300, _446, tmp375
	fmadd.d	fs4,fa0,fs0,fs5	# tmp377, pretmp_320, _453, tmp376
	fsd	fs4,0(t5)	# tmp377, *_465
	fld	fa5,0(t4)	# *_218, *_218
	fmadd.d	fs7,fa1,fs2,fa5	# tmp378, pretmp_340, _477, *_218
	fmadd.d	fs6,fa2,fs1,fs7	# tmp380, pretmp_334, _438, tmp378
	fmadd.d	fs5,fa3,fs3,fs6	# tmp381, pretmp_346, _446, tmp380
	fmadd.d	fs4,fa4,fs0,fs5	# tmp382, pretmp_360, _453, tmp381
	fsd	fs4,0(t4)	# tmp382, *_218
	fld	fa5,0(a6)	# *_138, *_138
	fmadd.d	fs2,ft8,fs2,fa5	# tmp383, pretmp_380, _477, *_138
	fmadd.d	fs1,fa7,fs1,fs2	# tmp385, pretmp_366, _438, tmp383
	fld	fs2,56(sp)	#,
	fmadd.d	fs3,fa6,fs3,fs1	# tmp386, pretmp_386, _446, tmp385
	fld	fs1,64(sp)	#,
	fmadd.d	fs0,ft7,fs0,fs3	# tmp387, pretmp_404, _453, tmp386
	fld	fs3,48(sp)	#,
	fsd	fs0,0(a6)	# tmp387, *_138
	fld	fs7,24(a5)	# MEM[(double *)C_13(D) + 24B], MEM[(double *)C_13(D) + 24B]
	fld	fs0,72(sp)	#,
	fmadd.d	ft6,ft10,ft6,fs7	# tmp395, _150, pretmp_259, MEM[(double *)C_13(D) + 24B]
	fld	fs7,16(sp)	#,
	fmadd.d	ft5,ft11,ft5,ft6	# tmp397, _171, pretmp_269, tmp395
	fmadd.d	ft4,ft9,ft4,ft5	# tmp398, _192, pretmp_272, tmp397
	fmadd.d	ft3,fs8,ft3,ft4	# tmp399, _213, pretmp_275, tmp398
	fsd	ft3,24(a5)	# tmp399, MEM[(double *)C_13(D) + 24B]
	fld	fs6,0(s5)	# *_231, *_231
	fmadd.d	ft2,ft10,ft2,fs6	# tmp400, _150, pretmp_280, *_231
	fld	fs6,24(sp)	#,
	fmadd.d	ft1,ft11,ft1,ft2	# tmp402, _171, pretmp_294, tmp400
	fmadd.d	ft0,ft9,ft0,ft1	# tmp403, _192, pretmp_300, tmp402
	fmadd.d	fa0,fs8,fa0,ft0	# tmp404, _213, pretmp_320, tmp403
	fsd	fa0,0(s5)	# tmp404, *_231
	fld	fs5,0(a1)	# *_318, *_318
	ld	s5,88(sp)	#,
	fmadd.d	fa1,ft11,fa1,fs5	# tmp405, _171, pretmp_340, *_318
	fld	fs5,32(sp)	#,
	fmadd.d	fa2,ft10,fa2,fa1	# tmp407, _150, pretmp_334, tmp405
	fmadd.d	fa3,ft9,fa3,fa2	# tmp408, _192, pretmp_346, tmp407
	fmadd.d	fa4,fs8,fa4,fa3	# tmp409, _213, pretmp_360, tmp408
	fsd	fa4,0(a1)	# tmp409, *_318
	fld	fs4,0(a4)	# *_405, *_405
	fmadd.d	ft8,ft11,ft8,fs4	# tmp410, _171, pretmp_380, *_405
	fld	fs4,40(sp)	#,
	fmadd.d	fa7,ft10,fa7,ft8	# tmp412, _150, pretmp_366, tmp410
	fmadd.d	fa6,ft9,fa6,fa7	# tmp413, _192, pretmp_386, tmp412
	fmadd.d	ft7,fs8,ft7,fa6	# tmp414, _213, pretmp_404, tmp413
	fld	fs8,8(sp)	#,
	add	sp,sp,128	#,,
	fsd	ft7,0(a4)	# tmp414, *_405
	jr	ra	#
	.size	slow_4x4_dgemm, .-slow_4x4_dgemm
	.align	2
	.globl	fast_4x4_dgemm
	.type	fast_4x4_dgemm, @function
fast_4x4_dgemm:
	add	sp,sp,-160	#,,
	sd	s0,144(sp)	#,
	sd	s1,136(sp)	#,
	sd	s2,128(sp)	#,
	sd	s3,120(sp)	#,
	sd	s4,112(sp)	#,
	sd	s5,104(sp)	#,
	sd	s6,96(sp)	#,
	sd	s7,88(sp)	#,
	sd	s8,80(sp)	#,
	sd	s9,72(sp)	#,
	sd	s10,64(sp)	#,
	sd	s11,56(sp)	#,
	sd	ra,152(sp)	#,
	add	s0,sp,160	#,,
	add	sp,sp,-480	#,,
	add	s1,sp,31	# tmp153,,
	and	s1,s1,-32	# tmp155, tmp153,
	mv	s5,a5	# ivtmp.90, C
	mv	s10,a2	# K, K
	mv	s11,a3	# A, A
	mv	s9,a4	# B, B
	mv	s3,s1	# ivtmp.91, tmp155
	sll	s4,a0,3	# _151, M,
	add	s8,s1,128	# _148, tmp155,
	mv	s6,a5	# ivtmp.112, ivtmp.90
	mv	s2,s1	# ivtmp.111, tmp155
	li	s7,32	# tmp236,
.L196:
 #APP
# 103 "matmul.c" 1
	# initial memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s6	#, ivtmp.112
	mv	a0,s2	#, ivtmp.111
	mv	a2,s7	#, tmp236
	add	s2,s2,32	# ivtmp.111, ivtmp.111,
	call	memcpy	#
	add	s6,s6,s4	# ivtmp.112, ivtmp.112, _151
	bne	s2,s8,.L196	#, ivtmp.111, _148,
	sll	ra,s10,3	# _83, K,
	add	s7,s9,ra	# ivtmp.101, ivtmp.100, _83
	add	s6,s7,ra	# ivtmp.102, ivtmp.101, _83
	add	a5,s1,416	# tmp233, tmp155,
	add	s10,s6,ra	# ivtmp.103, ivtmp.102, _83
	add	s8,s9,32	# _5, ivtmp.100,
	sd	a5,-152(s0)	# tmp233, %sfp
.L197:
	ld	a0,-152(s0)	#, %sfp
	mv	a1,s11	#, ivtmp.99
	li	a2,32	#,
	call	memcpy	#
	ld	a0,0(s1)	# c, c
	ld	a1,416(s1)	# a, a
	ld	a2,8(s1)	# c, c
	sd	a0,384(s1)	# c,
	sd	a1,352(s1)	# a,
	ld	a3,424(s1)	# a, a
	ld	t0,16(s1)	# c, c
	ld	t1,24(s1)	# c, c
	ld	t2,432(s1)	# a, a
	ld	a4,440(s1)	# a, a
	fld	fa1,0(s9)	# bv, MEM[base: _28, offset: 0B]
	fld	fa2,352(s1)	# _59,
	fld	fa5,384(s1)	# tmp174,
	sd	a2,392(s1)	# c,
	sd	a3,360(s1)	# a,
	sd	t0,400(s1)	# c,
	sd	t1,408(s1)	# c,
	sd	t2,368(s1)	# a,
	sd	a4,376(s1)	# a,
	fld	fa3,360(s1)	# _16,
	fld	fa4,368(s1)	# _143,
	fld	ft3,376(s1)	# _21,
	fld	ft0,392(s1)	# tmp176,
	fld	fa0,400(s1)	# tmp178,
	fld	ft2,408(s1)	# tmp180,
	fmadd.d	ft1,fa2,fa1,fa5	# tmp173, _59, bv, tmp174
	fmadd.d	ft4,fa3,fa1,ft0	# tmp175, _16, bv, tmp176
	fmadd.d	ft5,fa1,fa4,fa0	# tmp177, bv, _143, tmp178
	fmadd.d	ft6,ft3,fa1,ft2	# tmp179, _21, bv, tmp180
	add	s9,s9,8	# ivtmp.100, ivtmp.100,
	add	s11,s11,s4	# ivtmp.99, ivtmp.99, _151
	add	s7,s7,8	# ivtmp.101, ivtmp.101,
	fsd	ft1,-144(s0)	# tmp173,
	ld	a6,-144(s0)	# tmp181,
	fsd	ft4,-136(s0)	# tmp175,
	fsd	ft5,-128(s0)	# tmp177,
	fsd	ft6,-120(s0)	# tmp179,
	sd	a6,0(s1)	# tmp181, c
	ld	a7,-136(s0)	# tmp182,
	add	s6,s6,8	# ivtmp.102, ivtmp.102,
	add	s10,s10,8	# ivtmp.103, ivtmp.103,
	sd	a7,8(s1)	# tmp182, c
	ld	t3,32(s1)	# c, c
	ld	t4,40(s1)	# c, c
	ld	t5,48(s1)	# c, c
	ld	t6,56(s1)	# c, c
	fld	ft7,-8(s7)	# bv, MEM[base: _9, offset: 0B]
	sd	t3,288(s1)	# c,
	sd	t4,296(s1)	# c,
	sd	t5,304(s1)	# c,
	sd	t6,312(s1)	# c,
	fld	fa6,288(s1)	# tmp190,
	fld	fa7,296(s1)	# tmp192,
	fld	ft8,304(s1)	# tmp194,
	fld	ft9,312(s1)	# tmp196,
	fmadd.d	ft10,fa2,ft7,fa6	# tmp189, _59, bv, tmp190
	fmadd.d	ft11,fa3,ft7,fa7	# tmp191, _16, bv, tmp192
	fmadd.d	fa5,ft7,fa4,ft8	# tmp193, bv, _143, tmp194
	fmadd.d	fa1,ft3,ft7,ft9	# tmp195, _21, bv, tmp196
	ld	a5,-128(s0)	# tmp183,
	ld	a0,-120(s0)	# tmp184,
	ld	a1,64(s1)	# c, c
	fsd	ft10,-144(s0)	# tmp189,
	fsd	ft11,-136(s0)	# tmp191,
	fsd	fa5,-128(s0)	# tmp193,
	fsd	fa1,-120(s0)	# tmp195,
	sd	a5,16(s1)	# tmp183, c
	sd	a0,24(s1)	# tmp184, c
	ld	a2,-144(s0)	# tmp197,
	fld	ft4,-8(s6)	# bv, MEM[base: _8, offset: 0B]
	sd	a2,32(s1)	# tmp197, c
	ld	a3,-136(s0)	# tmp198,
	sd	a3,40(s1)	# tmp198, c
	ld	t0,-128(s0)	# tmp199,
	sd	t0,48(s1)	# tmp199, c
	ld	t1,-120(s0)	# tmp200,
	sd	a1,224(s1)	# c,
	sd	t1,56(s1)	# tmp200, c
	ld	t2,72(s1)	# c, c
	ld	a4,80(s1)	# c, c
	ld	a6,88(s1)	# c, c
	sd	t2,232(s1)	# c,
	sd	a4,240(s1)	# c,
	sd	a6,248(s1)	# c,
	fld	ft1,224(s1)	# tmp206,
	fld	ft0,232(s1)	# tmp208,
	fld	fa0,240(s1)	# tmp210,
	fld	ft2,248(s1)	# tmp212,
	fmadd.d	ft5,fa2,ft4,ft1	# tmp205, _59, bv, tmp206
	fmadd.d	ft6,fa3,ft4,ft0	# tmp207, _16, bv, tmp208
	fmadd.d	ft7,ft4,fa4,fa0	# tmp209, bv, _143, tmp210
	fmadd.d	fa6,ft3,ft4,ft2	# tmp211, _21, bv, tmp212
	ld	a7,96(s1)	# c, c
	ld	t3,104(s1)	# c, c
	ld	t4,112(s1)	# c, c
	fsd	ft5,-144(s0)	# tmp205,
	fsd	ft6,-136(s0)	# tmp207,
	fsd	ft7,-128(s0)	# tmp209,
	fsd	fa6,-120(s0)	# tmp211,
	fld	fa7,-8(s10)	# bv, MEM[base: _7, offset: 0B]
	sd	a7,160(s1)	# c,
	ld	t6,-144(s0)	# tmp213,
	fld	ft8,160(s1)	# tmp222,
	ld	t5,120(s1)	# c, c
	sd	t6,64(s1)	# tmp213, c
	ld	a5,-136(s0)	# tmp214,
	fmadd.d	fa2,fa2,fa7,ft8	# tmp221, _59, bv, tmp222
	sd	a5,72(s1)	# tmp214, c
	ld	a0,-128(s0)	# tmp215,
	sd	a0,80(s1)	# tmp215, c
	ld	a1,-120(s0)	# tmp216,
	sd	t3,168(s1)	# c,
	sd	t4,176(s1)	# c,
	sd	a1,88(s1)	# tmp216, c
	sd	t5,184(s1)	# c,
	fsd	fa2,-144(s0)	# tmp221,
	fld	ft9,168(s1)	# tmp224,
	fld	ft10,176(s1)	# tmp226,
	fld	ft11,184(s1)	# tmp228,
	fmadd.d	fa3,fa3,fa7,ft9	# tmp223, _16, bv, tmp224
	ld	a2,-144(s0)	# tmp229,
	fmadd.d	fa4,fa7,fa4,ft10	# tmp225, bv, _143, tmp226
	fmadd.d	ft3,ft3,fa7,ft11	# tmp227, _21, bv, tmp228
	sd	a2,96(s1)	# tmp229, c
	fsd	fa3,-136(s0)	# tmp223,
	ld	a3,-136(s0)	# tmp230,
	fsd	fa4,-128(s0)	# tmp225,
	fsd	ft3,-120(s0)	# tmp227,
	sd	a3,104(s1)	# tmp230, c
	ld	t0,-128(s0)	# tmp231,
	sd	t0,112(s1)	# tmp231, c
	ld	t1,-120(s0)	# tmp232,
	sd	t1,120(s1)	# tmp232, c
	bne	s8,s9,.L197	#, _5, ivtmp.100,
	li	s1,32	# tmp234,
.L199:
 #APP
# 117 "matmul.c" 1
	# final memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s3	#, ivtmp.91
	mv	a0,s5	#, ivtmp.90
	mv	a2,s1	#, tmp234
	add	s3,s3,32	# ivtmp.91, ivtmp.91,
	call	memcpy	#
	add	s5,s5,s4	# ivtmp.90, ivtmp.90, _151
	bne	s2,s3,.L199	#, ivtmp.111, ivtmp.91,
	add	sp,s0,-160	#,,
	ld	ra,152(sp)	#,
	ld	s0,144(sp)	#,
	ld	s1,136(sp)	#,
	ld	s2,128(sp)	#,
	ld	s3,120(sp)	#,
	ld	s4,112(sp)	#,
	ld	s5,104(sp)	#,
	ld	s6,96(sp)	#,
	ld	s7,88(sp)	#,
	ld	s8,80(sp)	#,
	ld	s9,72(sp)	#,
	ld	s10,64(sp)	#,
	ld	s11,56(sp)	#,
	add	sp,sp,160	#,,
	jr	ra	#
	.size	fast_4x4_dgemm, .-fast_4x4_dgemm
	.align	2
	.globl	do_4x4_block_fast
	.type	do_4x4_block_fast, @function
do_4x4_block_fast:
	add	sp,sp,-160	#,,
	sd	s0,144(sp)	#,
	sd	s1,136(sp)	#,
	sd	s2,128(sp)	#,
	sd	s3,120(sp)	#,
	sd	s4,112(sp)	#,
	sd	s5,104(sp)	#,
	sd	s6,96(sp)	#,
	sd	s7,88(sp)	#,
	sd	s8,80(sp)	#,
	sd	s9,72(sp)	#,
	sd	s10,64(sp)	#,
	sd	s11,56(sp)	#,
	add	s0,sp,160	#,,
	sd	ra,152(sp)	#,
	add	sp,sp,-480	#,,
	add	s1,sp,31	# tmp155,,
	and	s1,s1,-32	# tmp157, tmp155,
	mv	s6,a6	# ivtmp.122, C
	sw	a2,-152(s0)	# K, %sfp
	mv	s2,a3	# kdepth, kdepth
	mv	s11,a4	# A, A
	mv	s9,a5	# B, B
	mv	s5,s1	# ivtmp.123, tmp157
	sll	s3,a0,3	# _151, M,
	add	s10,s1,128	# _133, tmp157,
	mv	s7,a6	# ivtmp.142, ivtmp.122
	mv	s4,s1	# ivtmp.141, tmp157
	li	s8,32	# tmp243,
.L205:
 #APP
# 125 "matmul.c" 1
	# initial memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s7	#, ivtmp.142
	mv	a0,s4	#, ivtmp.141
	mv	a2,s8	#, tmp243
	add	s4,s4,32	# ivtmp.141, ivtmp.141,
	call	memcpy	#
	add	s7,s7,s3	# ivtmp.142, ivtmp.142, _151
	bne	s4,s10,.L205	#, ivtmp.141, _133,
	blez	s2,.L209	#, kdepth,
	lw	ra,-152(s0)	# K, %sfp
	addw	t0,s2,-1	# tmp167, kdepth,
	sll	t2,t0,32	# tmp168, tmp167,
	sll	t1,ra,3	# _89, K,
	srl	a0,t2,32	# tmp168, tmp168,
	add	s8,s9,t1	# ivtmp.130, ivtmp.129, _89
	add	a1,a0,1	# tmp169, tmp168,
	add	s7,s8,t1	# ivtmp.131, ivtmp.130, _89
	sll	a2,a1,3	# tmp170, tmp169,
	add	a5,s1,416	# tmp240, tmp157,
	add	s10,s7,t1	# ivtmp.132, ivtmp.131, _89
	add	s2,s9,a2	# _3, ivtmp.129, tmp170
	sd	a5,-152(s0)	# tmp240, %sfp
.L208:
	ld	a0,-152(s0)	#, %sfp
	mv	a1,s11	#, ivtmp.128
	li	a2,32	#,
	call	memcpy	#
	ld	a4,0(s1)	# c, c
	ld	a6,416(s1)	# a, a
	ld	a7,8(s1)	# c, c
	sd	a4,384(s1)	# c,
	sd	a6,352(s1)	# a,
	ld	a3,424(s1)	# a, a
	ld	t3,16(s1)	# c, c
	ld	t4,24(s1)	# c, c
	ld	t5,432(s1)	# a, a
	ld	t6,440(s1)	# a, a
	fld	fa1,0(s9)	# bv, MEM[base: _38, offset: 0B]
	fld	fa2,352(s1)	# _90,
	fld	fa5,384(s1)	# tmp181,
	sd	a7,392(s1)	# c,
	sd	a3,360(s1)	# a,
	sd	t3,400(s1)	# c,
	sd	t4,408(s1)	# c,
	sd	t5,368(s1)	# a,
	sd	t6,376(s1)	# a,
	fld	fa3,360(s1)	# _16,
	fld	fa4,368(s1)	# _148,
	fld	ft3,376(s1)	# _21,
	fld	ft0,392(s1)	# tmp183,
	fld	fa0,400(s1)	# tmp185,
	fld	ft2,408(s1)	# tmp187,
	fmadd.d	ft1,fa1,fa2,fa5	# tmp180, bv, _90, tmp181
	fmadd.d	ft4,fa3,fa1,ft0	# tmp182, _16, bv, tmp183
	fmadd.d	ft5,fa1,fa4,fa0	# tmp184, bv, _148, tmp185
	fmadd.d	ft6,ft3,fa1,ft2	# tmp186, _21, bv, tmp187
	add	s9,s9,8	# ivtmp.129, ivtmp.129,
	add	s11,s11,s3	# ivtmp.128, ivtmp.128, _151
	add	s8,s8,8	# ivtmp.130, ivtmp.130,
	fsd	ft1,-144(s0)	# tmp180,
	ld	t0,-144(s0)	# tmp188,
	fsd	ft4,-136(s0)	# tmp182,
	fsd	ft5,-128(s0)	# tmp184,
	fsd	ft6,-120(s0)	# tmp186,
	sd	t0,0(s1)	# tmp188, c
	ld	t1,-136(s0)	# tmp189,
	add	s7,s7,8	# ivtmp.131, ivtmp.131,
	add	s10,s10,8	# ivtmp.132, ivtmp.132,
	sd	t1,8(s1)	# tmp189, c
	ld	t2,32(s1)	# c, c
	ld	a0,40(s1)	# c, c
	ld	a1,48(s1)	# c, c
	ld	a2,56(s1)	# c, c
	fld	ft7,-8(s8)	# bv, MEM[base: _37, offset: 0B]
	sd	t2,288(s1)	# c,
	sd	a0,296(s1)	# c,
	sd	a1,304(s1)	# c,
	sd	a2,312(s1)	# c,
	fld	fa6,288(s1)	# tmp197,
	fld	fa7,296(s1)	# tmp199,
	fld	ft8,304(s1)	# tmp201,
	fld	ft9,312(s1)	# tmp203,
	fmadd.d	ft10,ft7,fa2,fa6	# tmp196, bv, _90, tmp197
	fmadd.d	ft11,fa3,ft7,fa7	# tmp198, _16, bv, tmp199
	fmadd.d	fa5,ft7,fa4,ft8	# tmp200, bv, _148, tmp201
	fmadd.d	fa1,ft3,ft7,ft9	# tmp202, _21, bv, tmp203
	ld	a5,-128(s0)	# tmp190,
	ld	a4,-120(s0)	# tmp191,
	ld	a6,64(s1)	# c, c
	fsd	ft10,-144(s0)	# tmp196,
	fsd	ft11,-136(s0)	# tmp198,
	fsd	fa5,-128(s0)	# tmp200,
	fsd	fa1,-120(s0)	# tmp202,
	sd	a5,16(s1)	# tmp190, c
	sd	a4,24(s1)	# tmp191, c
	ld	a7,-144(s0)	# tmp204,
	fld	ft4,-8(s7)	# bv, MEM[base: _36, offset: 0B]
	sd	a7,32(s1)	# tmp204, c
	ld	a3,-136(s0)	# tmp205,
	sd	a3,40(s1)	# tmp205, c
	ld	t3,-128(s0)	# tmp206,
	sd	t3,48(s1)	# tmp206, c
	ld	t4,-120(s0)	# tmp207,
	sd	a6,224(s1)	# c,
	sd	t4,56(s1)	# tmp207, c
	ld	t5,72(s1)	# c, c
	ld	t6,80(s1)	# c, c
	ld	t0,88(s1)	# c, c
	sd	t5,232(s1)	# c,
	sd	t6,240(s1)	# c,
	sd	t0,248(s1)	# c,
	fld	ft1,224(s1)	# tmp213,
	fld	ft0,232(s1)	# tmp215,
	fld	fa0,240(s1)	# tmp217,
	fld	ft2,248(s1)	# tmp219,
	fmadd.d	ft5,fa2,ft4,ft1	# tmp212, _90, bv, tmp213
	fmadd.d	ft6,fa3,ft4,ft0	# tmp214, _16, bv, tmp215
	fmadd.d	ft7,ft4,fa4,fa0	# tmp216, bv, _148, tmp217
	fmadd.d	fa6,ft3,ft4,ft2	# tmp218, _21, bv, tmp219
	ld	t1,96(s1)	# c, c
	ld	t2,104(s1)	# c, c
	ld	a1,112(s1)	# c, c
	fsd	ft5,-144(s0)	# tmp212,
	fsd	ft6,-136(s0)	# tmp214,
	fsd	ft7,-128(s0)	# tmp216,
	fsd	fa6,-120(s0)	# tmp218,
	fld	fa7,-8(s10)	# bv, MEM[base: _34, offset: 0B]
	sd	t1,160(s1)	# c,
	ld	a0,-144(s0)	# tmp220,
	fld	ft8,160(s1)	# tmp229,
	ld	a2,120(s1)	# c, c
	sd	a0,64(s1)	# tmp220, c
	ld	a5,-136(s0)	# tmp221,
	fmadd.d	fa2,fa2,fa7,ft8	# tmp228, _90, bv, tmp229
	sd	a5,72(s1)	# tmp221, c
	ld	a4,-128(s0)	# tmp222,
	sd	a4,80(s1)	# tmp222, c
	ld	a6,-120(s0)	# tmp223,
	sd	t2,168(s1)	# c,
	sd	a1,176(s1)	# c,
	sd	a6,88(s1)	# tmp223, c
	sd	a2,184(s1)	# c,
	fsd	fa2,-144(s0)	# tmp228,
	fld	ft9,168(s1)	# tmp231,
	fld	ft10,176(s1)	# tmp233,
	fld	ft11,184(s1)	# tmp235,
	fmadd.d	fa3,fa3,fa7,ft9	# tmp230, _16, bv, tmp231
	ld	a7,-144(s0)	# tmp236,
	fmadd.d	fa4,fa7,fa4,ft10	# tmp232, bv, _148, tmp233
	fmadd.d	ft3,ft3,fa7,ft11	# tmp234, _21, bv, tmp235
	sd	a7,96(s1)	# tmp236, c
	fsd	fa3,-136(s0)	# tmp230,
	ld	a3,-136(s0)	# tmp237,
	fsd	fa4,-128(s0)	# tmp232,
	fsd	ft3,-120(s0)	# tmp234,
	sd	a3,104(s1)	# tmp237, c
	ld	t3,-128(s0)	# tmp238,
	sd	t3,112(s1)	# tmp238, c
	ld	t4,-120(s0)	# tmp239,
	sd	t4,120(s1)	# tmp239, c
	bne	s2,s9,.L208	#, _3, ivtmp.129,
.L209:
	li	s1,32	# tmp241,
.L207:
 #APP
# 139 "matmul.c" 1
	# final memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s5	#, ivtmp.123
	mv	a0,s6	#, ivtmp.122
	mv	a2,s1	#, tmp241
	add	s5,s5,32	# ivtmp.123, ivtmp.123,
	call	memcpy	#
	add	s6,s6,s3	# ivtmp.122, ivtmp.122, _151
	bne	s4,s5,.L207	#, ivtmp.141, ivtmp.123,
	add	sp,s0,-160	#,,
	ld	ra,152(sp)	#,
	ld	s0,144(sp)	#,
	ld	s1,136(sp)	#,
	ld	s2,128(sp)	#,
	ld	s3,120(sp)	#,
	ld	s4,112(sp)	#,
	ld	s5,104(sp)	#,
	ld	s6,96(sp)	#,
	ld	s7,88(sp)	#,
	ld	s8,80(sp)	#,
	ld	s9,72(sp)	#,
	ld	s10,64(sp)	#,
	ld	s11,56(sp)	#,
	add	sp,sp,160	#,,
	jr	ra	#
	.size	do_4x4_block_fast, .-do_4x4_block_fast
	.align	2
	.globl	blocked_dgemm
	.type	blocked_dgemm, @function
blocked_dgemm:
	add	sp,sp,-448	#,,
	sd	s0,432(sp)	#,
	sd	ra,440(sp)	#,
	sd	s1,424(sp)	#,
	sd	s2,416(sp)	#,
	sd	s3,408(sp)	#,
	sd	s4,400(sp)	#,
	sd	s5,392(sp)	#,
	sd	s6,384(sp)	#,
	sd	s7,376(sp)	#,
	sd	s8,368(sp)	#,
	sd	s9,360(sp)	#,
	sd	s10,352(sp)	#,
	sd	s11,344(sp)	#,
	add	s0,sp,448	#,,
	add	sp,sp,-480	#,,
	blez	a2,.L214	#, K,
	sllw	a7,a2,1	# _405, K,
	addw	t1,a7,a2	# tmp394, _405, K
	blez	a1,.L214	#, N,
	mv	ra,a0	# M, M
	add	a6,sp,31	# tmp383,,
	sw	a0,-240(s0)	# M, %sfp
	mv	a0,a2	# K, K
	and	s10,a6,-32	# tmp385, tmp383,
	sd	a3,-352(s0)	# A, %sfp
	sw	a1,-380(s0)	# N, %sfp
	sw	a2,-256(s0)	# K, %sfp
	sllw	a1,a2,2	# tmp396, K,
	mv	a3,a0	# K,
	sllw	a2,ra,2	# tmp398, M,
	add	s7,s10,128	# _404, tmp385,
	sd	a5,-320(s0)	# C, %sfp
	sd	a4,-312(s0)	# B, %sfp
	mv	t2,ra	# M,
	sllw	s1,ra,5	# _583, M,
	sllw	a4,a0,5	# _577, K,
	sll	s2,a1,3	# _57, tmp396,
	sll	s3,a2,3	# _76, tmp398,
	sll	s4,a3,3	# _26, K,
	sll	s5,a7,3	# _18, _405,
	sll	s6,t1,3	# _11, _406,
	add	a5,s10,416	# tmp541, tmp385,
	sd	s7,-200(s0)	# _404, %sfp
	sw	s1,-376(s0)	# _583, %sfp
	mv	s7,s10	# tmp385, tmp385
	sw	a4,-436(s0)	# _577, %sfp
	sd	s2,-360(s0)	# _57, %sfp
	sd	s3,-368(s0)	# _76, %sfp
	sll	s8,t2,3	# _423, M,
	sd	s4,-408(s0)	# _26, %sfp
	sd	s5,-400(s0)	# _18, %sfp
	sd	s6,-392(s0)	# _11, %sfp
	sd	zero,-264(s0)	#, %sfp
	sw	zero,-340(s0)	#, %sfp
	sw	zero,-248(s0)	#, %sfp
	mv	s10,a5	# tmp541, tmp541
.L219:
	lw	t3,-248(s0)	#, %sfp
	lw	t5,-256(s0)	#, %sfp
	addw	t4,t3,32	# _586, ivtmp.281,
	sw	t4,-440(s0)	# _586, %sfp
	sw	t5,-268(s0)	# K, %sfp
	ble	t5,t4,.L217	#, K, _586,
	sw	t4,-268(s0)	# _586, %sfp
.L217:
	lw	t6,-268(s0)	#, %sfp
	lw	a7,-248(s0)	#, %sfp
	lw	ra,-340(s0)	# _376, %sfp
	lw	a0,-240(s0)	#, %sfp
	subw	a6,t6,a7	# _516, kend, ivtmp.281
	sw	a6,-188(s0)	# _516, %sfp
	sd	ra,-328(s0)	# _376, %sfp
	blez	a0,.L223	#, M,
	lw	a1,-188(s0)	#, %sfp
	ld	a3,-328(s0)	# _376, %sfp
	ld	a4,-352(s0)	# A, %sfp
	addw	t0,a1,-1	# tmp404, _516,
	sll	a2,t0,32	# tmp405, tmp404,
	srl	t2,a2,32	# tmp405, tmp405,
	sll	t1,a3,3	# tmp403, _376,
	sll	s1,t2,3	# _540, tmp405,
	add	s2,a4,t1	# ivtmp.269, A, tmp403
	add	s3,s1,8	# tmp532, _540,
	sd	s2,-432(s0)	# ivtmp.269, %sfp
	sw	zero,-300(s0)	#, %sfp
	sw	zero,-288(s0)	#, %sfp
	sw	zero,-252(s0)	#, %sfp
	sd	s3,-448(s0)	# tmp532, %sfp
	mv	s11,s8	# _423, _423
.L222:
	lw	s8,-252(s0)	#, %sfp
	lw	s5,-380(s0)	#, %sfp
	addw	s4,s8,32	# _36, n,
	sw	s4,-384(s0)	# _36, %sfp
	sw	s5,-272(s0)	# N, %sfp
	ble	s5,s4,.L220	#, N, _36,
	sw	s4,-272(s0)	# _36, %sfp
.L220:
	lw	s6,-272(s0)	#, %sfp
	lw	a5,-252(s0)	#, %sfp
	lw	s2,-240(s0)	#, %sfp
	lw	s4,-256(s0)	#, %sfp
	subw	s9,s6,a5	# tmp406, nend, n
	sraw	t3,s9,31	# tmp407, tmp406,
	srlw	t4,t3,30	# tmp408, tmp407,
	addw	t5,s9,t4	# tmp409, tmp406, tmp408
	and	t6,t5,3	# tmp410, tmp409,
	subw	a6,t6,t4	# _363, tmp410, tmp408
	subw	t0,s6,a6	# _364, nend, _363
	mulw	s3,t0,s2	# _370, _364, M
	lw	a7,-300(s0)	# ivtmp.277, %sfp
	ld	a0,-264(s0)	# ivtmp.283, %sfp
	lw	ra,-288(s0)	# ivtmp.276, %sfp
	ld	a3,-320(s0)	# C, %sfp
	ld	s1,-312(s0)	# B, %sfp
	add	a1,a7,a0	# tmp415, ivtmp.277, ivtmp.283
	ld	s8,-432(s0)	# ivtmp.269, %sfp
	sll	a2,ra,3	# tmp413, ivtmp.276,
	sll	t2,a1,3	# tmp416, tmp415,
	mulw	s5,t0,s4	# ivtmp.185, _364, K
	add	t1,a3,a2	# ivtmp.270, C, tmp413
	add	a4,s1,t2	# ivtmp.256, B, tmp416
	mv	s9,s11	# _423, _423
	sw	a6,-304(s0)	# _363, %sfp
	sw	t0,-192(s0)	# _364, %sfp
	sd	t1,-336(s0)	# ivtmp.270, %sfp
	sd	a4,-424(s0)	# ivtmp.256, %sfp
	sw	s3,-372(s0)	# _370, %sfp
	sd	s8,-296(s0)	# ivtmp.269, %sfp
	sw	zero,-236(s0)	#, %sfp
	li	s6,32	# tmp533,
	sw	s5,-344(s0)	# ivtmp.185, %sfp
	mv	s11,s7	# tmp385, tmp385
.L221:
	lw	s7,-236(s0)	#, %sfp
	lw	t3,-240(s0)	#, %sfp
	addw	a5,s7,32	# _39, m,
	sw	a5,-412(s0)	# _39, %sfp
	sw	t3,-244(s0)	# M, %sfp
	ble	t3,a5,.L224	#, M, _39,
	sw	a5,-244(s0)	# _39, %sfp
.L224:
	lw	t4,-244(s0)	#, %sfp
	lw	t5,-236(s0)	#, %sfp
	lw	a2,-252(s0)	#, %sfp
	lw	t2,-192(s0)	#, %sfp
	subw	t6,t4,t5	# tmp417, mend, m
	sraw	a7,t6,31	# tmp418, tmp417,
	srlw	a6,a7,30	# tmp419, tmp418,
	addw	ra,t6,a6	# tmp420, tmp417, tmp419
	and	a0,ra,3	# tmp421, tmp420,
	subw	a1,a0,a6	# bfringe, tmp421, tmp419
	subw	t0,t4,a1	# bboundary, mend, bfringe
	sw	a1,-416(s0)	# bfringe, %sfp
	sw	t0,-168(s0)	# bboundary, %sfp
	bge	a2,t2,.L226	#, n, _364,
	lw	a3,-168(s0)	#, %sfp
	lw	t1,-236(s0)	#, %sfp
	ble	a3,t1,.L233	#, bboundary, m,
	ld	s1,-336(s0)	# ivtmp.270, %sfp
	ld	a4,-424(s0)	# ivtmp.256, %sfp
	lw	s2,-252(s0)	#, %sfp
	sd	s1,-280(s0)	# ivtmp.270, %sfp
	sd	a4,-184(s0)	# ivtmp.256, %sfp
	sw	s2,-284(s0)	# n, %sfp
.L232:
	ld	s8,-184(s0)	# ivtmp.256, %sfp
	ld	s3,-408(s0)	# _26, %sfp
	ld	s5,-400(s0)	# _18, %sfp
	ld	a5,-392(s0)	# _11, %sfp
	ld	t4,-448(s0)	# tmp532, %sfp
	ld	t6,-296(s0)	# ivtmp.269, %sfp
	ld	a7,-280(s0)	# ivtmp.262, %sfp
	lw	a6,-236(s0)	#, %sfp
	add	s4,s3,s8	# _129, _26, ivtmp.256
	add	s7,s5,s8	# _133, _18, ivtmp.256
	add	t3,a5,s8	# _537, _11, ivtmp.256
	add	t5,t4,s8	# _542, tmp532, ivtmp.256
	sd	s4,-208(s0)	# _129, %sfp
	sd	s7,-216(s0)	# _133, %sfp
	sd	t3,-224(s0)	# _537, %sfp
	sd	t5,-232(s0)	# _542, %sfp
	sd	t6,-160(s0)	# ivtmp.269, %sfp
	sd	a7,-152(s0)	# ivtmp.262, %sfp
	sw	a6,-164(s0)	# m, %sfp
.L231:
	ld	s3,-152(s0)	# ivtmp.240, %sfp
	ld	s8,-200(s0)	# _404, %sfp
	mv	s2,s11	# ivtmp.221, tmp385
	mv	s1,s11	# ivtmp.239, tmp385
.L227:
 #APP
# 125 "matmul.c" 1
	# initial memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s3	#, ivtmp.240
	mv	a0,s1	#, ivtmp.239
	mv	a2,s6	#, tmp533
	add	s1,s1,32	# ivtmp.239, ivtmp.239,
	call	memcpy	#
	add	s3,s3,s9	# ivtmp.240, ivtmp.240, _423
	bne	s8,s1,.L227	#, _404, ivtmp.239,
	lw	ra,-188(s0)	#, %sfp
	blez	ra,.L230	#, _516,
	ld	a0,-224(s0)	# ivtmp.230, %sfp
	ld	a1,-216(s0)	# ivtmp.229, %sfp
	ld	t0,-208(s0)	# ivtmp.228, %sfp
	ld	a2,-160(s0)	# ivtmp.226, %sfp
	ld	s7,-184(s0)	# ivtmp.227, %sfp
	ld	s3,-232(s0)	# _542, %sfp
	sd	s1,-176(s0)	# ivtmp.239, %sfp
	mv	s8,t0	# ivtmp.228, ivtmp.228
	mv	s1,a2	# ivtmp.226, ivtmp.226
	mv	s5,a1	# ivtmp.229, ivtmp.229
	mv	s4,a0	# ivtmp.230, ivtmp.230
.L228:
	mv	a1,s1	#, ivtmp.226
	mv	a2,s6	#, tmp533
	mv	a0,s10	#, tmp541
	call	memcpy	#
	ld	t2,0(s11)	# c, c
	ld	t1,416(s11)	# a, a
	ld	a3,8(s11)	# c, c
	sd	t2,384(s11)	# c,
	sd	t1,352(s11)	# a,
	ld	a4,424(s11)	# a, a
	ld	a5,16(s11)	# c, c
	ld	t3,24(s11)	# c, c
	ld	t4,432(s11)	# a, a
	ld	t5,440(s11)	# a, a
	fld	fa1,0(s7)	# bv, MEM[base: _9, offset: 0B]
	fld	fa2,352(s11)	# _456,
	fld	fa5,384(s11)	# tmp433,
	sd	a3,392(s11)	# c,
	sd	a4,360(s11)	# a,
	sd	a5,400(s11)	# c,
	sd	t3,408(s11)	# c,
	sd	t4,368(s11)	# a,
	sd	t5,376(s11)	# a,
	fld	fa3,360(s11)	# _377,
	fld	fa4,368(s11)	# _350,
	fld	fa0,376(s11)	# _306,
	fld	ft0,392(s11)	# tmp435,
	fld	ft3,400(s11)	# tmp437,
	fld	ft2,408(s11)	# tmp439,
	fmadd.d	ft1,fa1,fa2,fa5	# tmp432, bv, _456, tmp433
	fmadd.d	ft4,fa1,fa3,ft0	# tmp434, bv, _377, tmp435
	fmadd.d	ft5,fa1,fa4,ft3	# tmp436, bv, _350, tmp437
	fmadd.d	ft6,fa1,fa0,ft2	# tmp438, bv, _306, tmp439
	add	s7,s7,8	# ivtmp.227, ivtmp.227,
	add	s1,s1,s9	# ivtmp.226, ivtmp.226, _423
	add	s8,s8,8	# ivtmp.228, ivtmp.228,
	fsd	ft1,-144(s0)	# tmp432,
	ld	t6,-144(s0)	# tmp440,
	fsd	ft4,-136(s0)	# tmp434,
	fsd	ft5,-128(s0)	# tmp436,
	fsd	ft6,-120(s0)	# tmp438,
	sd	t6,0(s11)	# tmp440, c
	ld	a7,-136(s0)	# tmp441,
	add	s5,s5,8	# ivtmp.229, ivtmp.229,
	add	s4,s4,8	# ivtmp.230, ivtmp.230,
	sd	a7,8(s11)	# tmp441, c
	ld	a6,32(s11)	# c, c
	ld	a0,40(s11)	# c, c
	ld	a1,48(s11)	# c, c
	ld	t0,56(s11)	# c, c
	fld	ft7,-8(s8)	# bv, MEM[base: _8, offset: 0B]
	sd	a6,288(s11)	# c,
	sd	a0,296(s11)	# c,
	sd	a1,304(s11)	# c,
	sd	t0,312(s11)	# c,
	fld	fa6,288(s11)	# tmp449,
	fld	fa7,296(s11)	# tmp451,
	fld	ft8,304(s11)	# tmp453,
	fld	ft9,312(s11)	# tmp455,
	fmadd.d	ft10,ft7,fa2,fa6	# tmp448, bv, _456, tmp449
	fmadd.d	ft11,ft7,fa3,fa7	# tmp450, bv, _377, tmp451
	fmadd.d	fa5,ft7,fa4,ft8	# tmp452, bv, _350, tmp453
	fmadd.d	fa1,ft7,fa0,ft9	# tmp454, bv, _306, tmp455
	ld	a2,-128(s0)	# tmp442,
	ld	t2,-120(s0)	# tmp443,
	ld	t1,64(s11)	# c, c
	fsd	ft10,-144(s0)	# tmp448,
	fsd	ft11,-136(s0)	# tmp450,
	fsd	fa5,-128(s0)	# tmp452,
	fsd	fa1,-120(s0)	# tmp454,
	sd	a2,16(s11)	# tmp442, c
	sd	t2,24(s11)	# tmp443, c
	ld	a3,-144(s0)	# tmp456,
	fld	ft3,-8(s5)	# bv, MEM[base: _7, offset: 0B]
	sd	a3,32(s11)	# tmp456, c
	ld	a4,-136(s0)	# tmp457,
	sd	a4,40(s11)	# tmp457, c
	ld	a5,-128(s0)	# tmp458,
	sd	a5,48(s11)	# tmp458, c
	ld	t3,-120(s0)	# tmp459,
	sd	t1,224(s11)	# c,
	sd	t3,56(s11)	# tmp459, c
	ld	t4,72(s11)	# c, c
	ld	t5,80(s11)	# c, c
	ld	t6,88(s11)	# c, c
	sd	t4,232(s11)	# c,
	sd	t5,240(s11)	# c,
	sd	t6,248(s11)	# c,
	fld	ft1,224(s11)	# tmp465,
	fld	ft0,232(s11)	# tmp467,
	fld	ft4,240(s11)	# tmp469,
	fld	ft2,248(s11)	# tmp471,
	fmadd.d	ft5,ft3,fa2,ft1	# tmp464, bv, _456, tmp465
	fmadd.d	ft6,ft3,fa3,ft0	# tmp466, bv, _377, tmp467
	fmadd.d	ft7,ft3,fa4,ft4	# tmp468, bv, _350, tmp469
	fmadd.d	fa6,ft3,fa0,ft2	# tmp470, bv, _306, tmp471
	ld	a7,96(s11)	# c, c
	ld	a6,104(s11)	# c, c
	ld	a0,112(s11)	# c, c
	fsd	ft5,-144(s0)	# tmp464,
	fsd	ft6,-136(s0)	# tmp466,
	fsd	ft7,-128(s0)	# tmp468,
	fsd	fa6,-120(s0)	# tmp470,
	fld	fa7,-8(s4)	# bv, MEM[base: _6, offset: 0B]
	sd	a7,160(s11)	# c,
	ld	a1,-144(s0)	# tmp472,
	fld	ft8,160(s11)	# tmp481,
	ld	t0,120(s11)	# c, c
	sd	a1,64(s11)	# tmp472, c
	ld	a2,-136(s0)	# tmp473,
	fmadd.d	fa2,fa7,fa2,ft8	# tmp480, bv, _456, tmp481
	sd	a2,72(s11)	# tmp473, c
	ld	t2,-128(s0)	# tmp474,
	sd	t2,80(s11)	# tmp474, c
	ld	t1,-120(s0)	# tmp475,
	sd	a6,168(s11)	# c,
	sd	a0,176(s11)	# c,
	sd	t1,88(s11)	# tmp475, c
	sd	t0,184(s11)	# c,
	fsd	fa2,-144(s0)	# tmp480,
	fld	ft9,168(s11)	# tmp483,
	fld	ft10,176(s11)	# tmp485,
	fld	ft11,184(s11)	# tmp487,
	fmadd.d	fa3,fa7,fa3,ft9	# tmp482, bv, _377, tmp483
	ld	a3,-144(s0)	# tmp488,
	fmadd.d	fa4,fa7,fa4,ft10	# tmp484, bv, _350, tmp485
	fmadd.d	fa0,fa7,fa0,ft11	# tmp486, bv, _306, tmp487
	sd	a3,96(s11)	# tmp488, c
	fsd	fa3,-136(s0)	# tmp482,
	ld	a4,-136(s0)	# tmp489,
	fsd	fa4,-128(s0)	# tmp484,
	fsd	fa0,-120(s0)	# tmp486,
	sd	a4,104(s11)	# tmp489, c
	ld	a5,-128(s0)	# tmp490,
	sd	a5,112(s11)	# tmp490, c
	ld	t3,-120(s0)	# tmp491,
	sd	t3,120(s11)	# tmp491, c
	bne	s7,s3,.L228	#, ivtmp.227, _542,
	ld	s1,-176(s0)	# ivtmp.239, %sfp
.L230:
	ld	s3,-152(s0)	# ivtmp.220, %sfp
.L229:
 #APP
# 139 "matmul.c" 1
	# final memcopy
# 0 "" 2
 #NO_APP
	mv	a1,s2	#, ivtmp.221
	mv	a0,s3	#, ivtmp.220
	mv	a2,s6	#, tmp533
	add	s2,s2,32	# ivtmp.221, ivtmp.221,
	call	memcpy	#
	add	s3,s3,s9	# ivtmp.220, ivtmp.220, _423
	bne	s2,s1,.L229	#, ivtmp.221, ivtmp.239,
	lw	ra,-164(s0)	#, %sfp
	ld	t4,-152(s0)	# ivtmp.247, %sfp
	ld	t6,-160(s0)	# ivtmp.248, %sfp
	lw	a6,-168(s0)	#, %sfp
	addw	s7,ra,4	# m1, m1,
	add	t5,t4,32	# ivtmp.247, ivtmp.247,
	add	a7,t6,32	# ivtmp.248, ivtmp.248,
	sw	s7,-164(s0)	# m1, %sfp
	sd	t5,-152(s0)	# ivtmp.247, %sfp
	sd	a7,-160(s0)	# ivtmp.248, %sfp
	bgt	a6,s7,.L231	#, bboundary, m1,
	lw	a0,-284(s0)	#, %sfp
	ld	a1,-184(s0)	# ivtmp.256, %sfp
	ld	t1,-280(s0)	# ivtmp.262, %sfp
	ld	a2,-360(s0)	# _57, %sfp
	ld	s8,-368(s0)	# _76, %sfp
	lw	a3,-192(s0)	#, %sfp
	addw	t0,a0,4	# n1, n1,
	add	t2,a1,a2	# ivtmp.256, ivtmp.256, _57
	add	s5,t1,s8	# ivtmp.262, ivtmp.262, _76
	sw	t0,-284(s0)	# n1, %sfp
	sd	t2,-184(s0)	# ivtmp.256, %sfp
	sd	s5,-280(s0)	# ivtmp.262, %sfp
	blt	t0,a3,.L232	#, n1, _364,
.L233:
	lw	a4,-416(s0)	#, %sfp
	blez	a4,.L226	#, bfringe,
	lw	t3,-244(s0)	#, %sfp
	lw	s4,-168(s0)	#, %sfp
	ble	t3,s4,.L239	#, mend, bboundary,
	ld	s3,-328(s0)	# _376, %sfp
	lw	t4,-288(s0)	#, %sfp
	ld	t5,-352(s0)	# A, %sfp
	add	ra,s4,s3	# tmp498, bboundary, _376
	addw	t6,t3,t4	# ivtmp.210, mend, ivtmp.276
	subw	s5,s4,t3	# tmp523, bboundary, mend
	lw	t2,-300(s0)	#, %sfp
	lw	t0,-252(s0)	#, %sfp
	lw	t1,-268(s0)	#, %sfp
	lw	t3,-248(s0)	#, %sfp
	lw	a7,-188(s0)	#, %sfp
	ld	s1,-320(s0)	# C, %sfp
	sll	s7,ra,3	# tmp499, tmp498,
	add	s8,t5,s7	# ivtmp.204, A, tmp499
.L237:
	ld	a0,-264(s0)	# ivtmp.283, %sfp
	ld	a3,-312(s0)	# B, %sfp
	addw	s2,s5,t6	# ivtmp.205, tmp523, ivtmp.210
	add	a1,t2,a0	# tmp502, ivtmp.212, ivtmp.283
	sll	a2,a1,3	# tmp503, tmp502,
	add	ra,a3,a2	# ivtmp.197, B, tmp503
	mv	s7,s8	# ivtmp.204, ivtmp.204
.L240:
	ble	t1,t3,.L236	#, kend, ivtmp.281,
	sll	a5,s2,3	# tmp496, ivtmp.205,
	add	t4,s1,a5	# _505, C, tmp496
	fld	fa1,0(t4)	# D__lsm.150, *_505
	fld	fa5,0(s7)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft3,0(ra)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	s4,a7,-1	# tmp570, _516,
	li	a3,1	# ivtmp.192,
	and	t5,s4,7	# tmp572, tmp570,
	fmadd.d	fa0,fa5,ft3,fa1	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a5,s7,s9	# ivtmp.196, ivtmp.204, _423
	add	a4,ra,8	# ivtmp.197, ivtmp.197,
	beq	a3,a7,.L363	#, ivtmp.192, _516,
	beqz	t5,.L234	#, tmp572,
	beq	t5,a3,.L354	#, tmp572, ivtmp.192,
	li	s3,2	# tmp577,
	beq	t5,s3,.L355	#, tmp572, tmp577,
	li	a6,3	# tmp576,
	beq	t5,a6,.L356	#, tmp572, tmp576,
	li	a0,4	# tmp575,
	beq	t5,a0,.L357	#, tmp572, tmp575,
	li	a1,5	# tmp574,
	beq	t5,a1,.L358	#, tmp572, tmp574,
	li	a2,6	# tmp573,
	beq	t5,a2,.L359	#, tmp572, tmp573,
	fld	ft1,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft0,8(ra)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	mv	a3,s3	# ivtmp.192, tmp577
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,ft1,ft0,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,ra,16	# ivtmp.197, ivtmp.197,
.L359:
	fld	ft4,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft2,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,ft4,ft2,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
.L358:
	fld	ft5,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft6,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,ft5,ft6,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
.L357:
	fld	ft7,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	fa6,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,ft7,fa6,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
.L356:
	fld	fa7,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft8,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,fa7,ft8,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
.L355:
	fld	fa2,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft9,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,fa2,ft9,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
.L354:
	fld	ft10,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	ft11,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	addw	a3,a3,1	# ivtmp.192, ivtmp.192,
	add	a5,a5,s9	# ivtmp.196, ivtmp.196, _423
	fmadd.d	fa0,ft10,ft11,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	add	a4,a4,8	# ivtmp.197, ivtmp.197,
	beq	a3,a7,.L363	#, ivtmp.192, _516,
.L234:
	fld	fa4,0(a5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	fld	fa3,0(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	add	s4,a5,s9	# ivtmp.196, ivtmp.196, _423
	fld	fa1,8(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fmadd.d	ft1,fa4,fa3,fa0	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fld	ft0,0(s4)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	t5,s4,s9	# ivtmp.196, ivtmp.196, _423
	fld	ft4,16(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fld	fa5,0(t5)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	s3,t5,s9	# ivtmp.196, ivtmp.196, _423
	fld	ft3,24(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fmadd.d	ft5,ft0,fa1,ft1	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fld	ft6,0(s3)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	a6,s3,s9	# ivtmp.196, ivtmp.196, _423
	fld	ft2,32(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fld	ft7,0(a6)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	a0,a6,s9	# ivtmp.196, ivtmp.196, _423
	fld	fa6,40(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fmadd.d	fa7,fa5,ft4,ft5	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fld	ft8,0(a0)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	a1,a0,s9	# ivtmp.196, ivtmp.196, _423
	fld	ft9,48(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fld	ft10,0(a1)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	add	a2,a1,s9	# ivtmp.196, ivtmp.196, _423
	fld	ft11,56(a4)	# MEM[base: _316, offset: 0B], MEM[base: _316, offset: 0B]
	fmadd.d	fa2,ft6,ft3,fa7	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fld	fa0,0(a2)	# MEM[base: _317, offset: 0B], MEM[base: _317, offset: 0B]
	addw	a3,a3,8	# ivtmp.192, ivtmp.192,
	add	a5,a2,s9	# ivtmp.196, ivtmp.196, _423
	add	a4,a4,64	# ivtmp.197, ivtmp.197,
	fmadd.d	fa4,ft7,ft2,fa2	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fmadd.d	fa3,ft8,fa6,fa4	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fmadd.d	fa1,ft10,ft9,fa3	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	fmadd.d	fa0,fa0,ft11,fa1	# D__lsm.150, MEM[base: _317, offset: 0B], MEM[base: _316, offset: 0B], D__lsm.150
	bne	a3,a7,.L234	#, ivtmp.192, _516,
.L363:
	fsd	fa0,0(t4)	# D__lsm.150, *_505
.L236:
	addw	s2,s2,1	# ivtmp.205, ivtmp.205,
	add	s7,s7,8	# ivtmp.204, ivtmp.204,
	bne	t6,s2,.L240	#, ivtmp.210, ivtmp.205,
	lw	s2,-240(s0)	#, %sfp
	lw	ra,-256(s0)	#, %sfp
	lw	s7,-192(s0)	#, %sfp
	addw	t0,t0,1	# n1, n1,
	addw	t6,t6,s2	# ivtmp.210, ivtmp.210, M
	addw	t2,t2,ra	# ivtmp.212, ivtmp.212, K
	bne	t0,s7,.L237	#, n1, _364,
	lw	t6,-304(s0)	#, %sfp
	blez	t6,.L249	#, _363,
.L257:
	lw	s8,-168(s0)	#, %sfp
	lw	t2,-236(s0)	#, %sfp
	ble	s8,t2,.L241	#, bboundary, m,
	lw	s5,-272(s0)	#, %sfp
	lw	t0,-192(s0)	#, %sfp
	ble	s5,t0,.L247	#, nend, _364,
	mv	t2,s5	# nend, nend
	ld	t3,-296(s0)	# ivtmp.191, %sfp
	lw	ra,-268(s0)	#, %sfp
	lw	s1,-248(s0)	#, %sfp
	lw	s8,-236(s0)	#, %sfp
	lw	a6,-188(s0)	#, %sfp
	ld	s4,-264(s0)	# ivtmp.283, %sfp
	lw	s2,-256(s0)	#, %sfp
	lw	s3,-240(s0)	#, %sfp
	ld	s5,-312(s0)	# B, %sfp
	ld	s7,-320(s0)	# C, %sfp
.L246:
	lw	t1,-372(s0)	#, %sfp
	lw	t0,-344(s0)	#, %sfp
	lw	a7,-192(s0)	#, %sfp
	addw	t4,s8,t1	# ivtmp.184, m, _370
.L248:
	ble	ra,s1,.L245	#, kend, ivtmp.281,
	add	a4,t0,s4	# tmp509, ivtmp.185, ivtmp.283
	sll	a0,a4,3	# tmp510, tmp509,
	sll	t5,t4,3	# tmp507, ivtmp.184,
	add	a2,s5,a0	# ivtmp.177, B, tmp510
	add	t1,s7,t5	# _474, C, tmp507
	fld	ft1,0(t1)	# D__lsm.148, *_474
	fld	ft0,0(t3)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	ft4,0(a2)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a1,a6,-1	# tmp559, _516,
	li	a3,1	# ivtmp.172,
	and	a0,a1,7	# tmp561, tmp559,
	fmadd.d	fa5,ft0,ft4,ft1	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a5,t3,s9	# ivtmp.176, ivtmp.191, _423
	add	a4,a2,8	# ivtmp.177, ivtmp.177,
	beq	a3,a6,.L365	#, ivtmp.172, _516,
	beqz	a0,.L243	#, tmp561,
	beq	a0,a3,.L348	#, tmp561, ivtmp.172,
	li	t5,2	# tmp566,
	beq	a0,t5,.L349	#, tmp561, tmp566,
	li	t6,3	# tmp565,
	beq	a0,t6,.L350	#, tmp561, tmp565,
	li	a1,4	# tmp564,
	beq	a0,a1,.L351	#, tmp561, tmp564,
	li	t6,5	# tmp563,
	beq	a0,t6,.L352	#, tmp561, tmp563,
	li	a1,6	# tmp562,
	beq	a0,a1,.L353	#, tmp561, tmp562,
	fld	ft3,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	ft5,8(a2)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	mv	a3,t5	# ivtmp.172, tmp566
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,ft3,ft5,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a2,16	# ivtmp.177, ivtmp.177,
.L353:
	fld	ft6,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	ft2,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,ft6,ft2,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
.L352:
	fld	ft7,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	fa6,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,ft7,fa6,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
.L351:
	fld	fa7,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	ft8,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,fa7,ft8,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
.L350:
	fld	ft9,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	ft10,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,ft9,ft10,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
.L349:
	fld	ft11,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	fa2,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,ft11,fa2,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
.L348:
	fld	fa0,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	fa4,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	addw	a3,a3,1	# ivtmp.172, ivtmp.172,
	add	a5,a5,s9	# ivtmp.176, ivtmp.176, _423
	fmadd.d	fa5,fa0,fa4,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	add	a4,a4,8	# ivtmp.177, ivtmp.177,
	beq	a3,a6,.L365	#, ivtmp.172, _516,
.L243:
	fld	fa1,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	fld	fa3,0(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	add	a2,a5,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft1,8(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fmadd.d	ft0,fa1,fa3,fa5	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fld	ft4,0(a2)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	a0,a2,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft5,16(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fld	ft6,0(a0)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	t5,a0,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft3,24(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fmadd.d	ft7,ft4,ft1,ft0	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fld	fa6,0(t5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	t6,t5,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft2,32(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fld	fa7,0(t6)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	a1,t6,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft8,40(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fmadd.d	ft9,ft6,ft5,ft7	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fld	ft10,0(a1)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	a5,a1,s9	# ivtmp.176, ivtmp.176, _423
	fld	ft11,48(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fld	fa4,0(a5)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	add	a2,a5,s9	# ivtmp.176, ivtmp.176, _423
	fld	fa0,56(a4)	# MEM[base: _398, offset: 0B], MEM[base: _398, offset: 0B]
	fmadd.d	fa2,fa6,ft3,ft9	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fld	fa5,0(a2)	# MEM[base: _407, offset: 0B], MEM[base: _407, offset: 0B]
	addw	a3,a3,8	# ivtmp.172, ivtmp.172,
	add	a5,a2,s9	# ivtmp.176, ivtmp.176, _423
	add	a4,a4,64	# ivtmp.177, ivtmp.177,
	fmadd.d	fa1,fa7,ft2,fa2	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fmadd.d	fa3,ft10,ft8,fa1	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fmadd.d	ft1,fa4,ft11,fa3	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	fmadd.d	fa5,fa5,fa0,ft1	# D__lsm.148, MEM[base: _407, offset: 0B], MEM[base: _398, offset: 0B], D__lsm.148
	bne	a3,a6,.L243	#, ivtmp.172, _516,
.L365:
	fsd	fa5,0(t1)	# D__lsm.148, *_474
.L245:
	addw	a7,a7,1	# n1, n1,
	addw	t4,t4,s3	# ivtmp.184, ivtmp.184, M
	addw	t0,t0,s2	# ivtmp.185, ivtmp.185, K
	bne	t2,a7,.L248	#, nend, n1,
	lw	t4,-168(s0)	#, %sfp
	addw	s8,s8,1	# m, m,
	add	t3,t3,8	# ivtmp.191, ivtmp.191,
	bne	t4,s8,.L246	#, bboundary, m,
.L241:
	lw	t3,-244(s0)	#, %sfp
	lw	ra,-168(s0)	#, %sfp
	ble	t3,ra,.L247	#, mend, bboundary,
.L249:
	lw	t2,-272(s0)	#, %sfp
	lw	s1,-192(s0)	#, %sfp
	ble	t2,s1,.L247	#, nend, _364,
	ld	s4,-328(s0)	# _376, %sfp
	lw	s8,-168(s0)	#, %sfp
	ld	s5,-352(s0)	# A, %sfp
	mv	ra,t2	# nend, nend
	add	s2,s8,s4	# tmp519, bboundary, _376
	sll	s3,s2,3	# tmp520, tmp519,
	add	t3,s5,s3	# ivtmp.171, A, tmp520
	lw	t0,-268(s0)	#, %sfp
	lw	t2,-248(s0)	#, %sfp
	lw	s1,-188(s0)	#, %sfp
	ld	a6,-264(s0)	# ivtmp.283, %sfp
	lw	s4,-256(s0)	#, %sfp
	lw	s2,-240(s0)	#, %sfp
	ld	s3,-312(s0)	# B, %sfp
	ld	s7,-320(s0)	# C, %sfp
.L253:
	lw	a7,-372(s0)	#, %sfp
	lw	t1,-344(s0)	#, %sfp
	lw	s5,-192(s0)	#, %sfp
	addw	t4,s8,a7	# ivtmp.164, bboundary, _370
.L254:
	ble	t0,t2,.L252	#, kend, ivtmp.281,
	add	t5,t1,a6	# tmp516, ivtmp.165, ivtmp.283
	sll	a0,t4,3	# tmp514, ivtmp.164,
	sll	t6,t5,3	# tmp517, tmp516,
	add	a2,s3,t6	# ivtmp.157, B, tmp517
	add	a7,s7,a0	# _446, C, tmp514
	fld	ft0,0(a7)	# D__lsm.146, *_446
	fld	ft4,0(t3)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	ft5,0(a2)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a1,s1,-1	# tmp548, _516,
	li	a3,1	# ivtmp.152,
	and	a0,a1,7	# tmp550, tmp548,
	fmadd.d	fa5,ft4,ft5,ft0	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a5,t3,s9	# ivtmp.156, ivtmp.171, _423
	add	a4,a2,8	# ivtmp.157, ivtmp.157,
	beq	a3,s1,.L366	#, ivtmp.152, _516,
	beqz	a0,.L250	#, tmp550,
	beq	a0,a3,.L342	#, tmp550, ivtmp.152,
	li	t5,2	# tmp555,
	beq	a0,t5,.L343	#, tmp550, tmp555,
	li	t6,3	# tmp554,
	beq	a0,t6,.L344	#, tmp550, tmp554,
	li	a1,4	# tmp553,
	beq	a0,a1,.L345	#, tmp550, tmp553,
	li	t6,5	# tmp552,
	beq	a0,t6,.L346	#, tmp550, tmp552,
	li	a1,6	# tmp551,
	beq	a0,a1,.L347	#, tmp550, tmp551,
	fld	ft6,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	ft3,8(a2)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	mv	a3,t5	# ivtmp.152, tmp555
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,ft6,ft3,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a2,16	# ivtmp.157, ivtmp.157,
.L347:
	fld	ft7,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	fa6,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,ft7,fa6,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
.L346:
	fld	ft2,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	fa7,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,ft2,fa7,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
.L345:
	fld	ft8,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	ft9,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,ft8,ft9,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
.L344:
	fld	ft10,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	ft11,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,ft10,ft11,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
.L343:
	fld	fa0,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	fa4,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,fa0,fa4,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
.L342:
	fld	fa2,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	fa1,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	addw	a3,a3,1	# ivtmp.152, ivtmp.152,
	add	a5,a5,s9	# ivtmp.156, ivtmp.156, _423
	fmadd.d	fa5,fa2,fa1,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	add	a4,a4,8	# ivtmp.157, ivtmp.157,
	beq	a3,s1,.L366	#, ivtmp.152, _516,
.L250:
	fld	fa3,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	fld	ft1,0(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	add	a2,a5,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft0,8(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fmadd.d	ft5,fa3,ft1,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fld	ft6,0(a2)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	a0,a2,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft7,16(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fld	fa6,0(a0)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	t5,a0,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft4,24(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fmadd.d	fa7,ft6,ft0,ft5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fld	ft8,0(t5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	t6,t5,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft3,32(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fld	ft9,0(t6)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	a1,t6,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft2,40(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fmadd.d	ft10,fa6,ft7,fa7	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fld	ft11,0(a1)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	a5,a1,s9	# ivtmp.156, ivtmp.156, _423
	fld	fa0,48(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fld	fa4,0(a5)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	add	a2,a5,s9	# ivtmp.156, ivtmp.156, _423
	fld	ft1,56(a4)	# MEM[base: _485, offset: 0B], MEM[base: _485, offset: 0B]
	fmadd.d	fa2,ft8,ft4,ft10	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fld	fa1,0(a2)	# MEM[base: _486, offset: 0B], MEM[base: _486, offset: 0B]
	addw	a3,a3,8	# ivtmp.152, ivtmp.152,
	add	a5,a2,s9	# ivtmp.156, ivtmp.156, _423
	add	a4,a4,64	# ivtmp.157, ivtmp.157,
	fmadd.d	fa5,ft9,ft3,fa2	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fmadd.d	fa3,ft11,ft2,fa5	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fmadd.d	ft0,fa4,fa0,fa3	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	fmadd.d	fa5,fa1,ft1,ft0	# D__lsm.146, MEM[base: _486, offset: 0B], MEM[base: _485, offset: 0B], D__lsm.146
	bne	a3,s1,.L250	#, ivtmp.152, _516,
.L366:
	fsd	fa5,0(a7)	# D__lsm.146, *_446
.L252:
	addw	s5,s5,1	# n1, n1,
	addw	t4,t4,s2	# ivtmp.164, ivtmp.164, M
	addw	t1,t1,s4	# ivtmp.165, ivtmp.165, K
	bne	ra,s5,.L254	#, nend, n1,
	lw	t4,-244(s0)	#, %sfp
	addw	s8,s8,1	# bboundary, bboundary,
	add	t3,t3,8	# ivtmp.171, ivtmp.171,
	bne	t4,s8,.L253	#, mend, bboundary,
.L247:
	ld	s8,-296(s0)	# ivtmp.269, %sfp
	ld	t0,-336(s0)	# ivtmp.270, %sfp
	lw	t2,-412(s0)	#, %sfp
	lw	s1,-240(s0)	#, %sfp
	add	t3,s8,256	# ivtmp.269, ivtmp.269,
	add	ra,t0,256	# ivtmp.270, ivtmp.270,
	sd	t3,-296(s0)	# ivtmp.269, %sfp
	sd	ra,-336(s0)	# ivtmp.270, %sfp
	sw	t2,-236(s0)	# m, %sfp
	bgt	s1,t2,.L221	#, M, m,
	lw	s4,-288(s0)	#, %sfp
	lw	t1,-300(s0)	#, %sfp
	lw	s2,-376(s0)	#, %sfp
	lw	s5,-436(s0)	#, %sfp
	lw	a6,-384(s0)	#, %sfp
	lw	a3,-380(s0)	#, %sfp
	addw	s3,s4,s2	# ivtmp.276, ivtmp.276, _583
	addw	a7,t1,s5	# ivtmp.277, ivtmp.277, _577
	sw	a6,-252(s0)	# n, %sfp
	sw	s3,-288(s0)	# ivtmp.276, %sfp
	sw	a7,-300(s0)	# ivtmp.277, %sfp
	mv	s7,s11	# tmp385, tmp385
	mv	s11,s9	# _423, _423
	bgt	a3,a6,.L222	#, N, n,
	mv	s8,s9	# _423, _423
.L223:
	lw	a4,-340(s0)	#, %sfp
	ld	t5,-264(s0)	# ivtmp.283, %sfp
	lw	s9,-376(s0)	#, %sfp
	lw	s6,-440(s0)	#, %sfp
	lw	a1,-256(s0)	#, %sfp
	addw	a0,a4,s9	# ivtmp.282, ivtmp.282, _583
	add	t6,t5,32	# ivtmp.283, ivtmp.283,
	sw	s6,-248(s0)	# ivtmp.281, %sfp
	sw	a0,-340(s0)	# ivtmp.282, %sfp
	sd	t6,-264(s0)	# ivtmp.283, %sfp
	bgt	a1,s6,.L219	#, K, ivtmp.281,
.L214:
	add	sp,s0,-448	#,,
	ld	ra,440(sp)	#,
	ld	s0,432(sp)	#,
	ld	s1,424(sp)	#,
	ld	s2,416(sp)	#,
	ld	s3,408(sp)	#,
	ld	s4,400(sp)	#,
	ld	s5,392(sp)	#,
	ld	s6,384(sp)	#,
	ld	s7,376(sp)	#,
	ld	s8,368(sp)	#,
	ld	s9,360(sp)	#,
	ld	s10,352(sp)	#,
	ld	s11,344(sp)	#,
	add	sp,sp,448	#,,
	jr	ra	#
.L226:
	lw	a5,-304(s0)	#, %sfp
	bgtz	a5,.L257	#, _363,
	j	.L241	#
.L239:
	lw	s1,-304(s0)	#, %sfp
	bgtz	s1,.L257	#, _363,
	j	.L247	#
	.size	blocked_dgemm, .-blocked_dgemm
	.align	2
	.globl	benchmark_once
	.type	benchmark_once, @function
benchmark_once:
	add	sp,sp,-224	#,,
	sd	s1,208(sp)	#,
	mulw	s1,a1,a3	# _5, m, k
	sd	s5,176(sp)	#,
	sd	s10,136(sp)	#,
	mv	s5,a1	# m, m
	mv	s10,a2	# n, n
	sd	s4,184(sp)	#,
	sd	a0,0(sp)	# f, %sfp
	sd	ra,216(sp)	#,
	sd	s2,200(sp)	#,
	sd	s3,192(sp)	#,
	mulw	a5,a3,a2	# _12, k, n
	mv	a0,s1	# _5,
	sll	a0,a0,3	#, _5,
	sd	s6,168(sp)	#,
	sd	s7,160(sp)	#,
	sd	s9,144(sp)	#,
	sd	s11,128(sp)	#,
	mv	s9,a3	# k, k
	sd	s8,152(sp)	#,
	fsd	fs0,120(sp)	#,
	mulw	s4,s5,s10	# _17, m, n
	mv	s2,a5	# _12, _12
	sw	a5,16(sp)	# _12, %sfp
	fsd	fs1,112(sp)	#,
	fsd	fs2,104(sp)	#,
	fsd	fs3,96(sp)	#,
	fsd	fs4,88(sp)	#,
	fsd	fs5,80(sp)	#,
	fsd	fs6,72(sp)	#,
	fsd	fs7,64(sp)	#,
	fsd	fs8,56(sp)	#,
	fsd	fs9,48(sp)	#,
	call	malloc	#
	mv	s3,a0	# A,
	mv	s11,s4	# _17,
	sll	a0,s2,3	#, _12,
	call	malloc	#
	sll	s11,s11,3	# _19, _17,
	mv	s6,a0	# B,
	mv	a0,s11	#, _19
	call	malloc	#
	mv	s7,a0	# C,
	mv	a0,s11	#, _19
	call	malloc	#
	mv	s2,a0	# Co,
	blez	s1,.L583	#, _5,
	addw	t0,s1,-1	# tmp397, _5,
	sll	t1,t0,32	# tmp398, tmp397,
	srl	t2,t1,32	# tmp398, tmp398,
	add	a1,t2,1	# tmp399, tmp398,
	sll	a2,a1,3	# tmp400, tmp399,
	add	a4,a2,-8	# tmp607, tmp400,
	lui	a3,%hi(.LANCHOR0)	# tmp616,
	srl	a6,a4,3	# tmp605, tmp607,
	and	s8,a6,7	# tmp608, tmp605,
	add	s1,a3,%lo(.LANCHOR0)	# tmp548, tmp616,
	add	a7,s3,a2	# _520, A, tmp400
	sd	s8,24(sp)	# tmp608, %sfp
	sd	a7,8(sp)	# _520, %sfp
	call	rand	#
	fld	fs0,0(s1)	# tmp403,
	ld	t3,8(sp)	# _520, %sfp
	add	s8,s3,8	# ivtmp.328, A,
	fsd	fs0,0(s3)	# tmp403, MEM[base: _513, offset: 0B]
	ld	t4,24(sp)	# tmp608, %sfp
	beq	s8,t3,.L383	#, ivtmp.328, _520,
	beqz	t4,.L382	#, tmp608,
	li	t5,1	# tmp614,
	beq	t4,t5,.L564	#, tmp608, tmp614,
	li	t6,2	# tmp613,
	beq	t4,t6,.L565	#, tmp608, tmp613,
	li	a5,3	# tmp612,
	beq	t4,a5,.L566	#, tmp608, tmp612,
	li	a0,4	# tmp611,
	beq	t4,a0,.L567	#, tmp608, tmp611,
	li	ra,5	# tmp610,
	beq	t4,ra,.L568	#, tmp608, tmp610,
	li	t0,6	# tmp609,
	beq	t4,t0,.L569	#, tmp608, tmp609,
	call	rand	#
	fsd	fs0,0(s8)	# tmp403, MEM[base: _513, offset: 0B]
	add	s8,s3,16	# ivtmp.328, A,
.L569:
	call	rand	#
	fld	fa5,0(s1)	# tmp793,
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	fa5,-8(s8)	# tmp793, MEM[base: _513, offset: 0B]
.L568:
	call	rand	#
	fld	ft0,0(s1)	# tmp794,
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	ft0,-8(s8)	# tmp794, MEM[base: _513, offset: 0B]
.L567:
	call	rand	#
	fld	ft1,0(s1)	# tmp795,
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	ft1,-8(s8)	# tmp795, MEM[base: _513, offset: 0B]
.L566:
	call	rand	#
	fld	ft2,0(s1)	# tmp796,
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	ft2,-8(s8)	# tmp796, MEM[base: _513, offset: 0B]
.L565:
	call	rand	#
	fld	ft3,0(s1)	# tmp797,
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	ft3,-8(s8)	# tmp797, MEM[base: _513, offset: 0B]
.L564:
	call	rand	#
	fld	ft4,0(s1)	# tmp798,
	ld	t1,8(sp)	# _520, %sfp
	add	s8,s8,8	# ivtmp.328, ivtmp.328,
	fsd	ft4,-8(s8)	# tmp798, MEM[base: _513, offset: 0B]
	beq	s8,t1,.L383	#, ivtmp.328, _520,
.L382:
	call	rand	#
	fld	fs1,0(s1)	# tmp618,
	add	s8,s8,64	# ivtmp.328, ivtmp.328,
	fsd	fs1,-64(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-56(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-48(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-40(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-32(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-24(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	fsd	fs1,-16(s8)	# tmp618, MEM[base: _513, offset: 0B]
	call	rand	#
	ld	t2,8(sp)	# _520, %sfp
	fsd	fs1,-8(s8)	# tmp618, MEM[base: _513, offset: 0B]
	bne	s8,t2,.L382	#, ivtmp.328, _520,
.L383:
	lw	a1,16(sp)	#, %sfp
	blez	a1,.L381	#, _12,
	lw	a2,16(sp)	#, %sfp
	add	s8,s6,8	# ivtmp.322, B,
	addw	a4,a2,-1	# tmp404, _12,
	sll	a3,a4,32	# tmp405, tmp404,
	srl	a6,a3,32	# tmp405, tmp405,
	add	a7,a6,1	# tmp406, tmp405,
	sll	t3,a7,3	# tmp407, tmp406,
	add	t4,t3,-8	# tmp596, tmp407,
	srl	t5,t4,3	# tmp594, tmp596,
	add	t6,s6,t3	# _509, B, tmp407
	and	a5,t5,7	# tmp597, tmp594,
	sd	t6,8(sp)	# _509, %sfp
	sd	a5,16(sp)	# tmp597, %sfp
	call	rand	#
	fld	fs2,0(s1)	# tmp410,
	ld	a0,8(sp)	# _509, %sfp
	ld	t0,16(sp)	# tmp597, %sfp
	fsd	fs2,0(s6)	# tmp410, MEM[base: _502, offset: 0B]
	beq	s8,a0,.L381	#, ivtmp.322, _509,
	beqz	t0,.L386	#, tmp597,
	li	ra,1	# tmp603,
	beq	t0,ra,.L558	#, tmp597, tmp603,
	li	t1,2	# tmp602,
	beq	t0,t1,.L559	#, tmp597, tmp602,
	li	t2,3	# tmp601,
	beq	t0,t2,.L560	#, tmp597, tmp601,
	li	a1,4	# tmp600,
	beq	t0,a1,.L561	#, tmp597, tmp600,
	li	a2,5	# tmp599,
	beq	t0,a2,.L562	#, tmp597, tmp599,
	li	a4,6	# tmp598,
	beq	t0,a4,.L563	#, tmp597, tmp598,
	call	rand	#
	fsd	fs2,0(s8)	# tmp410, MEM[base: _502, offset: 0B]
	add	s8,s6,16	# ivtmp.322, B,
.L563:
	call	rand	#
	fld	ft5,0(s1)	# tmp786,
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	ft5,-8(s8)	# tmp786, MEM[base: _502, offset: 0B]
.L562:
	call	rand	#
	fld	ft6,0(s1)	# tmp787,
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	ft6,-8(s8)	# tmp787, MEM[base: _502, offset: 0B]
.L561:
	call	rand	#
	fld	ft7,0(s1)	# tmp788,
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	ft7,-8(s8)	# tmp788, MEM[base: _502, offset: 0B]
.L560:
	call	rand	#
	fld	fa0,0(s1)	# tmp789,
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	fa0,-8(s8)	# tmp789, MEM[base: _502, offset: 0B]
.L559:
	call	rand	#
	fld	fa1,0(s1)	# tmp790,
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	fa1,-8(s8)	# tmp790, MEM[base: _502, offset: 0B]
.L558:
	call	rand	#
	fld	fa2,0(s1)	# tmp791,
	ld	a3,8(sp)	# _509, %sfp
	add	s8,s8,8	# ivtmp.322, ivtmp.322,
	fsd	fa2,-8(s8)	# tmp791, MEM[base: _502, offset: 0B]
	beq	s8,a3,.L381	#, ivtmp.322, _509,
.L386:
	call	rand	#
	fld	fs3,0(s1)	# tmp634,
	add	s8,s8,64	# ivtmp.322, ivtmp.322,
	fsd	fs3,-64(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-56(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-48(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-40(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-32(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-24(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	fsd	fs3,-16(s8)	# tmp634, MEM[base: _502, offset: 0B]
	call	rand	#
	ld	a6,8(sp)	# _509, %sfp
	fsd	fs3,-8(s8)	# tmp634, MEM[base: _502, offset: 0B]
	bne	s8,a6,.L386	#, ivtmp.322, _509,
.L381:
	blez	s4,.L385	#, _17,
	addw	a7,s4,-1	# tmp514, _17,
	sll	t3,a7,32	# tmp515, tmp514,
	srl	t4,t3,32	# tmp515, tmp515,
	add	t5,t4,1	# tmp516, tmp515,
	sll	t6,t5,3	# tmp517, tmp516,
	add	a5,t6,-8	# tmp585, tmp517,
	srl	a0,a5,3	# tmp583, tmp585,
	add	t0,s7,t6	# _498, C, tmp517
	and	ra,a0,7	# tmp586, tmp583,
	sd	t0,8(sp)	# _498, %sfp
	sd	ra,16(sp)	# tmp586, %sfp
	call	rand	#
	fld	fs4,0(s1)	# tmp520,
	ld	t1,8(sp)	# _498, %sfp
	add	s8,s7,8	# ivtmp.316, C,
	fsd	fs4,0(s7)	# tmp520, MEM[base: _491, offset: 0B]
	ld	t2,16(sp)	# tmp586, %sfp
	beq	s8,t1,.L385	#, ivtmp.316, _498,
	beqz	t2,.L389	#, tmp586,
	li	a1,1	# tmp592,
	beq	t2,a1,.L552	#, tmp586, tmp592,
	li	a2,2	# tmp591,
	beq	t2,a2,.L553	#, tmp586, tmp591,
	li	a4,3	# tmp590,
	beq	t2,a4,.L554	#, tmp586, tmp590,
	li	a3,4	# tmp589,
	beq	t2,a3,.L555	#, tmp586, tmp589,
	li	a6,5	# tmp588,
	beq	t2,a6,.L556	#, tmp586, tmp588,
	li	a7,6	# tmp587,
	beq	t2,a7,.L557	#, tmp586, tmp587,
	call	rand	#
	fsd	fs4,0(s8)	# tmp520, MEM[base: _491, offset: 0B]
	add	s8,s7,16	# ivtmp.316, C,
.L557:
	call	rand	#
	fld	fa3,0(s1)	# tmp779,
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fa3,-8(s8)	# tmp779, MEM[base: _491, offset: 0B]
.L556:
	call	rand	#
	fld	fa4,0(s1)	# tmp780,
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fa4,-8(s8)	# tmp780, MEM[base: _491, offset: 0B]
.L555:
	call	rand	#
	fld	fa6,0(s1)	# tmp781,
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fa6,-8(s8)	# tmp781, MEM[base: _491, offset: 0B]
.L554:
	call	rand	#
	fld	fa7,0(s1)	# tmp782,
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fa7,-8(s8)	# tmp782, MEM[base: _491, offset: 0B]
.L553:
	call	rand	#
	fld	fs5,0(s1)	# tmp783,
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fs5,-8(s8)	# tmp783, MEM[base: _491, offset: 0B]
.L552:
	call	rand	#
	fld	fs6,0(s1)	# tmp784,
	ld	t3,8(sp)	# _498, %sfp
	add	s8,s8,8	# ivtmp.316, ivtmp.316,
	fsd	fs6,-8(s8)	# tmp784, MEM[base: _491, offset: 0B]
	beq	s8,t3,.L385	#, ivtmp.316, _498,
.L389:
	call	rand	#
	fld	fs7,0(s1)	# tmp650,
	add	s8,s8,64	# ivtmp.316, ivtmp.316,
	fsd	fs7,-64(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-56(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-48(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-40(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-32(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-24(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	fsd	fs7,-16(s8)	# tmp650, MEM[base: _491, offset: 0B]
	call	rand	#
	ld	t4,8(sp)	# _498, %sfp
	fsd	fs7,-8(s8)	# tmp650, MEM[base: _491, offset: 0B]
	bne	s8,t4,.L389	#, ivtmp.316, _498,
.L385:
	ld	t5,0(sp)	# f, %sfp
	mv	a5,s7	#, C
	mv	a4,s6	#, B
	mv	a3,s3	#, A
	mv	a2,s9	#, k
	mv	a1,s10	#, n
	mv	a0,s5	#, m
	jalr	t5	# f
	call	rdinstret	#
	mv	t6,a0	# start_ins,
	sd	t6,8(sp)	# start_ins, %sfp
	call	rdcycle	#
	ld	t1,0(sp)	# f, %sfp
	mv	a3,s3	#, A
	mv	a4,s6	#, B
	mv	a2,s9	#, k
	mv	a1,s10	#, n
	mv	s8,a0	# start,
	mv	a5,s7	#, C
	mv	a0,s5	#, m
	jalr	t1	# f
	call	rdcycle	#
	subw	a5,a0,s8	# cycles,, start
	sw	a5,16(sp)	# cycles, %sfp
	call	rdinstret	#
	mv	t0,s10	# n,
	mv	t2,s5	# _39,
	sll	a1,t0,3	# tmp412, n,
	mul	a2,a1,t2	#, tmp412, _39
	ld	a4,8(sp)	# start_ins, %sfp
	sll	s8,t2,3	# _443, _39,
	mv	a1,s7	#, C
	subw	a0,a0,a4	# instructions,, start_ins
	sw	a0,24(sp)	# instructions, %sfp
	mv	a0,s2	#, Co
	sd	s8,8(sp)	# _443, %sfp
	call	memcpy	#
	mv	a2,s11	#, _19
	li	a1,0	#,
	mv	a0,s7	#, C
	call	memset	#
	mv	a2,s11	#, _19
	li	a1,0	#,
	mv	a0,s2	#, Co
	call	memset	#
	ld	a6,0(sp)	# f, %sfp
	mv	a5,s7	#, C
	mv	a4,s6	#, B
	mv	a3,s3	#, A
	mv	a2,s9	#, k
	mv	a1,s10	#, n
	mv	a0,s5	#, m
	jalr	a6	# f
	add	a3,s3,s8	# tmp436, A, _443
	fld	fs8,0(a3)	# a, *_442
	fld	fa2,8(s6)	# pretmp_271, MEM[(double *)B_16 + 8B]
	fld	ft9,0(s6)	# pretmp_23, *B_16
	fld	ft8,0(s3)	# a, *A_10
	fmul.d	fs9,fa2,fs8	# tmp437, pretmp_271, a
	fld	ft10,0(s2)	# t, *Co_25
	sllw	a7,s5,1	# tmp439, m,
	mv	t3,a7	# tmp440,
	sll	s11,t3,3	# _429, tmp440,
	add	t4,s3,s11	# tmp441, A, _429
	fld	ft1,0(t4)	# a, *_426
	fmadd.d	ft11,ft9,ft8,fs9	# tmp438, pretmp_23, a, tmp437
	fld	ft0,16(s6)	# pretmp_422, MEM[(double *)B_16 + 16B]
	mv	t5,s9	# k,
	sll	t6,t5,3	# _95, k,
	add	t1,s6,t6	# _96, B, _95
	fld	fa3,8(t1)	# pretmp_165, *_164
	addw	a5,a7,s5	# tmp445, tmp439, m
	fadd.d	fs0,ft11,ft10	# t, tmp438, t
	sll	t0,a5,3	# _409, tmp445,
	add	t2,s3,t0	# tmp446, A, _409
	fld	ft5,0(t2)	# a, *_408
	fld	ft2,24(s6)	# pretmp_227, MEM[(double *)B_16 + 24B]
	fmul.d	ft4,fa3,fs8	# tmp448, pretmp_165, a
	fld	ft10,0(t1)	# pretmp_97, *_96
	fmadd.d	fa5,ft0,ft1,fs0	# t, pretmp_422, a, t
	add	a1,s2,s8	# _396, Co, _443
	fld	ft3,16(t1)	# pretmp_171, *_170
	sllw	a3,s9,1	# _182, k,
	addw	a4,a3,1	# tmp419, _182,
	fmadd.d	fs1,ft10,ft8,ft4	# tmp449, pretmp_97, a, tmp448
	sll	a0,a4,3	# _190, tmp419,
	fmadd.d	fs2,ft2,ft5,fa5	# t, pretmp_227, a, t
	add	a7,s6,a0	# tmp420, B, _190
	fld	fa4,0(a7)	# pretmp_195, *_194
	fld	ft4,24(t1)	# pretmp_180, *_179
	add	t3,t1,t6	# _185, _96, _95
	fmul.d	ft6,fa4,fs8	# tmp451, pretmp_195, a
	fld	fs0,0(t3)	# pretmp_186, *_185
	fsd	fs2,0(s2)	# t, *Co_25
	fld	ft7,0(a1)	# t, *_396
	add	a2,s2,s11	# _378, Co, _429
	mv	a6,a3	# _182,
	fadd.d	fa0,fs1,ft7	# t, tmp449, t
	fmadd.d	fa1,fs0,ft8,ft6	# tmp452, pretmp_186, a, tmp451
	sll	s11,a6,3	# tmp423, _182,
	add	t4,s6,s11	# tmp422, B, tmp423
	fld	ft6,16(t4)	# pretmp_201, *_200
	addw	t5,a3,s9	# tmp427, _182, k
	addw	t1,t5,1	# tmp430, tmp427,
	fmadd.d	fs3,ft3,ft1,fa0	# t, pretmp_171, a, t
	sll	a5,t1,3	# _220, tmp430,
	add	t2,s6,a5	# tmp431, B, _220
	fld	fa5,0(t2)	# pretmp_222, *_221
	fld	ft7,16(a7)	# pretmp_207, *_206
	add	t6,t3,t6	# tmp428, _185, _95
	fmul.d	fs4,fa5,fs8	# tmp454, pretmp_222, a
	fmadd.d	fs5,ft4,ft5,fs3	# t, pretmp_180, a, t
	fld	fs2,0(t6)	# pretmp_216, *_215
	add	t0,s2,t0	# _358, Co, _409
	fld	fa6,8(t2)	# pretmp_485, *_91
	addw	s8,s5,1	# _241, m,
	mv	a3,s8	# _241,
	fmadd.d	fa7,fs2,ft8,fs4	# tmp455, pretmp_216, a, tmp454
	fsd	fs5,0(a1)	# t, *_396
	fld	fs6,0(a2)	# t, *_378
	sll	a1,a3,3	# _239, _241,
	add	a4,s3,a1	# tmp458, A, _239
	fadd.d	fs7,fa1,fs6	# t, tmp452, t
	fld	fs9,0(a4)	# a, *_236
	sll	a0,t5,3	# tmp435, _212,
	add	a7,s6,a0	# tmp434, B, tmp435
	fld	ft8,24(a7)	# pretmp_290, *_291
	fmul.d	fs8,fs9,fa2	# tmp459, a, pretmp_271
	fld	fs5,8(s3)	# a, MEM[(double *)A_10 + 8B]
	fmadd.d	ft11,ft6,ft1,fs7	# t, pretmp_201, a, t
	fmul.d	fs6,fa3,fs9	# tmp467, pretmp_165, a
	fmul.d	fs7,fa5,fs9	# tmp473, pretmp_222, a
	fmul.d	fs4,fa4,fs9	# tmp470, pretmp_195, a
	addw	t3,s5,s8	# _228, m, _241
	fmadd.d	fs1,ft9,fs5,fs8	# tmp460, pretmp_23, a, tmp459
	mv	a6,t3	# _228,
	fmadd.d	fa0,ft7,ft5,ft11	# t, pretmp_207, a, t
	sll	s11,a6,3	# _225, _228,
	add	t4,s3,s11	# tmp462, A, _225
	fld	fs3,0(t4)	# a, *_175
	addw	t5,s5,t3	# tmp464, m, _228
	sll	a5,t5,3	# _145, tmp464,
	add	t1,s3,a5	# tmp465, A, _145
	fsd	fa0,0(a2)	# t, *_378
	fld	fa1,0(t0)	# t, *_358
	fmadd.d	fs8,ft10,fs5,fs6	# tmp468, pretmp_97, a, tmp467
	add	t2,s2,a1	# _119, Co, _239
	fadd.d	fa7,fa7,fa1	# t, tmp455, t
	addw	a2,s5,2	# _257, m,
	mv	a3,a2	# _257,
	sll	a1,a3,3	# _92, _257,
	add	s8,s2,a5	# _22, Co, _145
	add	a0,s3,a1	# tmp477, A, _92
	addw	a5,s5,3	# _248, m,
	fmadd.d	ft1,ft1,fa6,fa7	# t, a, pretmp_485, t
	fmadd.d	fs4,fs0,fs5,fs4	# tmp471, pretmp_186, a, tmp470
	fmadd.d	fs5,fs2,fs5,fs7	# tmp474, pretmp_216, a, tmp473
	add	a3,s2,a1	# _307, Co, _92
	add	t6,s2,s11	# _99, Co, _225
	addw	a4,s5,a2	# _187, m, _257
	mv	a7,a4	# _187,
	fmadd.d	ft5,ft8,ft5,ft1	# t, pretmp_290, a, t
	sll	a6,a7,3	# _202, _187,
	add	t3,s3,a6	# tmp481, A, _202
	addw	s11,s5,a4	# tmp483, m, _187
	sll	t4,s11,3	# _258, tmp483,
	add	t5,s3,t4	# tmp484, A, _258
	add	a2,s2,a6	# _336, Co, _202
	fsd	ft5,0(t0)	# t, *_358
	fld	fs9,8(s2)	# t, MEM[(double *)Co_25 + 8B]
	fld	fs6,0(t1)	# a, *_144
	fld	fs7,0(a0)	# a, *_98
	fadd.d	fs1,fs1,fs9	# t, tmp460, t
	mv	t1,a5	# _248,
	sll	a1,t1,3	# _250, _248,
	add	a0,s3,a1	# tmp496, A, _250
	fmul.d	ft1,fs7,fa2	# tmp478, a, pretmp_271
	fmul.d	fa0,fa3,fs7	# tmp486, pretmp_165, a
	fmul.d	fa1,fs7,fa4	# tmp489, a, pretmp_195
	fmadd.d	fs9,fs3,ft0,fs1	# t, a, pretmp_422, t
	fmul.d	fs7,fs7,fa5	# tmp492, a, pretmp_222
	fld	ft5,16(s3)	# a, MEM[(double *)A_10 + 16B]
	fld	ft11,0(t3)	# a, *_211
	fld	fa7,0(t5)	# a, *_261
	fmadd.d	ft1,ft9,ft5,ft1	# tmp479, pretmp_23, a, tmp478
	fmadd.d	fa0,ft10,ft5,fa0	# tmp487, pretmp_97, a, tmp486
	fmadd.d	fs1,fs6,ft2,fs9	# t, a, pretmp_227, t
	fld	fs9,0(a0)	# a, *_251
	fmadd.d	fa1,ft5,fs0,fa1	# tmp490, a, pretmp_186, tmp489
	fmadd.d	ft5,ft5,fs2,fs7	# tmp493, a, pretmp_216, tmp492
	fmul.d	fa3,fa3,fs9	# tmp505, pretmp_165, a
	fld	fs7,24(s3)	# a, MEM[(double *)A_10 + 24B]
	fmul.d	fa4,fa4,fs9	# tmp508, pretmp_195, a
	fsd	fs1,8(s2)	# t, MEM[(double *)Co_25 + 8B]
	fld	fs1,0(t2)	# t, *_119
	fmul.d	fa5,fa5,fs9	# tmp511, pretmp_222, a
	fmul.d	fa2,fs9,fa2	# tmp497, a, pretmp_271
	fadd.d	fs8,fs8,fs1	# t, tmp468, t
	fmadd.d	fs9,ft10,fs7,fa3	# tmp506, pretmp_97, a, tmp505
	fmadd.d	fs0,fs0,fs7,fa4	# tmp509, pretmp_186, a, tmp508
	add	t0,s2,t4	# _374, Co, _258
	addw	a4,s5,a5	# _262, m, _248
	fmadd.d	fs2,fs2,fs7,fa5	# tmp512, pretmp_216, a, tmp511
	fmadd.d	fa2,ft9,fs7,fa2	# tmp498, pretmp_23, a, tmp497
	fmadd.d	fs8,fs3,ft3,fs8	# t, a, pretmp_171, t
	mv	a7,a4	# _262,
	sll	a6,a7,3	# _264, _262,
	add	t3,s3,a6	# tmp500, A, _264
	fld	fs1,0(t3)	# a, *_265
	addw	s11,s5,a4	# tmp502, m, _262
	sll	t4,s11,3	# _278, tmp502,
	fmadd.d	fs8,fs6,ft4,fs8	# t, a, pretmp_180, t
	add	t5,s3,t4	# tmp503, A, _278
	fld	ft9,0(t5)	# a, *_279
	add	a1,s2,a1	# _297, Co, _250
	add	t1,s2,a6	# _362, Co, _264
	add	a5,s2,t4	# _427, Co, _278
	fsd	fs8,0(t2)	# t, *_119
	fld	ft10,0(t6)	# t, *_99
	fadd.d	fs4,fs4,ft10	# t, tmp471, t
	fmadd.d	fs7,fs3,ft6,fs4	# t, a, pretmp_201, t
	fmadd.d	fa3,fs6,ft7,fs7	# t, a, pretmp_207, t
	fsd	fa3,0(t6)	# t, *_99
	fld	fa4,0(s8)	# t, *_22
	fadd.d	fs5,fs5,fa4	# t, tmp474, t
	fmadd.d	fs3,fs3,fa6,fs5	# t, a, pretmp_485, t
	fmadd.d	fs6,fs6,ft8,fs3	# t, a, pretmp_290, t
	fsd	fs6,0(s8)	# t, *_22
	fld	fs8,16(s2)	# t, MEM[(double *)Co_25 + 16B]
	fadd.d	ft1,ft1,fs8	# t, tmp479, t
	fmadd.d	fa5,ft11,ft0,ft1	# t, a, pretmp_422, t
	fmadd.d	ft10,ft2,fa7,fa5	# t, pretmp_227, a, t
	fsd	ft10,16(s2)	# t, MEM[(double *)Co_25 + 16B]
	fld	fs4,0(a3)	# t, *_307
	fadd.d	fa0,fa0,fs4	# t, tmp487, t
	fmadd.d	fs7,ft3,ft11,fa0	# t, pretmp_171, a, t
	fmadd.d	fa3,ft4,fa7,fs7	# t, pretmp_180, a, t
	fsd	fa3,0(a3)	# t, *_307
	fld	fa4,0(a2)	# t, *_336
	fadd.d	fa1,fa1,fa4	# t, tmp490, t
	fmadd.d	fs5,ft6,ft11,fa1	# t, pretmp_201, a, t
	fmadd.d	fs3,ft7,fa7,fs5	# t, pretmp_207, a, t
	fsd	fs3,0(a2)	# t, *_336
	fld	fs6,0(t0)	# t, *_374
	fadd.d	ft5,ft5,fs6	# t, tmp493, t
	fmadd.d	ft11,ft11,fa6,ft5	# t, a, pretmp_485, t
	fmadd.d	fa7,fa7,ft8,ft11	# t, a, pretmp_290, t
	fsd	fa7,0(t0)	# t, *_374
	fld	fs8,24(s2)	# t, MEM[(double *)Co_25 + 24B]
	fadd.d	fa2,fa2,fs8	# t, tmp498, t
	fmadd.d	ft0,fs1,ft0,fa2	# t, a, pretmp_422, t
	fmadd.d	ft2,ft2,ft9,ft0	# t, pretmp_227, a, t
	fsd	ft2,24(s2)	# t, MEM[(double *)Co_25 + 24B]
	fld	ft1,0(a1)	# t, *_297
	fadd.d	fs9,fs9,ft1	# t, tmp506, t
	fmadd.d	ft3,ft3,fs1,fs9	# t, pretmp_171, a, t
	fmadd.d	ft4,ft4,ft9,ft3	# t, pretmp_180, a, t
	fsd	ft4,0(a1)	# t, *_297
	fld	fa5,0(t1)	# t, *_362
	fadd.d	fs0,fs0,fa5	# t, tmp509, t
	fmadd.d	ft6,ft6,fs1,fs0	# t, pretmp_201, a, t
	fmadd.d	ft7,ft7,ft9,ft6	# t, pretmp_207, a, t
	fsd	ft7,0(t1)	# t, *_362
	fld	ft10,0(a5)	# t, *_427
	fadd.d	fs2,fs2,ft10	# t, tmp512, t
	fmadd.d	fa6,fs1,fa6,fs2	# t, a, pretmp_485, t
	fmadd.d	ft8,ft9,ft8,fa6	# t, a, pretmp_290, t
	fsd	ft8,0(a5)	# t, *_427
	blez	s4,.L388	#, _17,
	fld	fs1,0(s7)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	ft9,0(s2)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	addw	ra,s4,-1	# tmp524, _17,
	sll	s4,ra,32	# tmp525, tmp524,
	fsub.d	fa0,fs1,ft9	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	srl	t2,s4,32	# tmp525, tmp525,
	add	t6,t2,1	# tmp526, tmp525,
	sll	s8,t6,3	# tmp527, tmp526,
	add	a3,s8,-8	# tmp577, tmp527,
	srl	a2,a3,3	# tmp575, tmp577,
	and	t0,a2,3	# tmp578, tmp575,
	sd	t0,0(sp)	# tmp578, %sfp
	call	fabs	#
	fld	fs4,40(s1)	# tmp531,
	sd	s7,40(sp)	# C, %sfp
	sd	s2,32(sp)	# Co, %sfp
	fgt.d	a0,fa0,fs4	#, tmp534,, tmp531
	add	s4,s7,s8	# _487, C, tmp527
	ld	a4,0(sp)	# tmp578, %sfp
	bnez	a0,.L405	#, tmp534,
	add	s11,s7,8	# ivtmp.309, C,
	add	s8,s2,8	# ivtmp.310, Co,
	beq	s11,s4,.L388	#, ivtmp.309, _487,
	beqz	a4,.L400	#, tmp578,
	li	a7,1	# tmp580,
	beq	a4,a7,.L550	#, tmp578, tmp580,
	li	a6,2	# tmp579,
	beq	a4,a6,.L551	#, tmp578, tmp579,
	fld	fa0,0(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	fs7,0(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,fa0,fs7	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fgt.d	t3,fa0,fs4	#, tmp749,, tmp531
	bnez	t3,.L405	#, tmp749,
	add	s11,s7,16	# ivtmp.309, C,
	add	s8,s2,16	# ivtmp.310, Co,
.L551:
	fld	fa3,0(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	fa4,0(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,fa3,fa4	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fld	fa1,40(s1)	# tmp754,
	fgt.d	t4,fa0,fa1	#, tmp755,, tmp754
	bnez	t4,.L405	#, tmp755,
	add	s11,s11,8	# ivtmp.309, ivtmp.309,
	add	s8,s8,8	# ivtmp.310, ivtmp.310,
.L550:
	fld	fs5,0(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	fs3,0(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,fs5,fs3	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fld	fs6,40(s1)	# tmp760,
	fgt.d	t5,fa0,fs6	#, tmp761,, tmp760
	bnez	t5,.L405	#, tmp761,
	add	s11,s11,8	# ivtmp.309, ivtmp.309,
	add	s8,s8,8	# ivtmp.310, ivtmp.310,
	beq	s11,s4,.L388	#, ivtmp.309, _487,
.L400:
	fld	ft5,0(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	ft11,0(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,ft5,ft11	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fld	fs8,40(s1)	# tmp671,
	fgt.d	a1,fa0,fs8	#, tmp672,, tmp671
	bnez	a1,.L405	#, tmp672,
	fld	fa7,8(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	fa2,8(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,fa7,fa2	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fgt.d	t1,fa0,fs8	#, tmp729,, tmp671
	bnez	t1,.L405	#, tmp729,
	fld	ft0,16(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	ft2,16(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,ft0,ft2	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fgt.d	a5,fa0,fs8	#, tmp769,, tmp671
	bnez	a5,.L405	#, tmp769,
	fld	ft1,24(s11)	# MEM[base: _477, offset: 0B], MEM[base: _477, offset: 0B]
	fld	fs9,24(s8)	# MEM[base: _478, offset: 0B], MEM[base: _478, offset: 0B]
	fsub.d	fa0,ft1,fs9	#, MEM[base: _477, offset: 0B], MEM[base: _478, offset: 0B]
	call	fabs	#
	fgt.d	t2,fa0,fs8	#, tmp777,, tmp671
	bnez	t2,.L405	#, tmp777,
	add	s11,s11,32	# ivtmp.309, ivtmp.309,
	add	s8,s8,32	# ivtmp.310, ivtmp.310,
	bne	s11,s4,.L400	#, ivtmp.309, _487,
.L388:
	mv	a0,s3	#, A
	call	free	#
	mv	a0,s6	#, B
	call	free	#
	mv	a0,s7	#, C
	call	free	#
	mv	a0,s2	#, Co
	call	free	#
	lw	a5,24(sp)	#, %sfp
	lw	a4,16(sp)	#, %sfp
	mv	a3,s9	#, k
	mv	a2,s10	#, n
	mv	a1,s5	#, m
	add	a0,s1,24	#, tmp548,
	ld	ra,216(sp)	#,
	ld	s1,208(sp)	#,
	ld	s2,200(sp)	#,
	ld	s3,192(sp)	#,
	ld	s4,184(sp)	#,
	ld	s5,176(sp)	#,
	ld	s6,168(sp)	#,
	ld	s7,160(sp)	#,
	ld	s8,152(sp)	#,
	ld	s9,144(sp)	#,
	ld	s10,136(sp)	#,
	ld	s11,128(sp)	#,
	fld	fs0,120(sp)	#,
	fld	fs1,112(sp)	#,
	fld	fs2,104(sp)	#,
	fld	fs3,96(sp)	#,
	fld	fs4,88(sp)	#,
	fld	fs5,80(sp)	#,
	fld	fs6,72(sp)	#,
	fld	fs7,64(sp)	#,
	fld	fs8,56(sp)	#,
	fld	fs9,48(sp)	#,
	add	sp,sp,224	#,,
	tail	printf	#
.L583:
	lui	ra,%hi(.LANCHOR0)	# tmp547,
	add	s1,ra,%lo(.LANCHOR0)	# tmp548, tmp547,
	j	.L383	#
.L405:
	add	a0,s1,48	#, tmp548,
	call	perror	#
	li	s3,0	# i,
	lui	s2,%hi(.LC2)	# tmp550,
	lui	s4,%hi(.LC1)	# tmp554,
	blez	s5,.L584	#, m,
.L576:
	blez	s10,.L396	#, n,
	ld	s9,40(sp)	# ivtmp.304, %sfp
	ld	ra,8(sp)	# _443, %sfp
	addw	s7,s10,-1	# tmp565, n,
	ld	a1,0(s9)	#, MEM[base: _449, offset: 0B]
	li	s6,1	# j,
	add	a0,s4,%lo(.LC1)	#, tmp554,
	and	s11,s7,7	# tmp567, tmp565,
	add	s1,s9,ra	# ivtmp.299, ivtmp.304, _443
	call	printf	#
	beq	s10,s6,.L396	#, n, j,
	beqz	s11,.L394	#, tmp567,
	beq	s11,s6,.L543	#, tmp567, j,
	li	t6,2	# tmp572,
	beq	s11,t6,.L544	#, tmp567, tmp572,
	li	a3,3	# tmp571,
	beq	s11,a3,.L545	#, tmp567, tmp571,
	li	a2,4	# tmp570,
	beq	s11,a2,.L546	#, tmp567, tmp570,
	li	t0,5	# tmp569,
	beq	s11,t0,.L547	#, tmp567, tmp569,
	li	a0,6	# tmp568,
	beq	s11,a0,.L548	#, tmp567, tmp568,
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	mv	s6,t6	# j, tmp572
	call	printf	#
	ld	a4,8(sp)	# _443, %sfp
	add	s1,s1,a4	# ivtmp.299, ivtmp.299, _443
.L548:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	a7,8(sp)	# _443, %sfp
	add	s1,s1,a7	# ivtmp.299, ivtmp.299, _443
.L547:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	a6,8(sp)	# _443, %sfp
	add	s1,s1,a6	# ivtmp.299, ivtmp.299, _443
.L546:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	t3,8(sp)	# _443, %sfp
	add	s1,s1,t3	# ivtmp.299, ivtmp.299, _443
.L545:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	t4,8(sp)	# _443, %sfp
	add	s1,s1,t4	# ivtmp.299, ivtmp.299, _443
.L544:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	t5,8(sp)	# _443, %sfp
	add	s1,s1,t5	# ivtmp.299, ivtmp.299, _443
.L543:
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	a1,8(sp)	# _443, %sfp
	add	s1,s1,a1	# ivtmp.299, ivtmp.299, _443
	beq	s10,s6,.L396	#, n, j,
.L394:
	ld	s8,8(sp)	# _443, %sfp
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s9,s1,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s7,s9,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s7)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s11,s7,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s11)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s1,s11,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s1)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s9,s1,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s7,s9,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s7)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	add	s11,s7,s8	# ivtmp.299, ivtmp.299, _443
	call	printf	#
	ld	a1,0(s11)	#, MEM[base: _449, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp554,
	addw	s6,s6,8	# j, j,
	call	printf	#
	add	s1,s11,s8	# ivtmp.299, ivtmp.299, _443
	bne	s10,s6,.L394	#, n, j,
.L396:
	add	a0,s2,%lo(.LC2)	#, tmp550,
	call	printf	#
	ld	a4,40(sp)	# ivtmp.304, %sfp
	addw	s3,s3,1	# i, i,
	add	a7,a4,8	# ivtmp.304, ivtmp.304,
	sd	a7,40(sp)	# ivtmp.304, %sfp
	bne	s5,s3,.L576	#, m, i,
	add	a0,s2,%lo(.LC2)	#, tmp550,
	call	printf	#
	li	s5,0	# i,
	lui	s4,%hi(.LC1)	# tmp553,
.L401:
	blez	s10,.L399	#, n,
	ld	ra,32(sp)	# ivtmp.294, %sfp
	ld	t3,8(sp)	# _443, %sfp
	addw	a6,s10,-1	# tmp555, n,
	ld	a1,0(ra)	#, MEM[base: _281, offset: 0B]
	li	s6,1	# j,
	add	a0,s4,%lo(.LC1)	#, tmp553,
	and	s8,a6,7	# tmp557, tmp555,
	add	s1,ra,t3	# ivtmp.289, ivtmp.294, _443
	call	printf	#
	beq	s10,s6,.L399	#, n, j,
	beqz	s8,.L397	#, tmp557,
	beq	s8,s6,.L537	#, tmp557, j,
	li	t4,2	# tmp562,
	beq	s8,t4,.L538	#, tmp557, tmp562,
	li	t5,3	# tmp561,
	beq	s8,t5,.L539	#, tmp557, tmp561,
	li	a1,4	# tmp560,
	beq	s8,a1,.L540	#, tmp557, tmp560,
	li	t1,5	# tmp559,
	beq	s8,t1,.L541	#, tmp557, tmp559,
	li	a5,6	# tmp558,
	beq	s8,a5,.L542	#, tmp557, tmp558,
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	mv	s6,t4	# j, tmp562
	call	printf	#
	ld	t2,8(sp)	# _443, %sfp
	add	s1,s1,t2	# ivtmp.289, ivtmp.289, _443
.L542:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	t6,8(sp)	# _443, %sfp
	add	s1,s1,t6	# ivtmp.289, ivtmp.289, _443
.L541:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	a3,8(sp)	# _443, %sfp
	add	s1,s1,a3	# ivtmp.289, ivtmp.289, _443
.L540:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	s9,8(sp)	# _443, %sfp
	add	s1,s1,s9	# ivtmp.289, ivtmp.289, _443
.L539:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	a2,8(sp)	# _443, %sfp
	add	s1,s1,a2	# ivtmp.289, ivtmp.289, _443
.L538:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	s7,8(sp)	# _443, %sfp
	add	s1,s1,s7	# ivtmp.289, ivtmp.289, _443
.L537:
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,1	# j, j,
	call	printf	#
	ld	t0,8(sp)	# _443, %sfp
	add	s1,s1,t0	# ivtmp.289, ivtmp.289, _443
	beq	s10,s6,.L399	#, n, j,
.L397:
	ld	s11,8(sp)	# _443, %sfp
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s8,s1,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s9,s8,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s7,s9,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s7)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s1,s7,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s1)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s8,s1,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s9,s8,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	add	s7,s9,s11	# ivtmp.289, ivtmp.289, _443
	call	printf	#
	ld	a1,0(s7)	#, MEM[base: _281, offset: 0B]
	add	a0,s4,%lo(.LC1)	#, tmp553,
	addw	s6,s6,8	# j, j,
	call	printf	#
	add	s1,s7,s11	# ivtmp.289, ivtmp.289, _443
	bne	s10,s6,.L397	#, n, j,
.L399:
	add	a0,s2,%lo(.LC2)	#, tmp550,
	call	printf	#
	ld	a1,32(sp)	# ivtmp.294, %sfp
	addw	s5,s5,1	# i, i,
	add	a5,a1,8	# ivtmp.294, ivtmp.294,
	sd	a5,32(sp)	# ivtmp.294, %sfp
	bne	s5,s3,.L401	#, i, i,
.L398:
	add	a0,s2,%lo(.LC2)	#, tmp550,
	call	printf	#
	li	a0,1	#,
	call	exit	#
.L584:
	add	a0,s2,%lo(.LC2)	#, tmp550,
	call	printf	#
	j	.L398	#
	.size	benchmark_once, .-benchmark_once
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	add	sp,sp,-48	#,,
	sd	s1,32(sp)	#,
	mv	s1,a1	# f, f
	mv	a1,a0	#, desc
	lui	a0,%hi(.LANCHOR0+80)	# tmp86,
	add	a0,a0,%lo(.LANCHOR0+80)	#, tmp86,
	sd	ra,40(sp)	#,
	sd	s2,24(sp)	#,
	sd	s3,16(sp)	#,
	mv	s2,a2	# m, m
	mv	s3,a3	# n, n
	sd	s4,8(sp)	#,
	mv	s4,a4	# k, k
	call	printf	#
	lw	a3,0(s4)	#, *k_27(D)
	lw	a2,0(s3)	#, *n_26(D)
	lw	a1,0(s2)	#, *m_25(D)
	mv	a0,s1	#, f
	ld	ra,40(sp)	#,
	ld	s1,32(sp)	#,
	ld	s2,24(sp)	#,
	ld	s3,16(sp)	#,
	ld	s4,8(sp)	#,
	add	sp,sp,48	#,,
	tail	benchmark_once	#
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	add	sp,sp,-48	#,,
	sd	s5,0(sp)	#,
	sd	ra,40(sp)	#,
	sd	s1,32(sp)	#,
	sd	s2,24(sp)	#,
	sd	s3,16(sp)	#,
	sd	s4,8(sp)	#,
	li	a5,2	# tmp80,
	li	s5,4	# s,
	beq	a0,a5,.L592	#, argc, tmp80,
.L588:
	li	a0,4	#,
	call	malloc	#
	mv	s2,a0	# m,
	li	a0,4	#,
	call	malloc	#
	mv	s3,a0	# n,
	li	a0,4	#,
	call	malloc	#
	lui	s1,%hi(.LANCHOR0)	# tmp83,
	sw	s5,0(s2)	# s, *m_10
	mv	s4,a0	# k,
	add	s1,s1,%lo(.LANCHOR0)	# tmp82, tmp83,
	sw	s5,0(s3)	# s, *n_12
	lui	a1,%hi(naive_4x4_dgemm)	# tmp85,
	add	a0,s1,112	#, tmp82,
	sw	s5,0(s4)	# s, *k_14
	mv	a4,s4	#, k
	mv	a3,s3	#, n
	mv	a2,s2	#, m
	add	a1,a1,%lo(naive_4x4_dgemm)	#, tmp85,
	call	benchmark	#
	lui	t0,%hi(slow_4x4_dgemm)	# tmp89,
	mv	a4,s4	#, k
	mv	a3,s3	#, n
	mv	a2,s2	#, m
	add	a1,t0,%lo(slow_4x4_dgemm)	#, tmp89,
	add	a0,s1,128	#, tmp82,
	call	benchmark	#
	lui	t1,%hi(fast_4x4_dgemm)	# tmp93,
	add	a0,s1,144	#, tmp82,
	mv	a4,s4	#, k
	mv	a3,s3	#, n
	mv	a2,s2	#, m
	add	a1,t1,%lo(fast_4x4_dgemm)	#, tmp93,
	call	benchmark	#
	ld	ra,40(sp)	#,
	li	a0,0	#,
	ld	s1,32(sp)	#,
	ld	s2,24(sp)	#,
	ld	s3,16(sp)	#,
	ld	s4,8(sp)	#,
	ld	s5,0(sp)	#,
	add	sp,sp,48	#,,
	jr	ra	#
.L592:
	ld	a0,8(a1)	#, MEM[(char * *)argv_4(D) + 8B]
	call	atoi	#
	mv	s5,a0	# s,
	j	.L588	#
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	0
	.word	1072693248
.LC1:
	.string	"%.3f\t "
	.zero	1
.LC2:
	.string	"\n"
	.zero	6
.LC3:
	.string	"%d\t%d\t%d\t%d\t%d\n"
.LC4:
	.word	1202590843
	.word	1065646817
.LC5:
	.string	"error in matrix multiply"
	.zero	7
.LC6:
	.string	"%s\nM\tN\tK\tCycles\tInstructions\n"
	.zero	2
.LC7:
	.string	"naive_4x4"
	.zero	6
.LC8:
	.string	"slow_4x4"
	.zero	7
.LC9:
	.string	"fast_4x4"
	.ident	"GCC: (GNU) 6.1.0"
