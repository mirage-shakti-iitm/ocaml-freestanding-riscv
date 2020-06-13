	.file	"strchrnul.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	__strchrnul
	.type	__strchrnul, @function
__strchrnul:
.LFB0:
	.file 1 "strchrnul.c"
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
	.loc 1 14 2
	andi	a1,a1,0xff
.LVL1:
	.loc 1 15 2
	.loc 1 15 5 is_stmt 0
	bne	a1,zero,.L2
	.loc 1 15 10 is_stmt 1 discriminator 1
	.loc 1 15 29 is_stmt 0 discriminator 1
	call	strlen
.LVL2:
	.loc 1 15 27 discriminator 1
	add	a0,s0,a0
.LVL3:
.L1:
	.loc 1 23 1
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL4:
.L14:
	.cfi_restore_state
	.loc 1 17 31 is_stmt 1
	.loc 1 17 32 is_stmt 0
	addi	s0,s0,1
.LVL5:
.L2:
	.loc 1 17 9 is_stmt 1 discriminator 1
	.loc 1 17 22 is_stmt 0 discriminator 1
	andi	a5,s0,7
	.loc 1 17 2 discriminator 1
	beq	a5,zero,.L13
	.loc 1 18 3 is_stmt 1
	.loc 1 18 8 is_stmt 0
	lbu	a5,0(s0)
	.loc 1 18 6
	beq	a5,zero,.L10
	.loc 1 18 14 discriminator 2
	sext.w	a5,a5
	.loc 1 18 11 discriminator 2
	bne	a5,a1,.L14
	.loc 1 18 47
	mv	a0,s0
	j	.L1
.L13:
	.loc 1 19 2 is_stmt 1
	.loc 1 19 4 is_stmt 0
	ld	a2,.LC0
	mul	a2,a1,a2
.LVL6:
	.loc 1 20 2 is_stmt 1
.L5:
	.loc 1 20 22 discriminator 1
	.loc 1 20 23 is_stmt 0 discriminator 1
	ld	a5,0(s0)
	ld	a4,.LC1
	add	a4,a5,a4
	not	a3,a5
	and	a4,a4,a3
	ld	a3,.LC2
	and	a4,a4,a3
	.loc 1 20 2 discriminator 1
	bne	a4,zero,.L6
	.loc 1 20 39 discriminator 3
	xor	a5,a5,a2
	ld	a4,.LC1
	add	a4,a5,a4
	not	a5,a5
	and	a5,a4,a5
	and	a5,a5,a3
	.loc 1 20 35 discriminator 3
	bne	a5,zero,.L6
	.loc 1 20 58 is_stmt 1 discriminator 4
	.loc 1 20 54 discriminator 4
	.loc 1 20 55 is_stmt 0 discriminator 4
	addi	s0,s0,8
.LVL7:
	j	.L5
.L6:
	.loc 1 11 1 discriminator 1
	mv	a0,s0
	j	.L8
.LVL8:
.L9:
	.loc 1 21 58 is_stmt 1 discriminator 4
	.loc 1 21 54 discriminator 4
	.loc 1 21 55 is_stmt 0 discriminator 4
	addi	a0,a0,1
.LVL9:
.L8:
	.loc 1 21 22 is_stmt 1 discriminator 1
	lbu	a5,0(a0)
	.loc 1 21 2 is_stmt 0 discriminator 1
	beq	a5,zero,.L1
	.loc 1 21 28 discriminator 3
	sext.w	a5,a5
	.loc 1 21 25 discriminator 3
	bne	a5,a1,.L9
	j	.L1
.LVL10:
.L10:
	.loc 1 18 47
	mv	a0,s0
	j	.L1
	.cfi_endproc
.LFE0:
	.size	__strchrnul, .-__strchrnul
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	72340172838076673
	.align	3
.LC1:
	.dword	-72340172838076673
	.align	3
.LC2:
	.dword	-9187201950435737472
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x11f
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
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa
	.byte	0x7
	.4byte	0xf8
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xf8
	.byte	0x6
	.string	"s"
	.byte	0x1
	.byte	0xa
	.byte	0x1f
	.4byte	0x10a
	.4byte	.LLST0
	.byte	0x6
	.string	"c"
	.byte	0x1
	.byte	0xa
	.byte	0x26
	.4byte	0x47
	.4byte	.LLST1
	.byte	0x7
	.string	"w"
	.byte	0x1
	.byte	0xc
	.byte	0xa
	.4byte	0x110
	.4byte	.LLST2
	.byte	0x7
	.string	"k"
	.byte	0x1
	.byte	0xc
	.byte	0xd
	.4byte	0x34
	.4byte	.LLST3
	.byte	0x8
	.8byte	.LVL2
	.4byte	0x116
	.byte	0x9
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0xfe
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0xb
	.4byte	0xfe
	.byte	0xa
	.byte	0x8
	.4byte	0x105
	.byte	0xa
	.byte	0x8
	.4byte	0x34
	.byte	0xc
	.4byte	.LASF15
	.4byte	.LASF15
	.byte	0x5
	.byte	0xc
	.byte	0x8
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
	.byte	0x7
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
	.byte	0x8
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL10-.Ltext0
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
.LASF14:
	.string	"__strchrnul"
.LASF9:
	.string	"uintptr_t"
.LASF8:
	.string	"__uintptr_t"
.LASF15:
	.string	"strlen"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF12:
	.string	"strchrnul.c"
.LASF6:
	.string	"unsigned int"
.LASF10:
	.string	"char"
.LASF4:
	.string	"short int"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
