	.file	"memmove.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	memmove
	.type	memmove, @function
memmove:
.LFB0:
	.file 1 "memmove.c"
	.loc 1 8 1
	.cfi_startproc
.LVL0:
	.loc 1 9 2
	.loc 1 10 2
	.loc 1 12 2
	.loc 1 12 5 is_stmt 0
	beq	a0,a1,.L22
	.loc 1 13 2 is_stmt 1
	.loc 1 13 7 is_stmt 0
	add	a5,a1,a2
	.loc 1 13 5
	bleu	a5,a0,.L3
	.loc 1 13 19 discriminator 2
	add	a5,a0,a2
	.loc 1 13 15 discriminator 2
	bleu	a5,a1,.L3
	.loc 1 15 2 is_stmt 1
	.loc 1 15 5 is_stmt 0
	bgeu	a0,a1,.L5
	.loc 1 16 3 is_stmt 1
	.loc 1 16 25 is_stmt 0
	xor	a5,a1,a0
	andi	a5,a5,7
	.loc 1 16 6
	beq	a5,zero,.L20
	.loc 1 9 8
	mv	a5,a0
	j	.L7
.L3:
	.loc 1 8 1 discriminator 3
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 13 28 is_stmt 1 discriminator 3
	.loc 1 13 35 is_stmt 0 discriminator 3
	call	memcpy
.LVL1:
	.loc 1 36 1 discriminator 3
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL2:
.L20:
	.loc 1 9 8
	mv	a5,a0
.LVL3:
.L6:
	.loc 1 17 10 is_stmt 1
	.loc 1 17 24 is_stmt 0
	andi	a4,a5,7
	.loc 1 17 10
	beq	a4,zero,.L9
	.loc 1 18 5 is_stmt 1
	.loc 1 18 11 is_stmt 0
	addi	a4,a2,-1
.LVL4:
	.loc 1 18 8
	beq	a2,zero,.L22
	.loc 1 19 5 is_stmt 1
.LVL5:
	.loc 1 19 12 is_stmt 0
	lbu	a3,0(a1)
	.loc 1 19 10
	sb	a3,0(a5)
	.loc 1 19 14
	addi	a1,a1,1
.LVL6:
	.loc 1 19 7
	addi	a5,a5,1
.LVL7:
	.loc 1 18 11
	mv	a2,a4
	j	.L6
.LVL8:
.L10:
	.loc 1 21 39 is_stmt 1 discriminator 2
	.loc 1 21 50 is_stmt 0 discriminator 2
	ld	a4,0(a1)
	.loc 1 21 48 discriminator 2
	sd	a4,0(a5)
	.loc 1 21 18 is_stmt 1 discriminator 2
	.loc 1 21 19 is_stmt 0 discriminator 2
	addi	a2,a2,-8
.LVL9:
	.loc 1 21 26 discriminator 2
	addi	a5,a5,8
.LVL10:
	.loc 1 21 33 discriminator 2
	addi	a1,a1,8
.LVL11:
.L9:
	.loc 1 21 11 is_stmt 1 discriminator 1
	.loc 1 21 4 is_stmt 0 discriminator 1
	li	a4,7
	bgtu	a2,a4,.L10
	j	.L7
.L12:
	.loc 1 23 18 is_stmt 1 discriminator 2
.LVL12:
	.loc 1 23 25 is_stmt 0 discriminator 2
	lbu	a4,0(a1)
	.loc 1 23 23 discriminator 2
	sb	a4,0(a5)
	.loc 1 23 13 is_stmt 1 discriminator 2
	.loc 1 23 14 is_stmt 0 discriminator 2
	addi	a2,a2,-1
.LVL13:
	.loc 1 23 27 discriminator 2
	addi	a1,a1,1
.LVL14:
	.loc 1 23 20 discriminator 2
	addi	a5,a5,1
.LVL15:
.L7:
	.loc 1 23 10 is_stmt 1 discriminator 1
	.loc 1 23 3 is_stmt 0 discriminator 1
	bne	a2,zero,.L12
	ret
.LVL16:
.L5:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 25 is_stmt 0
	xor	a5,a1,a0
	andi	a5,a5,7
	.loc 1 25 6
	bne	a5,zero,.L14
