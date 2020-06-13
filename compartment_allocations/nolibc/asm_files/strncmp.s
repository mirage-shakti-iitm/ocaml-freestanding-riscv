	.file	"strncmp.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	strncmp
	.type	strncmp, @function
strncmp:
.LFB0:
	.file 1 "strncmp.c"
	.loc 1 22 1
	.cfi_startproc
.LVL0:
	.loc 1 23 3
	.loc 1 24 3
	.loc 1 25 3
	.loc 1 25 6 is_stmt 0
	li	a5,3
	bleu	a2,a5,.L17
.LBB2:
	.loc 1 27 7 is_stmt 1
	.loc 1 27 14 is_stmt 0
	srli	a3,a2,2
.LVL1:
	j	.L12
.LVL2:
.L18:
	.loc 1 43 35
	mv	a1,a0
	.loc 1 42 35
	mv	a0,a6
.LVL3:
.L12:
	.loc 1 28 7 is_stmt 1
	.loc 1 30 11
	.loc 1 30 14 is_stmt 0
	lbu	a5,0(a0)
.LVL4:
	.loc 1 31 11 is_stmt 1
	.loc 1 31 14 is_stmt 0
	lbu	a4,0(a1)
.LVL5:
	.loc 1 32 11 is_stmt 1
	.loc 1 32 14 is_stmt 0
	beq	a5,zero,.L3
	.loc 1 32 26 discriminator 1
	bne	a5,a4,.L3
	.loc 1 34 11 is_stmt 1
.LVL6:
	.loc 1 34 14 is_stmt 0
	lbu	a5,1(a0)
.LVL7:
	.loc 1 35 11 is_stmt 1
	.loc 1 35 14 is_stmt 0
	lbu	a4,1(a1)
.LVL8:
	.loc 1 36 11 is_stmt 1
	.loc 1 36 14 is_stmt 0
	beq	a5,zero,.L6
	.loc 1 36 26 discriminator 1
	bne	a5,a4,.L6
	.loc 1 38 11 is_stmt 1
.LVL9:
	.loc 1 38 14 is_stmt 0
	lbu	a5,2(a0)
.LVL10:
	.loc 1 39 11 is_stmt 1
	.loc 1 39 14 is_stmt 0
	lbu	a4,2(a1)
.LVL11:
	.loc 1 40 11 is_stmt 1
	.loc 1 40 14 is_stmt 0
	beq	a5,zero,.L8
	.loc 1 40 26 discriminator 1
	bne	a5,a4,.L8
	.loc 1 42 11 is_stmt 1
	.loc 1 42 35 is_stmt 0
	addi	a6,a0,4
.LVL12:
	.loc 1 42 14
	lbu	a5,3(a0)
.LVL13:
	.loc 1 43 11 is_stmt 1
	.loc 1 43 35 is_stmt 0
	addi	a0,a1,4
.LVL14:
	.loc 1 43 14
	lbu	a4,3(a1)
.LVL15:
	.loc 1 44 11 is_stmt 1
	.loc 1 44 14 is_stmt 0
	beq	a5,zero,.L10
	.loc 1 44 26 discriminator 1
	bne	a5,a4,.L10
	.loc 1 46 17 is_stmt 1
	.loc 1 46 9 is_stmt 0
	addi	a3,a3,-1
.LVL16:
	bne	a3,zero,.L18
	.loc 1 47 7 is_stmt 1
	.loc 1 47 9 is_stmt 0
	andi	a2,a2,3
.LVL17:
	.loc 1 43 35
	mv	a1,a0
	.loc 1 42 35
	mv	a0,a6
.LVL18:
	j	.L13
.LVL19:
.L3:
	.loc 1 33 13 is_stmt 1
	.loc 1 33 23 is_stmt 0
	subw	a0,a5,a4
.LVL20:
	ret
.LVL21:
.L6:
	.loc 1 37 13 is_stmt 1
	.loc 1 37 23 is_stmt 0
	subw	a0,a5,a4
