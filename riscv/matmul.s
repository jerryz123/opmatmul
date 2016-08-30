	.file	"matmul.c"
# GNU C99 (GCC) version 5.3.0 (riscv64-unknown-elf)
#	compiled by GNU C version 4.9.3, GMP version 6.0.0, MPFR version 3.1.3-p4, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -fpreprocessed matmul.i -O3 -Wall -std=gnu99
# -ftree-vectorize -fopt-info-vec -ffast-math -fverbose-asm -funroll-loops
# options enabled:  -faggressive-loop-optimizations -falign-functions
# -falign-jumps -falign-labels -falign-loops -fassociative-math
# -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
# -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
# -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
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
# -fpartial-inlining -fpeephole -fpeephole2 -fpredictive-commoning
# -fprefetch-loop-arrays -freciprocal-math -freg-struct-return
# -frename-registers -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns -fschedule-insns2 -fsection-anchors
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-phiopt -fstdarg-opt
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp
# -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
# -ftree-copy-prop -ftree-copyrename -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-distribute-patterns
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vectorize
# -ftree-vrp -funit-at-a-time -funroll-loops -funsafe-math-optimizations
# -funswitch-loops -fverbose-asm -fweb -fzero-initialized-in-bss -matomic
# -mfdiv -mhard-float -mmuldiv -mplt

	.text
	.align	2
	.globl	fill
	.type	fill, @function
fill:
	blez	a1,.L1	#, n,
	addw	a4,a1,-1	# D.3946, n,
	sll	t0,a4,32	# D.3948, D.3946,
	srl	t1,t0,32	# D.3948, D.3948,
	lui	a5,%hi(.LC1)	# tmp123,
	add	t2,t1,1	# D.3948, D.3948,
	fld	fa5,%lo(.LC1)(a5)	# tmp124,
	sll	a1,t2,3	# D.3948, D.3948,
	add	a3,a1,-8	# tmp127, D.3948,
	srl	a2,a3,3	# tmp125, tmp127,
	add	a6,a0,a1	# D.3950, p, D.3948
	fsd	fa5,0(a0)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,a0,8	# ivtmp.18, p,
	and	a7,a2,7	# tmp128, tmp125,
	beq	t1,a6,.L37	#, ivtmp.18, D.3950,
	beqz	a7,.L3	#, tmp128,
	li	t3,1	# tmp134,
	beq	a7,t3,.L29	#, tmp128, tmp134,
	li	t4,2	# tmp133,
	beq	a7,t4,.L30	#, tmp128, tmp133,
	li	t5,3	# tmp132,
	beq	a7,t5,.L31	#, tmp128, tmp132,
	li	t6,4	# tmp131,
	beq	a7,t6,.L32	#, tmp128, tmp131,
	li	a4,5	# tmp130,
	beq	a7,a4,.L33	#, tmp128, tmp130,
	li	t0,6	# tmp129,
	beq	a7,t0,.L34	#, tmp128, tmp129,
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,a0,16	# ivtmp.18, p,
.L34:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
.L33:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
.L32:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
.L31:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
.L30:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
.L29:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,8	# ivtmp.18, ivtmp.18,
	beq	t1,a6,.L38	#, ivtmp.18, D.3950,
