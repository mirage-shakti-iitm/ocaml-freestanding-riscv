	.file	"memset.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	memset
	.type	memset, @function
memset:
.LFB0:
	.file 1 "memset.c"
	.loc 1 5 1
	.cfi_startproc
.LVL0:
	.loc 1 6 2
	.loc 1 7 2
	.loc 1 13 2
	.loc 1 13 5 is_stmt 0
	beq	a2,zero,.L2
	.loc 1 14 2 is_stmt 1
	.loc 1 14 10 is_stmt 0
	addi	a4,a2,-1
	add	a4,a0,a4
	.loc 1 14 16
	andi	a5,a1,0xff
	sb	a5,0(a4)
	.loc 1 14 7
	sb	a5,0(a0)
	.loc 1 15 2 is_stmt 1
	.loc 1 15 5 is_stmt 0
	li	a4,2
	bleu	a2,a4,.L2
	.loc 1 16 2 is_stmt 1
	.loc 1 16 10 is_stmt 0
	addi	a4,a2,-2
	add	a4,a0,a4
	.loc 1 16 16
	sb	a5,0(a4)
	.loc 1 16 7
	sb	a5,1(a0)
	.loc 1 17 2 is_stmt 1
	.loc 1 17 10 is_stmt 0
	addi	a4,a2,-3
	add	a4,a0,a4
	.loc 1 17 16
	sb	a5,0(a4)
	.loc 1 17 7
	sb	a5,2(a0)
	.loc 1 18 2 is_stmt 1
	.loc 1 18 5 is_stmt 0
	li	a4,6
	bleu	a2,a4,.L2
	.loc 1 19 2 is_stmt 1
	.loc 1 19 10 is_stmt 0
	addi	a4,a2,-4
	add	a4,a0,a4
	.loc 1 19 16
	sb	a5,0(a4)
	.loc 1 19 7
	sb	a5,3(a0)
	.loc 1 20 2 is_stmt 1
	.loc 1 20 5 is_stmt 0
	li	a5,8
	bleu	a2,a5,.L2
	.loc 1 27 2 is_stmt 1
	.loc 1 27 6 is_stmt 0
	neg	a4,a0
	.loc 1 27 4
	andi	a4,a4,3
.LVL1:
	.loc 1 28 2 is_stmt 1
	.loc 1 28 4 is_stmt 0
	add	a5,a0,a4
.LVL2:
	.loc 1 29 2 is_stmt 1
	.loc 1 29 4 is_stmt 0
	sub	a2,a2,a4
.LVL3:
	.loc 1 30 2 is_stmt 1
	.loc 1 30 4 is_stmt 0
	andi	a2,a2,-4
.LVL4:
	.loc 1 33 2 is_stmt 1
	.loc 1 34 2
	.loc 1 36 2
	.loc 1 36 28 is_stmt 0
	andi	a1,a1,0xff
.LVL5:
	.loc 1 36 6
	slliw	a4,a1,8
.LVL6:
	addw	a1,a4,a1
	slliw	a4,a1,16
	addw	a1,a1,a4
.LVL7:
	.loc 1 44 2 is_stmt 1
	.loc 1 44 16 is_stmt 0
	sw	a1,0(a5)
	.loc 1 45 2 is_stmt 1
	.loc 1 45 14 is_stmt 0
	addi	a4,a2,-4
	add	a4,a5,a4
	.loc 1 45 18
	sw	a1,0(a4)
	.loc 1 46 2 is_stmt 1
	.loc 1 46 5 is_stmt 0
	li	a4,8
	bleu	a2,a4,.L2
	.loc 1 47 2 is_stmt 1
	.loc 1 47 16 is_stmt 0
	sw	a1,4(a5)
	.loc 1 48 2 is_stmt 1
	.loc 1 48 16 is_stmt 0
	sw	a1,8(a5)
	.loc 1 49 2 is_stmt 1
	.loc 1 49 14 is_stmt 0
	addi	a4,a2,-12
	add	a4,a5,a4
	.loc 1 49 19
	sw	a1,0(a4)
	.loc 1 50 2 is_stmt 1
	.loc 1 50 14 is_stmt 0
	addi	a4,a2,-8
	add	a4,a5,a4
	.loc 1 50 18
	sw	a1,0(a4)
	.loc 1 51 2 is_stmt 1
	.loc 1 51 5 is_stmt 0
	li	a4,24
	bleu	a2,a4,.L2
	.loc 1 52 2 is_stmt 1
	.loc 1 52 17 is_stmt 0
	sw	a1,12(a5)
	.loc 1 53 2 is_stmt 1
	.loc 1 53 17 is_stmt 0
	sw	a1,16(a5)
	.loc 1 54 2 is_stmt 1
	.loc 1 54 17 is_stmt 0
	sw	a1,20(a5)
	.loc 1 55 2 is_stmt 1
	.loc 1 55 17 is_stmt 0
	sw	a1,24(a5)
	.loc 1 56 2 is_stmt 1
	.loc 1 56 14 is_stmt 0
	addi	a4,a2,-28
	add	a4,a5,a4
	.loc 1 56 19
	sw	a1,0(a4)
	.loc 1 57 2 is_stmt 1
	.loc 1 57 14 is_stmt 0
	addi	a4,a2,-24
	add	a4,a5,a4
	.loc 1 57 19
	sw	a1,0(a4)
	.loc 1 58 2 is_stmt 1
	.loc 1 58 14 is_stmt 0
	addi	a4,a2,-20
	add	a4,a5,a4
	.loc 1 58 19
	sw	a1,0(a4)
	.loc 1 59 2 is_stmt 1
	.loc 1 59 14 is_stmt 0
	addi	a4,a2,-16
	add	a4,a5,a4
	.loc 1 59 19
	sw	a1,0(a4)
	.loc 1 65 2 is_stmt 1
	.loc 1 65 25 is_stmt 0
	andi	a4,a5,4
	.loc 1 65 4
	addi	a4,a4,24
