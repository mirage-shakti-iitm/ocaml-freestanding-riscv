	.file	"strlen.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	strlen
	.type	strlen, @function
strlen:
.LFB0:
	.file 1 "strlen.c"
	.loc 1 11 1
	.cfi_startproc
.LVL0:
	.loc 1 12 2
	.loc 1 13 2
	.loc 1 14 2
	mv	a5,a0
.LVL1:
.L2:
	.loc 1 14 9 discriminator 3
	.loc 1 14 22 is_stmt 0 discriminator 3
	andi	a4,a5,7
	.loc 1 14 2 discriminator 3
	beq	a4,zero,.L6
	.loc 1 14 36 is_stmt 1 discriminator 4
	.loc 1 14 41 is_stmt 0 discriminator 4
	lbu	a4,0(a5)
	.loc 1 14 39 discriminator 4
	beq	a4,zero,.L10
	.loc 1 14 31 is_stmt 1 discriminator 2
	.loc 1 14 32 is_stmt 0 discriminator 2
	addi	a5,a5,1
.LVL2:
	j	.L2
.L10:
	.loc 1 14 45 is_stmt 1 discriminator 1
	.loc 1 14 53 is_stmt 0 discriminator 1
	sub	a0,a5,a0
.LVL3:
	ret
.LVL4:
.L6:
	.loc 1 15 28 is_stmt 1 discriminator 1
	.loc 1 15 29 is_stmt 0 discriminator 1
	ld	a3,0(a5)
	ld	a4,.LC0
	add	a4,a3,a4
	not	a3,a3
	and	a4,a4,a3
	ld	a3,.LC1
	and	a4,a4,a3
	.loc 1 15 2 discriminator 1
	bne	a4,zero,.L8
	.loc 1 15 46 is_stmt 1 discriminator 3
	.loc 1 15 42 discriminator 3
	.loc 1 15 43 is_stmt 0 discriminator 3
	addi	a5,a5,8
.LVL5:
	j	.L6
.LVL6:
.L8:
	.loc 1 16 28 is_stmt 1 discriminator 1
	lbu	a4,0(a5)
	.loc 1 16 2 is_stmt 0 discriminator 1
	beq	a4,zero,.L11
	.loc 1 16 36 is_stmt 1 discriminator 3
	.loc 1 16 32 discriminator 3
	.loc 1 16 33 is_stmt 0 discriminator 3
	addi	a5,a5,1
.LVL7:
	j	.L8
.L11:
	.loc 1 17 2 is_stmt 1
	.loc 1 17 10 is_stmt 0
	sub	a0,a5,a0
.LVL8:
	.loc 1 18 1
	ret
	.cfi_endproc
.LFE0:
	.size	strlen, .-strlen
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
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf0
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
	.byte	0x5
	.byte	0xc
	.byte	0x8
	.4byte	0x34
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xdb
	.byte	0x7
	.string	"s"
	.byte	0x1
	.byte	0xa
	.byte	0x1b
	.4byte	0xdb
	.4byte	.LLST0
	.byte	0x8
	.string	"a"
	.byte	0x1
	.byte	0xc
	.byte	0xe
	.4byte	0xdb
	.4byte	.LLST1
	.byte	0x8
	.string	"w"
	.byte	0x1
	.byte	0xd
	.byte	0x10
	.4byte	0xed
	.4byte	.LLST2
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xe8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x4
	.4byte	0xe1
	.byte	0x9
	.byte	0x8
	.4byte	0x40
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL6-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5f
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
.LASF12:
	.string	"strlen.c"
.LASF11:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF7:
	.string	"size_t"
.LASF9:
	.string	"uintptr_t"
.LASF8:
	.string	"__uintptr_t"
.LASF14:
	.string	"strlen"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
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