.L13:
	.loc 1 26 10 is_stmt 1
	.loc 1 26 24 is_stmt 0
	add	a5,a0,a2
	.loc 1 26 28
	andi	a5,a5,7
	.loc 1 26 10
	beq	a5,zero,.L16
	.loc 1 27 5 is_stmt 1
	.loc 1 27 11 is_stmt 0
	addi	a5,a2,-1
.LVL17:
	.loc 1 27 8
	beq	a2,zero,.L22
	.loc 1 28 5 is_stmt 1
	.loc 1 28 6 is_stmt 0
	add	a4,a0,a5
	.loc 1 28 13
	add	a3,a1,a5
	lbu	a3,0(a3)
	.loc 1 28 10
	sb	a3,0(a4)
	.loc 1 27 11
	mv	a2,a5
	j	.L13
.LVL18:
.L17:
	.loc 1 30 18 is_stmt 1 discriminator 2
	.loc 1 30 19 is_stmt 0 discriminator 2
	addi	a2,a2,-8
.LVL19:
	.loc 1 30 49 discriminator 2
	add	a4,a1,a2
	.loc 1 30 34 discriminator 2
	add	a5,a0,a2
	.loc 1 30 40 discriminator 2
	ld	a4,0(a4)
	.loc 1 30 38 discriminator 2
	sd	a4,0(a5)
.L16:
	.loc 1 30 10 is_stmt 1 discriminator 1
	li	a5,7
	bgtu	a2,a5,.L17
	j	.L14
.L19:
	.loc 1 32 13 discriminator 2
	.loc 1 32 14 is_stmt 0 discriminator 2
	addi	a2,a2,-1
.LVL20:
	.loc 1 32 19 discriminator 2
	add	a5,a0,a2
	.loc 1 32 26 discriminator 2
	add	a4,a1,a2
	lbu	a4,0(a4)
	.loc 1 32 23 discriminator 2
	sb	a4,0(a5)
.L14:
	.loc 1 32 9 is_stmt 1 discriminator 1
	bne	a2,zero,.L19
	ret
.LVL21:
.L22:
	.loc 1 36 1 is_stmt 0
	ret
	.cfi_endproc
.LFE0:
	.size	memmove, .-memmove
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 6 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x12c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF12
	.byte	0xc
	.4byte	.LASF13
	.4byte	.LASF14
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.4byte	0x40
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0xe8
	.byte	0x1a
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF9
	.byte	0x4
	.byte	0x52
	.byte	0x15
	.4byte	0x71
	.byte	0x5
	.4byte	.LASF15
	.byte	0x5
	.byte	0x9
	.byte	0x7
	.4byte	0x103
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x103
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x7
	.byte	0x15
	.4byte	0x103
	.4byte	.LLST0
	.byte	0x7
	.string	"src"
	.byte	0x1
	.byte	0x7
	.byte	0x27
	.4byte	0x105
	.4byte	.LLST1
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x7
	.byte	0x33
	.4byte	0x34
	.4byte	.LLST2
	.byte	0x8
	.string	"d"
	.byte	0x1
	.byte	0x9
	.byte	0x8
	.4byte	0x10c
	.4byte	.LLST3
	.byte	0x8
	.string	"s"
	.byte	0x1
	.byte	0xa
	.byte	0xe
	.4byte	0x11e
	.4byte	.LLST4
	.byte	0x9
	.8byte	.LVL1
	.4byte	0x124
	.byte	0
	.byte	0xa
	.byte	0x8
	.byte	0xb
	.byte	0x8
	.4byte	0x10b
	.byte	0xc
	.byte	0xb
	.byte	0x8
	.4byte	0x112
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0xd
	.4byte	0x112
	.byte	0xb
	.byte	0x8
	.4byte	0x119
	.byte	0xe
	.4byte	.LASF16
	.4byte	.LASF17
	.byte	0x6
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL21-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL1-1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL14-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF15:
	.string	"memmove"
.LASF12:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF7:
	.string	"size_t"
.LASF13:
	.string	"memmove.c"
.LASF9:
	.string	"uintptr_t"
.LASF8:
	.string	"__uintptr_t"
.LASF10:
	.string	"dest"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF6:
	.string	"unsigned int"
.LASF11:
	.string	"char"
.LASF17:
	.string	"__builtin_memcpy"
.LASF16:
	.string	"memcpy"
.LASF4:
	.string	"short int"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