.LVL8:
	.loc 1 66 2 is_stmt 1
	.loc 1 66 4 is_stmt 0
	add	a5,a5,a4
.LVL9:
	.loc 1 67 2 is_stmt 1
	.loc 1 67 4 is_stmt 0
	sub	a2,a2,a4
.LVL10:
	.loc 1 73 2 is_stmt 1
	.loc 1 73 16 is_stmt 0
	slli	a4,a1,32
.LVL11:
	srli	a4,a4,32
	.loc 1 73 28
	slli	a1,a1,32
.LVL12:
	.loc 1 73 6
	or	a1,a4,a1
.LVL13:
	.loc 1 74 2 is_stmt 1
	j	.L3
.LVL14:
.L4:
	.loc 1 75 3 discriminator 2
	.loc 1 75 17 is_stmt 0 discriminator 2
	sd	a1,0(a5)
	.loc 1 76 3 is_stmt 1 discriminator 2
	.loc 1 76 17 is_stmt 0 discriminator 2
	sd	a1,8(a5)
	.loc 1 77 3 is_stmt 1 discriminator 2
	.loc 1 77 18 is_stmt 0 discriminator 2
	sd	a1,16(a5)
	.loc 1 78 3 is_stmt 1 discriminator 2
	.loc 1 78 18 is_stmt 0 discriminator 2
	sd	a1,24(a5)
	.loc 1 74 18 is_stmt 1 discriminator 2
	.loc 1 74 19 is_stmt 0 discriminator 2
	addi	a2,a2,-32
.LVL15:
	.loc 1 74 26 discriminator 2
	addi	a5,a5,32
.LVL16:
.L3:
	.loc 1 74 9 is_stmt 1 discriminator 1
	.loc 1 74 2 is_stmt 0 discriminator 1
	li	a4,31
	bgtu	a2,a4,.L4
.LVL17:
.L2:
	.loc 1 86 1
	ret
	.cfi_endproc
.LFE0:
	.size	memset, .-memset
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x147
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF13
	.byte	0xc
	.4byte	.LASF14
	.4byte	.LASF15
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF6
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
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x76
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x69
	.byte	0x19
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0xe8
	.byte	0x1a
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x52
	.byte	0x15
	.4byte	0x89
	.byte	0x5
	.4byte	.LASF16
	.byte	0x5
	.byte	0xa
	.byte	0x7
	.4byte	0x142
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x142
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4
	.byte	0x14
	.4byte	0x142
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.string	"c"
	.byte	0x1
	.byte	0x4
	.byte	0x1e
	.4byte	0x47
	.4byte	.LLST0
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x4
	.byte	0x28
	.4byte	0x34
	.4byte	.LLST1
	.byte	0x8
	.string	"s"
	.byte	0x1
	.byte	0x6
	.byte	0x11
	.4byte	0x144
	.4byte	.LLST2
	.byte	0x8
	.string	"k"
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.4byte	0x34
	.4byte	.LLST3
	.byte	0x9
	.string	"u32"
	.byte	0x1
	.byte	0x21
	.byte	0x32
	.4byte	0x6a
	.byte	0x9
	.string	"u64"
	.byte	0x1
	.byte	0x22
	.byte	0x32
	.4byte	0x7d
	.byte	0x8
	.string	"c32"
	.byte	0x1
	.byte	0x24
	.byte	0x6
	.4byte	0x109
	.4byte	.LLST4
	.byte	0x8
	.string	"c64"
	.byte	0x1
	.byte	0x49
	.byte	0x6
	.4byte	0x115
	.4byte	.LLST5
	.byte	0
	.byte	0xa
	.byte	0x8
	.byte	0xb
	.byte	0x8
	.4byte	0x55
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
	.byte	0x18
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
	.byte	0x16
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL3-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x6
	.byte	0x7a
	.byte	0
	.byte	0x1f
	.byte	0x33
	.byte	0x1a
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0xd
	.byte	0x7a
	.byte	0
	.byte	0x1f
	.byte	0x33
	.byte	0x1a
	.byte	0x7a
	.byte	0
	.byte	0x22
	.byte	0x34
	.byte	0x1a
	.byte	0x23
	.byte	0x18
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x17
	.byte	0x7a
	.byte	0
	.byte	0x1f
	.byte	0x33
	.byte	0x1a
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x7a
	.byte	0
	.byte	0x1f
	.byte	0x33
	.byte	0x1a
	.byte	0x1c
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x22
	.byte	0x7a
	.byte	0
	.byte	0x22
	.byte	0x4c
	.byte	0x1c
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x16
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x22
	.byte	0xc
	.4byte	0x10001
	.byte	0x1e
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL17-.Ltext0
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
.LASF15:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF13:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF14:
	.string	"memset.c"
.LASF11:
	.string	"uintptr_t"
.LASF10:
	.string	"__uintptr_t"
.LASF12:
	.string	"dest"
.LASF3:
	.string	"unsigned char"
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF6:
	.string	"size_t"
.LASF16:
	.string	"memset"
.LASF7:
	.string	"__uint32_t"
.LASF8:
	.string	"unsigned int"
.LASF4:
	.string	"short int"
.LASF9:
	.string	"__uint64_t"
.LASF0:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
