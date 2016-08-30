	.file	"dgemm-other.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	transpose
	.type	transpose, @function
transpose:
.LFB2249:
	.file 1 "dgemm-other.c"
	.loc 1 13 0
	.cfi_startproc
.LVL0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	mcount
	.loc 1 13 0
.LVL1:
.LBB2:
	.loc 1 14 0
	testl	%edi, %edi
	jle	.L45
	leal	-1(%rdi), %eax
	movslq	%esi, %r9
	movslq	%edi, %rdi
	leaq	8(%rdx,%rax,8), %r10
	salq	$3, %r9
	leaq	0(,%rdi,8), %r8
.LVL2:
	.p2align 4,,10
	.p2align 3
.L3:
.LBB3:
	.loc 1 16 0 discriminator 1
	testl	%esi, %esi
	jle	.L5
	.loc 1 18 0 discriminator 3
	vmovsd	(%rdx), %xmm0
	leal	-1(%rsi), %r11d
	movl	$1, %edi
	leaq	(%rdx,%r8), %rax
	andl	$7, %r11d
	vmovsd	%xmm0, (%rcx)
.LVL3:
	.loc 1 16 0 discriminator 3
	cmpl	$1, %esi
	jle	.L5
	testl	%r11d, %r11d
	je	.L7
	cmpl	$1, %r11d
	je	.L32
	cmpl	$2, %r11d
	je	.L33
	cmpl	$3, %r11d
	je	.L34
	cmpl	$4, %r11d
	je	.L35
	cmpl	$5, %r11d
	je	.L36
	cmpl	$6, %r11d
	je	.L37
.LVL4:
	.loc 1 18 0
	vmovsd	(%rax), %xmm1
	movl	$2, %edi
	addq	%r8, %rax
	vmovsd	%xmm1, 8(%rcx)
.LVL5:
.L37:
	vmovsd	(%rax), %xmm2
	addq	%r8, %rax
	vmovsd	%xmm2, (%rcx,%rdi,8)
.LVL6:
	addq	$1, %rdi
.LVL7:
.L36:
	vmovsd	(%rax), %xmm3
	addq	%r8, %rax
	vmovsd	%xmm3, (%rcx,%rdi,8)
.LVL8:
	addq	$1, %rdi
.LVL9:
.L35:
	vmovsd	(%rax), %xmm4
	addq	%r8, %rax
	vmovsd	%xmm4, (%rcx,%rdi,8)
.LVL10:
	addq	$1, %rdi
.LVL11:
.L34:
	vmovsd	(%rax), %xmm5
	addq	%r8, %rax
	vmovsd	%xmm5, (%rcx,%rdi,8)
.LVL12:
	addq	$1, %rdi
.LVL13:
.L33:
	vmovsd	(%rax), %xmm6
	addq	%r8, %rax
	vmovsd	%xmm6, (%rcx,%rdi,8)
.LVL14:
	addq	$1, %rdi
.LVL15:
.L32:
	vmovsd	(%rax), %xmm7
	addq	%r8, %rax
	vmovsd	%xmm7, (%rcx,%rdi,8)
.LVL16:
	addq	$1, %rdi
	.loc 1 16 0
	cmpl	%edi, %esi
	jle	.L5
.LVL17:
.L7:
	.loc 1 18 0 discriminator 3
	vmovsd	(%rax), %xmm8
	addq	%r8, %rax
	vmovsd	%xmm8, (%rcx,%rdi,8)
.LVL18:
	vmovsd	(%rax), %xmm9
	addq	%r8, %rax
	vmovsd	%xmm9, 8(%rcx,%rdi,8)
.LVL19:
	vmovsd	(%rax), %xmm10
	addq	%r8, %rax
	vmovsd	%xmm10, 16(%rcx,%rdi,8)
.LVL20:
	vmovsd	(%rax), %xmm11
	addq	%r8, %rax
	vmovsd	%xmm11, 24(%rcx,%rdi,8)
.LVL21:
	vmovsd	(%rax), %xmm12
	addq	%r8, %rax
	vmovsd	%xmm12, 32(%rcx,%rdi,8)
.LVL22:
	vmovsd	(%rax), %xmm13
	addq	%r8, %rax
	vmovsd	%xmm13, 40(%rcx,%rdi,8)
.LVL23:
	vmovsd	(%rax), %xmm14
	addq	%r8, %rax
	vmovsd	%xmm14, 48(%rcx,%rdi,8)
.LVL24:
	vmovsd	(%rax), %xmm15
	addq	%r8, %rax
	vmovsd	%xmm15, 56(%rcx,%rdi,8)
.LVL25:
	addq	$8, %rdi
	.loc 1 16 0 discriminator 3
	cmpl	%edi, %esi
	jg	.L7
.LVL26:
.L5:
	addq	$8, %rdx
	addq	%r9, %rcx
.LBE3:
	.loc 1 14 0
	cmpq	%r10, %rdx
	jne	.L3
.L45:
.LBE2:
	.loc 1 21 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2249:
	.size	transpose, .-transpose
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	do_l1_block
	.type	do_l1_block, @function
do_l1_block:
.LFB2250:
	.loc 1 32 0
	.cfi_startproc
.LVL27:
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$160, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	mcount
	.loc 1 32 0
.LVL28:
	movq	8(%r10), %rax
	movq	(%r10), %r13
	movq	16(%r10), %rbx
	movl	%edi, -120(%rbp)
	movl	%r9d, %r14d
	movl	%edx, -116(%rbp)
	movl	%ecx, -196(%rbp)
	movl	%r8d, -92(%rbp)
	movq	%rax, -56(%rbp)
.LBB9:
	.loc 1 33 0
	testl	%ecx, %ecx
	jle	.L91
.LBB10:
.LBB11:
.LBB12:
.LBB13:
	.loc 1 38 0
	movl	%edi, %eax
	movslq	%edi, %rsi
.LVL29:
	movslq	%edx, %rdx
.LVL30:
	movq	%rbx, -192(%rbp)
	leaq	0(,%rsi,8), %r15
	addl	%eax, %eax
	movq	%rdx, -112(%rbp)
	salq	$3, %rdx
	movq	%rdx, -104(%rbp)
	leaq	0(%r13,%r15), %r8
.LVL31:
	movslq	%eax, %r9
.LVL32:
	addl	%edi, %eax
	movq	%rsi, -184(%rbp)
	cltq
	movq	%r15, %rdx
	salq	$5, %rsi
	leaq	0(%r13,%rax,8), %r12
	movl	%edi, %eax
	negq	%rdx
	movq	%r8, -144(%rbp)
	leaq	0(%r13,%r9,8), %r11
	sall	$2, %eax
	movq	%rsi, -72(%rbp)
	leal	-1(%r14), %ecx
.LVL33:
	movslq	%eax, %r10
	addl	%edi, %eax
	movq	%r12, -152(%rbp)
	leaq	0(%r13,%r10,8), %rbx
	cltq
	xorl	%r12d, %r12d
	movl	%ecx, -124(%rbp)
	leaq	0(%r13,%rax,8), %rdi
.LVL34:
	movq	%r11, -160(%rbp)
	movq	%rbx, -168(%rbp)
	movq	%rdi, -176(%rbp)
	movq	%rdx, -80(%rbp)
.LVL35:
	.p2align 4,,10
	.p2align 3
.L49:
.LBE13:
.LBE12:
.LBE11:
	.loc 1 34 0 discriminator 1
	movl	-92(%rbp), %r8d
	movl	%r12d, -96(%rbp)
.LVL36:
	testl	%r8d, %r8d
	jle	.L62
	.loc 1 34 0 is_stmt 0
	xorl	%r9d, %r9d
	movq	-56(%rbp), %rcx
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	movq	-192(%rbp), %rdi
	movq	%r9, -64(%rbp)
	jmp	.L61
.LVL37:
	.p2align 4,,10
	.p2align 3
.L92:
.LBB22:
.LBB20:
.LBB14:
	.loc 1 40 0 is_stmt 1
	vmovsd	(%rcx), %xmm0
	vmulsd	0(%r13,%r12,8), %xmm0, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
.LVL38:
	cmpl	$1, %eax
	je	.L64
.LVL39:
	movq	-144(%rbp), %rbx
	vmovsd	8(%rcx), %xmm3
	vmulsd	(%rbx,%r12,8), %xmm3, %xmm4
	vaddsd	%xmm4, %xmm2, %xmm2
.LVL40:
	cmpl	$2, %eax
	je	.L65
.LVL41:
	movq	-160(%rbp), %rsi
	vmovsd	16(%rcx), %xmm5
	vmulsd	(%rsi,%r12,8), %xmm5, %xmm6
	vaddsd	%xmm6, %xmm2, %xmm2
.LVL42:
	cmpl	$3, %eax
	je	.L66
.LVL43:
	movq	-152(%rbp), %rdx
	vmovsd	24(%rcx), %xmm7
	vmulsd	(%rdx,%r12,8), %xmm7, %xmm8
	vaddsd	%xmm8, %xmm2, %xmm2
.LVL44:
	cmpl	$4, %eax
	je	.L67
.LVL45:
	movq	-168(%rbp), %r8
	vmovsd	32(%rcx), %xmm9
	vmulsd	(%r8,%r12,8), %xmm9, %xmm10
	vaddsd	%xmm10, %xmm2, %xmm2
.LVL46:
	cmpl	$6, %eax
	jne	.L68
.LVL47:
	movq	-176(%rbp), %r9
.LBE14:
	.loc 1 37 0
	movl	$6, %edx
.LBB15:
	.loc 1 40 0
	vmovsd	40(%rcx), %xmm11
	vmulsd	(%r9,%r12,8), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm2, %xmm2
.LVL48:
.L53:
	cmpl	%eax, %r14d
	je	.L50
.L52:
	movl	%r14d, %esi
	movl	%eax, %r8d
	subl	%eax, %esi
	movl	%esi, -88(%rbp)
	subl	$4, %esi
	shrl	$2, %esi
	leal	1(%rsi), %r9d
	leal	0(,%r9,4), %ebx
	movl	%ebx, -84(%rbp)
	movl	-124(%rbp), %ebx
	subl	%eax, %ebx
	cmpl	$2, %ebx
	jbe	.L55
	movq	-184(%rbp), %rax
	andl	$3, %esi
	movl	%esi, -128(%rbp)
.LVL49:
	.loc 1 38 0
	movq	-80(%rbp), %rsi
	movq	-56(%rbp), %rbx
	imulq	%r8, %rax
	addq	-64(%rbp), %r8
	leaq	(%rbx,%r8,8), %r8
	addq	%r12, %rax
	movq	%r8, -136(%rbp)
	leaq	(%r15,%rax,8), %rax
	leaq	32(%r8), %r8
	addq	%r13, %rax
	vmovsd	(%rax,%rsi), %xmm15
	movl	$1, %esi
	vmovsd	(%rax,%r15), %xmm13
	vmovhpd	(%rax), %xmm15, %xmm0
	vmovhpd	(%rax,%r15,2), %xmm13, %xmm14
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm14, %ymm0, %ymm1
	.loc 1 40 0
	vmulpd	-32(%r8), %ymm1, %ymm0
	cmpl	$1, %r9d
	jbe	.L87
	movl	-128(%rbp), %ebx
	testl	%ebx, %ebx
	je	.L89
	cmpl	$1, %ebx
	je	.L82
	cmpl	$2, %ebx
	je	.L83
	.loc 1 38 0
	movq	-80(%rbp), %r8
	movl	$2, %esi
	.loc 1 40 0
	movq	-136(%rbp), %rbx
	.loc 1 38 0
	vmovsd	(%rax,%r15), %xmm3
	vmovsd	(%rax,%r8), %xmm5
	vmovhpd	(%rax,%r15,2), %xmm3, %xmm4
	leaq	64(%rbx), %r8
	vmovhpd	(%rax), %xmm5, %xmm6
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7
	.loc 1 40 0
	vmulpd	32(%rbx), %ymm7, %ymm8
	vaddpd	%ymm8, %ymm0, %ymm0
.L83:
	.loc 1 38 0
	movq	-80(%rbp), %rbx
	addl	$1, %esi
	addq	$32, %r8
	vmovsd	(%rax,%r15), %xmm9
	vmovhpd	(%rax,%r15,2), %xmm9, %xmm10
	vmovsd	(%rax,%rbx), %xmm11
	vmovhpd	(%rax), %xmm11, %xmm12
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13
	.loc 1 40 0
	vmulpd	-32(%r8), %ymm13, %ymm14
	vaddpd	%ymm14, %ymm0, %ymm0
.L82:
	.loc 1 38 0
	movq	-80(%rbp), %rbx
	addl	$1, %esi
	addq	$32, %r8
	vmovsd	(%rax,%r15), %xmm15
	vmovhpd	(%rax,%r15,2), %xmm15, %xmm1
	vmovsd	(%rax,%rbx), %xmm3
	vmovhpd	(%rax), %xmm3, %xmm4
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5
	.loc 1 40 0
	vmulpd	-32(%r8), %ymm5, %ymm6
	vaddpd	%ymm6, %ymm0, %ymm0
	cmpl	%esi, %r9d
	jbe	.L87
.L89:
	movl	%edx, -136(%rbp)
	movq	-64(%rbp), %rbx
	movq	-80(%rbp), %rdx
