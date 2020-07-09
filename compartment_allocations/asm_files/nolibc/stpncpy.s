	.file	"stpncpy.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	__stpncpy
	.type	__stpncpy, @function
__stpncpy:
.LFB0:
	.file 1 "stpncpy.c"
	.loc 1 11 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 12 2
	.loc 1 13 2
	.loc 1 15 2
	.loc 1 15 29 is_stmt 0
	xor	a5,a1,a0
	andi	a5,a5,7
	.loc 1 15 5
	beq	a5,zero,.L2
.LVL1:
.L3:
	.loc 1 23 9 is_stmt 1 discriminator 1
	.loc 1 23 2 is_stmt 0 discriminator 1
	beq	a2,zero,.L6
	.loc 1 23 18 discriminator 2
	lbu	a5,0(a1)
	.loc 1 23 17 discriminator 2
	sb	a5,0(s0)
	.loc 1 23 11 discriminator 2
	beq	a5,zero,.L6
	.loc 1 23 37 is_stmt 1 discriminator 3
	.loc 1 23 23 discriminator 3
	.loc 1 23 24 is_stmt 0 discriminator 3
	addi	a2,a2,-1
.LVL2:
	.loc 1 23 29 discriminator 3
	addi	a1,a1,1
.LVL3:
	.loc 1 23 34 discriminator 3
	addi	s0,s0,1
.LVL4:
	j	.L3
.L5:
	.loc 1 16 64 is_stmt 1 discriminator 4
	.loc 1 16 50 discriminator 4
	.loc 1 16 51 is_stmt 0 discriminator 4
	addi	a2,a2,-1
.LVL5:
	.loc 1 16 56 discriminator 4
	addi	a1,a1,1
.LVL6:
	.loc 1 16 61 discriminator 4
	addi	s0,s0,1
.LVL7:
.L2:
	.loc 1 16 10 is_stmt 1 discriminator 1
	.loc 1 16 24 is_stmt 0 discriminator 1
	andi	a5,a1,7
	.loc 1 16 3 discriminator 1
	beq	a5,zero,.L4
	.loc 1 16 33 discriminator 2
	beq	a2,zero,.L4
	.loc 1 16 45 discriminator 3
	lbu	a5,0(a1)
	.loc 1 16 44 discriminator 3
	sb	a5,0(s0)
	.loc 1 16 38 discriminator 3
	bne	a5,zero,.L5
.L4:
	.loc 1 17 3 is_stmt 1
	.loc 1 17 6 is_stmt 0
	beq	a2,zero,.L6
	.loc 1 17 14 discriminator 2
	lbu	a5,0(a1)
	.loc 1 17 10 discriminator 2
	bne	a5,zero,.L7
.L6:
	.loc 1 25 2 is_stmt 1
	li	a1,0
.LVL8:
	mv	a0,s0
	call	memset
.LVL9:
	.loc 1 26 2
	.loc 1 27 1 is_stmt 0
	mv	a0,s0
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL10:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL11:
.L9:
	.cfi_restore_state
	.loc 1 20 41 is_stmt 1
	.loc 1 20 45 is_stmt 0
	sd	a4,0(s0)
	.loc 1 20 10 is_stmt 1
	.loc 1 20 11 is_stmt 0
	addi	a2,a2,-8
.LVL12:
	.loc 1 20 31
	addi	a1,a1,8
.LVL13:
	.loc 1 20 37
	addi	s0,s0,8
.LVL14:
.L7:
	.loc 1 19 10 is_stmt 1
	.loc 1 19 3 is_stmt 0
	li	a5,7
	bleu	a2,a5,.L3
	.loc 1 19 32 discriminator 1
	ld	a4,0(a1)
	ld	a5,.LC0
	add	a5,a4,a5
	not	a3,a4
	and	a5,a5,a3
	ld	a3,.LC1
	and	a5,a5,a3
	.loc 1 19 28 discriminator 1
	beq	a5,zero,.L9
	j	.L3
	.cfi_endproc
.LFE0:
	.size	__stpncpy, .-__stpncpy
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-72340172838076673
	.align	3
.LC1:
	.dword	-9187201950435737472
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x154
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
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
	.4byte	0x45
	.byte	0x4
	.4byte	0x34
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x5
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
	.4byte	0x45
	.byte	0x3
	.4byte	.LASF9
	.byte	0x4
	.byte	0x52
	.byte	0x15
	.4byte	0x76
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa
	.byte	0x7
	.4byte	0x11e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x11e
	.byte	0x7
	.string	"d"
	.byte	0x1
	.byte	0xa
	.byte	0x20
	.4byte	0x124
	.4byte	.LLST0
	.byte	0x7
	.string	"s"
	.byte	0x1
	.byte	0xa
	.byte	0x38
	.4byte	0x13b
	.4byte	.LLST1
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0xa
	.byte	0x42
	.4byte	0x34
	.4byte	.LLST2
	.byte	0x8
	.string	"wd"
	.byte	0x1
	.byte	0xc
	.byte	0xa
	.4byte	0x140
	.byte	0x1
	.byte	0x58
	.byte	0x8
	.string	"ws"
	.byte	0x1
	.byte	0xd
	.byte	0x10
	.4byte	0x146
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x18
	.byte	0x1
	.8byte	.L6
	.byte	0xa
	.8byte	.LVL9
	.4byte	0x14c
	.byte	0xb
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0xb
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x129
	.byte	0xd
	.4byte	0x11e
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x4
	.4byte	0x129
	.byte	0xc
	.byte	0x8
	.4byte	0x130
	.byte	0xd
	.4byte	0x135
	.byte	0xc
	.byte	0x8
	.4byte	0x34
	.byte	0xc
	.byte	0x8
	.4byte	0x40
	.byte	0xe
	.4byte	.LASF16
	.4byte	.LASF17
	.byte	0x5
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x37
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
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL9-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL11-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
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
.LASF13:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF11:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF7:
	.string	"size_t"
.LASF9:
	.string	"uintptr_t"
.LASF8:
	.string	"__uintptr_t"
.LASF3:
	.string	"unsigned char"
.LASF17:
	.string	"__builtin_memset"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"memset"
.LASF14:
	.string	"__stpncpy"
.LASF6:
	.string	"unsigned int"
.LASF10:
	.string	"char"
.LASF4:
	.string	"short int"
.LASF15:
	.string	"tail"
.LASF0:
	.string	"long int"
.LASF12:
	.string	"stpncpy.c"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
