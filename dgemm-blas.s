	.file	"dgemm-blas.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	square_dgemm
	.type	square_dgemm, @function
square_dgemm:
.LFB15:
	.file 1 "dgemm-blas.c"
	.loc 1 12 0
	.cfi_startproc
.LVL0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	mcount
	.loc 1 12 0
.LVL1:
	.loc 1 18 0
	vmovsd	.LC0(%rip), %xmm1
	vmovapd	%xmm1, %xmm0
	movslq	%edi, %rdi
	pushq	%rdi
	movq	%rdi, %r9
	movq	%rdi, %r8
	pushq	%rcx
	movq	%rdi, %rcx
.LVL2:
	pushq	%rdi
.LVL3:
	pushq	%rdx
.LVL4:
	movl	$111, %edx
.LVL5:
	pushq	%rdi
.LVL6:
	movl	$102, %edi
.LVL7:
	pushq	%rsi
.LVL8:
	movl	$111, %esi
.LVL9:
	call	cblas_dgemm
.LVL10:
	addq	$48, %rsp
	.loc 1 19 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	square_dgemm, .-square_dgemm
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.globl	dgemm_desc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Reference dgemm."
	.data
	.align 8
	.type	dgemm_desc, @object
	.size	dgemm_desc, 8
dgemm_desc:
	.quad	.LC2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 2 "/opt/intel/compilers_and_libraries_2016.2.181/linux/mkl/include/mkl_cblas.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x262
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF21
	.byte	0x1
	.long	.LASF22
	.long	.LASF23
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.byte	0x4
	.byte	0x2
	.byte	0x2c
	.long	0x6e
	.uleb128 0x5
	.long	.LASF5
	.sleb128 101
	.uleb128 0x5
	.long	.LASF6
	.sleb128 102
	.byte	0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x2
	.byte	0x2c
	.long	0x57
	.uleb128 0x4
	.byte	0x4
	.byte	0x2
	.byte	0x2d
	.long	0x97
	.uleb128 0x5
	.long	.LASF7
	.sleb128 111
	.uleb128 0x5
	.long	.LASF8
	.sleb128 112
	.uleb128 0x5
	.long	.LASF9
	.sleb128 113
	.byte	0
	.uleb128 0x6
	.long	.LASF11
	.byte	0x2
	.byte	0x2d
	.long	0x79
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF12
	.uleb128 0x7
	.byte	0x8
	.long	0x2d
	.uleb128 0x7
	.byte	0x8
	.long	0xb5
	.uleb128 0x8
	.long	0x2d
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF14
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF16
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF17
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF18
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF19
	.uleb128 0x7
	.byte	0x8
	.long	0xf1
	.uleb128 0x8
	.long	0x42
	.uleb128 0x9
	.long	.LASF24
	.byte	0x1
	.byte	0xb
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ee
	.uleb128 0xa
	.string	"N"
	.byte	0x1
	.byte	0xb
	.long	0x3b
	.long	.LLST0
	.uleb128 0xa
	.string	"A"
	.byte	0x1
	.byte	0xb
	.long	0xa9
	.long	.LLST1
	.uleb128 0xa
	.string	"B"
	.byte	0x1
	.byte	0xb
	.long	0xa9
	.long	.LLST2
	.uleb128 0xa
	.string	"C"
	.byte	0x1
	.byte	0xb
	.long	0xa9
	.long	.LLST3
	.uleb128 0xb
	.long	.LASF20
	.byte	0x1
	.byte	0xd
	.long	0x2d
	.byte	0x8
	.long	0
	.long	0x3ff00000
	.uleb128 0xc
	.string	"LDA"
	.byte	0x1
	.byte	0xe
	.long	0x3b
	.long	.LLST4
	.uleb128 0xc
	.string	"LDB"
	.byte	0x1
	.byte	0xf
	.long	0x3b
	.long	.LLST4
	.uleb128 0xc
	.string	"LDC"
	.byte	0x1
	.byte	0x10
	.long	0x3b
	.long	.LLST4
	.uleb128 0xd
	.quad	.LVL10
	.long	0x203
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x66
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x6f
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x6f
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x61
	.uleb128 0xb
	.byte	0xf4
	.uleb128 0x2d
	.byte	0x8
	.long	0
	.long	0x3ff00000
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x62
	.uleb128 0xb
	.byte	0xf4
	.uleb128 0x2d
	.byte	0x8
	.long	0
	.long	0x3ff00000
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	.LASF25
	.byte	0x1
	.byte	0x4
	.long	0xeb
	.uleb128 0x9
	.byte	0x3
	.quad	dgemm_desc
	.uleb128 0x10
	.long	.LASF26
	.byte	0x2
	.value	0x234
	.long	0x256
	.uleb128 0x11
	.long	0x256
	.uleb128 0x11
	.long	0x25b
	.uleb128 0x11
	.long	0x25b
	.uleb128 0x11
	.long	0x260
	.uleb128 0x11
	.long	0x260
	.uleb128 0x11
	.long	0x260
	.uleb128 0x11
	.long	0xb5
	.uleb128 0x11
	.long	0xaf
	.uleb128 0x11
	.long	0x260
	.uleb128 0x11
	.long	0xaf
	.uleb128 0x11
	.long	0x260
	.uleb128 0x11
	.long	0xb5
	.uleb128 0x11
	.long	0xa9
	.uleb128 0x11
	.long	0x260
	.byte	0
	.uleb128 0x8
	.long	0x6e
	.uleb128 0x8
	.long	0x97
	.uleb128 0x8
	.long	0xa2
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
	.uleb128 0xe
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
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL7-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL5-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL6-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LVL8-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LVL4-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LVL6-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 24
	.quad	.LVL8-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 32
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL1-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL7-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"CblasNoTrans"
.LASF11:
	.string	"CBLAS_TRANSPOSE"
.LASF20:
	.string	"BETA"
.LASF25:
	.string	"dgemm_desc"
.LASF1:
	.string	"float"
.LASF17:
	.string	"signed char"
.LASF14:
	.string	"unsigned char"
.LASF4:
	.string	"long unsigned int"
.LASF15:
	.string	"short unsigned int"
.LASF26:
	.string	"cblas_dgemm"
.LASF0:
	.string	"double"
.LASF16:
	.string	"unsigned int"
.LASF5:
	.string	"CblasRowMajor"
.LASF21:
	.string	"GNU C 4.9.3 -mavx -march=corei7-avx -m64 -g -O3 -std=gnu99 -p -funroll-loops -ffast-math -fstack-protector-strong"
.LASF19:
	.string	"long long unsigned int"
.LASF13:
	.string	"sizetype"
.LASF10:
	.string	"CBLAS_LAYOUT"
.LASF12:
	.string	"long long int"
.LASF9:
	.string	"CblasConjTrans"
.LASF2:
	.string	"char"
.LASF24:
	.string	"square_dgemm"
.LASF18:
	.string	"short int"
.LASF23:
	.string	"/home/jerryz123/opmatmul"
.LASF3:
	.string	"long int"
.LASF6:
	.string	"CblasColMajor"
.LASF8:
	.string	"CblasTrans"
.LASF22:
	.string	"dgemm-blas.c"
	.ident	"GCC: (Gentoo 4.9.3 p1.5, pie-0.6.4) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