.L3:
	fsd	fa5,0(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,8(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,16(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,24(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,32(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,40(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,48(t1)	# tmp124, MEM[base: _16, offset: 0B]
	fsd	fa5,56(t1)	# tmp124, MEM[base: _16, offset: 0B]
	add	t1,t1,64	# ivtmp.18, ivtmp.18,
	bne	t1,a6,.L3	#, ivtmp.18, D.3950,
.L1:
	ret
.L38:
	ret
.L37:
	ret
	.size	fill, .-fill
	.align	2
	.globl	printmatrix
	.type	printmatrix, @function
printmatrix:
	blez	a0,.L77	#, m,
	add	sp,sp,-80	#,,
	sd	s7,8(sp)	#,
	mv	s7,a0	# m, m
	sd	s2,48(sp)	#,
	mv	s2,s7	# D.3973,
	sd	s3,40(sp)	#,
	sd	s4,32(sp)	#,
	sd	s5,24(sp)	#,
	sd	s6,16(sp)	#,
	sd	ra,72(sp)	#,
	sd	s0,64(sp)	#,
	sd	s1,56(sp)	#,
	sd	s8,0(sp)	#,
	mv	s4,a1	# n, n
	mv	s5,a2	# ivtmp.31, M
	sll	s2,s2,3	# D.3973, D.3973,
	li	s6,0	# i,
	lui	s3,%hi(.LC2)	# tmp89,
.L41:
	blez	s4,.L43	#, n,
	ld	a1,0(s5)	#, MEM[base: _24, offset: 0B]
	addw	s8,s4,-1	# tmp91, n,
	li	s1,1	# j,
	add	a0,s3,%lo(.LC2)	#, tmp89,
	and	s8,s8,7	# tmp93, tmp91,
	add	s0,s5,s2	# ivtmp.26, ivtmp.31, D.3973
	call	printf	#
	beq	s4,s1,.L43	#, n, j,
	beqz	s8,.L42	#, tmp93,
	beq	s8,s1,.L69	#, tmp93, j,
	li	a5,2	# tmp98,
	beq	s8,a5,.L70	#, tmp93, tmp98,
	li	a4,3	# tmp97,
	beq	s8,a4,.L71	#, tmp93, tmp97,
	li	ra,4	# tmp96,
	beq	s8,ra,.L72	#, tmp93, tmp96,
	li	t0,5	# tmp95,
	beq	s8,t0,.L73	#, tmp93, tmp95,
	li	t1,6	# tmp94,
	beq	s8,t1,.L74	#, tmp93, tmp94,
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	mv	s1,a5	# j, tmp98
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
.L74:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
.L73:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
.L72:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
.L71:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
.L70:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
.L69:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,1	# j, j,
	call	printf	#
	add	s0,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	beq	s4,s1,.L43	#, n, j,
.L42:
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s8,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s0,s8,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s8,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s0,s8,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s8,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s0,s8,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s0)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	add	s8,s0,s2	# ivtmp.26, ivtmp.26, D.3973
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _24, offset: 0B]
	add	a0,s3,%lo(.LC2)	#, tmp89,
	addw	s1,s1,8	# j, j,
	call	printf	#
	add	s0,s8,s2	# ivtmp.26, ivtmp.26, D.3973
	bne	s4,s1,.L42	#, n, j,
.L43:
	li	a0,10	#,
	addw	s6,s6,1	# i, i,
	call	putchar	#
	add	s5,s5,8	# ivtmp.31, ivtmp.31,
	bne	s7,s6,.L41	#, m, i,
	ld	ra,72(sp)	#,
	ld	s0,64(sp)	#,
	ld	s1,56(sp)	#,
	ld	s2,48(sp)	#,
	ld	s3,40(sp)	#,
	ld	s4,32(sp)	#,
	ld	s5,24(sp)	#,
	ld	s6,16(sp)	#,
	ld	s7,8(sp)	#,
	ld	s8,0(sp)	#,
	li	a0,10	#,
	add	sp,sp,80	#,,
	tail	putchar	#
.L77:
	li	a0,10	#,
	tail	putchar	#
	.size	printmatrix, .-printmatrix
	.align	2
	.globl	naive_dgemm
	.type	naive_dgemm, @function
naive_dgemm:
	blez	a0,.L78	#, n,
	mv	t4,a1	# ivtmp.51, A
	mv	t5,a3	# ivtmp.53, C
	sll	a1,a0,3	# D.4015, D.4015,
	li	t6,0	# i,
.L80:
	mv	a7,a2	# ivtmp.47, B
	mv	t1,t5	# ivtmp.45, ivtmp.53
	li	t3,0	# j,
.L82:
	fld	fa5,0(t1)	# t, MEM[base: _80, offset: 0B]
	fld	fa4,0(t4)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa3,0(a7)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a6,a0,-1	# tmp99, n,
	li	a3,1	# k,
	and	a6,a6,7	# tmp101, tmp99,
	fmadd.d	ft9,fa4,fa3,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a5,t4,a1	# ivtmp.38, ivtmp.51, D.4015
	add	a4,a7,8	# ivtmp.40, ivtmp.47,
	beq	a0,a3,.L115	#, n, k,
	beqz	a6,.L81	#, tmp101,
	beq	a6,a3,.L108	#, tmp101, k,
	li	t0,2	# tmp106,
	beq	a6,t0,.L109	#, tmp101, tmp106,
	li	t2,3	# tmp105,
	beq	a6,t2,.L110	#, tmp101, tmp105,
	li	t2,4	# tmp104,
	beq	a6,t2,.L111	#, tmp101, tmp104,
	li	t2,5	# tmp103,
	beq	a6,t2,.L112	#, tmp101, tmp103,
	li	t2,6	# tmp102,
	beq	a6,t2,.L113	#, tmp101, tmp102,
	fld	ft0,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft1,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	mv	a3,t0	# k, tmp106
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,ft0,ft1,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a7,16	# ivtmp.40, ivtmp.47,
.L113:
	fld	ft2,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft3,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,ft2,ft3,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
.L112:
	fld	ft4,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft5,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,ft4,ft5,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
.L111:
	fld	ft6,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft7,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,ft6,ft7,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
.L110:
	fld	fa0,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa1,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,fa0,fa1,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
.L109:
	fld	fa2,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	fa6,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,fa2,fa6,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
.L108:
	fld	fa7,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft8,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	addw	a3,a3,1	# k, k,
	add	a5,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fmadd.d	ft9,fa7,ft8,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	add	a4,a4,8	# ivtmp.40, ivtmp.40,
	beq	a0,a3,.L115	#, n, k,
.L81:
	fld	ft10,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	fld	ft11,0(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	add	a6,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft1,8(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa5,ft10,ft11,ft9	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fld	fa4,0(a6)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t0,a6,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft0,16(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	fa3,0(t0)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t2,t0,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft4,24(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	ft2,fa4,ft1,fa5	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fld	ft5,0(t2)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	a5,t2,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft3,32(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	ft6,0(a5)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	a6,a5,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft7,40(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa0,fa3,ft0,ft2	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fld	fa1,0(a6)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t0,a6,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	fa6,48(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fld	fa7,0(t0)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	add	t2,t0,a1	# ivtmp.38, ivtmp.38, D.4015
	fld	ft8,56(a4)	# MEM[base: _85, offset: 0B], MEM[base: _85, offset: 0B]
	fmadd.d	fa2,ft5,ft4,fa0	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fld	ft9,0(t2)	# MEM[base: _86, offset: 0B], MEM[base: _86, offset: 0B]
	addw	a3,a3,8	# k, k,
	add	a5,t2,a1	# ivtmp.38, ivtmp.38, D.4015
	add	a4,a4,64	# ivtmp.40, ivtmp.40,
	fmadd.d	ft10,ft6,ft3,fa2	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fmadd.d	ft11,fa1,ft7,ft10	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fmadd.d	ft1,fa7,fa6,ft11	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	fmadd.d	ft9,ft9,ft8,ft1	# t, MEM[base: _86, offset: 0B], MEM[base: _85, offset: 0B], t
	bne	a0,a3,.L81	#, n, k,
.L115:
	fsd	ft9,0(t1)	# t, MEM[base: _80, offset: 0B]
	addw	t3,t3,1	# j, j,
	add	t1,t1,a1	# ivtmp.45, ivtmp.45, D.4015
	add	a7,a7,a1	# ivtmp.47, ivtmp.47, D.4015
	bne	a0,t3,.L82	#, n, j,
	addw	t6,t6,1	# i, i,
	add	t4,t4,8	# ivtmp.51, ivtmp.51,
	add	t5,t5,8	# ivtmp.53, ivtmp.53,
	bne	a0,t6,.L80	#, n, i,
.L78:
	ret
	.size	naive_dgemm, .-naive_dgemm
	.align	2
	.globl	do_4x4_block
	.type	do_4x4_block, @function
do_4x4_block:
	add	sp,sp,-144	#,,
	sd	s0,128(sp)	#,
	sd	s1,120(sp)	#,
	sd	s2,112(sp)	#,
	sd	s3,104(sp)	#,
	sd	s4,96(sp)	#,
	sd	s5,88(sp)	#,
	sd	s6,80(sp)	#,
	sd	s7,72(sp)	#,
	sd	s8,64(sp)	#,
	sd	s9,56(sp)	#,
	sd	s10,48(sp)	#,
	sd	ra,136(sp)	#,
	sd	s11,40(sp)	#,
	add	s0,sp,144	#,,
	add	sp,sp,-608	#,,
	add	s1,sp,31	# tmp167,,
	and	s1,s1,-32	# tmp169, tmp167,
	mv	s5,a4	# ivtmp.62, C
	mv	s10,a1	# kdepth, kdepth
	mv	s8,a2	# A, A
	mv	s7,a3	# B, B
	mv	s4,s1	# ivtmp.64, tmp169
	sll	s2,a0,3	# D.4060, D.4060,
	add	s6,s1,128	# D.4061, tmp169,
	mv	s9,a4	# ivtmp.84, ivtmp.62
	mv	s3,s1	# ivtmp.82, tmp169
.L117:
 #APP
# 74 "matmul.c" 1
	# initial memcopy
# 0 "" 2
 #NO_APP
	li	a2,32	#,
	mv	a1,s9	#, ivtmp.84
	mv	a0,s3	#, ivtmp.82
	add	s3,s3,a2	# ivtmp.82, ivtmp.82,
	add	s9,s9,s2	# ivtmp.84, ivtmp.84, D.4060
	call	memcpy	#
	bne	s3,s6,.L117	#, ivtmp.82, D.4061,
	blez	s10,.L119	#, kdepth,
	addw	ra,s10,-1	# D.4064, kdepth,
	sll	s10,ra,32	# D.4063, D.4064,
	srl	s3,s10,32	# D.4063, D.4063,
	ld	s11,0(s1)	# c, c
	ld	t2,8(s1)	# c, c
	ld	t0,16(s1)	# c, c
	ld	t6,24(s1)	# c, c
	ld	t5,32(s1)	# c, c
	ld	t4,40(s1)	# c, c
	ld	t3,48(s1)	# c, c
	ld	t1,56(s1)	# c, c
	ld	a7,64(s1)	# c, c
	ld	a6,72(s1)	# c, c
	ld	a0,80(s1)	# c, c
	ld	a1,88(s1)	# c, c
	ld	a2,96(s1)	# c, c
	ld	a3,104(s1)	# c, c
	ld	a4,112(s1)	# c, c
	ld	a5,120(s1)	# c, c
	add	s10,s7,s2	# ivtmp.73, ivtmp.71, D.4060
	add	ra,s3,1	# D.4063, D.4063,
	add	s9,s10,s2	# ivtmp.74, ivtmp.73, D.4060
	sll	s3,ra,3	# D.4063, D.4063,
	sd	s11,416(s1)	# c,
	sd	t2,424(s1)	# c,
	sd	t0,432(s1)	# c,
	sd	t6,440(s1)	# c,
	sd	t5,320(s1)	# c,
	sd	t4,328(s1)	# c,
	sd	t3,336(s1)	# c,
	sd	t1,344(s1)	# c,
	sd	a7,224(s1)	# c,
	sd	a6,232(s1)	# c,
	sd	a0,240(s1)	# c,
	sd	a1,248(s1)	# c,
	sd	a2,128(s1)	# c,
	sd	a3,136(s1)	# c,
	sd	a4,144(s1)	# c,
	sd	a5,152(s1)	# c,
	add	s11,s9,s2	# ivtmp.75, ivtmp.74, D.4060
	add	s3,s7,s3	# D.4061, ivtmp.71, D.4063
	add	t2,s1,544	# tmp309, tmp169,
.L120:
	mv	a1,s8	#, ivtmp.69
	li	a2,32	#,
	mv	a0,t2	#, tmp309
	call	memcpy	#
	ld	t0,544(s1)	# a, a
	ld	t6,552(s1)	# a, a
	fld	fa5,0(s7)	# bv, MEM[base: _126, offset: 0B]
	sd	t0,480(s1)	# a,
	sd	t6,488(s1)	# a,
	fld	fa1,480(s1)	# D.4055,
	fld	fa2,488(s1)	# D.4055,
	ld	t5,560(s1)	# a, a
	ld	t4,568(s1)	# a, a
	fmul.d	ft5,fa5,fa1	# D.4055, bv, D.4055
	fmul.d	ft4,fa5,fa2	# D.4055, bv, D.4055
	sd	t5,496(s1)	# a,
	sd	t4,504(s1)	# a,
	fld	fa3,496(s1)	# D.4055,
	fld	fa4,504(s1)	# D.4055,
	fsd	fa5,-144(s0)	# bv,
	fsd	fa5,-136(s0)	# bv,
	ld	t3,-144(s0)	# tmp205,
	ld	t1,-136(s0)	# tmp206,
	fsd	fa5,-128(s0)	# bv,
	fsd	fa5,-120(s0)	# bv,
	fsd	ft5,-144(s0)	# D.4055,
	fsd	ft4,-136(s0)	# D.4055,
	sd	t3,512(s1)	# tmp205,
	sd	t1,520(s1)	# tmp206,
	ld	a7,-128(s0)	# tmp207,
	fmul.d	ft3,fa5,fa3	# D.4055, bv, D.4055
	fmul.d	ft2,fa5,fa4	# D.4055, bv, D.4055
	sd	a7,528(s1)	# tmp207,
	ld	a6,-120(s0)	# tmp208,
	mv	t2,a0	# tmp309,
	add	s7,s7,8	# ivtmp.71, ivtmp.71,
	sd	a6,536(s1)	# tmp208,
	ld	a0,-144(s0)	# tmp213,
	fsd	ft3,-128(s0)	# D.4055,
	fsd	ft2,-120(s0)	# D.4055,
	sd	a0,448(s1)	# tmp213,
	ld	a1,-136(s0)	# tmp214,
	add	s8,s8,s2	# ivtmp.69, ivtmp.69, D.4060
	add	s10,s10,8	# ivtmp.73, ivtmp.73,
	sd	a1,456(s1)	# tmp214,
	fld	ft1,416(s1)	# tmp218,
	fld	ft0,424(s1)	# tmp220,
	fld	fa0,432(s1)	# tmp222,
	fld	ft6,440(s1)	# tmp224,
	fadd.d	ft7,ft1,ft5	# D.4055, tmp218, D.4055
	fadd.d	fa6,ft0,ft4	# D.4055, tmp220, D.4055
	fadd.d	fa7,fa0,ft3	# D.4055, tmp222, D.4055
	fadd.d	ft8,ft6,ft2	# D.4055, tmp224, D.4055
	ld	a5,-128(s0)	# tmp215,
	ld	t0,-120(s0)	# tmp216,
	add	s9,s9,8	# ivtmp.74, ivtmp.74,
	fsd	ft7,-144(s0)	# D.4055,
	fsd	fa6,-136(s0)	# D.4055,
	fsd	fa7,-128(s0)	# D.4055,
	fsd	ft8,-120(s0)	# D.4055,
	ld	t6,-144(s0)	# tmp225,
	ld	a2,-136(s0)	# tmp226,
	ld	a3,-128(s0)	# tmp227,
	ld	a4,-120(s0)	# tmp228,
	sd	a5,464(s1)	# tmp215,
	sd	t0,472(s1)	# tmp216,
	sd	t6,416(s1)	# tmp225,
	sd	a2,424(s1)	# tmp226,
	sd	a3,432(s1)	# tmp227,
	sd	a4,440(s1)	# tmp228,
	fld	ft9,-8(s10)	# bv, MEM[base: _125, offset: 0B]
	sd	t6,0(s1)	# tmp225, c
	sd	a2,8(s1)	# tmp226, c
	fsd	ft9,-144(s0)	# bv,
	fsd	ft9,-136(s0)	# bv,
	sd	a3,16(s1)	# tmp227, c
	sd	a4,24(s1)	# tmp228, c
	ld	t5,-144(s0)	# tmp233,
	fsd	ft9,-128(s0)	# bv,
	fsd	ft9,-120(s0)	# bv,
	fmul.d	ft10,ft9,fa1	# D.4055, bv, D.4055
	fmul.d	ft11,ft9,fa2	# D.4055, bv, D.4055
	fmul.d	ft5,ft9,fa3	# D.4055, bv, D.4055
	fmul.d	ft4,fa4,ft9	# D.4055, D.4055, bv
	sd	t5,384(s1)	# tmp233,
	ld	t4,-136(s0)	# tmp234,
	add	s11,s11,8	# ivtmp.75, ivtmp.75,
	sd	t4,392(s1)	# tmp234,
	fld	ft3,320(s1)	# tmp242,
	fld	ft2,328(s1)	# tmp244,
	fld	fa0,336(s1)	# tmp246,
	fld	fa5,344(s1)	# tmp248,
	fadd.d	ft1,ft3,ft10	# D.4055, tmp242, D.4055
	fadd.d	ft0,ft2,ft11	# D.4055, tmp244, D.4055
	fadd.d	ft6,fa0,ft5	# D.4055, tmp246, D.4055
	fadd.d	ft7,fa5,ft4	# D.4055, tmp248, D.4055
	fsd	ft10,-144(s0)	# D.4055,
	fsd	ft11,-136(s0)	# D.4055,
	ld	t3,-128(s0)	# tmp235,
	ld	t1,-120(s0)	# tmp236,
	fsd	ft5,-128(s0)	# D.4055,
	fsd	ft4,-120(s0)	# D.4055,
	ld	a7,-144(s0)	# tmp237,
	ld	a6,-136(s0)	# tmp238,
	ld	a0,-128(s0)	# tmp239,
	ld	a1,-120(s0)	# tmp240,
	fsd	ft1,-144(s0)	# D.4055,
	fsd	ft0,-136(s0)	# D.4055,
	fsd	ft6,-128(s0)	# D.4055,
	fsd	ft7,-120(s0)	# D.4055,
	ld	a5,-136(s0)	# tmp250,
	ld	t0,-128(s0)	# tmp251,
	ld	t6,-120(s0)	# tmp252,
	ld	a2,-144(s0)	# tmp249,
	sd	t3,400(s1)	# tmp235,
	sd	t1,408(s1)	# tmp236,
	sd	a7,352(s1)	# tmp237,
	sd	a6,360(s1)	# tmp238,
	sd	a0,368(s1)	# tmp239,
	sd	a1,376(s1)	# tmp240,
	sd	a2,320(s1)	# tmp249,
	sd	a5,328(s1)	# tmp250,
	sd	t0,336(s1)	# tmp251,
	sd	t6,344(s1)	# tmp252,
	sd	a2,32(s1)	# tmp249, c
	fld	fa6,-8(s9)	# bv, MEM[base: _124, offset: 0B]
	fld	fa7,224(s1)	# tmp266,
	fld	ft8,232(s1)	# tmp268,
	fmul.d	ft9,fa1,fa6	# D.4055, D.4055, bv
	fmul.d	ft10,fa6,fa2	# D.4055, bv, D.4055
	fmul.d	ft11,fa6,fa3	# D.4055, bv, D.4055
	fmul.d	ft5,fa6,fa4	# D.4055, bv, D.4055
	fsd	fa6,-144(s0)	# bv,
	fsd	fa6,-136(s0)	# bv,
	fsd	fa6,-128(s0)	# bv,
	fsd	fa6,-120(s0)	# bv,
	ld	a3,-144(s0)	# tmp257,
	ld	a4,-136(s0)	# tmp258,
	ld	t5,-128(s0)	# tmp259,
	ld	t4,-120(s0)	# tmp260,
	fsd	ft9,-144(s0)	# D.4055,
	fsd	ft10,-136(s0)	# D.4055,
	fsd	ft11,-128(s0)	# D.4055,
	fsd	ft5,-120(s0)	# D.4055,
	sd	a5,40(s1)	# tmp250, c
	sd	t0,48(s1)	# tmp251, c
	sd	t6,56(s1)	# tmp252, c
	sd	a3,288(s1)	# tmp257,
	sd	a4,296(s1)	# tmp258,
	sd	t5,304(s1)	# tmp259,
	sd	t4,312(s1)	# tmp260,
	ld	t3,-144(s0)	# tmp261,
	fadd.d	ft4,fa7,ft9	# D.4055, tmp266, D.4055
	fadd.d	ft3,ft8,ft10	# D.4055, tmp268, D.4055
	sd	t3,256(s1)	# tmp261,
	ld	t1,-136(s0)	# tmp262,
	sd	t1,264(s1)	# tmp262,
	ld	a7,-128(s0)	# tmp263,
	sd	a7,272(s1)	# tmp263,
	ld	a6,-120(s0)	# tmp264,
	sd	a6,280(s1)	# tmp264,
	fsd	ft4,-144(s0)	# D.4055,
	fsd	ft3,-136(s0)	# D.4055,
	fld	ft2,240(s1)	# tmp270,
	fld	fa5,248(s1)	# tmp272,
	ld	a0,-144(s0)	# tmp273,
	fadd.d	fa0,ft2,ft11	# D.4055, tmp270, D.4055
	fadd.d	ft1,fa5,ft5	# D.4055, tmp272, D.4055
	ld	a1,-136(s0)	# tmp274,
	sd	a0,224(s1)	# tmp273,
	sd	a0,64(s1)	# tmp273, c
	sd	a1,232(s1)	# tmp274,
	sd	a1,72(s1)	# tmp274, c
	fsd	fa0,-128(s0)	# D.4055,
	fsd	ft1,-120(s0)	# D.4055,
	ld	a5,-128(s0)	# tmp275,
	ld	t0,-120(s0)	# tmp276,
	sd	a5,240(s1)	# tmp275,
	sd	t0,248(s1)	# tmp276,
	fld	ft0,-8(s11)	# bv, MEM[base: _123, offset: 0B]
	sd	a5,80(s1)	# tmp275, c
	sd	t0,88(s1)	# tmp276, c
	fsd	ft0,-144(s0)	# bv,
	ld	t6,-144(s0)	# tmp281,
	fsd	ft0,-136(s0)	# bv,
	fsd	ft0,-128(s0)	# bv,
	fsd	ft0,-120(s0)	# bv,
	sd	t6,192(s1)	# tmp281,
	ld	a2,-136(s0)	# tmp282,
	fmul.d	fa1,ft0,fa1	# D.4055, bv, D.4055
	fmul.d	fa2,ft0,fa2	# D.4055, bv, D.4055
	sd	a2,200(s1)	# tmp282,
	ld	a3,-128(s0)	# tmp283,
	fmul.d	fa3,ft0,fa3	# D.4055, bv, D.4055
	fmul.d	fa4,ft0,fa4	# D.4055, bv, D.4055
	sd	a3,208(s1)	# tmp283,
	ld	a4,-120(s0)	# tmp284,
	sd	a4,216(s1)	# tmp284,
	fsd	fa1,-144(s0)	# D.4055,
	fsd	fa2,-136(s0)	# D.4055,
	fsd	fa3,-128(s0)	# D.4055,
	fsd	fa4,-120(s0)	# D.4055,
	fld	ft6,128(s1)	# tmp290,
	fld	ft7,136(s1)	# tmp292,
	fld	fa6,144(s1)	# tmp294,
	fld	fa7,152(s1)	# tmp296,
	fadd.d	ft8,ft6,fa1	# D.4055, tmp290, D.4055
	fadd.d	ft9,ft7,fa2	# D.4055, tmp292, D.4055
	fadd.d	ft10,fa6,fa3	# D.4055, tmp294, D.4055
	fadd.d	ft11,fa7,fa4	# D.4055, tmp296, D.4055
	ld	t5,-144(s0)	# tmp285,
	ld	t4,-136(s0)	# tmp286,
	ld	t3,-128(s0)	# tmp287,
	ld	t1,-120(s0)	# tmp288,
	fsd	ft8,-144(s0)	# D.4055,
	fsd	ft9,-136(s0)	# D.4055,
	fsd	ft10,-128(s0)	# D.4055,
	fsd	ft11,-120(s0)	# D.4055,
	ld	a7,-144(s0)	# tmp297,
	ld	a6,-136(s0)	# tmp298,
	ld	a0,-128(s0)	# tmp299,
	ld	a1,-120(s0)	# tmp300,
	sd	t5,160(s1)	# tmp285,
	sd	t4,168(s1)	# tmp286,
	sd	t3,176(s1)	# tmp287,
	sd	t1,184(s1)	# tmp288,
	sd	a7,128(s1)	# tmp297,
	sd	a6,136(s1)	# tmp298,
	sd	a0,144(s1)	# tmp299,
	sd	a1,152(s1)	# tmp300,
	sd	a7,96(s1)	# tmp297, c
	sd	a6,104(s1)	# tmp298, c
	sd	a0,112(s1)	# tmp299, c
	sd	a1,120(s1)	# tmp300, c
	bne	s7,s3,.L120	#, ivtmp.71, D.4061,
.L119:
 #APP
# 89 "matmul.c" 1
	# final memcopy
# 0 "" 2
 #NO_APP
	li	a2,32	#,
	mv	a1,s4	#, ivtmp.64
	mv	a0,s5	#, ivtmp.62
	add	s4,s4,a2	# ivtmp.64, ivtmp.64,
	add	s5,s5,s2	# ivtmp.62, ivtmp.62, D.4060
	call	memcpy	#
	bne	s6,s4,.L119	#, D.4061, ivtmp.64,
	add	sp,s0,-144	#,,
	ld	ra,136(sp)	#,
	ld	s0,128(sp)	#,
	ld	s1,120(sp)	#,
	ld	s2,112(sp)	#,
	ld	s3,104(sp)	#,
	ld	s4,96(sp)	#,
	ld	s5,88(sp)	#,
	ld	s6,80(sp)	#,
	ld	s7,72(sp)	#,
	ld	s8,64(sp)	#,
	ld	s9,56(sp)	#,
	ld	s10,48(sp)	#,
	ld	s11,40(sp)	#,
	add	sp,sp,144	#,,
	jr	ra	#
	.size	do_4x4_block, .-do_4x4_block
	.align	2
	.globl	avx_dgemm_slow
	.type	avx_dgemm_slow, @function
avx_dgemm_slow:
	blez	a0,.L305	#, n,
	add	sp,sp,-320	#,,
	sllw	a5,a0,5	# D.4200, n,
	mv	a4,a5	# D.4201, D.4201
	sd	s1,296(sp)	#,
	sd	s11,216(sp)	#,
	mv	s1,a0	# n, n
	sllw	s11,a0,2	# D.4199, n,
	sll	t1,s11,3	# D.4199, D.4199,
	sd	ra,312(sp)	#,
	sll	t0,a4,3	# D.4199, D.4201,
	mv	ra,s1	# D.4201,
	sd	s10,224(sp)	#,
	sd	s0,304(sp)	#,
	sd	s2,288(sp)	#,
	sd	s3,280(sp)	#,
	sd	s4,272(sp)	#,
	sd	s5,264(sp)	#,
	sd	s6,256(sp)	#,
	sd	s7,248(sp)	#,
	sd	s8,240(sp)	#,
	sd	s9,232(sp)	#,
	sd	a3,56(sp)	# C, %sfp
	sd	a2,64(sp)	# B, %sfp
	sd	a1,136(sp)	# A, %sfp
	sw	a5,176(sp)	# D.4200, %sfp
	sd	a4,144(sp)	# D.4201, %sfp
	sd	a2,104(sp)	# B, %sfp
	sd	t0,192(sp)	# D.4199, %sfp
	sd	t1,72(sp)	# D.4199, %sfp
	sll	s10,ra,3	# D.4201, D.4201,
	sd	zero,48(sp)	#, %sfp
	sd	zero,80(sp)	#, %sfp
	sw	zero,128(sp)	#, %sfp
	li	s11,0	# ivtmp.195,
.L159:
	addw	t2,s11,32	# D.4200, ivtmp.195,
	sw	t2,188(sp)	# D.4200, %sfp
	mv	s9,s1	# kend, n
	ble	s1,t2,.L128	#, n, D.4200,
	mv	s9,t2	# kend, D.4200
.L128:
	lw	s0,128(sp)	# D.4199, %sfp
	ld	a1,80(sp)	# ivtmp.197, %sfp
	ld	a6,136(sp)	# A, %sfp
	ld	s3,104(sp)	# ivtmp.199, %sfp
	sll	a0,s0,3	# D.4199, D.4199,
	sub	a2,a1,s0	# D.4196, ivtmp.197, D.4199
	add	a7,a6,a0	# ivtmp.182, A, D.4199
	sll	s2,a2,3	# D.4196, D.4196,
	sd	a7,168(sp)	# ivtmp.182, %sfp
	sd	s2,160(sp)	# D.4196, %sfp
	sd	s3,120(sp)	# ivtmp.199, %sfp
	sd	zero,112(sp)	#, %sfp
	sw	zero,132(sp)	#, %sfp
	sw	zero,92(sp)	#, %sfp
	subw	s8,s9,s11	# D.4197, kend, ivtmp.195
.L158:
	lw	s4,92(sp)	#, %sfp
	mv	s7,s1	# jend, n
	addw	s5,s4,32	# j1, j1,
	sw	s5,180(sp)	# j1, %sfp
	ble	s1,s5,.L129	#, n, j1,
	mv	s7,s5	# jend, j1
.L129:
	lw	s6,92(sp)	#, %sfp
	ld	s0,48(sp)	# ivtmp.198, %sfp
	ld	a2,112(sp)	# ivtmp.191, %sfp
	subw	t3,s7,s6	# D.4197, jend, j1
	sraw	t4,t3,31	# tmp279, D.4197,
	srlw	t5,t4,30	# tmp280, tmp279,
	addw	t6,t3,t5	# tmp281, D.4197, tmp280
	and	a3,t6,3	# tmp282, tmp281,
	subw	a5,a3,t5	# tmp283, tmp282, tmp280
	subw	a4,s7,a5	# j1, jend, tmp283
	mulw	ra,s1,a4	# D.4197, n, j1
	ld	s2,56(sp)	# C, %sfp
	ld	s5,64(sp)	# B, %sfp
	ld	t0,168(sp)	# ivtmp.182, %sfp
	sw	a4,12(sp)	# j1, %sfp
	sw	zero,8(sp)	#, %sfp
	sd	t0,24(sp)	# ivtmp.182, %sfp
	mv	t1,ra	# D.4196,
	add	a0,t1,s0	# D.4201, D.4196, ivtmp.198
	sll	a1,ra,3	# D.4201, D.4201,
	sub	a6,a2,t1	# D.4196, ivtmp.191, D.4196
	sll	a7,a0,3	# D.4201, D.4201,
	add	s3,s2,a1	# ivtmp.179, C, D.4201
	sll	s4,a6,3	# D.4196, D.4196,
	add	s6,s5,a7	# ivtmp.130, B, D.4201
	sd	t1,152(sp)	# D.4196, %sfp
	sd	s3,96(sp)	# ivtmp.179, %sfp
	sd	s4,200(sp)	# D.4196, %sfp
	sd	s6,32(sp)	# ivtmp.130, %sfp
.L157:
	lw	t3,8(sp)	#, %sfp
	mv	s3,s1	# iend, n
	addw	t4,t3,32	# i1, i1,
	sw	t4,184(sp)	# i1, %sfp
	ble	s1,t4,.L130	#, n, i1,
	mv	s3,t4	# iend, i1
.L130:
	lw	t5,8(sp)	#, %sfp
	ld	t1,200(sp)	# D.4196, %sfp
	ld	t2,96(sp)	# ivtmp.179, %sfp
	subw	t6,s3,t5	# D.4197, iend, i1
	sraw	a3,t6,31	# tmp292, D.4197,
	srlw	a5,a3,30	# tmp293, tmp292,
	lw	a0,92(sp)	#, %sfp
	addw	a4,t6,a5	# tmp294, D.4197, tmp293
	lw	a1,12(sp)	#, %sfp
	and	ra,a4,3	# tmp295, tmp294,
	add	s0,t1,t2	# ivtmp.172, D.4196, ivtmp.179
	subw	t0,ra,a5	# tmp296, tmp295, tmp293
	sd	s0,16(sp)	# ivtmp.172, %sfp
	sw	a0,88(sp)	# j1, %sfp
	subw	s4,s3,t0	# i1, iend, tmp296
	ld	s2,120(sp)	# ivtmp.174, %sfp
	bge	a0,a1,.L132	#, j1, j1,
.L164:
	lw	a7,8(sp)	#, %sfp
	ble	s4,a7,.L136	#, i1, i1,
	not	a2,a7	# tmp356, i1
	ld	s5,16(sp)	# ivtmp.172, %sfp
	ld	t4,24(sp)	# ivtmp.182, %sfp
	addw	a6,a2,s4	# tmp357, tmp356, i1
	srlw	t3,a6,2	# tmp355, tmp357,
	mv	a4,s5	#, ivtmp.172
	and	t5,t3,7	# tmp358, tmp355,
	mv	a3,s2	#, ivtmp.174
	mv	a2,t4	#, ivtmp.182
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	addw	s6,a7,4	# i1, i1,
	sd	t5,40(sp)	# tmp358, %sfp
	add	s0,t4,32	# ivtmp.164, ivtmp.182,
	call	do_4x4_block	#
	add	s5,s5,32	# ivtmp.166, ivtmp.172,
	ld	a5,40(sp)	# tmp358, %sfp
	ble	s4,s6,.L136	#, i1, i1,
	beqz	a5,.L133	#, tmp358,
	li	a4,1	# tmp364,
	beq	a5,a4,.L287	#, tmp358, tmp364,
	li	ra,2	# tmp363,
	beq	a5,ra,.L288	#, tmp358, tmp363,
	li	t0,3	# tmp362,
	beq	a5,t0,.L289	#, tmp358, tmp362,
	li	t1,4	# tmp361,
	beq	a5,t1,.L290	#, tmp358, tmp361,
	li	t2,5	# tmp360,
	beq	a5,t2,.L291	#, tmp358, tmp360,
	li	a0,6	# tmp359,
	beq	a5,a0,.L292	#, tmp358, tmp359,
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a1,s8	#, D.4197
	mv	a3,s2	#, ivtmp.174
	mv	a0,s1	#, n
	call	do_4x4_block	#
	ld	a1,16(sp)	# ivtmp.172, %sfp
	lw	s6,8(sp)	#, %sfp
	ld	s0,24(sp)	# ivtmp.182, %sfp
	add	s5,a1,64	# ivtmp.166, ivtmp.172,
	addw	s6,s6,8	# i1, i1,
	add	s0,s0,64	# ivtmp.164, ivtmp.182,
.L292:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	addw	s6,s6,4	# i1, i1,
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
.L291:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	addw	s6,s6,4	# i1, i1,
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
.L290:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	addw	s6,s6,4	# i1, i1,
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
.L289:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	addw	s6,s6,4	# i1, i1,
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
.L288:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	addw	s6,s6,4	# i1, i1,
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
.L287:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	addw	s6,s6,4	# i1, i1,
	call	do_4x4_block	#
	add	s0,s0,32	# ivtmp.164, ivtmp.164,
	add	s5,s5,32	# ivtmp.166, ivtmp.166,
	ble	s4,s6,.L136	#, i1, i1,
.L133:
	mv	a4,s5	#, ivtmp.166
	mv	a2,s0	#, ivtmp.164
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,32	#, ivtmp.166,
	add	a2,s0,32	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,64	#, ivtmp.166,
	add	a2,s0,64	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,96	#, ivtmp.166,
	add	a2,s0,96	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,128	#, ivtmp.166,
	add	a2,s0,128	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,160	#, ivtmp.166,
	add	a2,s0,160	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,192	#, ivtmp.166,
	add	a2,s0,192	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	call	do_4x4_block	#
	add	a4,s5,224	#, ivtmp.166,
	add	a2,s0,224	#, ivtmp.164,
	mv	a3,s2	#, ivtmp.174
	mv	a1,s8	#, D.4197
	mv	a0,s1	#, n
	addw	s6,s6,32	# i1, i1,
	call	do_4x4_block	#
	add	s0,s0,256	# ivtmp.164, ivtmp.164,
	add	s5,s5,256	# ivtmp.166, ivtmp.166,
	bgt	s4,s6,.L133	#, i1, i1,
.L136:
	lw	a7,88(sp)	#, %sfp
	ld	a6,16(sp)	# ivtmp.172, %sfp
	ld	t3,72(sp)	# D.4199, %sfp
	lw	t5,12(sp)	#, %sfp
	addw	a2,a7,4	# j1, j1,
	add	t4,a6,t3	# ivtmp.172, ivtmp.172, D.4199
	sw	a2,88(sp)	# j1, %sfp
	sd	t4,16(sp)	# ivtmp.172, %sfp
	add	s2,s2,t3	# ivtmp.174, ivtmp.174, D.4199
	blt	a2,t5,.L164	#, j1, j1,
	ld	t6,80(sp)	# ivtmp.197, %sfp
	ld	a4,136(sp)	# A, %sfp
	lw	s6,132(sp)	#, %sfp
	add	a3,t6,s4	# D.4201, ivtmp.197, D.4201
	lw	s0,92(sp)	#, %sfp
	sll	a5,a3,3	# D.4201, D.4201,
	mv	ra,s4	# D.4201,
	add	t1,a4,a5	# ivtmp.152, A, D.4201
.L141:
	ble	s3,s4,.L139	#, iend, i1,
	ld	a0,48(sp)	# ivtmp.198, %sfp
	ld	a2,56(sp)	# C, %sfp
	ld	t3,64(sp)	# B, %sfp
	add	t2,s6,ra	# D.4201, D.4201, D.4201
	add	a1,s6,a0	# D.4201, D.4201, ivtmp.198
	sll	s5,t2,3	# D.4201, D.4201,
	sll	a7,a1,3	# D.4201, D.4201,
	add	a6,a2,s5	# ivtmp.150, C, D.4201
	add	t4,t3,a7	# ivtmp.144, B, D.4201
	mv	s2,t1	# ivtmp.152, ivtmp.152
	mv	t5,s4	# i1, i1
.L138:
	ble	s9,s11,.L140	#, kend, ivtmp.195,
	fld	fa5,0(a6)	# pretmp__lsm.92, MEM[base: _163, offset: 0B]
	fld	fa4,0(s2)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	fa3,0(t4)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	t6,s8,-1	# tmp344, D.4197,
	li	a7,1	# ivtmp.138,
	and	a5,t6,7	# tmp346, tmp344,
	fmadd.d	ft9,fa4,fa3,fa5	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a4,s2,s10	# ivtmp.142, ivtmp.152, D.4201
	add	a3,t4,8	# ivtmp.144, ivtmp.144,
	beq	s8,a7,.L300	#, D.4197, ivtmp.138,
	beqz	a5,.L137	#, tmp346,
	beq	a5,a7,.L281	#, tmp346, ivtmp.138,
	li	t0,2	# tmp351,
	beq	a5,t0,.L282	#, tmp346, tmp351,
	li	t2,3	# tmp350,
	beq	a5,t2,.L283	#, tmp346, tmp350,
	li	a0,4	# tmp349,
	beq	a5,a0,.L284	#, tmp346, tmp349,
	li	a1,5	# tmp348,
	beq	a5,a1,.L285	#, tmp346, tmp348,
	li	s5,6	# tmp347,
	beq	a5,s5,.L286	#, tmp346, tmp347,
	fld	ft0,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft1,8(t4)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	mv	a7,t0	# ivtmp.138, tmp351
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,ft0,ft1,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,t4,16	# ivtmp.144, ivtmp.144,
.L286:
	fld	ft2,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft3,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,ft2,ft3,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
.L285:
	fld	ft4,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft5,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,ft4,ft5,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
.L284:
	fld	ft6,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft7,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,ft6,ft7,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
.L283:
	fld	fa0,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	fa1,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,fa0,fa1,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
.L282:
	fld	fa2,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	fa6,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,fa2,fa6,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
.L281:
	fld	fa7,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft8,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	addw	a7,a7,1	# ivtmp.138, ivtmp.138,
	add	a4,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fmadd.d	ft9,fa7,ft8,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	add	a3,a3,8	# ivtmp.144, ivtmp.144,
	beq	s8,a7,.L300	#, D.4197, ivtmp.138,
.L137:
	fld	ft10,0(a4)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	fld	ft11,0(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	add	a2,a4,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft1,8(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fmadd.d	fa5,ft10,ft11,ft9	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fld	fa4,0(a2)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	t3,a2,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft0,16(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fld	fa3,0(t3)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	t6,t3,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft4,24(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fmadd.d	ft2,fa4,ft1,fa5	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fld	ft5,0(t6)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	a5,t6,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft3,32(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fld	ft6,0(a5)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	t0,a5,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft7,40(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fmadd.d	fa0,fa3,ft0,ft2	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fld	fa1,0(t0)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	t2,t0,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	fa6,48(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fld	fa7,0(t2)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	add	a0,t2,s10	# ivtmp.142, ivtmp.142, D.4201
	fld	ft8,56(a3)	# MEM[base: _175, offset: 0B], MEM[base: _175, offset: 0B]
	fmadd.d	fa2,ft5,ft4,fa0	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fld	ft9,0(a0)	# MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
	addw	a7,a7,8	# ivtmp.138, ivtmp.138,
	add	a4,a0,s10	# ivtmp.142, ivtmp.142, D.4201
	add	a3,a3,64	# ivtmp.144, ivtmp.144,
	fmadd.d	ft10,ft6,ft3,fa2	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fmadd.d	ft11,fa1,ft7,ft10	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fmadd.d	ft1,fa7,fa6,ft11	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	fmadd.d	ft9,ft9,ft8,ft1	# pretmp__lsm.92, MEM[base: _176, offset: 0B], MEM[base: _175, offset: 0B], pretmp__lsm.92
	bne	s8,a7,.L137	#, D.4197, ivtmp.138,
.L300:
	fsd	ft9,0(a6)	# pretmp__lsm.92, MEM[base: _163, offset: 0B]
.L140:
	addw	t5,t5,1	# i1, i1,
	add	a6,a6,8	# ivtmp.150, ivtmp.150,
	add	s2,s2,8	# ivtmp.152, ivtmp.152,
	bne	s3,t5,.L138	#, iend, i1,
.L139:
	lw	a6,12(sp)	#, %sfp
	addw	s0,s0,1	# j1, j1,
	addw	s6,s6,s1	# ivtmp.157, ivtmp.157, n
	bne	s0,a6,.L141	#, j1, j1,
.L132:
	ld	ra,160(sp)	# D.4196, %sfp
	ld	t1,24(sp)	# ivtmp.182, %sfp
	lw	s6,8(sp)	#, %sfp
	ld	s0,96(sp)	# ivtmp.135, %sfp
	add	t0,ra,t1	# ivtmp.137, D.4196, ivtmp.182
	ble	s4,s6,.L144	#, i1, i1,
.L163:
	lw	a1,12(sp)	#, %sfp
	ld	s2,32(sp)	# ivtmp.130, %sfp
	mv	t4,s0	# ivtmp.128, ivtmp.135
	mv	t5,a1	# j1, j1
	ble	s7,a1,.L146	#, jend, j1,
.L297:
	ble	s9,s11,.L147	#, kend, ivtmp.195,
	fld	fa5,0(t4)	# pretmp__lsm.90, MEM[base: _230, offset: 0B]
	fld	fa4,0(t0)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft0,0(s2)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	s5,s8,-1	# tmp333, D.4197,
	li	a2,1	# ivtmp.116,
	and	a7,s5,7	# tmp335, tmp333,
	fmadd.d	ft10,fa4,ft0,fa5	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a4,t0,s10	# ivtmp.120, ivtmp.137, D.4201
	add	a3,s2,8	# ivtmp.122, ivtmp.130,
	beq	a2,s8,.L301	#, ivtmp.116, D.4197,
	beqz	a7,.L145	#, tmp335,
	beq	a7,a2,.L275	#, tmp335, ivtmp.116,
	li	t3,2	# tmp340,
	beq	a7,t3,.L276	#, tmp335, tmp340,
	li	t6,3	# tmp339,
	beq	a7,t6,.L277	#, tmp335, tmp339,
	li	a5,4	# tmp338,
	beq	a7,a5,.L278	#, tmp335, tmp338,
	li	t2,5	# tmp337,
	beq	a7,t2,.L279	#, tmp335, tmp337,
	li	a0,6	# tmp336,
	beq	a7,a0,.L280	#, tmp335, tmp336,
	fld	fa3,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft4,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	mv	a2,t3	# ivtmp.116, tmp340
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,fa3,ft4,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,s2,16	# ivtmp.122, ivtmp.130,
.L280:
	fld	ft2,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft5,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,ft2,ft5,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
.L279:
	fld	ft3,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft6,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,ft3,ft6,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
.L278:
	fld	ft7,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	fa0,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,ft7,fa0,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
.L277:
	fld	fa1,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	fa6,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,fa1,fa6,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
.L276:
	fld	fa7,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft8,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,fa7,ft8,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
.L275:
	fld	fa2,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft9,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	addw	a2,a2,1	# ivtmp.116, ivtmp.116,
	add	a4,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fmadd.d	ft10,fa2,ft9,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	add	a3,a3,8	# ivtmp.122, ivtmp.122,
	beq	a2,s8,.L301	#, ivtmp.116, D.4197,
.L145:
	fld	ft11,0(a4)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	fld	ft1,0(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	add	a6,a4,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	ft4,8(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fmadd.d	fa5,ft11,ft1,ft10	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fld	fa4,0(a6)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	ra,a6,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	ft0,16(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fld	fa3,0(ra)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	t1,ra,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	ft5,24(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fmadd.d	ft2,fa4,ft4,fa5	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fld	ft6,0(t1)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	s6,t1,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	ft3,32(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fld	ft7,0(s6)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	a1,s6,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	fa0,40(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fmadd.d	fa6,fa3,ft0,ft2	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fld	fa1,0(a1)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	s5,a1,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	fa7,48(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fld	ft8,0(s5)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	add	a7,s5,s10	# ivtmp.120, ivtmp.120, D.4201
	fld	ft9,56(a3)	# MEM[base: _252, offset: 0B], MEM[base: _252, offset: 0B]
	fmadd.d	fa2,ft6,ft5,fa6	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fld	ft10,0(a7)	# MEM[base: _253, offset: 0B], MEM[base: _253, offset: 0B]
	addw	a2,a2,8	# ivtmp.116, ivtmp.116,
	add	a4,a7,s10	# ivtmp.120, ivtmp.120, D.4201
	add	a3,a3,64	# ivtmp.122, ivtmp.122,
	fmadd.d	ft11,ft7,ft3,fa2	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fmadd.d	ft1,fa1,fa0,ft11	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fmadd.d	ft4,ft8,fa7,ft1	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	fmadd.d	ft10,ft10,ft9,ft4	# pretmp__lsm.90, MEM[base: _253, offset: 0B], MEM[base: _252, offset: 0B], pretmp__lsm.90
	bne	a2,s8,.L145	#, ivtmp.116, D.4197,
.L301:
	fsd	ft10,0(t4)	# pretmp__lsm.90, MEM[base: _230, offset: 0B]
.L147:
	addw	t5,t5,1	# j1, j1,
	add	t4,t4,s10	# ivtmp.128, ivtmp.128, D.4201
	add	s2,s2,s10	# ivtmp.130, ivtmp.130, D.4201
	bne	s7,t5,.L297	#, jend, j1,
.L146:
	lw	s2,8(sp)	#, %sfp
	add	s0,s0,8	# ivtmp.135, ivtmp.135,
	add	t0,t0,8	# ivtmp.137, ivtmp.137,
	addw	t4,s2,1	# i1, i1,
	sw	t4,8(sp)	# i1, %sfp
	bne	s4,t4,.L163	#, i1, i1,
.L144:
	ble	s3,s4,.L151	#, iend, i1,
	ld	t3,152(sp)	# D.4196, %sfp
	ld	a5,80(sp)	# ivtmp.197, %sfp
	ld	a4,56(sp)	# C, %sfp
	ld	a3,136(sp)	# A, %sfp
	add	t6,t3,s4	# D.4201, D.4196, D.4201
	add	t2,a5,s4	# D.4201, ivtmp.197, D.4201
	sll	a0,t6,3	# D.4201, D.4201,
	sll	a2,t2,3	# D.4201, D.4201,
	add	a6,a4,a0	# ivtmp.113, C, D.4201
	add	ra,a3,a2	# ivtmp.115, A, D.4201
.L155:
	lw	a1,12(sp)	#, %sfp
	ld	t1,32(sp)	# ivtmp.108, %sfp
	mv	s6,a6	# ivtmp.106, ivtmp.113
	mv	s5,a1	# j1, j1
	ble	s7,a1,.L153	#, jend, j1,
.L298:
	ble	s9,s11,.L154	#, kend, ivtmp.195,
	fld	fa5,0(s6)	# pretmp__lsm.88, MEM[base: _283, offset: 0B]
	fld	fa4,0(ra)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft0,0(t1)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	a7,s8,-1	# tmp322, D.4197,
	li	t6,1	# ivtmp.94,
	and	s2,a7,7	# tmp324, tmp322,
	fmadd.d	ft11,fa4,ft0,fa5	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	a5,ra,s10	# ivtmp.98, ivtmp.115, D.4201
	add	t2,t1,8	# ivtmp.100, ivtmp.108,
	beq	t6,s8,.L302	#, ivtmp.94, D.4197,
	beqz	s2,.L152	#, tmp324,
	beq	s2,t6,.L269	#, tmp324, ivtmp.94,
	li	t4,2	# tmp329,
	beq	s2,t4,.L270	#, tmp324, tmp329,
	li	s0,3	# tmp328,
	beq	s2,s0,.L271	#, tmp324, tmp328,
	li	t0,4	# tmp327,
	beq	s2,t0,.L272	#, tmp324, tmp327,
	li	t5,5	# tmp326,
	beq	s2,t5,.L273	#, tmp324, tmp326,
	li	t3,6	# tmp325,
	beq	s2,t3,.L274	#, tmp324, tmp325,
	fld	fa3,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft5,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	mv	t6,t4	# ivtmp.94, tmp329
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,fa3,ft5,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t1,16	# ivtmp.100, ivtmp.108,
.L274:
	fld	ft2,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft6,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,ft2,ft6,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
.L273:
	fld	ft3,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft7,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,ft3,ft7,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
.L272:
	fld	fa0,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	fa6,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,fa0,fa6,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
.L271:
	fld	fa1,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	fa7,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,fa1,fa7,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
.L270:
	fld	ft8,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft9,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,ft8,ft9,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
.L269:
	fld	fa2,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft10,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	addw	t6,t6,1	# ivtmp.94, ivtmp.94,
	add	a5,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fmadd.d	ft11,fa2,ft10,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	add	t2,t2,8	# ivtmp.100, ivtmp.100,
	beq	t6,s8,.L302	#, ivtmp.94, D.4197,
.L152:
	fld	ft1,0(a5)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	fld	ft4,0(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	add	a0,a5,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft5,8(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fmadd.d	fa5,ft1,ft4,ft11	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fld	fa4,0(a0)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	a2,a0,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft0,16(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fld	fa3,0(a2)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	a4,a2,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft6,24(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fmadd.d	ft2,fa4,ft5,fa5	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fld	ft7,0(a4)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	a3,a4,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft3,32(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fld	fa0,0(a3)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	a1,a3,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	fa6,40(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fmadd.d	fa7,fa3,ft0,ft2	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fld	fa1,0(a1)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	a7,a1,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft8,48(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fld	ft9,0(a7)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	add	s2,a7,s10	# ivtmp.98, ivtmp.98, D.4201
	fld	ft10,56(t2)	# MEM[base: _293, offset: 0B], MEM[base: _293, offset: 0B]
	fmadd.d	fa2,ft7,ft6,fa7	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fld	ft11,0(s2)	# MEM[base: _318, offset: 0B], MEM[base: _318, offset: 0B]
	addw	t6,t6,8	# ivtmp.94, ivtmp.94,
	add	a5,s2,s10	# ivtmp.98, ivtmp.98, D.4201
	add	t2,t2,64	# ivtmp.100, ivtmp.100,
	fmadd.d	ft1,fa0,ft3,fa2	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fmadd.d	ft4,fa1,fa6,ft1	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fmadd.d	ft5,ft9,ft8,ft4	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	fmadd.d	ft11,ft11,ft10,ft5	# pretmp__lsm.88, MEM[base: _318, offset: 0B], MEM[base: _293, offset: 0B], pretmp__lsm.88
	bne	t6,s8,.L152	#, ivtmp.94, D.4197,
.L302:
	fsd	ft11,0(s6)	# pretmp__lsm.88, MEM[base: _283, offset: 0B]
.L154:
	addw	s5,s5,1	# j1, j1,
	add	s6,s6,s10	# ivtmp.106, ivtmp.106, D.4201
	add	t1,t1,s10	# ivtmp.108, ivtmp.108, D.4201
	bne	s7,s5,.L298	#, jend, j1,
.L153:
	addw	s4,s4,1	# i1, i1,
	add	a6,a6,8	# ivtmp.113, ivtmp.113,
	add	ra,ra,8	# ivtmp.115, ivtmp.115,
	bne	s3,s4,.L155	#, iend, i1,
.L151:
	ld	s3,96(sp)	# ivtmp.179, %sfp
	ld	a6,24(sp)	# ivtmp.182, %sfp
	lw	t1,184(sp)	#, %sfp
	add	s4,s3,256	# ivtmp.179, ivtmp.179,
	add	ra,a6,256	# ivtmp.182, ivtmp.182,
	sd	s4,96(sp)	# ivtmp.179, %sfp
	sd	ra,24(sp)	# ivtmp.182, %sfp
	sw	t1,8(sp)	# i1, %sfp
	bgt	s1,t1,.L157	#, n, i1,
	lw	s6,132(sp)	#, %sfp
	ld	s0,120(sp)	# ivtmp.189, %sfp
	ld	t3,112(sp)	# ivtmp.191, %sfp
	lw	s5,176(sp)	#, %sfp
	ld	t0,192(sp)	# D.4199, %sfp
	ld	t6,144(sp)	# D.4201, %sfp
	lw	t2,180(sp)	#, %sfp
	addw	t4,s6,s5	# ivtmp.188, ivtmp.188, D.4200
	add	t5,s0,t0	# ivtmp.189, ivtmp.189, D.4199
	add	a5,t3,t6	# ivtmp.191, ivtmp.191, D.4201
	sw	t4,132(sp)	# ivtmp.188, %sfp
	sd	t5,120(sp)	# ivtmp.189, %sfp
	sd	a5,112(sp)	# ivtmp.191, %sfp
	sw	t2,92(sp)	# j1, %sfp
	bgt	s1,t2,.L158	#, n, j1,
	lw	s7,128(sp)	#, %sfp
	ld	a0,80(sp)	# ivtmp.197, %sfp
	ld	a3,48(sp)	# ivtmp.198, %sfp
	ld	a7,104(sp)	# ivtmp.199, %sfp
	lw	s8,176(sp)	#, %sfp
	ld	a2,144(sp)	# D.4201, %sfp
	lw	s11,188(sp)	#, %sfp
	addw	s9,s7,s8	# ivtmp.196, ivtmp.196, D.4200
	add	a4,a0,a2	# ivtmp.197, ivtmp.197, D.4201
	add	a1,a3,32	# ivtmp.198, ivtmp.198,
	add	s2,a7,256	# ivtmp.199, ivtmp.199,
	sw	s9,128(sp)	# ivtmp.196, %sfp
	sd	a4,80(sp)	# ivtmp.197, %sfp
	sd	a1,48(sp)	# ivtmp.198, %sfp
	sd	s2,104(sp)	# ivtmp.199, %sfp
	bgt	s1,s11,.L159	#, n, ivtmp.195,
	ld	ra,312(sp)	#,
	ld	s0,304(sp)	#,
	ld	s1,296(sp)	#,
	ld	s2,288(sp)	#,
	ld	s3,280(sp)	#,
	ld	s4,272(sp)	#,
	ld	s5,264(sp)	#,
	ld	s6,256(sp)	#,
	ld	s7,248(sp)	#,
	ld	s8,240(sp)	#,
	ld	s9,232(sp)	#,
	ld	s10,224(sp)	#,
	ld	s11,216(sp)	#,
	add	sp,sp,320	#,,
.L305:
	jr	ra	#
	.size	avx_dgemm_slow, .-avx_dgemm_slow
	.align	2
	.globl	test
	.type	test, @function
test:
	blez	a0,.L306	#, n,
	fld	fa5,0(a1)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa4,0(a2)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	addw	a6,a0,-1	# D.4217, n,
	sll	t0,a6,32	# D.4218, D.4217,
	fadd.d	ft0,fa5,fa4	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	srl	t1,t0,32	# D.4218, D.4218,
	add	t2,t1,1	# D.4218, D.4218,
	sll	a0,t2,3	# D.4218, D.4218,
	add	a7,a0,-8	# tmp102, D.4218,
	srl	a4,a7,3	# tmp100, tmp102,
	add	t3,a1,a0	# D.4220, A, D.4218
	add	a5,a1,8	# ivtmp.206, A,
	fsd	ft0,0(a3)	# D.4216, MEM[base: _31, offset: 0B]
	and	t4,a4,7	# tmp103, tmp100,
	add	a0,a2,8	# ivtmp.208, B,
	add	a7,a3,8	# ivtmp.209, C,
	beq	a5,t3,.L341	#, ivtmp.206, D.4220,
	beqz	t4,.L308	#, tmp103,
	li	t5,1	# tmp109,
	beq	t4,t5,.L334	#, tmp103, tmp109,
	li	t6,2	# tmp108,
	beq	t4,t6,.L335	#, tmp103, tmp108,
	li	a6,3	# tmp107,
	beq	t4,a6,.L336	#, tmp103, tmp107,
	li	t0,4	# tmp106,
	beq	t4,t0,.L337	#, tmp103, tmp106,
	li	t1,5	# tmp105,
	beq	t4,t1,.L338	#, tmp103, tmp105,
	li	t2,6	# tmp104,
	beq	t4,t2,.L339	#, tmp103, tmp104,
	fld	ft1,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft2,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a1,16	# ivtmp.206, A,
	add	a0,a2,16	# ivtmp.208, B,
	fadd.d	ft3,ft1,ft2	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft3,0(a7)	# D.4216, MEM[base: _31, offset: 0B]
	add	a7,a3,16	# ivtmp.209, C,
.L339:
	fld	ft4,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft5,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fadd.d	ft6,ft4,ft5	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	fsd	ft6,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
.L338:
	fld	ft7,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa0,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fadd.d	fa1,ft7,fa0	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	fsd	fa1,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
.L337:
	fld	fa2,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa3,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fadd.d	fa6,fa2,fa3	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	fsd	fa6,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
.L336:
	fld	fa7,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft8,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fadd.d	ft9,fa7,ft8	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	fsd	ft9,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
.L335:
	fld	ft10,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft11,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fadd.d	fa5,ft10,ft11	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	fsd	fa5,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
.L334:
	fld	ft0,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa4,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,8	# ivtmp.209, ivtmp.209,
	add	a5,a5,8	# ivtmp.206, ivtmp.206,
	fadd.d	ft1,ft0,fa4	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a0,a0,8	# ivtmp.208, ivtmp.208,
	fsd	ft1,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
	beq	a5,t3,.L342	#, ivtmp.206, D.4220,
.L308:
	fld	ft2,0(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft3,0(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	add	a7,a7,64	# ivtmp.209, ivtmp.209,
	add	a5,a5,64	# ivtmp.206, ivtmp.206,
	fadd.d	ft4,ft2,ft3	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	add	a0,a0,64	# ivtmp.208, ivtmp.208,
	fsd	ft4,-64(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	ft5,-56(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft6,-56(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	ft7,ft5,ft6	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft7,-56(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	fa0,-48(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa1,-48(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	fa2,fa0,fa1	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	fa2,-48(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	fa3,-40(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa6,-40(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	fa7,fa3,fa6	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	fa7,-40(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	ft8,-32(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft9,-32(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	ft10,ft8,ft9	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft10,-32(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	ft11,-24(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa5,-24(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	ft0,ft11,fa5	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft0,-24(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	ft1,-16(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	fa4,-16(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	ft2,ft1,fa4	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft2,-16(a7)	# D.4216, MEM[base: _31, offset: 0B]
	fld	ft3,-8(a5)	# MEM[base: _2, offset: 0B], MEM[base: _2, offset: 0B]
	fld	ft4,-8(a0)	# MEM[base: _1, offset: 0B], MEM[base: _1, offset: 0B]
	fadd.d	ft5,ft3,ft4	# D.4216, MEM[base: _2, offset: 0B], MEM[base: _1, offset: 0B]
	fsd	ft5,-8(a7)	# D.4216, MEM[base: _31, offset: 0B]
	bne	a5,t3,.L308	#, ivtmp.206, D.4220,
.L306:
	ret
.L342:
	ret
.L341:
	ret
	.size	test, .-test
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	add	sp,sp,-128	#,,
	sd	s3,88(sp)	#,
	mv	s3,a1	# f, f
	mv	a1,a0	#, desc
	lui	a0,%hi(.LC3)	# tmp189,
	sd	s0,112(sp)	#,
	sd	s1,104(sp)	#,
	sd	s10,32(sp)	#,
	sd	ra,120(sp)	#,
	sd	s2,96(sp)	#,
	sd	s4,80(sp)	#,
	sd	s5,72(sp)	#,
	sd	s6,64(sp)	#,
	sd	s7,56(sp)	#,
	sd	s8,48(sp)	#,
	sd	s9,40(sp)	#,
	sd	s11,24(sp)	#,
	fsd	fs0,8(sp)	#,
	fsd	fs1,0(sp)	#,
	add	s0,sp,128	#,,
	mv	s1,a3	# nsizes, nsizes
	add	a0,a0,%lo(.LC3)	#, tmp189,
	mv	s10,a2	# test_sizes, test_sizes
	call	printf	#
	bgtz	s1,.L498	#, nsizes,
.L343:
	add	sp,s0,-128	#,,
	ld	ra,120(sp)	#,
	ld	s0,112(sp)	#,
	ld	s1,104(sp)	#,
	ld	s2,96(sp)	#,
	ld	s3,88(sp)	#,
	ld	s4,80(sp)	#,
	ld	s5,72(sp)	#,
	ld	s6,64(sp)	#,
	ld	s7,56(sp)	#,
	ld	s8,48(sp)	#,
	ld	s9,40(sp)	#,
	ld	s10,32(sp)	#,
	ld	s11,24(sp)	#,
	fld	fs0,8(sp)	#,
	fld	fs1,0(sp)	#,
	add	sp,sp,128	#,,
	jr	ra	#
.L498:
	lui	a5,%hi(.LC5)	# tmp259,
	addw	s2,s1,-1	# D.4309, nsizes,
	fld	fs0,%lo(.LC5)(a5)	# tmp260,
	sll	ra,s2,32	# D.4306, D.4309,
	srl	t0,ra,32	# D.4306, D.4306,
	add	t1,t0,1	# D.4306, D.4306,
	fmv.d	fs1,fs0	# tmp261, tmp260
	sll	t2,t1,2	# D.4306, D.4306,
	add	s2,s10,t2	# D.4311, ivtmp.262, D.4306
	lui	s4,%hi(.LC4)	# tmp252,
.L364:
	lw	s6,0(s10)	#, MEM[base: _192, offset: 0B]
	mv	s5,sp	# D.4303,
	mulw	s8,s6,s6	# D.4304, n, n
	mv	a0,s6	#, n
	mv	a1,s8	# D.4305,
	sll	s1,a1,3	# D.4306, D.4305,
	add	a2,s1,22	# tmp197, D.4306,
	and	a3,a2,-16	# tmp199, tmp197,
	sub	sp,sp,a3	#,, tmp199
	mv	s11,sp	# A.1,
	sub	sp,sp,a3	#,, tmp199
	mv	s9,sp	# B.2,
	sub	sp,sp,a3	#,, tmp199
	mv	a3,sp	#, C.3
	mv	a2,s9	#, B.2
	mv	a1,s11	#, A.1
	jalr	s3	# f
	mv	a1,s6	#, n
	mv	a2,zero	#,
	add	a0,s4,%lo(.LC4)	#, tmp252,
	call	printf	#
	mv	a2,s1	#, D.4306
	li	a1,0	#,
	mv	a0,sp	#, C.3
	call	memset	#
	mv	a0,s1	#, D.4306
	li	a1,1	#,
	call	calloc	#
	mv	s7,sp	# C.3,
	mv	s1,a0	# Co,
	blez	s6,.L351	#, n,
	mv	t1,s11	# ivtmp.256, A.1
	mv	t4,a0	# ivtmp.258, Co
	sll	a1,s6,3	# D.4308, D.4308,
	li	t3,0	# i,
.L350:
	mv	a0,s9	# ivtmp.252, B.2
	mv	a6,t4	# ivtmp.250, ivtmp.258
	li	a7,0	# j,
.L349:
	fld	fa5,0(a6)	# t, MEM[base: _178, offset: 0B]
	fld	fa4,0(t1)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	fa3,0(a0)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	t5,s6,-1	# tmp293, n,
	li	a2,1	# k,
	and	ra,t5,7	# tmp295, tmp293,
	fmadd.d	ft9,fa4,fa3,fa5	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a5,t1,a1	# ivtmp.243, ivtmp.256, D.4308
	add	a3,a0,8	# ivtmp.245, ivtmp.252,
	beq	s6,a2,.L487	#, n, k,
	beqz	ra,.L348	#, tmp295,
	beq	ra,a2,.L477	#, tmp295, k,
	li	t0,2	# tmp300,
	beq	ra,t0,.L478	#, tmp295, tmp300,
	li	t6,3	# tmp299,
	beq	ra,t6,.L479	#, tmp295, tmp299,
	li	t2,4	# tmp298,
	beq	ra,t2,.L480	#, tmp295, tmp298,
	li	a4,5	# tmp297,
	beq	ra,a4,.L481	#, tmp295, tmp297,
	li	t5,6	# tmp296,
	beq	ra,t5,.L482	#, tmp295, tmp296,
	fld	ft0,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft1,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	mv	a2,t0	# k, tmp300
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,ft0,ft1,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a0,16	# ivtmp.245, ivtmp.252,
.L482:
	fld	ft2,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft3,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,ft2,ft3,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
.L481:
	fld	ft4,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft5,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,ft4,ft5,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
.L480:
	fld	ft6,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft7,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,ft6,ft7,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
.L479:
	fld	fa0,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	fa1,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,fa0,fa1,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
.L478:
	fld	fa2,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	fa6,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,fa2,fa6,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
.L477:
	fld	fa7,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft8,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	addw	a2,a2,1	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fmadd.d	ft9,fa7,ft8,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	add	a3,a3,8	# ivtmp.245, ivtmp.245,
	beq	s6,a2,.L487	#, n, k,
.L348:
	fld	ft10,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	fld	ft11,0(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	add	ra,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft1,8(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fmadd.d	fa5,ft10,ft11,ft9	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fld	fa4,0(ra)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	t0,ra,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft0,16(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fld	fa3,0(t0)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	t6,t0,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft4,24(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fmadd.d	ft2,fa4,ft1,fa5	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fld	ft5,0(t6)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	t2,t6,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft3,32(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fld	ft6,0(t2)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	a4,t2,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft7,40(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fmadd.d	fa0,fa3,ft0,ft2	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fld	fa1,0(a4)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	t5,a4,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	fa6,48(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fld	fa7,0(t5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	add	a5,t5,a1	# ivtmp.243, ivtmp.243, D.4308
	fld	ft8,56(a3)	# MEM[base: _183, offset: 0B], MEM[base: _183, offset: 0B]
	fmadd.d	fa2,ft5,ft4,fa0	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fld	ft9,0(a5)	# MEM[base: _184, offset: 0B], MEM[base: _184, offset: 0B]
	addw	a2,a2,8	# k, k,
	add	a5,a5,a1	# ivtmp.243, ivtmp.243, D.4308
	add	a3,a3,64	# ivtmp.245, ivtmp.245,
	fmadd.d	ft10,ft6,ft3,fa2	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fmadd.d	ft11,fa1,ft7,ft10	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fmadd.d	ft1,fa7,fa6,ft11	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	fmadd.d	ft9,ft9,ft8,ft1	# t, MEM[base: _184, offset: 0B], MEM[base: _183, offset: 0B], t
	bne	s6,a2,.L348	#, n, k,
.L487:
	fsd	ft9,0(a6)	# t, MEM[base: _178, offset: 0B]
	addw	a7,a7,1	# j, j,
	add	a6,a6,a1	# ivtmp.250, ivtmp.250, D.4308
	add	a0,a0,a1	# ivtmp.252, ivtmp.252, D.4308
	bne	s6,a7,.L349	#, n, j,
	addw	t3,t3,1	# i, i,
	add	t1,t1,8	# ivtmp.256, ivtmp.256,
	add	t4,t4,8	# ivtmp.258, ivtmp.258,
	bne	s6,t3,.L350	#, n, i,
.L351:
	mv	a3,s7	#, C.3
	mv	a2,s9	#, B.2
	mv	a1,s11	#, A.1
	mv	a0,s6	#, n
	jalr	s3	# f
	beqz	s8,.L347	#, D.4304,
	fld	fa5,0(s7)	# *C.3_25, *C.3_25
	fld	fa4,0(s1)	# *Co_32, *Co_32
	fsub.d	ft0,fa5,fa4	# D.4307, *C.3_25, *Co_32
	fabs.d	fa3,ft0	# D.4307, D.4307
	fgt.d	a2,fa3,fs0	#, tmp234, D.4307, tmp260
	bnez	a2,.L356	#, tmp234,
	addw	a3,s8,-1	# D.4309, D.4304,
	sll	a1,a3,32	# D.4306, D.4309,
	srl	s8,a1,32	# D.4306, D.4306,
	add	s9,s8,1	# D.4306, D.4306,
	sll	s11,s9,3	# D.4306, D.4306,
	add	a5,s7,8	# ivtmp.235, C.3,
	add	ra,s7,s11	# D.4311, C.3, D.4306
	sub	t0,ra,a5	# tmp283, D.4311, ivtmp.235
	srl	t6,t0,3	# tmp282, tmp283,
	and	t2,t6,7	# tmp284, tmp282,
	add	a4,s1,8	# ivtmp.238, Co,
	beqz	t2,.L357	#, tmp284,
	fld	ft4,8(s7)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft2,8(s1)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,s7,16	# ivtmp.235, C.3,
	add	a4,s1,16	# ivtmp.238, Co,
	fsub.d	ft5,ft4,ft2	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft3,ft5	# D.4307, D.4307
	fgt.d	t5,ft3,fs1	#, tmp421, D.4307, tmp261
	bnez	t5,.L356	#, tmp421,
	li	a7,1	# tmp290,
	beq	t2,a7,.L357	#, tmp284, tmp290,
	li	a6,2	# tmp289,
	beq	t2,a6,.L430	#, tmp284, tmp289,
	li	a0,3	# tmp288,
	beq	t2,a0,.L428	#, tmp284, tmp288,
	li	t3,4	# tmp287,
	beq	t2,t3,.L426	#, tmp284, tmp287,
	li	t1,5	# tmp286,
	beq	t2,t1,.L424	#, tmp284, tmp286,
	li	t4,6	# tmp285,
	beq	t2,t4,.L422	#, tmp284, tmp285,
	fld	ft6,16(s7)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft7,16(s1)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	fa0,ft6,ft7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa1,fa0	# D.4307, D.4307
	fgt.d	a2,fa1,fs1	#, tmp427, D.4307, tmp261
	bnez	a2,.L356	#, tmp427,
.L422:
	fld	fa6,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa7,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	ft8,fa6,fa7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa2,ft8	# D.4307, D.4307
	fgt.d	a3,fa2,fs1	#, tmp433, D.4307, tmp261
	bnez	a3,.L356	#, tmp433,
.L424:
	fld	ft9,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft10,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	ft11,ft9,ft10	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft1,ft11	# D.4307, D.4307
	fgt.d	a1,ft1,fs1	#, tmp439, D.4307, tmp261
	bnez	a1,.L356	#, tmp439,
.L426:
	fld	fa5,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa4,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	ft0,fa5,fa4	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa3,ft0	# D.4307, D.4307
	fgt.d	s8,fa3,fs1	#, tmp445, D.4307, tmp261
	bnez	s8,.L356	#, tmp445,
.L428:
	fld	ft4,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft2,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	ft5,ft4,ft2	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft3,ft5	# D.4307, D.4307
	fgt.d	s9,ft3,fs1	#, tmp451, D.4307, tmp261
	bnez	s9,.L356	#, tmp451,
.L430:
	fld	ft6,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft7,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,8	# ivtmp.235, ivtmp.235,
	add	a4,a4,8	# ivtmp.238, ivtmp.238,
	fsub.d	fa0,ft6,ft7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa1,fa0	# D.4307, D.4307
	fgt.d	s11,fa1,fs1	#, tmp457, D.4307, tmp261
	bnez	s11,.L356	#, tmp457,
.L357:
	beq	ra,a5,.L347	#, D.4311, ivtmp.235,
	fld	fa6,0(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa7,0(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft8,fa6,fa7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa2,ft8	# D.4307, D.4307
	fgt.d	t0,fa2,fs1	#, tmp241, D.4307, tmp261
	bnez	t0,.L356	#, tmp241,
	fld	ft9,8(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft10,8(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft11,ft9,ft10	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft1,ft11	# D.4307, D.4307
	fgt.d	t6,ft1,fs1	#, tmp465, D.4307, tmp261
	bnez	t6,.L356	#, tmp465,
	fld	fa5,16(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa4,16(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft0,fa5,fa4	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa3,ft0	# D.4307, D.4307
	fgt.d	t2,fa3,fs1	#, tmp473, D.4307, tmp261
	bnez	t2,.L356	#, tmp473,
	fld	ft4,24(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft2,24(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft5,ft4,ft2	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft3,ft5	# D.4307, D.4307
	fgt.d	t5,ft3,fs1	#, tmp481, D.4307, tmp261
	bnez	t5,.L356	#, tmp481,
	fld	ft6,32(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft7,32(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	fa0,ft6,ft7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa1,fa0	# D.4307, D.4307
	fgt.d	a7,fa1,fs1	#, tmp489, D.4307, tmp261
	bnez	a7,.L356	#, tmp489,
	fld	fa6,40(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa7,40(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft8,fa6,fa7	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa2,ft8	# D.4307, D.4307
	fgt.d	a6,fa2,fs1	#, tmp497, D.4307, tmp261
	bnez	a6,.L356	#, tmp497,
	fld	ft9,48(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	ft10,48(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	fsub.d	ft11,ft9,ft10	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	ft1,ft11	# D.4307, D.4307
	fgt.d	a0,ft1,fs1	#, tmp505, D.4307, tmp261
	bnez	a0,.L356	#, tmp505,
	fld	fa5,56(a5)	# MEM[base: _195, offset: 0B], MEM[base: _195, offset: 0B]
	fld	fa4,56(a4)	# MEM[base: _194, offset: 0B], MEM[base: _194, offset: 0B]
	add	a5,a5,64	# ivtmp.235, ivtmp.235,
	add	a4,a4,64	# ivtmp.238, ivtmp.238,
	fsub.d	ft0,fa5,fa4	# D.4307, MEM[base: _195, offset: 0B], MEM[base: _194, offset: 0B]
	fabs.d	fa3,ft0	# D.4307, D.4307
	fgt.d	t3,fa3,fs1	#, tmp511, D.4307, tmp261
	beqz	t3,.L357	#, tmp511,
.L356:
	lui	s2,%hi(.LC6)	# tmp235,
	add	a0,s2,%lo(.LC6)	#, tmp235,
	call	perror	#
	blez	s6,.L499	#, n,
	sll	s10,s6,3	# D.4308, D.4308,
	li	s5,0	# i,
	lui	s4,%hi(.LC2)	# tmp251,
.L359:
	ld	a1,0(s7)	#, MEM[base: _209, offset: 0B]
	addw	ra,s6,-1	# tmp272, n,
	li	s8,1	# j,
	add	a0,s4,%lo(.LC2)	#, tmp251,
	and	s9,ra,7	# tmp274, tmp272,
	add	s11,s7,s10	# ivtmp.225, ivtmp.230, D.4308
	call	printf	#
	beq	s6,s8,.L491	#, n, j,
	beqz	s9,.L358	#, tmp274,
	beq	s9,s8,.L471	#, tmp274, j,
	li	t1,2	# tmp279,
	beq	s9,t1,.L472	#, tmp274, tmp279,
	li	t4,3	# tmp278,
	beq	s9,t4,.L473	#, tmp274, tmp278,
	li	a2,4	# tmp277,
	beq	s9,a2,.L474	#, tmp274, tmp277,
	li	a3,5	# tmp276,
	beq	s9,a3,.L475	#, tmp274, tmp276,
	li	a1,6	# tmp275,
	beq	s9,a1,.L476	#, tmp274, tmp275,
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	mv	s8,t1	# j, tmp279
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
.L476:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
.L475:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
.L474:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
.L473:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
.L472:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
.L471:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,1	# j, j,
	call	printf	#
	add	s11,s11,s10	# ivtmp.225, ivtmp.225, D.4308
	beq	s6,s8,.L491	#, n, j,
.L358:
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s2,s11,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s2)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s3,s2,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s3)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s9,s3,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s11,s9,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s11)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s2,s11,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s2)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s3,s2,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s3)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s9,s3,s10	# ivtmp.225, ivtmp.225, D.4308
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _209, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s8,s8,8	# j, j,
	call	printf	#
	add	s11,s9,s10	# ivtmp.225, ivtmp.225, D.4308
	bne	s6,s8,.L358	#, n, j,
.L491:
	li	a0,10	#,
	addw	s5,s5,1	# i, i,
	call	putchar	#
	add	s7,s7,8	# ivtmp.230, ivtmp.230,
	bne	s6,s5,.L359	#, n, i,
	li	a0,10	#,
	call	putchar	#
	li	s11,0	# i,
.L362:
	ld	a1,0(s1)	#, MEM[base: _219, offset: 0B]
	addw	t0,s6,-1	# tmp262, n,
	li	s3,1	# j,
	add	a0,s4,%lo(.LC2)	#, tmp251,
	and	s8,t0,7	# tmp264, tmp262,
	add	s2,s1,s10	# ivtmp.215, ivtmp.220, D.4308
	call	printf	#
	beq	s6,s3,.L493	#, n, j,
	beqz	s8,.L361	#, tmp264,
	beq	s8,s3,.L465	#, tmp264, j,
	li	t6,2	# tmp269,
	beq	s8,t6,.L466	#, tmp264, tmp269,
	li	t2,3	# tmp268,
	beq	s8,t2,.L467	#, tmp264, tmp268,
	li	t5,4	# tmp267,
	beq	s8,t5,.L468	#, tmp264, tmp267,
	li	a7,5	# tmp266,
	beq	s8,a7,.L469	#, tmp264, tmp266,
	li	a6,6	# tmp265,
	beq	s8,a6,.L470	#, tmp264, tmp265,
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	mv	s3,t6	# j, tmp269
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
.L470:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
.L469:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
.L468:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
.L467:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
.L466:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
.L465:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,1	# j, j,
	call	printf	#
	add	s2,s2,s10	# ivtmp.215, ivtmp.215, D.4308
	beq	s6,s3,.L493	#, n, j,
.L361:
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s9,s2,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s5,s9,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s5)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s7,s5,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s7)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s8,s7,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s8)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s2,s8,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s2)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s9,s2,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s9)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	add	s5,s9,s10	# ivtmp.215, ivtmp.215, D.4308
	call	printf	#
	ld	a1,0(s5)	#, MEM[base: _219, offset: 0B]
	add	a0,s4,%lo(.LC2)	#, tmp251,
	addw	s3,s3,8	# j, j,
	call	printf	#
	add	s2,s5,s10	# ivtmp.215, ivtmp.215, D.4308
	bne	s6,s3,.L361	#, n, j,
.L493:
	li	a0,10	#,
	addw	s11,s11,1	# i, i,
	call	putchar	#
	add	s1,s1,8	# ivtmp.220, ivtmp.220,
	bne	s6,s11,.L362	#, n, i,
	j	.L366	#
.L347:
	add	s10,s10,4	# ivtmp.262, ivtmp.262,
	mv	sp,s5	#, D.4303
	beq	s10,s2,.L343	#, ivtmp.262, D.4311,
	j	.L364	#
.L499:
	li	a0,10	#,
	call	putchar	#
.L366:
	li	a0,10	#,
	call	putchar	#
	li	a0,1	#,
	call	exit	#
	.size	benchmark, .-benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	add	sp,sp,-96	#,,
	lui	a1,%hi(.LANCHOR0)	# tmp76,
	li	a2,68	#,
	add	a1,a1,%lo(.LANCHOR0)	#, tmp76,
	add	a0,sp,8	# tmp85,,
	sd	ra,88(sp)	#,
	call	memcpy	#
	lui	t0,%hi(avx_dgemm_slow)	# tmp82,
	lui	a0,%hi(.LC7)	# tmp83,
	add	a0,a0,%lo(.LC7)	#, tmp83,
	add	a2,sp,8	# tmp86,,
	li	a3,17	#,
	add	a1,t0,%lo(avx_dgemm_slow)	#, tmp82,
	call	benchmark	#
	ld	ra,88(sp)	#,
	li	a0,0	#,
	add	sp,sp,96	#,,
	jr	ra	#
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	4
	.word	6
	.word	7
	.word	8
	.word	16
	.word	32
	.word	64
	.word	65
	.word	66
	.word	67
	.word	128
	.word	153
	.word	185
	.word	251
	.word	285
	.word	301
	.word	339
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.4byte	0
	.4byte	1072693248
.LC5:
	.4byte	1202590843
	.4byte	1065646817
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"%.3f\t "
	.zero	1
.LC3:
	.string	"%s\nSize:\tGflops\n"
	.zero	7
.LC4:
	.string	"%d\t%.3g\n"
	.zero	7
.LC6:
	.string	"error in matrix multiply"
	.zero	7
.LC7:
	.string	"avx_slow"
	.ident	"GCC: (GNU) 5.3.0"
