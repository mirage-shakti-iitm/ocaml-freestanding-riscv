	.file	"printf.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	printf
	.type	printf, @function
printf:
.LFB0:
	.file 1 "printf.c"
	.loc 1 5 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,24(sp)
	.cfi_offset 1, -72
	sd	a1,40(sp)
	sd	a2,48(sp)
	sd	a3,56(sp)
	sd	a4,64(sp)
	sd	a5,72(sp)
	sd	a6,80(sp)
	sd	a7,88(sp)
	.loc 1 6 2
	.loc 1 7 2
	.loc 1 8 2
	addi	a2,sp,40
	sd	a2,8(sp)
	.loc 1 9 2
	.loc 1 9 8 is_stmt 0
	mv	a1,a0
	ld	a0,stdout
.LVL1:
	call	vfprintf
.LVL2:
	.loc 1 10 2 is_stmt 1
	.loc 1 11 2
	.loc 1 12 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	printf, .-printf
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stdarg.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x18e
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
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.byte	0x1b
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	.LASF16
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x63
	.byte	0x18
	.4byte	0x2d
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.4byte	.LASF2
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0x5e
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.4byte	.LASF17
	.byte	0x18
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.4byte	0xa1
	.byte	0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0x9
	.byte	0xe
	.4byte	0xd7
	.byte	0
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.byte	0xa
	.byte	0xb
	.4byte	0xdd
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
	.byte	0xb
	.byte	0xb
	.4byte	0xdd
	.byte	0x10
	.byte	0
	.byte	0x8
	.4byte	0x52
	.4byte	0xba
	.byte	0x9
	.4byte	0xba
	.byte	0x9
	.4byte	0xc0
	.byte	0x9
	.4byte	0x52
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x6c
	.byte	0xa
	.byte	0x8
	.4byte	0xd2
	.byte	0xb
	.4byte	0xc0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0xc
	.4byte	0xcb
	.byte	0xa
	.byte	0x8
	.4byte	0xa1
	.byte	0xa
	.byte	0x8
	.4byte	0xcb
	.byte	0x2
	.4byte	.LASF9
	.byte	0x4
	.byte	0xc
	.byte	0x3
	.4byte	0x6c
	.byte	0xd
	.4byte	.LASF10
	.byte	0x4
	.byte	0x11
	.byte	0xe
	.4byte	0xfb
	.byte	0xa
	.byte	0x8
	.4byte	0xe3
	.byte	0xd
	.4byte	.LASF11
	.byte	0x4
	.byte	0x12
	.byte	0xe
	.4byte	0xfb
	.byte	0xd
	.4byte	.LASF12
	.byte	0x4
	.byte	0x1c
	.byte	0xe
	.4byte	0xfb
	.byte	0xe
	.4byte	.LASF18
	.byte	0x4
	.byte	0xf
	.byte	0x5
	.4byte	0x65
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x185
	.byte	0xf
	.string	"fmt"
	.byte	0x1
	.byte	0x4
	.byte	0x21
	.4byte	0xc6
	.4byte	.LLST0
	.byte	0x10
	.byte	0x11
	.string	"ret"
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.4byte	0x65
	.byte	0x1
	.byte	0x5a
	.byte	0x11
	.string	"ap"
	.byte	0x1
	.byte	0x7
	.byte	0xa
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x12
	.8byte	.LVL2
	.4byte	0x185
	.byte	0x13
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x13
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF19
	.4byte	.LASF19
	.byte	0x4
	.byte	0x15
	.byte	0x5
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
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
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
	.byte	0xe
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
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x37
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
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
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LFE0-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
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
.LASF2:
	.string	"size_t"
.LASF13:
	.string	"GNU C99 9.2.0 -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -O2 -Og -std=c99"
.LASF15:
	.string	"/home/sai/ocaml-freestanding-riscv/build/nolibc"
.LASF14:
	.string	"printf.c"
.LASF16:
	.string	"__builtin_va_list"
.LASF12:
	.string	"stdin"
.LASF4:
	.string	"long unsigned int"
.LASF17:
	.string	"_FILE"
.LASF5:
	.string	"write"
.LASF6:
	.string	"wpos"
.LASF3:
	.string	"long int"
.LASF19:
	.string	"vfprintf"
.LASF1:
	.string	"va_list"
.LASF7:
	.string	"wend"
.LASF11:
	.string	"stderr"
.LASF9:
	.string	"FILE"
.LASF18:
	.string	"printf"
.LASF0:
	.string	"__gnuc_va_list"
.LASF10:
	.string	"stdout"
.LASF8:
	.string	"char"
	.ident	"GCC: (GNU) 9.2.0"