.LVL22:
	ret
.LVL23:
.L8:
	.loc 1 41 13 is_stmt 1
	.loc 1 41 23 is_stmt 0
	subw	a0,a5,a4
.LVL24:
	ret
.LVL25:
.L10:
	.loc 1 45 13 is_stmt 1
	.loc 1 45 23 is_stmt 0
	subw	a0,a5,a4
.LVL26:
	ret
.LVL27:
.L17:
.LBE2:
	.loc 1 24 17
	li	a4,0
	.loc 1 23 17
	li	a5,0
	j	.L13
.LVL28:
.L15:
	.loc 1 55 7 is_stmt 1
	.loc 1 55 8 is_stmt 0
	addi	a2,a2,-1
.LVL29:
	.loc 1 52 31
	mv	a1,a0
	.loc 1 51 31
	mv	a0,a3
.LVL30:
.L13:
	.loc 1 49 9 is_stmt 1
	beq	a2,zero,.L19
	.loc 1 51 7
	.loc 1 51 31 is_stmt 0
	addi	a3,a0,1
.LVL31:
	.loc 1 51 10
	lbu	a5,0(a0)
.LVL32:
	.loc 1 52 7 is_stmt 1
	.loc 1 52 31 is_stmt 0
	addi	a0,a1,1
.LVL33:
	.loc 1 52 10
	lbu	a4,0(a1)
.LVL34:
	.loc 1 53 7 is_stmt 1
	.loc 1 53 10 is_stmt 0
	beq	a5,zero,.L14
	.loc 1 53 22 discriminator 1
	beq	a5,a4,.L15
.L14:
	.loc 1 54 9 is_stmt 1
	.loc 1 54 19 is_stmt 0
	subw	a0,a5,a4
.LVL35:
	ret
.LVL36:
.L19:
	.loc 1 57 3 is_stmt 1
	.loc 1 57 13 is_stmt 0
	subw	a0,a5,a4
.LVL37:
	.loc 1 58 1
	ret
	.cfi_endproc
.LFE0:
	.size	strncmp, .-strncmp
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 3 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF4
	.byte	0xc
	.4byte	.LASF5
	.4byte	.LASF6
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
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.byte	0x1b
	.byte	0x5
	.4byte	0x47
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xdc
	.byte	0x6
	.string	"s1"
	.byte	0x1
	.byte	0x15
	.byte	0x1a
	.4byte	0xdc
	.4byte	.LLST0
	.byte	0x6
	.string	"s2"
	.byte	0x1
	.byte	0x15
	.byte	0x2a
	.4byte	0xdc
	.4byte	.LLST1
	.byte	0x6
	.string	"n"
	.byte	0x1
	.byte	0x15
	.byte	0x35
	.4byte	0x34
	.4byte	.LLST2
	.byte	0x7
	.string	"c1"
	.byte	0x1
	.byte	0x17
	.byte	0x11
	.4byte	0xee
	.4byte	.LLST3
	.byte	0x7
	.string	"c2"
	.byte	0x1
	.byte	0x18
	.byte	0x11
	.4byte	0xee
	.4byte	.LLST4
	.byte	0x8
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x7
	.string	"n4"
	.byte	0x1
	.byte	0x1b
	.byte	0xe
	.4byte	0x34
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xe9
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0xa
	.4byte	0xe2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x3
	.byte	0x7a
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x60
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL36-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x2
	.byte	0x9f
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x3
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x4
	.byte	0x9f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL36-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL27-.Ltext0
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
.LASF8:
	.string	"strncmp"
.LASF5:
	.string	"strncmp.c"
.LASF7:
	.string	"size_t"
.LASF3:
	.string	"unsigned char"
.LASF0:
	.string	"long int"
.LASF1:
	.string	"long unsigned int"
.LASF4:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF2:
	.string	"char"
.LASF6:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
	.ident	"GCC: (GNU) 9.2.0"