.L56:
	.loc 1 38 0 discriminator 3
	vmovsd	(%rax,%r15), %xmm7
	addl	$4, %esi
	subq	$-128, %r8
	vmovsd	(%rax,%rdx), %xmm9
	vmovhpd	(%rax,%r15,2), %xmm7, %xmm8
	vmovhpd	(%rax), %xmm9, %xmm10
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11
	.loc 1 40 0 discriminator 3
	vmulpd	-128(%r8), %ymm11, %ymm12
	vaddpd	%ymm12, %ymm0, %ymm13
	.loc 1 38 0 discriminator 3
	vmovsd	(%rax,%r15), %xmm14
	vmovsd	(%rax,%rdx), %xmm1
	vmovhpd	(%rax,%r15,2), %xmm14, %xmm15
	vmovhpd	(%rax), %xmm1, %xmm3
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4
	.loc 1 40 0 discriminator 3
	vmulpd	-96(%r8), %ymm4, %ymm5
	vaddpd	%ymm5, %ymm13, %ymm8
	.loc 1 38 0 discriminator 3
	vmovsd	(%rax,%r15), %xmm6
	vmovsd	(%rax,%rdx), %xmm7
	vmovhpd	(%rax,%r15,2), %xmm6, %xmm0
	vmovhpd	(%rax), %xmm7, %xmm9
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm0, %ymm9, %ymm10
	.loc 1 40 0 discriminator 3
	vmulpd	-64(%r8), %ymm10, %ymm11
	vaddpd	%ymm11, %ymm8, %ymm12
	.loc 1 38 0 discriminator 3
	vmovsd	(%rax,%r15), %xmm13
	vmovsd	(%rax,%rdx), %xmm15
	vmovhpd	(%rax,%r15,2), %xmm13, %xmm14
	vmovhpd	(%rax), %xmm15, %xmm1
	addq	-72(%rbp), %rax
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3
	.loc 1 40 0 discriminator 3
	vmulpd	-32(%r8), %ymm3, %ymm4
	vaddpd	%ymm4, %ymm12, %ymm0
	cmpl	%esi, %r9d
	ja	.L56
	movl	-136(%rbp), %edx
	movq	%rbx, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L87:
	vhaddpd	%ymm0, %ymm0, %ymm5
	movl	-84(%rbp), %r9d
	vperm2f128	$1, %ymm5, %ymm5, %ymm8
	vaddpd	%ymm8, %ymm5, %ymm6
	addl	%r9d, %edx
	vaddsd	%xmm6, %xmm2, %xmm2
	cmpl	-88(%rbp), %r9d
	je	.L50
.L55:
.LVL50:
	.loc 1 38 0
	movl	-120(%rbp), %ebx
	movl	-96(%rbp), %r9d
	.loc 1 39 0
	leal	(%r11,%rdx), %esi
	movslq	%esi, %rsi
	.loc 1 38 0
	movl	%ebx, %eax
	imull	%edx, %eax
.LVL51:
	leal	(%rax,%r9), %r8d
.LVL52:
	movslq	%r8d, %r8
	.loc 1 40 0
	vmovsd	0(%r13,%r8,8), %xmm0
	movq	-56(%rbp), %r8
.LVL53:
	vmulsd	(%r8,%rsi,8), %xmm0, %xmm7
.LBE15:
	.loc 1 37 0
	leal	1(%rdx), %esi
.LVL54:
.LBB16:
	.loc 1 40 0
	vaddsd	%xmm7, %xmm2, %xmm2
.LVL55:
.LBE16:
	.loc 1 37 0
	cmpl	%esi, %r14d
	jle	.L50
.LBB17:
	.loc 1 38 0
	addl	%ebx, %eax
.LVL56:
	.loc 1 40 0
	movq	-56(%rbp), %rbx
	.loc 1 39 0
	addl	%r11d, %esi
.LVL57:
.LBE17:
	.loc 1 37 0
	addl	$2, %edx
.LVL58:
.LBB18:
	.loc 1 38 0
	leal	(%r9,%rax), %r9d
.LVL59:
	.loc 1 39 0
	movslq	%esi, %rsi
	.loc 1 38 0
	movslq	%r9d, %r8
	.loc 1 40 0
	vmovsd	0(%r13,%r8,8), %xmm9
	vmulsd	(%rbx,%rsi,8), %xmm9, %xmm10
	vaddsd	%xmm10, %xmm2, %xmm2
.LVL60:
.LBE18:
	.loc 1 37 0
	cmpl	%edx, %r14d
	jle	.L50
.LVL61:
.LBB19:
	.loc 1 38 0
	addl	-120(%rbp), %eax
.LVL62:
	.loc 1 39 0
	addl	%r11d, %edx
.LVL63:
	.loc 1 38 0
	addl	-96(%rbp), %eax
	.loc 1 39 0
	movslq	%edx, %rdx
	.loc 1 38 0
	cltq
	.loc 1 40 0
	vmovsd	0(%r13,%rax,8), %xmm11
	movq	-56(%rbp), %rax
	vmulsd	(%rax,%rdx,8), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm2, %xmm2
.LVL64:
.L50:
.LBE19:
.LBE20:
	.loc 1 42 0 discriminator 2
	vmovsd	%xmm2, (%rdi)
	movq	-112(%rbp), %r9
.LBE22:
	.loc 1 34 0 discriminator 2
	addl	$1, %r10d
.LVL65:
	addq	%r15, %rdi
	addq	-104(%rbp), %rcx
	addq	%r9, -64(%rbp)
	addl	-116(%rbp), %r11d
	cmpl	-92(%rbp), %r10d
	je	.L62
.LVL66:
.L61:
.LBB23:
	.loc 1 35 0
	vmovsd	(%rdi), %xmm2
.LVL67:
.LBB21:
	.loc 1 37 0
	testl	%r14d, %r14d
	jle	.L50
	movq	%rcx, %rax
	andl	$31, %eax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%r14d, %eax
	cmova	%r14d, %eax
	cmpl	$6, %r14d
	cmovbe	%r14d, %eax
	testl	%eax, %eax
	jne	.L92
	xorl	%edx, %edx
	jmp	.L52
.LVL68:
	.p2align 4,,10
	.p2align 3
.L68:
	movl	$5, %edx
	jmp	.L53
.LVL69:
	.p2align 4,,10
	.p2align 3
.L67:
	movl	$4, %edx
.LVL70:
	jmp	.L53
.LVL71:
	.p2align 4,,10
	.p2align 3
.L66:
	movl	$3, %edx
	jmp	.L53
.LVL72:
	.p2align 4,,10
	.p2align 3
.L65:
	movl	$2, %edx
	jmp	.L53
.LVL73:
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$1, %edx
	jmp	.L53
.LVL74:
	.p2align 4,,10
	.p2align 3
.L62:
	addq	$8, -192(%rbp)
	addq	$1, %r12
.LVL75:
.LBE21:
.LBE23:
.LBE10:
	.loc 1 33 0
	cmpl	%r12d, -196(%rbp)
	jg	.L49
	vzeroupper
.LVL76:
.L91:
.LBE9:
	.loc 1 45 0
	addq	$160, %rsp
	popq	%rbx
	popq	%rcx
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
.LVL77:
	popq	%r15
	popq	%rbp
.LVL78:
	leaq	-8(%rcx), %rsp
	.cfi_def_cfa 7, 8
.LVL79:
	ret
	.cfi_endproc
.LFE2250:
	.size	do_l1_block, .-do_l1_block
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	my_dgemm
	.type	my_dgemm, @function
my_dgemm:
.LFB2251:
	.loc 1 54 0
	.cfi_startproc
.LVL80:
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$448, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	mcount
	.loc 1 54 0
.LVL81:
	movl	%edi, %eax
	movl	%edi, -120(%rbp)
	movl	%edx, %edi
