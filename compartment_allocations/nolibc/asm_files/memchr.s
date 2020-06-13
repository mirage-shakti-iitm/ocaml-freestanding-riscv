	.file	"memchr.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	memchr
	.type	memchr, @function
memchr:
.LFB0:
	.file 1 "memchr.c"
	.loc 1 12 1
	.cfi_startproc
.LVL0:
	.loc 1 13 2
	.loc 1 14 2
	andi	a1,a1,0xff
.LVL1:
	.loc 1 15 2
	j	.L2
.LVL2:
.L4:
	.loc 1 15 58 discriminator 4
	.loc 1 15 49 discriminator 4
	.loc 1 15 50 is_stmt 0 discriminator 4
	addi	a0,a0,1
.LVL3:
	.loc 1 15 55 discriminator 4
	addi	a2,a2,-1
.LVL4:
.L2:
	.loc 1 15 9 is_stmt 1 discriminator 1
	.loc 1 15 23 is_stmt 0 discriminator 1
	andi	a5,a0,7
	.loc 1 15 2 discriminator 1
	beq	a5,zero,.L3
	.loc 1 15 32 discriminator 2
	beq	a2,zero,.L3
	.loc 1 15 40 discriminator 3
	lbu	a5,0(a0)
	.loc 1 15 37 discriminator 3
	bne	a5,a1,.L4
.L3:
	.loc 1 16 2 is_stmt 1
	.loc 1 16 5 is_stmt 0
	beq	a2,zero,.L5
	.loc 1 16 11 discriminator 1
	lbu	a5,0(a0)
	.loc 1 16 8 discriminator 1
	beq	a5,a1,.L5
.LBB2:
	.loc 1 17 3 is_stmt 1
	.loc 1 18 3
	.loc 1 18 10 is_stmt 0
	ld	a3,.LC0
	mul	a3,a1,a3
.LVL5:
	.loc 1 19 3 is_stmt 1
	j	.L6
.LVL6:
.L8:
	.loc 1 19 65 discriminator 4
	.loc 1 19 54 discriminator 4
	.loc 1 19 55 is_stmt 0 discriminator 4
	addi	a0,a0,8
.LVL7:
	.loc 1 19 60 discriminator 4
	addi	a2,a2,-8
.LVL8:
.L6:
	.loc 1 19 29 is_stmt 1 discriminator 1
	.loc 1 19 3 is_stmt 0 discriminator 1
	li	a5,7
	bleu	a2,a5,.L9
	.loc 1 19 39 discriminator 3
	ld	a4,0(a0)
	xor	a4,a4,a3
	ld	a5,.LC1
	add	a5,a4,a5
	not	a4,a4
	and	a5,a5,a4
	ld	a4,.LC2
	and	a5,a5,a4
	.loc 1 19 35 discriminator 3
	beq	a5,zero,.L8
	j	.L9
.LVL9:
.L10:
	.loc 1 20 52 is_stmt 1 discriminator 4
	.loc 1 20 43 discriminator 4
	.loc 1 20 44 is_stmt 0 discriminator 4
	addi	a0,a0,1
.LVL10:
	.loc 1 20 49 discriminator 4
	addi	a2,a2,-1
.LVL11:
.L9:
	.loc 1 20 29 is_stmt 1 discriminator 1
	.loc 1 20 3 is_stmt 0 discriminator 1
	beq	a2,zero,.L5
	.loc 1 20 34 discriminator 3
	lbu	a5,0(a0)
	.loc 1 20 31 discriminator 3
	bne	a5,a1,.L10
.LVL12:
.L5:
.LBE2:
	.loc 1 22 2 is_stmt 1
	.loc 1 22 23 is_stmt 0
	beq	a2,zero,.L12
.LVL13:
.L11:
	.loc 1 23 1 discriminator 4
	ret
.LVL14:
.L12:
	.loc 1 22 23
	li	a0,0
.LVL15:
	j	.L11
	.cfi_endproc
.LFE0:
	.size	memchr, .-memchr
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
	.4byte	0x130
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF11
	.4byte	.LASF12
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
	.byte	0x4
	.4byte	0x5a
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
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF13
	.byte	0x5
	.byte	0x7
	.byte	0x7
	.4byte	0x11e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x11e
	.byte	0x7
	.string	"src"
	.byte	0x1
	.byte	0xb
	.byte	0x1a
	.4byte	0x120
	.4byte	.LLST0
	.byte	0x7
	.string	"c"
	.byte	0x1
	.byte	0xb
	.byte	0x23
	.4byte	0x4c
	.4byte	.LLST1
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0xb
	.byte	0x2d
	.4byte	0x34
	.4byte	.LLST2
	.byte	0x8
	.string	"s"
	.byte	0x1
	.byte	0xd
	.byte	0x17
	.4byte	0x127
	.4byte	.LLST3
	.byte	0x9
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x8
	.string	"w"
	.byte	0x1
	.byte	0x11
	.byte	0x11
	.4byte	0x12d
	.4byte	.LLST4
	.byte	0x8
	.string	"k"
	.byte	0x1
	.byte	0x12
	.byte	0xa
	.4byte	0x34
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x8
	.byte	0xb
	.byte	0x8
	.4byte	0x126
	.byte	0xc
	.byte	0xb
	.byte	0x8
	.4byte	0x61
	.byte	0xb
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL4-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5d
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
.LASF12:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF10:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF7:
	.string	"size_t"
.LASF11:
	.string	"memchr.c"
.LASF9:
	.string	"uintptr_t"
.LASF8:
	.string	"__uintptr_t"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF13:
	.string	"memchr"
.LASF6:
	.string	"unsigned int"
.LASF4:
	.string	"short int"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
