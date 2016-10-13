	.file	"test.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.section	.text.startup,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	subq	$4856, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	vmovapd	-4880(%rbp,%rax), %ymm0
	vmulpd	-3280(%rbp,%rax), %ymm0, %ymm0
	vaddpd	-1680(%rbp,%rax), %ymm0, %ymm0
	vmovapd	%ymm0, -1680(%rbp,%rax)
	addq	$32, %rax
	cmpq	$1600, %rax
	jne	.L2
	leaq	-1680(%rbp), %rbx
	leaq	1600(%rbx), %r12
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L3:
	vmovsd	(%rbx), %xmm0
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk
	cmpq	%r12, %rbx
	jne	.L3
	movq	-56(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L10
	addq	$4856, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L10:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.ident	"GCC: (Gentoo 4.9.3 p1.5, pie-0.6.4) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