.LVL82:
	movl	%esi, -240(%rbp)
	movl	%edx, -116(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	movq	%r9, -440(%rbp)
.LBB43:
	.loc 1 57 0
	testl	%edx, %edx
	jle	.L160
	leal	0(,%rax,4), %edx
.LVL83:
	movl	%eax, %r9d
.LVL84:
	movslq	%edi, %r15
.LBB44:
.LBB45:
.LBB46:
.LBB47:
.LBB48:
.LBB49:
.LBB50:
.LBB51:
.LBB52:
.LBB53:
.LBB54:
.LBB55:
.LBB56:
.LBB57:
.LBB58:
.LBB59:
.LBB60:
	.loc 1 38 0
	movq	%r8, -328(%rbp)
	leal	(%rdx,%rax), %ecx
.LVL85:
	movslq	%r9d, %r13
	movslq	%edx, %rbx
	movq	%r15, -136(%rbp)
	movl	%ecx, %eax
.LVL86:
	movq	%r13, %r14
	salq	$3, %r15
	movq	%r13, -112(%rbp)
	sall	$5, %eax
	movslq	%ecx, %rdx
	movq	%r15, -128(%rbp)
	movl	%eax, -432(%rbp)
	cltq
	salq	$3, %rax
	movq	%rbx, -168(%rbp)
	movq	%rax, -408(%rbp)
	leal	(%rdi,%rdi,4), %eax
	sall	$5, %eax
	movq	%rdx, -152(%rbp)
	movl	$0, -332(%rbp)
	cltq
	movq	%rax, -416(%rbp)
	salq	$3, %rax
	movq	%rax, -424(%rbp)
	movl	%r9d, %eax
	movq	%r14, %r9
.LVL87:
	sall	$5, %eax
.LVL88:
	salq	$5, %r9
	movq	$0, -224(%rbp)
	movl	%eax, -396(%rbp)
	cltq
	salq	$3, %rax
	movq	%rax, -376(%rbp)
	movl	%edi, %eax
	sall	$5, %eax
	cltq
	movq	%rax, -384(%rbp)
	salq	$3, %rax
	movq	%rax, -368(%rbp)
	movq	%r13, %rax
	leaq	0(,%r13,8), %r13
	addl	%eax, %eax
	movslq	%eax, %rdi
.LVL89:
	addl	%r14d, %eax
	movq	%r9, %r14
	cltq
	movq	%rdi, -160(%rbp)
	movq	%rax, -176(%rbp)
.LVL90:
.L96:
	movq	-224(%rbp), %rsi
.LBE60:
.LBE59:
.LBE58:
.LBE57:
.LBE56:
.LBE55:
.LBE54:
.LBE53:
.LBE52:
.LBE51:
.LBE50:
.LBE49:
.LBE48:
.LBE47:
.LBE46:
.LBE45:
	.loc 1 58 0
	movl	-116(%rbp), %r11d
.LBB85:
	.loc 1 59 0
	movl	-240(%rbp), %r12d
	movl	%esi, -272(%rbp)
.LVL91:
	addl	$160, %esi
.LVL92:
.LBE85:
	.loc 1 58 0
	cmpl	%esi, %r11d
	cmovle	%r11d, %esi
	movl	%esi, -244(%rbp)
.LVL93:
.LBB86:
	.loc 1 59 0
	testl	%r12d, %r12d
	jle	.L100
	movq	-224(%rbp), %rdi
	movl	%esi, %r10d
	movl	$0, -232(%rbp)
	movq	-440(%rbp), %rax
	movq	-328(%rbp), %r8
	movl	%edi, %edx
	subl	%edi, %r10d
	movq	%rdi, -352(%rbp)
	leal	-32(%r10), %ebx
	notl	%edx
	movq	%rax, -304(%rbp)
	addl	%esi, %edx
	subl	-272(%rbp), %esi
.LVL94:
	movq	%r8, -344(%rbp)
	andl	$-32, %edx
	subl	%edx, %ebx
	movl	%ebx, -400(%rbp)
	movl	%esi, -468(%rbp)
	movl	-232(%rbp), %esi
.LVL95:
.L99:
.LBB84:
	.loc 1 60 0
	movl	-240(%rbp), %ecx
	addl	$160, %esi
.LBB82:
	.loc 1 61 0
	movl	-120(%rbp), %r11d
	movl	%esi, -428(%rbp)
.LBE82:
	.loc 1 60 0
	cmpl	%esi, %ecx
	cmovle	%ecx, %esi
	movl	%esi, -248(%rbp)
.LVL96:
.LBB83:
	.loc 1 61 0
	testl	%r11d, %r11d
	jle	.L103
	movl	-232(%rbp), %eax
	movl	%esi, %r15d
	movq	$0, -216(%rbp)
	movq	-304(%rbp), %rdi
	subl	%eax, %r15d
	notl	%eax
	leal	-32(%r15), %r10d
	addl	%esi, %eax
	movq	%rdi, -264(%rbp)
	andl	$-32, %eax
	movl	%r15d, -464(%rbp)
	subl	%eax, %r10d
	movl	%r10d, -336(%rbp)
.LVL97:
.L102:
	movq	-216(%rbp), %rdx
.LBB81:
	.loc 1 62 0
	movl	-120(%rbp), %r9d
.LBB79:
	.loc 1 65 0
	movl	-272(%rbp), %r8d
	movl	%edx, -268(%rbp)
.LVL98:
	addl	$160, %edx
.LVL99:
.LBE79:
	.loc 1 62 0
	cmpl	%edx, %r9d
	cmovle	%r9d, %edx
	movl	%edx, -252(%rbp)
.LVL100:
.LBB80:
	.loc 1 65 0
	cmpl	%r8d, -244(%rbp)
	jle	.L106
	movq	-216(%rbp), %r12
	movl	%edx, %r11d
	movl	-468(%rbp), %esi
	movl	-332(%rbp), %ecx
	movq	-352(%rbp), %rax
	movl	%r12d, %r15d
	movq	-344(%rbp), %r10
	notl	%r15d
	movl	%esi, -236(%rbp)
	addq	%r11, %r15
	subl	-268(%rbp), %r11d
	movl	%ecx, -256(%rbp)
	andl	$4294967264, %r15d
	movq	%rax, -288(%rbp)
	leaq	32(%r15,%r12), %rdi
	movl	-236(%rbp), %r12d
	movq	%r10, -280(%rbp)
	movq	%rdi, -456(%rbp)
	movl	%r11d, -460(%rbp)
.LVL101:
.L105:
	cmpl	$32, %r12d
	movl	$32, %edx
.LBB78:
.LBB77:
	.loc 1 67 0
	movl	-232(%rbp), %ebx
	cmovle	%r12d, %edx
.LVL102:
	cmpl	%ebx, -248(%rbp)
	jle	.L109
	movslq	-256(%rbp), %r9
	movq	%r13, %rax
	movq	-216(%rbp), %r11
	leal	-1(%rdx), %ecx
	movl	%edx, %r13d
	movl	-464(%rbp), %r8d
	movl	%ecx, -140(%rbp)
	movq	-280(%rbp), %r12
	movq	-288(%rbp), %rsi
	addq	%r9, %r11
	addq	-456(%rbp), %r9
	movq	-264(%rbp), %r15
	movl	%r8d, -228(%rbp)
	movl	-228(%rbp), %r8d
	movq	%r11, -448(%rbp)
	salq	$3, %r11
	movq	%r12, -200(%rbp)
	movq	%rax, %r12
	salq	$3, %r9
	movq	%r11, -392(%rbp)
	movq	%r9, -360(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%r15, -312(%rbp)
.LVL103:
.L108:
	cmpl	$32, %r8d
	movl	$32, %r10d
.LBB76:
.LBB75:
	.loc 1 69 0
	movl	-268(%rbp), %edi
	cmovle	%r8d, %r10d
	movl	%r10d, -104(%rbp)
.LVL104:
	cmpl	%edi, -252(%rbp)
	jle	.L125
	movq	-200(%rbp), %rdx
	movq	$0, -296(%rbp)
	subq	-64(%rbp), %rdx
	movq	-392(%rbp), %rbx
	movq	-312(%rbp), %r9
	movq	%rdx, -96(%rbp)
	movq	%rbx, -88(%rbp)
	movq	%r9, -320(%rbp)
.LVL105:
.L124:
	movl	-460(%rbp), %r8d
	movl	$32, %esi
	movq	-296(%rbp), %r11
	subl	%r11d, %r8d
	cmpl	$32, %r8d
	cmovg	%esi, %r8d
	movl	%r8d, -144(%rbp)
.LVL106:
.LBB74:
.LBB73:
.LBB72:
	.loc 1 33 0
	testl	%r8d, %r8d
	jle	.L110
	movq	-448(%rbp), %r15
	movl	$0, -68(%rbp)
	movq	-320(%rbp), %rcx
	movq	-56(%rbp), %rbx
	addq	-88(%rbp), %rbx
	addq	%r11, %r15
	movq	%r15, -184(%rbp)
	movq	%rcx, -192(%rbp)
.LVL107:
	.p2align 4,,10
	.p2align 3
.L111:
.LBB71:
	.loc 1 34 0
	movl	-104(%rbp), %eax
	testl	%eax, %eax
	jle	.L123
	movq	-208(%rbp), %r10
	xorl	%r9d, %r9d
	movq	-200(%rbp), %rsi
	movq	-192(%rbp), %r8
	movq	%r10, -80(%rbp)
	xorl	%r10d, %r10d
	movq	%rsi, %r11
	jmp	.L122
.LVL108:
	.p2align 4,,10
	.p2align 3
.L161:
.LBB69:
.LBB67:
.LBB61:
	.loc 1 40 0
	vmovsd	(%rsi), %xmm0
	vmulsd	(%rbx), %xmm0, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
.LVL109:
	cmpl	$1, %eax
	je	.L127
.LVL110:
	movq	-112(%rbp), %rdi
	vmovsd	8(%rsi), %xmm3
	vmulsd	(%rbx,%rdi,8), %xmm3, %xmm4
	vaddsd	%xmm4, %xmm2, %xmm2
.LVL111:
	cmpl	$2, %eax
	je	.L128
.LVL112:
	movq	-160(%rbp), %rdx
	vmovsd	16(%rsi), %xmm5
	vmulsd	(%rbx,%rdx,8), %xmm5, %xmm6
	vaddsd	%xmm6, %xmm2, %xmm2
.LVL113:
	cmpl	$3, %eax
	je	.L129
.LVL114:
	movq	-176(%rbp), %r15
	vmovsd	24(%rsi), %xmm7
	vmulsd	(%rbx,%r15,8), %xmm7, %xmm8
	vaddsd	%xmm8, %xmm2, %xmm2
.LVL115:
	cmpl	$4, %eax
	je	.L130
.LVL116:
	movq	-168(%rbp), %rcx
	vmovsd	32(%rsi), %xmm9
	vmulsd	(%rbx,%rcx,8), %xmm9, %xmm10
	vaddsd	%xmm10, %xmm2, %xmm2
.LVL117:
	cmpl	$6, %eax
	jne	.L131
.LVL118:
	movq	-152(%rbp), %rdi
.LBE61:
	.loc 1 37 0
	movl	$6, %ecx
.LBB62:
	.loc 1 40 0
	vmovsd	40(%rsi), %xmm11
	vmulsd	(%rbx,%rdi,8), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm2, %xmm2
.LVL119:
.L115:
	cmpl	%eax, %r13d
	je	.L112
.L114:
	movl	%r13d, %edx
	movl	%eax, %edi
	subl	%eax, %edx
	movl	%edx, -100(%rbp)
	subl	$4, %edx
	shrl	$2, %edx
	addl	$1, %edx
	leal	0(,%rdx,4), %r15d
	movl	%r15d, -72(%rbp)
	movl	-140(%rbp), %r15d
	subl	%eax, %r15d
	cmpl	$2, %r15d
	jbe	.L117
	movq	-112(%rbp), %rax
	movq	-56(%rbp), %r15
	imulq	%rdi, %rax
	addq	-80(%rbp), %rdi
	addq	-184(%rbp), %rax
	leaq	(%r15,%rax,8), %rax
	movq	-64(%rbp), %r15
	.loc 1 38 0
	vmovsd	(%rax), %xmm15
	leaq	(%r15,%rdi,8), %rdi
.LVL120:
	leaq	(%rax,%r12), %r15
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm13
	vmovhpd	(%r15), %xmm15, %xmm0
	vmovhpd	(%r15,%r12,2), %xmm13, %xmm14
	vinsertf128	$0x1, %xmm14, %ymm0, %ymm1
	.loc 1 40 0
	vmulpd	(%rdi), %ymm1, %ymm0
	cmpl	$1, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm5
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm3
	vmovhpd	(%r15), %xmm5, %xmm6
	vmovhpd	(%r15,%r12,2), %xmm3, %xmm4
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7
	.loc 1 40 0
	vmulpd	32(%rdi), %ymm7, %ymm8
	vaddpd	%ymm8, %ymm0, %ymm0
	cmpl	$2, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm11
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm9
	vmovhpd	(%r15), %xmm11, %xmm12
	vmovhpd	(%r15,%r12,2), %xmm9, %xmm10
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13
	.loc 1 40 0
	vmulpd	64(%rdi), %ymm13, %ymm14
	vaddpd	%ymm14, %ymm0, %ymm0
	cmpl	$3, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm3
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm15
	vmovhpd	(%r15), %xmm3, %xmm4
	vmovhpd	(%r15,%r12,2), %xmm15, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5
	.loc 1 40 0
	vmulpd	96(%rdi), %ymm5, %ymm6
	vaddpd	%ymm6, %ymm0, %ymm0
	cmpl	$4, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm9
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm7
	vmovhpd	(%r15), %xmm9, %xmm10
	vmovhpd	(%r15,%r12,2), %xmm7, %xmm8
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11
	.loc 1 40 0
	vmulpd	128(%rdi), %ymm11, %ymm12
	vaddpd	%ymm12, %ymm0, %ymm0
	cmpl	$5, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm15
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm13
	vmovhpd	(%r15), %xmm15, %xmm1
	vmovhpd	(%r15,%r12,2), %xmm13, %xmm14
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3
	.loc 1 40 0
	vmulpd	160(%rdi), %ymm3, %ymm4
	vaddpd	%ymm4, %ymm0, %ymm0
	cmpl	$6, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %r15
	vmovsd	(%rax), %xmm7
	addq	%r14, %rax
	vmovsd	(%r15,%r12), %xmm5
	vmovhpd	(%r15), %xmm7, %xmm8
	vmovhpd	(%r15,%r12,2), %xmm5, %xmm6
	vinsertf128	$0x1, %xmm6, %ymm8, %ymm9
	.loc 1 40 0
	vmulpd	192(%rdi), %ymm9, %ymm10
	vaddpd	%ymm10, %ymm0, %ymm0
	cmpl	$7, %edx
	je	.L118
	.loc 1 38 0
	leaq	(%rax,%r12), %rdx
	vmovsd	(%rax), %xmm13
	vmovsd	(%rdx,%r12), %xmm11
	vmovhpd	(%rdx), %xmm13, %xmm14
	vmovhpd	(%rdx,%r12,2), %xmm11, %xmm12
	vinsertf128	$0x1, %xmm12, %ymm14, %ymm15
	.loc 1 40 0
	vmulpd	224(%rdi), %ymm15, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
.L118:
	vhaddpd	%ymm0, %ymm0, %ymm3
	movl	-72(%rbp), %eax
	vperm2f128	$1, %ymm3, %ymm3, %ymm4
	vaddpd	%ymm4, %ymm3, %ymm5
	addl	%eax, %ecx
	vaddsd	%xmm5, %xmm2, %xmm2
	cmpl	-100(%rbp), %eax
	je	.L112
.L117:
.LVL121:
	.loc 1 38 0
	movl	-120(%rbp), %r15d
	movl	-68(%rbp), %edi
	movl	%r15d, %edx
	imull	%ecx, %edx
.LVL122:
	leal	(%rdi,%rdx), %eax
	movq	-88(%rbp), %rdi
.LVL123:
	movl	%edx, -72(%rbp)
	movslq	%eax, %rdx
.LVL124:
	.loc 1 39 0
	leal	(%rcx,%r9), %eax
	.loc 1 38 0
	leaq	(%rdi,%rdx,8), %rdi
	.loc 1 39 0
	movslq	%eax, %rdx
.LVL125:
	movq	-96(%rbp), %rax
	leaq	(%rax,%rdx,8), %rdx
.LVL126:
	.loc 1 40 0
	movq	-56(%rbp), %rax
	vmovsd	(%rax,%rdi), %xmm6
	movq	-64(%rbp), %rdi
	vmulsd	(%rdi,%rdx), %xmm6, %xmm7
.LBE62:
	.loc 1 37 0
	leal	1(%rcx), %edx
.LBB63:
	.loc 1 40 0
	vaddsd	%xmm7, %xmm2, %xmm2
.LVL127:
.LBE63:
	.loc 1 37 0
	cmpl	%r13d, %edx
	jge	.L112
.LBB64:
	.loc 1 38 0
	movl	-72(%rbp), %eax
	.loc 1 39 0
	addl	%r9d, %edx
.LVL128:
.LBE64:
	.loc 1 37 0
	addl	$2, %ecx
.LVL129:
.LBB65:
	.loc 1 38 0
	movl	-68(%rbp), %edi
	.loc 1 39 0
	movslq	%edx, %rdx
	.loc 1 38 0
	addl	%r15d, %eax
.LVL130:
	movq	-88(%rbp), %r15
	addl	%eax, %edi
	movslq	%edi, %rdi
.LVL131:
	leaq	(%r15,%rdi,8), %rdi
.LVL132:
	.loc 1 39 0
	movq	-96(%rbp), %r15
	leaq	(%r15,%rdx,8), %rdx
	.loc 1 40 0
	movq	-56(%rbp), %r15
	vmovsd	(%r15,%rdi), %xmm8
	movq	-64(%rbp), %rdi
	vmulsd	(%rdi,%rdx), %xmm8, %xmm9
	vaddsd	%xmm9, %xmm2, %xmm2
.LVL133:
.LBE65:
	.loc 1 37 0
	cmpl	%ecx, %r13d
	jle	.L112
.LVL134:
.LBB66:
	.loc 1 38 0
	addl	-120(%rbp), %eax
.LVL135:
	.loc 1 39 0
	addl	%r9d, %ecx
	.loc 1 38 0
	addl	-68(%rbp), %eax
	.loc 1 39 0
	movslq	%ecx, %rcx
	.loc 1 38 0
	movq	-88(%rbp), %rdx
	.loc 1 39 0
	movq	-96(%rbp), %r15
	.loc 1 38 0
	cltq
	leaq	(%rdx,%rax,8), %rax
	.loc 1 40 0
	movq	-56(%rbp), %rdx
	.loc 1 39 0
	leaq	(%r15,%rcx,8), %rdi
	.loc 1 40 0
	vmovsd	(%rdx,%rax), %xmm10
	movq	-64(%rbp), %rax
	vmulsd	(%rax,%rdi), %xmm10, %xmm11
	vaddsd	%xmm11, %xmm2, %xmm2
.LVL136:
.L112:
	movq	-128(%rbp), %rcx
.LBE66:
.LBE67:
	.loc 1 42 0
	vmovsd	%xmm2, (%r8)
.LBE69:
	.loc 1 34 0
	addl	$1, %r10d
.LVL137:
	addq	%r12, %r8
	movq	-136(%rbp), %r15
	addl	-116(%rbp), %r9d
	addq	%r15, -80(%rbp)
	addq	%rcx, %rsi
	addq	%rcx, %r11
	cmpl	-104(%rbp), %r10d
	je	.L123
.LVL138:
.L122:
.LBB70:
	.loc 1 35 0
	vmovsd	(%r8), %xmm2
.LVL139:
.LBB68:
	.loc 1 37 0
	testl	%r13d, %r13d
	jle	.L112
	movq	%r11, %rax
	andl	$31, %eax
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%r13d, %eax
	cmova	%r13d, %eax
	cmpl	$6, %r13d
	cmovbe	%r13d, %eax
	testl	%eax, %eax
	jne	.L161
	xorl	%ecx, %ecx
	jmp	.L114
.LVL140:
	.p2align 4,,10
	.p2align 3
.L131:
	movl	$5, %ecx
.LVL141:
	jmp	.L115
.LVL142:
	.p2align 4,,10
	.p2align 3
.L130:
	movl	$4, %ecx
	jmp	.L115
.LVL143:
	.p2align 4,,10
	.p2align 3
.L129:
	movl	$3, %ecx
	jmp	.L115
.LVL144:
	.p2align 4,,10
	.p2align 3
.L128:
	movl	$2, %ecx
	jmp	.L115
.LVL145:
	.p2align 4,,10
	.p2align 3
.L127:
	movl	$1, %ecx
	jmp	.L115
.LVL146:
	.p2align 4,,10
	.p2align 3
.L123:
.LBE68:
.LBE70:
.LBE71:
	.loc 1 33 0
	addl	$1, -68(%rbp)
.LVL147:
	addq	$8, %rbx
	movl	-68(%rbp), %esi
.LVL148:
	addq	$8, -192(%rbp)
	addq	$1, -184(%rbp)
	cmpl	-144(%rbp), %esi
	jne	.L111
.LVL149:
.L110:
	addq	$256, -88(%rbp)
	addq	$256, -320(%rbp)
	addq	$32, -296(%rbp)
.LVL150:
	movq	-88(%rbp), %r11
.LBE72:
.LBE73:
.LBE74:
	.loc 1 69 0
	cmpq	-360(%rbp), %r11
	jne	.L124
.L125:
	subl	$32, -228(%rbp)
	movq	-376(%rbp), %r9
	movq	-368(%rbp), %r10
	movq	-384(%rbp), %rbx
	movl	-228(%rbp), %r8d
	addq	%r9, -312(%rbp)
	addq	%r10, -200(%rbp)
	addq	%rbx, -208(%rbp)
.LBE75:
.LBE76:
	.loc 1 67 0
	cmpl	-336(%rbp), %r8d
	jne	.L108
	movq	%r12, %r13
.LVL151:
.L109:
	subl	$32, -236(%rbp)
	movl	-396(%rbp), %edi
	movl	-236(%rbp), %r12d
	addq	$256, -280(%rbp)
	addq	$32, -288(%rbp)
	addl	%edi, -256(%rbp)
.LBE77:
.LBE78:
	.loc 1 65 0
	cmpl	-400(%rbp), %r12d
	jne	.L105
.L106:
.LVL152:
	addq	$160, -216(%rbp)
	addq	$1280, -264(%rbp)
	movq	-216(%rbp), %rdx
.LBE80:
.LBE81:
	.loc 1 61 0
	cmpl	%edx, -120(%rbp)
	jg	.L102
.LVL153:
.L103:
	movl	-428(%rbp), %esi
	movq	-408(%rbp), %rax
	movq	-424(%rbp), %rcx
	movq	-416(%rbp), %r15
	addq	%rax, -304(%rbp)
	movl	%esi, -232(%rbp)
	addq	%rcx, -344(%rbp)
	addq	%r15, -352(%rbp)
.LBE83:
.LBE84:
	.loc 1 59 0
	cmpl	%esi, -240(%rbp)
	jg	.L99
.LVL154:
.L100:
	addq	$160, -224(%rbp)
	movl	-432(%rbp), %r8d
	addq	$1280, -328(%rbp)
	movq	-224(%rbp), %r11
	addl	%r8d, -332(%rbp)
.LBE86:
.LBE44:
	.loc 1 57 0
	cmpl	%r11d, -116(%rbp)
	jg	.L96
	vzeroupper
.LVL155:
.L160:
.LBE43:
	.loc 1 81 0
	addq	$448, %rsp
	popq	%rbx
	popq	%r9
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
.LVL156:
	leaq	-8(%r9), %rsp
	.cfi_def_cfa 7, 8
.LVL157:
	ret
	.cfi_endproc
.LFE2251:
	.size	my_dgemm, .-my_dgemm
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	square_dgemm
	.type	square_dgemm, @function
square_dgemm:
.LFB2252:
	.loc 1 85 0
	.cfi_startproc
.LVL158:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	mcount
	.loc 1 85 0
	.loc 1 87 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	.loc 1 85 0
	movq	%rdx, %r8
	movq	%rcx, %r9
	.loc 1 86 0
	movl	%edi, %edx
.LVL159:
	movq	%rsi, %rcx
.LVL160:
	movl	%edi, %esi
.LVL161:
	jmp	my_dgemm
.LVL162:
	.cfi_endproc
.LFE2252:
	.size	square_dgemm, .-square_dgemm
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	square_dgemm_l1l2
	.type	square_dgemm_l1l2, @function
square_dgemm_l1l2:
.LFB2253:
	.loc 1 89 0
	.cfi_startproc
.LVL163:
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$480, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	mcount
	.loc 1 89 0
.LVL164:
	movq	%rsi, -96(%rbp)
	movl	%edi, %ebx
	movl	%r8d, %eax
	movl	%r9d, %esi
.LVL165:
	movq	%rdx, -80(%rbp)
	movq	%rcx, -488(%rbp)
	movl	%r8d, -220(%rbp)
	movl	%r9d, -256(%rbp)
.LBB106:
	.loc 1 94 0
	testl	%edi, %edi
	jle	.L229
	movl	%eax, %r12d
	movslq	%eax, %r11
	movl	%r9d, %edi
.LVL166:
.LBB107:
.LBB108:
.LBB109:
.LBB110:
.LBB111:
.LBB112:
.LBB113:
.LBB114:
.LBB115:
.LBB116:
.LBB117:
.LBB118:
.LBB119:
.LBB120:
.LBB121:
.LBB122:
.LBB123:
	.loc 1 38 0
	movq	%rdx, -336(%rbp)
	imull	%ebx, %eax
	movslq	%r9d, %r8
.LVL167:
	movslq	%ebx, %r14
	movq	%r11, -344(%rbp)
	imull	%ebx, %edi
	salq	$3, %r11
	movq	%r8, -304(%rbp)
	salq	$3, %r8
	leaq	0(,%r14,8), %r15
	movq	%r8, -432(%rbp)
	movq	%r14, %r8
	movl	%eax, -468(%rbp)
	cltq
	salq	$5, %r8
	movq	%rax, -416(%rbp)
	salq	$3, %rax
	movslq	%edi, %r9
.LVL168:
	movq	%rax, -408(%rbp)
	leal	(%rbx,%rbx), %eax
	movl	%edi, -400(%rbp)
	movslq	%eax, %rdi
	addl	%ebx, %eax
	cltq
	movq	%r9, -440(%rbp)
	salq	$3, %r9
	movq	%rax, -184(%rbp)
	leal	0(,%rbx,4), %eax
	movslq	%eax, %rcx
.LVL169:
	movq	%r9, -424(%rbp)
	addl	%ebx, %eax
	movl	%r12d, %r9d
	movq	%r11, -328(%rbp)
	movl	%r12d, %r11d
	movq	%r15, %r12
.LVL170:
	cltq
	negl	%r9d
.LVL171:
	subl	%esi, %r11d
.LVL172:
	negq	%r12
	movq	%r14, -72(%rbp)
	movq	%rdi, -168(%rbp)
	movq	%rcx, -176(%rbp)
	movq	%rax, -160(%rbp)
	movq	%r8, -104(%rbp)
	movq	$0, -272(%rbp)
	movl	$0, -356(%rbp)
	movl	$0, -224(%rbp)
	movl	%r9d, -260(%rbp)
	movl	%r11d, -388(%rbp)
	movq	%r12, -120(%rbp)
	movl	%ebx, -56(%rbp)
.LVL173:
.L192:
.LBE123:
.LBE122:
.LBE121:
.LBE120:
.LBE119:
.LBE118:
.LBE117:
.LBE116:
.LBE115:
.LBE114:
.LBE113:
.LBE112:
.LBE111:
.LBE110:
.LBE109:
.LBE108:
	.loc 1 95 0
	movl	-224(%rbp), %ebx
	movl	$0, -228(%rbp)
	movl	-256(%rbp), %r13d
	movl	-56(%rbp), %r14d
	movq	-272(%rbp), %r10
	movq	-336(%rbp), %rax
	addl	%ebx, %r13d
	movl	-228(%rbp), %r12d
	cmpl	%r14d, %r13d
	movl	%r13d, -392(%rbp)
	cmovle	%r13d, %r14d
	movq	%r10, -384(%rbp)
	movq	%rax, -296(%rbp)
	movl	%r14d, -264(%rbp)
.LVL174:
	leaq	0(,%r10,8), %rdi
	subl	%ebx, %r14d
.LVL175:
	movq	%rdi, -480(%rbp)
	movl	%r14d, -512(%rbp)
.LVL176:
.L191:
.LBB150:
.LBB149:
	.loc 1 97 0
	movl	$0, -232(%rbp)
	movl	-56(%rbp), %r8d
	addl	-256(%rbp), %r12d
	movq	$0, -352(%rbp)
	movl	-388(%rbp), %edx
	movl	-232(%rbp), %r10d
	cmpl	%r8d, %r12d
	movl	%r12d, -396(%rbp)
	cmovle	%r12d, %r8d
	addl	%r12d, %edx
	movl	%edx, -508(%rbp)
	movl	%r8d, -236(%rbp)
.LVL177:
.L166:
.LBB148:
.LBB147:
	.loc 1 99 0
	addl	-256(%rbp), %r10d
	movl	-56(%rbp), %r9d
.LBB145:
	.loc 1 102 0
	movl	-224(%rbp), %r11d
.LBE145:
	.loc 1 99 0
	movl	%r10d, -276(%rbp)
	cmpl	%r9d, %r10d
	cmovle	%r10d, %r9d
	movl	%r9d, -240(%rbp)
.LVL178:
.LBB146:
	.loc 1 102 0
	cmpl	%r11d, -264(%rbp)
	jle	.L170
	movq	-296(%rbp), %r14
	movl	-512(%rbp), %esi
	movq	-480(%rbp), %r12
	movl	-356(%rbp), %ebx
	movq	-384(%rbp), %r13
	movq	%r14, -288(%rbp)
	movq	%r15, %r14
	movl	-224(%rbp), %r10d
	movl	%esi, -280(%rbp)
	movl	-236(%rbp), %edi
	movq	%r12, -376(%rbp)
	subl	-228(%rbp), %edi
	movl	%ebx, -360(%rbp)
	movl	-276(%rbp), %eax
	movq	%r13, -368(%rbp)
	addl	-388(%rbp), %eax
	movl	%r10d, -248(%rbp)
	movl	-240(%rbp), %ecx
	subl	-232(%rbp), %ecx
	movl	%edi, -472(%rbp)
	movl	%eax, -500(%rbp)
	movl	%ecx, -504(%rbp)
.LVL179:
.L169:
.LBB144:
	.loc 1 103 0
	movl	-280(%rbp), %r15d
	movl	-220(%rbp), %r8d
.LBB142:
	.loc 1 104 0
	movl	-228(%rbp), %r9d
.LBE142:
	.loc 1 103 0
	cmpl	%r8d, %r15d
	cmovle	%r15d, %r8d
	movl	%r8d, %edx
.LVL180:
.LBB143:
	.loc 1 104 0
	cmpl	%r9d, -236(%rbp)
	jle	.L173
	movslq	-360(%rbp), %r11
	movq	-80(%rbp), %r10
	leal	-1(%r8), %r15d
	movq	%r14, %r8
	movl	%edx, %r14d
	movq	-352(%rbp), %rbx
	movl	%r15d, -148(%rbp)
	movq	%r8, %r15
	movl	-508(%rbp), %esi
	movl	-472(%rbp), %r12d
	leaq	(%r10,%r11,8), %rdi
	movq	-368(%rbp), %rax
	addq	-376(%rbp), %rdi
	leaq	(%r11,%rbx), %r13
	movq	-288(%rbp), %rcx
	movq	%r13, -496(%rbp)
	salq	$3, %r13
	movl	%esi, -244(%rbp)
	movl	%r12d, -308(%rbp)
	movq	%r13, -448(%rbp)
	movq	%rdi, -456(%rbp)
	movq	%rax, -216(%rbp)
	movq	%rcx, -208(%rbp)
.LVL181:
.L172:
.LBB141:
	.loc 1 105 0
	movl	-308(%rbp), %edx
	movl	-220(%rbp), %r9d
.LBB139:
	.loc 1 106 0
	movl	-232(%rbp), %r11d
.LBE139:
	.loc 1 105 0
	cmpl	%r9d, %edx
	cmovle	%edx, %r9d
	movl	%r9d, -136(%rbp)
.LVL182:
.LBB140:
	.loc 1 106 0
	cmpl	%r11d, -240(%rbp)
	jle	.L190
	movq	-208(%rbp), %rsi
	movl	-504(%rbp), %r13d
	movl	-500(%rbp), %ebx
	movq	-496(%rbp), %r10
	movq	%rsi, %r12
	movq	%rsi, %rdi
	subq	-80(%rbp), %r12
	subq	-456(%rbp), %rdi
	movl	%r13d, -312(%rbp)
	movq	%r15, %r13
	movl	%r14d, %r15d
	movq	-448(%rbp), %rax
	movl	%ebx, -252(%rbp)
	movq	%r10, -320(%rbp)
	movq	%r12, -144(%rbp)
	movq	%rdi, -464(%rbp)
	movq	%rax, -112(%rbp)
.LVL183:
.L189:
.LBB138:
	.loc 1 107 0 discriminator 3
	movl	-312(%rbp), %r14d
	movl	-220(%rbp), %ecx
	cmpl	%ecx, %r14d
	cmovle	%r14d, %ecx
	movl	%ecx, -152(%rbp)
.LVL184:
.LBB137:
.LBB136:
	.loc 1 33 0 discriminator 3
	testl	%ecx, %ecx
	jle	.L174
	movq	-112(%rbp), %r8
	.loc 1 33 0 is_stmt 0
	movl	$0, -124(%rbp)
	movq	-96(%rbp), %r14
	movq	-320(%rbp), %r11
	movq	%r8, %rdx
	addq	-464(%rbp), %rdx
	addq	-488(%rbp), %rdx
	addq	%r8, %r14
	movq	%r11, -192(%rbp)
	movq	%rdx, -200(%rbp)
.LVL185:
	.p2align 4,,10
	.p2align 3
.L175:
.LBB135:
	.loc 1 34 0 is_stmt 1
	movl	-136(%rbp), %esi
	testl	%esi, %esi
	jle	.L188
	movq	-216(%rbp), %r12
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movq	-208(%rbp), %rcx
	movl	%eax, -52(%rbp)
	movq	-200(%rbp), %rdi
	movq	%r12, -88(%rbp)
	movq	%rcx, -64(%rbp)
	jmp	.L187
.LVL186:
	.p2align 4,,10
	.p2align 3
.L231:
.LBB132:
.LBB130:
.LBB124:
	.loc 1 40 0
	vmovsd	(%rcx), %xmm0
	vmulsd	(%r14), %xmm0, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
.LVL187:
	cmpl	$1, %r12d
	je	.L195
.LVL188:
	movq	-72(%rbp), %r8
	vmovsd	8(%rcx), %xmm3
	vmulsd	(%r14,%r8,8), %xmm3, %xmm4
	vaddsd	%xmm4, %xmm2, %xmm2
.LVL189:
	cmpl	$2, %r12d
	je	.L196
.LVL190:
	movq	-168(%rbp), %rdx
	vmovsd	16(%rcx), %xmm5
	vmulsd	(%r14,%rdx,8), %xmm5, %xmm6
	vaddsd	%xmm6, %xmm2, %xmm2
.LVL191:
	cmpl	$3, %r12d
	je	.L197
.LVL192:
	movq	-184(%rbp), %r9
	vmovsd	24(%rcx), %xmm7
	vmulsd	(%r14,%r9,8), %xmm7, %xmm8
	vaddsd	%xmm8, %xmm2, %xmm2
.LVL193:
	cmpl	$4, %r12d
	je	.L198
.LVL194:
	movq	-176(%rbp), %r11
	vmovsd	32(%rcx), %xmm9
	vmulsd	(%r14,%r11,8), %xmm9, %xmm10
	vaddsd	%xmm10, %xmm2, %xmm2
.LVL195:
	cmpl	$6, %r12d
	jne	.L199
.LVL196:
	movq	-160(%rbp), %rsi
.LBE124:
	.loc 1 37 0
	movl	$6, %edx
.LBB125:
	.loc 1 40 0
	vmovsd	40(%rcx), %xmm11
	vmulsd	(%r14,%rsi,8), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm2, %xmm2
.LVL197:
.L179:
	cmpl	%r12d, %r15d
	je	.L176
.L178:
	movl	%r15d, %esi
	movl	-148(%rbp), %r9d
	movl	%r12d, %r8d
	subl	%r12d, %esi
	movl	%esi, -132(%rbp)
	subl	$4, %esi
	shrl	$2, %esi
	leal	1(%rsi), %r10d
	subl	%r12d, %r9d
	leal	0(,%r10,4), %eax
	movl	%eax, -128(%rbp)
	cmpl	$2, %r9d
	jbe	.L181
	movq	-72(%rbp), %rax
	andl	$3, %esi
.LVL198:
	movq	-80(%rbp), %r11
	imulq	%r8, %rax
	addq	-88(%rbp), %r8
	addq	-192(%rbp), %rax
	leaq	(%r11,%r8,8), %r9
	.loc 1 38 0
	movq	-120(%rbp), %r8
	leaq	0(%r13,%rax,8), %rax
	addq	-96(%rbp), %rax
	movq	%r9, %r12
	addq	$32, %r9
	vmovsd	(%rax,%r8), %xmm15
	movl	$1, %r8d
	vmovsd	(%rax,%r13), %xmm13
	vmovhpd	(%rax), %xmm15, %xmm0
	vmovhpd	(%rax,%r13,2), %xmm13, %xmm14
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm14, %ymm0, %ymm1
	.loc 1 40 0
	vmulpd	-32(%r9), %ymm1, %ymm0
	cmpl	%r10d, %r8d
	jnb	.L225
	testl	%esi, %esi
	je	.L227
	cmpl	$1, %esi
	je	.L219
	cmpl	$2, %esi
	je	.L220
	.loc 1 38 0
	movq	-120(%rbp), %rsi
	leaq	64(%r12), %r9
	movl	$2, %r8d
	vmovsd	(%rax,%r13), %xmm3
	vmovhpd	(%rax,%r13,2), %xmm3, %xmm4
	vmovsd	(%rax,%rsi), %xmm5
	vmovhpd	(%rax), %xmm5, %xmm6
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm4, %ymm6, %ymm7
	.loc 1 40 0
	vmulpd	32(%r12), %ymm7, %ymm8
	vaddpd	%ymm8, %ymm0, %ymm0
.L220:
	.loc 1 38 0
	movq	-120(%rbp), %r11
	addl	$1, %r8d
	addq	$32, %r9
	vmovsd	(%rax,%r13), %xmm9
	vmovhpd	(%rax,%r13,2), %xmm9, %xmm10
	vmovsd	(%rax,%r11), %xmm11
	vmovhpd	(%rax), %xmm11, %xmm12
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm10, %ymm12, %ymm13
	.loc 1 40 0
	vmulpd	-32(%r9), %ymm13, %ymm14
	vaddpd	%ymm14, %ymm0, %ymm0
.L219:
	.loc 1 38 0
	movq	-120(%rbp), %rsi
	addl	$1, %r8d
	addq	$32, %r9
	vmovsd	(%rax,%r13), %xmm15
	vmovhpd	(%rax,%r13,2), %xmm15, %xmm1
	vmovsd	(%rax,%rsi), %xmm3
	vmovhpd	(%rax), %xmm3, %xmm4
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm1, %ymm4, %ymm5
	.loc 1 40 0
	vmulpd	-32(%r9), %ymm5, %ymm6
	vaddpd	%ymm6, %ymm0, %ymm0
	cmpl	%r10d, %r8d
	jnb	.L225
	movl	-52(%rbp), %r11d
	movq	-64(%rbp), %r12
.L182:
	.loc 1 38 0
	vmovsd	(%rax,%r13), %xmm7
	addl	$4, %r8d
	subq	$-128, %r9
	vmovsd	(%rax,%rsi), %xmm9
	vmovhpd	(%rax,%r13,2), %xmm7, %xmm8
	vmovhpd	(%rax), %xmm9, %xmm10
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm8, %ymm10, %ymm11
	.loc 1 40 0
	vmulpd	-128(%r9), %ymm11, %ymm12
	vaddpd	%ymm12, %ymm0, %ymm13
	.loc 1 38 0
	vmovsd	(%rax,%r13), %xmm14
	vmovsd	(%rax,%rsi), %xmm1
	vmovhpd	(%rax,%r13,2), %xmm14, %xmm15
	vmovhpd	(%rax), %xmm1, %xmm3
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm15, %ymm3, %ymm4
	.loc 1 40 0
	vmulpd	-96(%r9), %ymm4, %ymm5
	vaddpd	%ymm5, %ymm13, %ymm8
	.loc 1 38 0
	vmovsd	(%rax,%r13), %xmm6
	vmovsd	(%rax,%rsi), %xmm7
	vmovhpd	(%rax,%r13,2), %xmm6, %xmm0
	vmovhpd	(%rax), %xmm7, %xmm9
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm0, %ymm9, %ymm10
	.loc 1 40 0
	vmulpd	-64(%r9), %ymm10, %ymm11
	vaddpd	%ymm11, %ymm8, %ymm12
	.loc 1 38 0
	vmovsd	(%rax,%r13), %xmm13
	vmovsd	(%rax,%rsi), %xmm15
	vmovhpd	(%rax,%r13,2), %xmm13, %xmm14
	vmovhpd	(%rax), %xmm15, %xmm1
	addq	-104(%rbp), %rax
	vinsertf128	$0x1, %xmm14, %ymm1, %ymm3
	.loc 1 40 0
	vmulpd	-32(%r9), %ymm3, %ymm4
	vaddpd	%ymm4, %ymm12, %ymm0
	cmpl	%r10d, %r8d
	jb	.L182
	movl	%r11d, -52(%rbp)
.LVL199:
	movq	%r12, -64(%rbp)
	.p2align 4,,10
	.p2align 3
.L225:
	vhaddpd	%ymm0, %ymm0, %ymm5
	movl	-128(%rbp), %r10d
	vperm2f128	$1, %ymm5, %ymm5, %ymm8
	vaddpd	%ymm8, %ymm5, %ymm6
	addl	%r10d, %edx
	vaddsd	%xmm6, %xmm2, %xmm2
	cmpl	-132(%rbp), %r10d
	je	.L176
.L181:
.LVL200:
	.loc 1 38 0
	movl	-56(%rbp), %r10d
	movl	-124(%rbp), %r9d
	.loc 1 39 0
	leal	(%rdx,%rbx), %r12d
	.loc 1 38 0
	movq	-112(%rbp), %r11
	movl	%r10d, %eax
	imull	%edx, %eax
.LVL201:
	movl	%r9d, %r8d
	addl	%eax, %r8d
	movslq	%r8d, %rsi
.LVL202:
	leaq	(%r11,%rsi,8), %r8
	.loc 1 40 0
	movq	-96(%rbp), %r11
.LVL203:
	.loc 1 39 0
	movslq	%r12d, %rsi
.LVL204:
	movq	-144(%rbp), %r12
	.loc 1 40 0
	vmovsd	(%r11,%r8), %xmm0
	movq	-80(%rbp), %r8
	.loc 1 39 0
	leaq	(%r12,%rsi,8), %rsi
.LVL205:
	.loc 1 40 0
	vmulsd	(%r8,%rsi), %xmm0, %xmm7
.LBE125:
	.loc 1 37 0
	leal	1(%rdx), %esi
.LBB126:
	.loc 1 40 0
	vaddsd	%xmm7, %xmm2, %xmm2
.LVL206:
.LBE126:
	.loc 1 37 0
	cmpl	%esi, %r15d
	jle	.L176
.LBB127:
	.loc 1 38 0
	addl	%r10d, %eax
.LVL207:
	movq	-112(%rbp), %r10
	.loc 1 39 0
	addl	%ebx, %esi
.LVL208:
.LBE127:
	.loc 1 37 0
	addl	$2, %edx
.LVL209:
.LBB128:
	.loc 1 38 0
	leal	(%r9,%rax), %r9d
.LVL210:
	.loc 1 39 0
	movslq	%esi, %rsi
.LVL211:
	leaq	(%r12,%rsi,8), %r12
	.loc 1 38 0
	movslq	%r9d, %r8
.LVL212:
	leaq	(%r10,%r8,8), %r9
	.loc 1 40 0
	vmovsd	(%r11,%r9), %xmm9
	movq	-80(%rbp), %r11
	vmulsd	(%r11,%r12), %xmm9, %xmm10
	vaddsd	%xmm10, %xmm2, %xmm2
.LVL213:
.LBE128:
	.loc 1 37 0
	cmpl	%edx, %r15d
	jle	.L176
.LVL214:
.LBB129:
	.loc 1 38 0
	addl	-56(%rbp), %eax
.LVL215:
	.loc 1 39 0
	addl	%ebx, %edx
.LVL216:
	.loc 1 38 0
	addl	-124(%rbp), %eax
	.loc 1 39 0
	movslq	%edx, %rdx
	.loc 1 40 0
	movq	-96(%rbp), %rsi
	movq	-80(%rbp), %r12
	.loc 1 38 0
	cltq
	leaq	(%r10,%rax,8), %rax
	.loc 1 39 0
	movq	-144(%rbp), %r10
	.loc 1 40 0
	vmovsd	(%rsi,%rax), %xmm11
	.loc 1 39 0
	leaq	(%r10,%rdx,8), %r9
	.loc 1 40 0
	vmulsd	(%r12,%r9), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm2, %xmm2
.LVL217:
.L176:
.LBE129:
.LBE130:
.LBE132:
	.loc 1 34 0
	addl	$1, -52(%rbp)
.LBB133:
	.loc 1 42 0
	vmovsd	%xmm2, (%rdi)
	addq	%r13, %rcx
	addq	%r13, %rdi
.LBE133:
	.loc 1 34 0
	movl	-52(%rbp), %r11d
.LVL218:
	movl	-136(%rbp), %eax
	movq	-72(%rbp), %r8
	addq	%r13, -64(%rbp)
	addq	%r8, -88(%rbp)
	addl	-56(%rbp), %ebx
	cmpl	%eax, %r11d
	je	.L188
.LVL219:
.L187:
.LBB134:
	.loc 1 35 0
	vmovsd	(%rdi), %xmm2
.LVL220:
.LBB131:
	.loc 1 37 0
	testl	%r15d, %r15d
	jle	.L176
	movq	-64(%rbp), %r12
	andl	$31, %r12d
	shrq	$3, %r12
	negq	%r12
	andl	$3, %r12d
	cmpl	%r15d, %r12d
	cmova	%r15d, %r12d
	cmpl	$6, %r15d
	cmovbe	%r15d, %r12d
	testl	%r12d, %r12d
	jne	.L231
	xorl	%edx, %edx
	jmp	.L178
.LVL221:
	.p2align 4,,10
	.p2align 3
.L198:
	movl	$4, %edx
	jmp	.L179
.LVL222:
	.p2align 4,,10
	.p2align 3
.L197:
	movl	$3, %edx
.LVL223:
	jmp	.L179
.LVL224:
	.p2align 4,,10
	.p2align 3
.L196:
	movl	$2, %edx
	jmp	.L179
.LVL225:
	.p2align 4,,10
	.p2align 3
.L195:
	movl	$1, %edx
	jmp	.L179
.LVL226:
	.p2align 4,,10
	.p2align 3
.L199:
	movl	$5, %edx
	jmp	.L179
.LVL227:
	.p2align 4,,10
	.p2align 3
.L188:
.LBE131:
.LBE134:
.LBE135:
	.loc 1 33 0
	addl	$1, -124(%rbp)
.LVL228:
	addq	$8, %r14
	movl	-124(%rbp), %ecx
.LVL229:
	addq	$8, -200(%rbp)
	addq	$1, -192(%rbp)
	cmpl	-152(%rbp), %ecx
	jne	.L175
.LVL230:
.L174:
	movl	-220(%rbp), %edi
	addl	%edi, -252(%rbp)
	movl	-252(%rbp), %ebx
	movl	-260(%rbp), %r14d
	movq	-344(%rbp), %rdx
	movq	-328(%rbp), %r10
	addl	%r14d, -312(%rbp)
	subl	%edi, %ebx
	addq	%rdx, -320(%rbp)
	addq	%r10, -112(%rbp)
.LBE136:
.LBE137:
.LBE138:
	.loc 1 106 0
	cmpl	%ebx, -240(%rbp)
	jg	.L189
	movl	%r15d, %r14d
	movq	%r13, %r15
.LVL231:
.L190:
	movl	-220(%rbp), %r13d
	addl	%r13d, -244(%rbp)
	movl	-244(%rbp), %r9d
	movl	-260(%rbp), %esi
	movq	-408(%rbp), %r12
	movq	-416(%rbp), %r11
	addl	%esi, -308(%rbp)
	subl	%r13d, %r9d
	addq	%r12, -208(%rbp)
	addq	%r11, -216(%rbp)
.LBE140:
.LBE141:
	.loc 1 104 0
	cmpl	%r9d, -236(%rbp)
	jg	.L172
	movq	%r15, %r14
.LVL232:
.L173:
	movq	-328(%rbp), %rdi
.LBE143:
.LBE144:
	.loc 1 102 0
	movl	-220(%rbp), %r8d
	movl	-260(%rbp), %ecx
	addl	%r8d, -248(%rbp)
.LVL233:
	movq	-344(%rbp), %rbx
	movl	-468(%rbp), %edx
	movl	-248(%rbp), %eax
.LVL234:
	addl	%ecx, -280(%rbp)
.LVL235:
	addq	%rdi, -288(%rbp)
	addq	%rbx, -368(%rbp)
	addl	%edx, -360(%rbp)
	addq	%rdi, -376(%rbp)
	cmpl	%eax, -264(%rbp)
	jg	.L169
	movl	-276(%rbp), %r10d
	movq	%r14, %r15
.LVL236:
.L170:
	movq	-304(%rbp), %r13
	movl	%r10d, -232(%rbp)
	addq	%r13, -352(%rbp)
.LBE146:
.LBE147:
	.loc 1 98 0
	cmpl	%r10d, -56(%rbp)
	jg	.L166
.LVL237:
	movl	-396(%rbp), %r12d
	movq	-424(%rbp), %r9
	movq	-440(%rbp), %rsi
	addq	%r9, -296(%rbp)
	addq	%rsi, -384(%rbp)
	movl	%r12d, -228(%rbp)
.LBE148:
.LBE149:
	.loc 1 96 0
	cmpl	%r12d, -56(%rbp)
	jg	.L191
.LVL238:
	movl	-392(%rbp), %eax
	movl	-400(%rbp), %r11d
	movq	-432(%rbp), %r14
	movq	-304(%rbp), %r8
	addl	%r11d, -356(%rbp)
	movl	%eax, -224(%rbp)
	addq	%r14, -336(%rbp)
	addq	%r8, -272(%rbp)
.LBE150:
.LBE107:
	.loc 1 94 0
	cmpl	%eax, -56(%rbp)
	jg	.L192
	vzeroupper
.LVL239:
.L229:
.LBE106:
	.loc 1 118 0
	addq	$480, %rsp
	popq	%rbx
	popq	%rcx
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
.LVL240:
	leaq	-8(%rcx), %rsp
	.cfi_def_cfa 7, 8
.LVL241:
	ret
.LVL242:
	.p2align 4,,10
	.p2align 3
.L227:
	.cfi_restore_state
	movl	-52(%rbp), %r11d
	movq	-64(%rbp), %r12
	movq	-120(%rbp), %rsi
	jmp	.L182
	.cfi_endproc
.LFE2253:
	.size	square_dgemm_l1l2, .-square_dgemm_l1l2
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.globl	L2_BLOCK_SIZE
	.section	.rodata
	.align 4
	.type	L2_BLOCK_SIZE, @object
	.size	L2_BLOCK_SIZE, 4
L2_BLOCK_SIZE:
	.long	160
	.globl	L1_BLOCK_SIZE
	.align 4
	.type	L1_BLOCK_SIZE, @object
	.size	L1_BLOCK_SIZE, 4
L1_BLOCK_SIZE:
	.long	32
	.globl	dgemm_desc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"mydgemm"
	.data
	.align 8
	.type	dgemm_desc, @object
	.size	dgemm_desc, 8
dgemm_desc:
	.quad	.LC5
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9fd
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF68
	.byte	0x1
	.long	.LASF69
	.long	.LASF70
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF3
	.uleb128 0x4
	.long	.LASF10
	.byte	0x2
	.byte	0xd4
	.long	0x5b
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF11
	.byte	0x3
	.byte	0x83
	.long	0x7e
	.uleb128 0x4
	.long	.LASF12
	.byte	0x3
	.byte	0x84
	.long	0x7e
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x3b
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF15
	.uleb128 0x7
	.long	.LASF45
	.byte	0xd8
	.byte	0x4
	.byte	0xf5
	.long	0x238
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0xf6
	.long	0x2d
	.byte	0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0xfb
	.long	0xa4
	.byte	0x8
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.byte	0xfc
	.long	0xa4
	.byte	0x10
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.byte	0xfd
	.long	0xa4
	.byte	0x18
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.byte	0xfe
	.long	0xa4
	.byte	0x20
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.byte	0xff
	.long	0xa4
	.byte	0x28
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.value	0x100
	.long	0xa4
	.byte	0x30
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.value	0x101
	.long	0xa4
	.byte	0x38
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.value	0x102
	.long	0xa4
	.byte	0x40
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.value	0x104
	.long	0xa4
	.byte	0x48
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.value	0x105
	.long	0xa4
	.byte	0x50
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.value	0x106
	.long	0xa4
	.byte	0x58
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.value	0x108
	.long	0x270
	.byte	0x60
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.value	0x10a
	.long	0x276
	.byte	0x68
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.value	0x10c
	.long	0x2d
	.byte	0x70
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.value	0x110
	.long	0x2d
	.byte	0x74
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.value	0x112
	.long	0x85
	.byte	0x78
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.value	0x116
	.long	0x69
	.byte	0x80
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.value	0x117
	.long	0x77
	.byte	0x82
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.value	0x118
	.long	0x27c
	.byte	0x83
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.value	0x11c
	.long	0x28c
	.byte	0x88
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.value	0x125
	.long	0x90
	.byte	0x90
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.value	0x12e
	.long	0xa2
	.byte	0x98
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.value	0x12f
	.long	0xa2
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.value	0x130
	.long	0xa2
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.value	0x131
	.long	0xa2
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.value	0x132
	.long	0x50
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.value	0x134
	.long	0x2d
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.value	0x136
	.long	0x292
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF71
	.byte	0x4
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF46
	.byte	0x18
	.byte	0x4
	.byte	0xa0
	.long	0x270
	.uleb128 0x8
	.long	.LASF47
	.byte	0x4
	.byte	0xa1
	.long	0x270
	.byte	0
	.uleb128 0x8
	.long	.LASF48
	.byte	0x4
	.byte	0xa2
	.long	0x276
	.byte	0x8
	.uleb128 0x8
	.long	.LASF49
	.byte	0x4
	.byte	0xa6
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23f
	.uleb128 0x6
	.byte	0x8
	.long	0xb8
	.uleb128 0xb
	.long	0x3b
	.long	0x28c
	.uleb128 0xc
	.long	0x9b
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0xb
	.long	0x3b
	.long	0x2a2
	.uleb128 0xc
	.long	0x9b
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a8
	.uleb128 0xd
	.long	0x3b
	.uleb128 0xe
	.long	.LASF53
	.byte	0x1
	.byte	0xc
	.quad	.LFB2249
	.quad	.LFE2249-.LFB2249
	.uleb128 0x1
	.byte	0x9c
	.long	0x33c
	.uleb128 0xf
	.string	"m"
	.byte	0x1
	.byte	0xc
	.long	0x2d
	.long	.LLST0
	.uleb128 0x10
	.string	"n"
	.byte	0x1
	.byte	0xc
	.long	0x2d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xf
	.string	"A"
	.byte	0x1
	.byte	0xc
	.long	0x33c
	.long	.LLST1
	.uleb128 0xf
	.string	"At"
	.byte	0x1
	.byte	0xc
	.long	0x33c
	.long	.LLST2
	.uleb128 0x11
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xe
	.long	0x2d
	.long	.LLST3
	.uleb128 0x11
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x12
	.string	"j"
	.byte	0x1
	.byte	0x10
	.long	0x2d
	.long	.LLST4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb1
	.uleb128 0x13
	.long	.LASF72
	.byte	0x1
	.byte	0x20
	.byte	0x1
	.long	0x3e8
	.uleb128 0x14
	.string	"M"
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x14
	.string	"N"
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x14
	.string	"K"
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x15
	.long	.LASF50
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x15
	.long	.LASF52
	.byte	0x1
	.byte	0x20
	.long	0x2d
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x20
	.long	0x3e8
	.uleb128 0x14
	.string	"B"
	.byte	0x1
	.byte	0x20
	.long	0x3e8
	.uleb128 0x14
	.string	"C"
	.byte	0x1
	.byte	0x20
	.long	0x33c
	.uleb128 0x16
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x21
	.long	0x2d
	.uleb128 0x16
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.byte	0x22
	.long	0x2d
	.uleb128 0x16
	.uleb128 0x17
	.string	"c"
	.byte	0x1
	.byte	0x23
	.long	0xb1
	.uleb128 0x16
	.uleb128 0x17
	.string	"k"
	.byte	0x1
	.byte	0x25
	.long	0x2d
	.uleb128 0x16
	.uleb128 0x17
	.string	"av"
	.byte	0x1
	.byte	0x26
	.long	0xb1
	.uleb128 0x17
	.string	"bv"
	.byte	0x1
	.byte	0x27
	.long	0xb1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ee
	.uleb128 0xd
	.long	0xb1
	.uleb128 0x18
	.long	0x342
	.quad	.LFB2250
	.quad	.LFE2250-.LFB2250
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c9
	.uleb128 0x19
	.long	0x34e
	.long	.LLST5
	.uleb128 0x19
	.long	0x357
	.long	.LLST6
	.uleb128 0x19
	.long	0x360
	.long	.LLST7
	.uleb128 0x19
	.long	0x369
	.long	.LLST8
	.uleb128 0x19
	.long	0x374
	.long	.LLST9
	.uleb128 0x19
	.long	0x37f
	.long	.LLST10
	.uleb128 0x1a
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.long	0x393
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.long	0x39c
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x1b
	.long	0x3a6
	.long	.LLST11
	.uleb128 0x11
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x1b
	.long	0x3b0
	.long	.LLST12
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0
	.uleb128 0x1b
	.long	0x3ba
	.long	.LLST13
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x40
	.uleb128 0x1b
	.long	0x3c4
	.long	.LLST14
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x80
	.uleb128 0x1b
	.long	0x3ce
	.long	.LLST15
	.uleb128 0x1b
	.long	0x3d8
	.long	.LLST16
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF54
	.byte	0x1
	.byte	0x36
	.quad	.LFB2251
	.quad	.LFE2251-.LFB2251
	.uleb128 0x1
	.byte	0x9c
	.long	0x6dc
	.uleb128 0xf
	.string	"M"
	.byte	0x1
	.byte	0x36
	.long	0x2d
	.long	.LLST17
	.uleb128 0xf
	.string	"N"
	.byte	0x1
	.byte	0x36
	.long	0x2d
	.long	.LLST18
	.uleb128 0xf
	.string	"K"
	.byte	0x1
	.byte	0x36
	.long	0x2d
	.long	.LLST19
	.uleb128 0xf
	.string	"A"
	.byte	0x1
	.byte	0x36
	.long	0x33c
	.long	.LLST20
	.uleb128 0xf
	.string	"B"
	.byte	0x1
	.byte	0x36
	.long	0x33c
	.long	.LLST21
	.uleb128 0xf
	.string	"C"
	.byte	0x1
	.byte	0x36
	.long	0x33c
	.long	.LLST22
	.uleb128 0x11
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.uleb128 0x12
	.string	"k2"
	.byte	0x1
	.byte	0x39
	.long	0x2d
	.long	.LLST23
	.uleb128 0x11
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x1d
	.long	.LASF55
	.byte	0x1
	.byte	0x3a
	.long	0x2d
	.long	.LLST24
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x100
	.uleb128 0x12
	.string	"j2"
	.byte	0x1
	.byte	0x3b
	.long	0x2d
	.long	.LLST25
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x140
	.uleb128 0x1d
	.long	.LASF56
	.byte	0x1
	.byte	0x3c
	.long	0x2d
	.long	.LLST26
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x170
	.uleb128 0x12
	.string	"i2"
	.byte	0x1
	.byte	0x3d
	.long	0x2d
	.long	.LLST27
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x1b0
	.uleb128 0x1d
	.long	.LASF57
	.byte	0x1
	.byte	0x3e
	.long	0x2d
	.long	.LLST28
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x1e0
	.uleb128 0x12
	.string	"k1"
	.byte	0x1
	.byte	0x41
	.long	0x2d
	.long	.LLST29
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x220
	.uleb128 0x1d
	.long	.LASF58
	.byte	0x1
	.byte	0x42
	.long	0x2d
	.long	.LLST30
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x220
	.uleb128 0x12
	.string	"j1"
	.byte	0x1
	.byte	0x43
	.long	0x2d
	.long	.LLST31
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x250
	.uleb128 0x1d
	.long	.LASF59
	.byte	0x1
	.byte	0x44
	.long	0x2d
	.long	.LLST32
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x250
	.uleb128 0x12
	.string	"i1"
	.byte	0x1
	.byte	0x45
	.long	0x2d
	.long	.LLST33
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x280
	.uleb128 0x1d
	.long	.LASF60
	.byte	0x1
	.byte	0x46
	.long	0x2d
	.long	.LLST34
	.uleb128 0x1e
	.long	0x342
	.quad	.LBB55
	.long	.Ldebug_ranges0+0x280
	.byte	0x1
	.byte	0x48
	.uleb128 0x1f
	.long	0x39c
	.uleb128 0x1f
	.long	0x393
	.uleb128 0x1f
	.long	0x38a
	.uleb128 0x1f
	.long	0x37f
	.uleb128 0x1f
	.long	0x374
	.uleb128 0x19
	.long	0x369
	.long	.LLST34
	.uleb128 0x1f
	.long	0x360
	.uleb128 0x1f
	.long	0x357
	.uleb128 0x1f
	.long	0x34e
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x280
	.uleb128 0x1b
	.long	0x3a6
	.long	.LLST36
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x2b0
	.uleb128 0x1b
	.long	0x3b0
	.long	.LLST37
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x2e0
	.uleb128 0x1b
	.long	0x3ba
	.long	.LLST38
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x320
	.uleb128 0x1b
	.long	0x3c4
	.long	.LLST39
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x360
	.uleb128 0x1b
	.long	0x3ce
	.long	.LLST40
	.uleb128 0x1b
	.long	0x3d8
	.long	.LLST41
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF61
	.byte	0x1
	.byte	0x54
	.quad	.LFB2252
	.quad	.LFE2252-.LFB2252
	.uleb128 0x1
	.byte	0x9c
	.long	0x768
	.uleb128 0xf
	.string	"lda"
	.byte	0x1
	.byte	0x54
	.long	0x2d
	.long	.LLST42
	.uleb128 0xf
	.string	"A"
	.byte	0x1
	.byte	0x54
	.long	0x33c
	.long	.LLST43
	.uleb128 0xf
	.string	"B"
	.byte	0x1
	.byte	0x54
	.long	0x33c
	.long	.LLST44
	.uleb128 0xf
	.string	"C"
	.byte	0x1
	.byte	0x54
	.long	0x33c
	.long	.LLST45
	.uleb128 0x20
	.quad	.LVL162
	.long	0x4c9
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF62
	.byte	0x1
	.byte	0x59
	.quad	.LFB2253
	.quad	.LFE2253-.LFB2253
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a6
	.uleb128 0xf
	.string	"lda"
	.byte	0x1
	.byte	0x59
	.long	0x2d
	.long	.LLST46
	.uleb128 0xf
	.string	"A"
	.byte	0x1
	.byte	0x59
	.long	0x33c
	.long	.LLST47
	.uleb128 0xf
	.string	"B"
	.byte	0x1
	.byte	0x59
	.long	0x33c
	.long	.LLST48
	.uleb128 0xf
	.string	"C"
	.byte	0x1
	.byte	0x59
	.long	0x33c
	.long	.LLST49
	.uleb128 0xf
	.string	"L1"
	.byte	0x1
	.byte	0x59
	.long	0x2d
	.long	.LLST50
	.uleb128 0xf
	.string	"L2"
	.byte	0x1
	.byte	0x59
	.long	0x2d
	.long	.LLST51
	.uleb128 0x12
	.string	"M"
	.byte	0x1
	.byte	0x5a
	.long	0x2d
	.long	.LLST52
	.uleb128 0x12
	.string	"N"
	.byte	0x1
	.byte	0x5b
	.long	0x2d
	.long	.LLST52
	.uleb128 0x12
	.string	"K"
	.byte	0x1
	.byte	0x5c
	.long	0x2d
	.long	.LLST52
	.uleb128 0x11
	.quad	.LBB106
	.quad	.LBE106-.LBB106
	.uleb128 0x12
	.string	"k2"
	.byte	0x1
	.byte	0x5e
	.long	0x2d
	.long	.LLST55
	.uleb128 0x11
	.quad	.LBB107
	.quad	.LBE107-.LBB107
	.uleb128 0x1d
	.long	.LASF55
	.byte	0x1
	.byte	0x5f
	.long	0x2d
	.long	.LLST56
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x3e0
	.uleb128 0x12
	.string	"j2"
	.byte	0x1
	.byte	0x60
	.long	0x2d
	.long	.LLST57
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x410
	.uleb128 0x1d
	.long	.LASF56
	.byte	0x1
	.byte	0x61
	.long	0x2d
	.long	.LLST58
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x440
	.uleb128 0x12
	.string	"i2"
	.byte	0x1
	.byte	0x62
	.long	0x2d
	.long	.LLST59
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x470
	.uleb128 0x1d
	.long	.LASF57
	.byte	0x1
	.byte	0x63
	.long	0x2d
	.long	.LLST60
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x4a0
	.uleb128 0x12
	.string	"k1"
	.byte	0x1
	.byte	0x66
	.long	0x2d
	.long	.LLST61
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x4e0
	.uleb128 0x1d
	.long	.LASF58
	.byte	0x1
	.byte	0x67
	.long	0x2d
	.long	.LLST62
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x510
	.uleb128 0x12
	.string	"j1"
	.byte	0x1
	.byte	0x68
	.long	0x2d
	.long	.LLST63
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x550
	.uleb128 0x1d
	.long	.LASF59
	.byte	0x1
	.byte	0x69
	.long	0x2d
	.long	.LLST64
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x580
	.uleb128 0x12
	.string	"i1"
	.byte	0x1
	.byte	0x6a
	.long	0x2d
	.long	.LLST65
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x5c0
	.uleb128 0x1d
	.long	.LASF60
	.byte	0x1
	.byte	0x6b
	.long	0x2d
	.long	.LLST66
	.uleb128 0x1e
	.long	0x342
	.quad	.LBB118
	.long	.Ldebug_ranges0+0x5f0
	.byte	0x1
	.byte	0x6d
	.uleb128 0x1f
	.long	0x39c
	.uleb128 0x1f
	.long	0x393
	.uleb128 0x1f
	.long	0x38a
	.uleb128 0x1f
	.long	0x37f
	.uleb128 0x1f
	.long	0x374
	.uleb128 0x19
	.long	0x369
	.long	.LLST66
	.uleb128 0x1f
	.long	0x360
	.uleb128 0x1f
	.long	0x357
	.uleb128 0x1f
	.long	0x34e
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x5f0
	.uleb128 0x1b
	.long	0x3a6
	.long	.LLST68
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x620
	.uleb128 0x1b
	.long	0x3b0
	.long	.LLST69
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x650
	.uleb128 0x1b
	.long	0x3ba
	.long	.LLST70
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x6a0
	.uleb128 0x1b
	.long	0x3c4
	.long	.LLST71
	.uleb128 0x1c
	.long	.Ldebug_ranges0+0x6e0
	.uleb128 0x1b
	.long	0x3ce
	.long	.LLST72
	.uleb128 0x1b
	.long	0x3d8
	.long	.LLST73
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF63
	.byte	0x5
	.byte	0xa8
	.long	0x276
	.uleb128 0x22
	.long	.LASF64
	.byte	0x5
	.byte	0xa9
	.long	0x276
	.uleb128 0x23
	.long	.LASF65
	.byte	0x1
	.byte	0x6
	.long	0x2a2
	.uleb128 0x9
	.byte	0x3
	.quad	dgemm_desc
	.uleb128 0x23
	.long	.LASF66
	.byte	0x1
	.byte	0x7
	.long	0x9e6
	.uleb128 0x9
	.byte	0x3
	.quad	L1_BLOCK_SIZE
	.uleb128 0xd
	.long	0x2d
	.uleb128 0x23
	.long	.LASF67
	.byte	0x1
	.byte	0x8
	.long	0x9e6
	.uleb128 0x9
	.byte	0x3
	.quad	L2_BLOCK_SIZE
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL2-.Ltext0
	.quad	.LFE2249-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL2-.Ltext0
	.quad	.LFE2249-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL2-.Ltext0
	.quad	.LFE2249-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL1-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL4-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL6-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL10-.Ltext0
	.quad	.LVL11-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL13-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL14-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL15-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL17-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL27-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL34-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -120
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -128
	.quad	.LVL79-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x88
	.byte	0x1c
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL27-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL29-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL27-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL30-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -116
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -124
	.quad	.LVL79-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x84
	.byte	0x1c
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL27-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL33-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -196
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -204
	.quad	.LVL79-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0xd4
	.byte	0x1c
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL27-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL31-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -92
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -100
	.quad	.LVL79-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x6c
	.byte	0x1c
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL27-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL32-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL77-.Ltext0
	.quad	.LFE2250-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL28-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL36-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 1
	.byte	0x9f
	.quad	.LVL75-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x8
	.byte	0x76
	.sleb128 -96
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL37-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL37-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL50-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL67-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL38-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL40-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL44-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL46-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL50-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL55-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL58-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL69-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL37-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.quad	.LVL41-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -160
	.byte	0x6
	.byte	0x22
	.quad	.LVL43-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -152
	.byte	0x6
	.byte	0x22
	.quad	.LVL45-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -168
	.byte	0x6
	.byte	0x22
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -176
	.byte	0x6
	.byte	0x22
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x10
	.byte	0x70
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0xd
	.byte	0x78
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL53-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x10
	.byte	0x70
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL56-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x10
	.byte	0x79
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL59-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0xd
	.byte	0x79
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x19
	.byte	0x76
	.sleb128 -96
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x76
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x21
	.byte	0x71
	.sleb128 -2
	.byte	0x76
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x76
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x24
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x9
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -152
	.byte	0x6
	.byte	0x22
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL37-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 8
	.quad	.LVL41-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 16
	.quad	.LVL43-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 24
	.quad	.LVL45-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 32
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 40
	.quad	.LVL51-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL54-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x11
	.byte	0x7b
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x11
	.byte	0x74
	.sleb128 0
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL57-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	.LVL69-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL80-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL82-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL86-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL87-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL88-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -120
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -128
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x88
	.byte	0x1c
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL80-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL90-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -240
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -248
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x9
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0xa
	.value	0x100
	.byte	0x1c
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL80-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL83-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL89-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -116
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -124
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x84
	.byte	0x1c
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL80-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL85-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 -64
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x48
	.byte	0x1c
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL80-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL90-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -64
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -72
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x50
	.byte	0x1c
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL80-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL84-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -440
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -448
	.quad	.LVL157-.Ltext0
	.quad	.LFE2251-.Ltext0
	.value	0x9
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0xa
	.value	0x1c8
	.byte	0x1c
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL81-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL91-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL92-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -272
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -272
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0xa0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL93-.Ltext0
	.quad	.LVL94-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL94-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -244
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL93-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL95-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -232
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -428
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL96-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL97-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -248
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL96-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL98-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL99-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -268
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -268
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0xa0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL100-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL101-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -252
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL100-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL103-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL105-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -104
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -460
	.byte	0x94
	.byte	0x4
	.byte	0x7b
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL107-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0xc
	.byte	0x76
	.sleb128 -460
	.byte	0x94
	.byte	0x4
	.byte	0x76
	.sleb128 -296
	.byte	0x94
	.byte	0x4
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL107-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -68
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL107-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL108-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL108-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL121-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL139-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL109-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL111-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL113-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL115-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL117-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL121-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL127-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL128-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL129-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL139-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL140-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL142-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL143-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL108-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL110-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -160
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL114-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -176
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL116-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -168
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -152
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x16
	.byte	0x75
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL123-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x19
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x71
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0xd
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL125-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0x1c
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x76
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL130-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x19
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL131-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0xd
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL132-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x19
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL134-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1f
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x76
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL135-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x24
	.byte	0x76
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x24
	.byte	0x76
	.sleb128 -72
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x76
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -88
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x6
	.byte	0x22
	.quad	.LVL140-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -168
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL142-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x7
	.byte	0x7f
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL143-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x7
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL108-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL110-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 16
	.quad	.LVL114-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.quad	.LVL116-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 32
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 40
	.quad	.LVL122-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x16
	.byte	0x72
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x22
	.quad	.LVL125-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0xd
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x22
	.quad	.LVL126-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x16
	.byte	0x72
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x22
	.quad	.LVL129-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0x18
	.byte	0x72
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x32
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -64
	.byte	0x6
	.byte	0x22
	.quad	.LVL140-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	.LVL142-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL143-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL158-.Ltext0
	.quad	.LVL162-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL162-1-.Ltext0
	.quad	.LFE2252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL158-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL161-.Ltext0
	.quad	.LVL162-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL162-1-.Ltext0
	.quad	.LFE2252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL158-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL159-.Ltext0
	.quad	.LVL162-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL162-1-.Ltext0
	.quad	.LFE2252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL158-.Ltext0
	.quad	.LVL160-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL160-.Ltext0
	.quad	.LVL162-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL162-1-.Ltext0
	.quad	.LFE2252-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL163-.Ltext0
	.quad	.LVL166-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL166-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL173-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL239-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL163-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL165-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -96
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -104
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x70
	.byte	0x1c
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -96
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL163-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL173-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -88
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0x60
	.byte	0x1c
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -80
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL163-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL169-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -488
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -496
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x9
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0xa
	.value	0x1f8
	.byte	0x1c
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -488
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL163-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL167-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL170-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL172-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -220
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -228
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0x8
	.byte	0xec
	.byte	0x1c
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -220
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL163-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL168-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL173-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -256
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 -264
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x9
	.byte	0x91
	.sleb128 -8
	.byte	0x9
	.byte	0xe0
	.byte	0x1a
	.byte	0xa
	.value	0x110
	.byte	0x1c
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -256
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL164-.Ltext0
	.quad	.LVL166-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL166-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL173-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	.LVL239-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -56
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL164-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL173-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -224
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -392
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -224
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL174-.Ltext0
	.quad	.LVL175-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL175-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -264
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -264
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL174-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL176-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -228
	.quad	.LVL237-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -396
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -228
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL177-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -236
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -236
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL177-.Ltext0
	.quad	.LVL236-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -232
	.quad	.LVL236-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -276
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -232
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL179-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -240
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -240
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL179-.Ltext0
	.quad	.LVL233-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -248
	.quad	.LVL234-.Ltext0
	.quad	.LVL236-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -248
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL180-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL181-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL183-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL231-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL232-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x21
	.byte	0x76
	.sleb128 -280
	.byte	0x94
	.byte	0x4
	.byte	0x76
	.sleb128 -220
	.byte	0x94
	.byte	0x4
	.byte	0x76
	.sleb128 -280
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x76
	.sleb128 -220
	.byte	0x94
	.byte	0x4
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x2c
	.byte	0x28
	.value	0x1
	.byte	0x16
	.byte	0x13
	.byte	0x9f
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL180-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL182-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL183-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -136
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -136
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL182-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL185-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -152
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -152
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL185-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -124
	.quad	.LVL229-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -124
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL186-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -52
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL219-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -52
	.quad	.LVL242-.Ltext0
	.quad	.LFE2253-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 -52
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL186-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL200-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL220-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL189-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL191-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL193-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL195-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	.LVL200-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL206-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	.LVL209-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL221-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x2
	.byte	0x35
	.byte	0x9f
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL186-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x2
	.byte	0x7e
	.sleb128 0
	.quad	.LVL188-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -72
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL190-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -168
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -184
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -176
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL196-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -160
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL201-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x15
	.byte	0x79
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL202-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0xc
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7b
	.sleb128 0
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL204-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x17
	.byte	0x79
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL210-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1a
	.byte	0x76
	.sleb128 -124
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL212-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0xe
	.byte	0x78
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1f
	.byte	0x76
	.sleb128 -124
	.byte	0x94
	.byte	0x4
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x76
	.sleb128 -56
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL215-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x26
	.byte	0x71
	.sleb128 -2
	.byte	0x76
	.sleb128 -56
	.byte	0x94
	.byte	0x4
	.byte	0x1e
	.byte	0x76
	.sleb128 -56
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x24
	.byte	0x22
	.byte	0x76
	.sleb128 -124
	.byte	0x94
	.byte	0x4
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -112
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -96
	.byte	0x6
	.byte	0x22
	.quad	.LVL221-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x7
	.byte	0x79
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL222-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL223-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x9
	.byte	0x76
	.sleb128 -168
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL224-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x7
	.byte	0x78
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x2
	.byte	0x7e
	.sleb128 0
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x7
	.byte	0x7b
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL186-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL188-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 8
	.quad	.LVL190-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 16
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 24
	.quad	.LVL194-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 32
	.quad	.LVL196-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 40
	.quad	.LVL201-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x17
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL204-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL205-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x17
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL207-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x17
	.byte	0x73
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x19
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL209-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x19
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL211-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 -144
	.byte	0x6
	.byte	0x22
	.byte	0x76
	.sleb128 -80
	.byte	0x6
	.byte	0x22
	.quad	.LVL221-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL224-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB11-.Ltext0
	.quad	.LBE11-.Ltext0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	.LBB23-.Ltext0
	.quad	.LBE23-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	.LBB20-.Ltext0
	.quad	.LBE20-.Ltext0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	.LBB14-.Ltext0
	.quad	.LBE14-.Ltext0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
	.quad	.LBB16-.Ltext0
	.quad	.LBE16-.Ltext0
	.quad	.LBB17-.Ltext0
	.quad	.LBE17-.Ltext0
	.quad	.LBB18-.Ltext0
	.quad	.LBE18-.Ltext0
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB45-.Ltext0
	.quad	.LBE45-.Ltext0
	.quad	.LBB85-.Ltext0
	.quad	.LBE85-.Ltext0
	.quad	.LBB86-.Ltext0
	.quad	.LBE86-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB46-.Ltext0
	.quad	.LBE46-.Ltext0
	.quad	.LBB84-.Ltext0
	.quad	.LBE84-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB47-.Ltext0
	.quad	.LBE47-.Ltext0
	.quad	.LBB82-.Ltext0
	.quad	.LBE82-.Ltext0
	.quad	.LBB83-.Ltext0
	.quad	.LBE83-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB48-.Ltext0
	.quad	.LBE48-.Ltext0
	.quad	.LBB81-.Ltext0
	.quad	.LBE81-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB49-.Ltext0
	.quad	.LBE49-.Ltext0
	.quad	.LBB79-.Ltext0
	.quad	.LBE79-.Ltext0
	.quad	.LBB80-.Ltext0
	.quad	.LBE80-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB50-.Ltext0
	.quad	.LBE50-.Ltext0
	.quad	.LBB78-.Ltext0
	.quad	.LBE78-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB52-.Ltext0
	.quad	.LBE52-.Ltext0
	.quad	.LBB76-.Ltext0
	.quad	.LBE76-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB54-.Ltext0
	.quad	.LBE54-.Ltext0
	.quad	.LBB74-.Ltext0
	.quad	.LBE74-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB57-.Ltext0
	.quad	.LBE57-.Ltext0
	.quad	.LBB71-.Ltext0
	.quad	.LBE71-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB58-.Ltext0
	.quad	.LBE58-.Ltext0
	.quad	.LBB69-.Ltext0
	.quad	.LBE69-.Ltext0
	.quad	.LBB70-.Ltext0
	.quad	.LBE70-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB59-.Ltext0
	.quad	.LBE59-.Ltext0
	.quad	.LBB67-.Ltext0
	.quad	.LBE67-.Ltext0
	.quad	.LBB68-.Ltext0
	.quad	.LBE68-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB60-.Ltext0
	.quad	.LBE60-.Ltext0
	.quad	.LBB61-.Ltext0
	.quad	.LBE61-.Ltext0
	.quad	.LBB62-.Ltext0
	.quad	.LBE62-.Ltext0
	.quad	.LBB63-.Ltext0
	.quad	.LBE63-.Ltext0
	.quad	.LBB64-.Ltext0
	.quad	.LBE64-.Ltext0
	.quad	.LBB65-.Ltext0
	.quad	.LBE65-.Ltext0
	.quad	.LBB66-.Ltext0
	.quad	.LBE66-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB108-.Ltext0
	.quad	.LBE108-.Ltext0
	.quad	.LBB150-.Ltext0
	.quad	.LBE150-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB109-.Ltext0
	.quad	.LBE109-.Ltext0
	.quad	.LBB149-.Ltext0
	.quad	.LBE149-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB110-.Ltext0
	.quad	.LBE110-.Ltext0
	.quad	.LBB148-.Ltext0
	.quad	.LBE148-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB111-.Ltext0
	.quad	.LBE111-.Ltext0
	.quad	.LBB147-.Ltext0
	.quad	.LBE147-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB112-.Ltext0
	.quad	.LBE112-.Ltext0
	.quad	.LBB145-.Ltext0
	.quad	.LBE145-.Ltext0
	.quad	.LBB146-.Ltext0
	.quad	.LBE146-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB113-.Ltext0
	.quad	.LBE113-.Ltext0
	.quad	.LBB144-.Ltext0
	.quad	.LBE144-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB114-.Ltext0
	.quad	.LBE114-.Ltext0
	.quad	.LBB142-.Ltext0
	.quad	.LBE142-.Ltext0
	.quad	.LBB143-.Ltext0
	.quad	.LBE143-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB115-.Ltext0
	.quad	.LBE115-.Ltext0
	.quad	.LBB141-.Ltext0
	.quad	.LBE141-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB116-.Ltext0
	.quad	.LBE116-.Ltext0
	.quad	.LBB139-.Ltext0
	.quad	.LBE139-.Ltext0
	.quad	.LBB140-.Ltext0
	.quad	.LBE140-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB117-.Ltext0
	.quad	.LBE117-.Ltext0
	.quad	.LBB138-.Ltext0
	.quad	.LBE138-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB118-.Ltext0
	.quad	.LBE118-.Ltext0
	.quad	.LBB137-.Ltext0
	.quad	.LBE137-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB120-.Ltext0
	.quad	.LBE120-.Ltext0
	.quad	.LBB135-.Ltext0
	.quad	.LBE135-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB121-.Ltext0
	.quad	.LBE121-.Ltext0
	.quad	.LBB132-.Ltext0
	.quad	.LBE132-.Ltext0
	.quad	.LBB133-.Ltext0
	.quad	.LBE133-.Ltext0
	.quad	.LBB134-.Ltext0
	.quad	.LBE134-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB122-.Ltext0
	.quad	.LBE122-.Ltext0
	.quad	.LBB130-.Ltext0
	.quad	.LBE130-.Ltext0
	.quad	.LBB131-.Ltext0
	.quad	.LBE131-.Ltext0
	.quad	0
	.quad	0
	.quad	.LBB123-.Ltext0
	.quad	.LBE123-.Ltext0
	.quad	.LBB124-.Ltext0
	.quad	.LBE124-.Ltext0
	.quad	.LBB125-.Ltext0
	.quad	.LBE125-.Ltext0
	.quad	.LBB126-.Ltext0
	.quad	.LBE126-.Ltext0
	.quad	.LBB127-.Ltext0
	.quad	.LBE127-.Ltext0
	.quad	.LBB128-.Ltext0
	.quad	.LBE128-.Ltext0
	.quad	.LBB129-.Ltext0
	.quad	.LBE129-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF65:
	.string	"dgemm_desc"
.LASF32:
	.string	"_old_offset"
.LASF15:
	.string	"double"
.LASF45:
	.string	"_IO_FILE"
.LASF27:
	.string	"_IO_save_end"
.LASF0:
	.string	"short int"
.LASF10:
	.string	"size_t"
.LASF13:
	.string	"sizetype"
.LASF57:
	.string	"i2end"
.LASF37:
	.string	"_offset"
.LASF21:
	.string	"_IO_write_ptr"
.LASF16:
	.string	"_flags"
.LASF70:
	.string	"/home/jerryz123/opmatmul"
.LASF23:
	.string	"_IO_buf_base"
.LASF28:
	.string	"_markers"
.LASF18:
	.string	"_IO_read_end"
.LASF54:
	.string	"my_dgemm"
.LASF56:
	.string	"j2end"
.LASF69:
	.string	"dgemm-other.c"
.LASF3:
	.string	"float"
.LASF68:
	.string	"GNU C 4.9.3 -mavx -march=corei7-avx -m64 -g -O3 -std=gnu99 -p -funroll-loops -ffast-math -fstack-protector-strong"
.LASF2:
	.string	"long long int"
.LASF36:
	.string	"_lock"
.LASF33:
	.string	"_cur_column"
.LASF49:
	.string	"_pos"
.LASF59:
	.string	"j1depth"
.LASF53:
	.string	"transpose"
.LASF48:
	.string	"_sbuf"
.LASF5:
	.string	"unsigned char"
.LASF8:
	.string	"signed char"
.LASF14:
	.string	"long long unsigned int"
.LASF7:
	.string	"unsigned int"
.LASF46:
	.string	"_IO_marker"
.LASF35:
	.string	"_shortbuf"
.LASF20:
	.string	"_IO_write_base"
.LASF44:
	.string	"_unused2"
.LASF17:
	.string	"_IO_read_ptr"
.LASF55:
	.string	"k2end"
.LASF24:
	.string	"_IO_buf_end"
.LASF1:
	.string	"char"
.LASF9:
	.string	"long int"
.LASF47:
	.string	"_next"
.LASF38:
	.string	"__pad1"
.LASF39:
	.string	"__pad2"
.LASF40:
	.string	"__pad3"
.LASF41:
	.string	"__pad4"
.LASF42:
	.string	"__pad5"
.LASF51:
	.string	"jdepth"
.LASF6:
	.string	"short unsigned int"
.LASF4:
	.string	"long unsigned int"
.LASF22:
	.string	"_IO_write_end"
.LASF52:
	.string	"kdepth"
.LASF12:
	.string	"__off64_t"
.LASF30:
	.string	"_fileno"
.LASF29:
	.string	"_chain"
.LASF50:
	.string	"idepth"
.LASF11:
	.string	"__off_t"
.LASF60:
	.string	"i1depth"
.LASF26:
	.string	"_IO_backup_base"
.LASF63:
	.string	"stdin"
.LASF31:
	.string	"_flags2"
.LASF66:
	.string	"L1_BLOCK_SIZE"
.LASF43:
	.string	"_mode"
.LASF19:
	.string	"_IO_read_base"
.LASF34:
	.string	"_vtable_offset"
.LASF62:
	.string	"square_dgemm_l1l2"
.LASF67:
	.string	"L2_BLOCK_SIZE"
.LASF58:
	.string	"k1depth"
.LASF72:
	.string	"do_l1_block"
.LASF25:
	.string	"_IO_save_base"
.LASF61:
	.string	"square_dgemm"
.LASF64:
	.string	"stdout"
.LASF71:
	.string	"_IO_lock_t"
	.ident	"GCC: (Gentoo 4.9.3 p1.5, pie-0.6.4) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
