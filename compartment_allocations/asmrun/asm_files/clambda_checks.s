	.file	"clambda_checks.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"NULL is not a closure: %s\n"
	.align	3
.LC1:
	.string	"Expecting a closure, got a non-boxed value %p: %s\n"
	.align	3
.LC2:
	.string	"Expecting a closure, got a boxed value with tag %i: %s\n"
	.text
	.align	1
	.globl	caml_check_value_is_closure
	.type	caml_check_value_is_closure, @function
caml_check_value_is_closure:
.LFB5:
	.file 1 "clambda_checks.c"
	.loc 1 25 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 26 3
.LVL1:
	.loc 1 27 3
	.loc 1 29 3
	.loc 1 29 6 is_stmt 0
	beq	a0,zero,.L6
	.loc 1 34 3 is_stmt 1
	.loc 1 34 8 is_stmt 0
	andi	a5,a0,1
	.loc 1 34 6
	bne	a5,zero,.L7
	.loc 1 40 3 is_stmt 1
	.loc 1 40 9 is_stmt 0
	lbu	a2,-8(a0)
	.loc 1 40 6
	li	a5,247
	beq	a2,a5,.L4
	.loc 1 40 7 discriminator 1
	li	a5,249
	bne	a2,a5,.L8
.L4:
	.loc 1 46 3 is_stmt 1
.LVL2:
	.loc 1 48 5
	.loc 1 50 3
	.loc 1 52 3
	.loc 1 53 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL3:
.L6:
	.cfi_restore_state
	.loc 1 30 5 is_stmt 1
	mv	a2,a1
	lla	a1,.LC0
.LVL4:
	ld	a0,stderr
.LVL5:
	call	fprintf
.LVL6:
	.loc 1 32 5
	call	abort
.LVL7:
.L7:
	.loc 1 35 5
	mv	a3,a1
	mv	a2,a0
	lla	a1,.LC1
.LVL8:
	ld	a0,stderr
.LVL9:
	call	fprintf
.LVL10:
	.loc 1 38 5
	call	abort
.LVL11:
.L8:
	.loc 1 41 5
	mv	a3,a1
	lla	a1,.LC2
.LVL12:
	ld	a0,stderr
.LVL13:
	call	fprintf
.LVL14:
	.loc 1 44 5
	call	abort
.LVL15:
	.cfi_endproc
.LFE5:
	.size	caml_check_value_is_closure, .-caml_check_value_is_closure
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Access to field %lu of NULL: %s\n"
	.align	3
.LC4:
	.string	"Access to field %lu of non-boxed value %p is illegal: %s\n"
	.align	3
.LC5:
	.string	"Access to field %lu of value %p of size %lu is illegal: %s\n"
	.text
	.align	1
	.globl	caml_check_field_access
	.type	caml_check_field_access, @function
caml_check_field_access:
.LFB6:
	.loc 1 56 1
	.cfi_startproc
.LVL16:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 57 3
.LVL17:
	.loc 1 58 3
	.loc 1 59 3
	.loc 1 59 6 is_stmt 0
	beq	a0,zero,.L16
	.loc 1 65 3 is_stmt 1
	.loc 1 65 8 is_stmt 0
	andi	a5,a0,1
	.loc 1 65 6
	bne	a5,zero,.L17
	.loc 1 72 3 is_stmt 1
	.loc 1 72 7 is_stmt 0
	lbu	a4,-8(a0)
	.loc 1 72 6
	li	a5,249
	beq	a4,a5,.L18
	mv	a3,a0
.LVL18:
.L12:
	.loc 1 77 3 is_stmt 1
	.loc 1 78 3
	.loc 1 78 7 is_stmt 0
	srai	a1,a1,1
.LVL19:
	.loc 1 78 24
	ld	a6,-8(a3)
	srli	a6,a6,10
	.loc 1 78 6
	bgeu	a1,a6,.L19
	.loc 1 87 3 is_stmt 1
	.loc 1 88 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL20:
.L16:
	.cfi_restore_state
	.loc 1 60 5 is_stmt 1
	mv	a3,a2
	srai	a2,a1,1
.LVL21:
	lla	a1,.LC3
.LVL22:
	ld	a0,stderr
.LVL23:
	call	fprintf
.LVL24:
	.loc 1 63 5
	call	abort
.LVL25:
.L17:
	.loc 1 66 5
	mv	a4,a2
	mv	a3,a0
	srai	a2,a1,1
.LVL26:
	lla	a1,.LC4
.LVL27:
	ld	a0,stderr
.LVL28:
	call	fprintf
.LVL29:
	.loc 1 70 5
	call	abort
.LVL30:
.L18:
.LBB2:
	.loc 1 73 5
	.loc 1 73 22 is_stmt 0
	ld	a5,-8(a0)
	srli	a5,a5,10
	.loc 1 73 13
	slli	a3,a5,3
.LVL31:
	.loc 1 74 5 is_stmt 1
	.loc 1 74 7 is_stmt 0
	sub	a3,a0,a3
.LVL32:
	.loc 1 75 5 is_stmt 1
	.loc 1 75 9 is_stmt 0
	add	a1,a1,a5
.LVL33:
	j	.L12
.LVL34:
.L19:
.LBE2:
	.loc 1 79 5 is_stmt 1
	mv	a5,a2
	mv	a4,a6
	mv	a2,a1
.LVL35:
	lla	a1,.LC5
	ld	a0,stderr
.LVL36:
	call	fprintf
.LVL37:
	.loc 1 85 5
	call	abort
.LVL38:
	.cfi_endproc
.LFE6:
	.size	caml_check_field_access, .-caml_check_field_access
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "./caml/config.h"
	.file 5 "./caml/misc.h"
	.file 6 "./caml/mlvalues.h"
	.file 7 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x434
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF38
	.byte	0xc
	.4byte	.LASF39
	.4byte	.LASF40
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF8
	.byte	0x3
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
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF3
	.byte	0x5
	.4byte	.LASF41
	.byte	0x18
	.byte	0x2
	.byte	0x8
	.byte	0x10
	.4byte	0x91
	.byte	0x6
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.byte	0xe
	.4byte	0xc2
	.byte	0
	.byte	0x6
	.4byte	.LASF5
	.byte	0x2
	.byte	0xa
	.byte	0xb
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0xb
	.byte	0xb
	.4byte	0xc8
	.byte	0x10
	.byte	0
	.byte	0x7
	.4byte	0x34
	.4byte	0xaa
	.byte	0x8
	.4byte	0xaa
	.byte	0x8
	.4byte	0xb0
	.byte	0x8
	.4byte	0x34
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x5c
	.byte	0x9
	.byte	0x8
	.4byte	0xbd
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0xa
	.4byte	0xb6
	.byte	0x9
	.byte	0x8
	.4byte	0x91
	.byte	0x9
	.byte	0x8
	.4byte	0xb6
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc
	.byte	0x3
	.4byte	0x5c
	.byte	0xb
	.4byte	.LASF10
	.byte	0x2
	.byte	0x11
	.byte	0xe
	.4byte	0xe6
	.byte	0x9
	.byte	0x8
	.4byte	0xce
	.byte	0xb
	.4byte	.LASF11
	.byte	0x2
	.byte	0x12
	.byte	0xe
	.4byte	0xe6
	.byte	0xb
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1c
	.byte	0xe
	.4byte	0xe6
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF14
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF15
	.byte	0x3
	.4byte	.LASF16
	.byte	0x4
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF18
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0x13d
	.byte	0x9
	.byte	0x8
	.4byte	0x143
	.byte	0xc
	.byte	0xb
	.4byte	.LASF19
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF20
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0x131
	.byte	0x3
	.4byte	.LASF25
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x119
	.byte	0x3
	.4byte	.LASF26
	.byte	0x6
	.byte	0x3d
	.byte	0x11
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x3e
	.byte	0x11
	.4byte	0x125
	.byte	0xd
	.4byte	0x198
	.4byte	0x1bb
	.byte	0xe
	.byte	0
	.byte	0xf
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x15c
	.byte	0x15
	.4byte	0x1b0
	.byte	0xf
	.4byte	.LASF29
	.byte	0x6
	.2byte	0x171
	.byte	0xe
	.4byte	0x18c
	.byte	0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0x37
	.byte	0x7
	.4byte	0x18c
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x31e
	.byte	0x11
	.string	"v"
	.byte	0x1
	.byte	0x37
	.byte	0x25
	.4byte	0x18c
	.4byte	.LLST4
	.byte	0x11
	.string	"pos"
	.byte	0x1
	.byte	0x37
	.byte	0x2e
	.4byte	0x18c
	.4byte	.LLST5
	.byte	0x12
	.4byte	.LASF30
	.byte	0x1
	.byte	0x37
	.byte	0x39
	.4byte	0x18c
	.4byte	.LLST6
	.byte	0x13
	.4byte	.LASF31
	.byte	0x1
	.byte	0x39
	.byte	0xf
	.4byte	0xb0
	.4byte	.LLST7
	.byte	0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0x3a
	.byte	0x9
	.4byte	0x18c
	.4byte	.LLST8
	.byte	0x14
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x26b
	.byte	0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0x49
	.byte	0xd
	.4byte	0x125
	.4byte	.LLST9
	.byte	0
	.byte	0x15
	.8byte	.LVL24
	.4byte	0x41f
	.4byte	0x29a
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0x16
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x31
	.byte	0x26
	.byte	0x16
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x17
	.8byte	.LVL25
	.4byte	0x42b
	.byte	0x15
	.8byte	.LVL29
	.4byte	0x41f
	.4byte	0x2dd
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0x16
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x31
	.byte	0x26
	.byte	0x16
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x16
	.byte	0x1
	.byte	0x5e
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x17
	.8byte	.LVL30
	.4byte	0x42b
	.byte	0x15
	.8byte	.LVL37
	.4byte	0x41f
	.4byte	0x310
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0x16
	.byte	0x1
	.byte	0x5f
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x17
	.8byte	.LVL38
	.4byte	0x42b
	.byte	0
	.byte	0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x18
	.byte	0x7
	.4byte	0x18c
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x41f
	.byte	0x11
	.string	"v"
	.byte	0x1
	.byte	0x18
	.byte	0x29
	.4byte	0x18c
	.4byte	.LLST0
	.byte	0x12
	.4byte	.LASF30
	.byte	0x1
	.byte	0x18
	.byte	0x32
	.4byte	0x18c
	.4byte	.LLST1
	.byte	0x13
	.4byte	.LASF31
	.byte	0x1
	.byte	0x1a
	.byte	0xf
	.4byte	0xb0
	.4byte	.LLST2
	.byte	0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0x1b
	.byte	0x9
	.4byte	0x18c
	.4byte	.LLST3
	.byte	0x15
	.8byte	.LVL6
	.4byte	0x41f
	.4byte	0x3a4
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0x16
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x17
	.8byte	.LVL7
	.4byte	0x42b
	.byte	0x15
	.8byte	.LVL10
	.4byte	0x41f
	.4byte	0x3de
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0x16
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x16
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x17
	.8byte	.LVL11
	.4byte	0x42b
	.byte	0x15
	.8byte	.LVL14
	.4byte	0x41f
	.4byte	0x411
	.byte	0x16
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0x16
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x17
	.8byte	.LVL15
	.4byte	0x42b
	.byte	0
	.byte	0x18
	.4byte	.LASF36
	.4byte	.LASF36
	.byte	0x2
	.byte	0xe
	.byte	0x5
	.byte	0x18
	.4byte	.LASF37
	.4byte	.LASF37
	.byte	0x7
	.byte	0x6
	.byte	0x6
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xb
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
	.byte	0xc
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
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
.LLST4:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL29-1-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL37-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL24-1-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL29-1-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL37-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL37-1-.Ltext0
	.8byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL24-1-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL29-1-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL37-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL37-1-.Ltext0
	.8byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL23-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL29-1-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL36-.Ltext0
	.8byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL31-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x33
	.byte	0x24
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL10-1-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL6-1-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL10-1-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL14-1-.Ltext0
	.8byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL6-1-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL10-1-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL14-1-.Ltext0
	.8byte	.LFE5-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL10-1-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE5-.Ltext0
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
.LASF21:
	.string	"caml_minor_gc_begin_hook"
.LASF8:
	.string	"size_t"
.LASF11:
	.string	"stderr"
.LASF25:
	.string	"value"
.LASF32:
	.string	"orig_v"
.LASF10:
	.string	"stdout"
.LASF22:
	.string	"caml_minor_gc_end_hook"
.LASF38:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF19:
	.string	"caml_major_slice_begin_hook"
.LASF17:
	.string	"uintnat"
.LASF9:
	.string	"FILE"
.LASF36:
	.string	"fprintf"
.LASF40:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF1:
	.string	"long unsigned int"
.LASF28:
	.string	"caml_atom_table"
.LASF15:
	.string	"short unsigned int"
.LASF12:
	.string	"stdin"
.LASF27:
	.string	"mlsize_t"
.LASF4:
	.string	"write"
.LASF24:
	.string	"caml_finalise_end_hook"
.LASF6:
	.string	"wend"
.LASF30:
	.string	"v_descr"
.LASF23:
	.string	"caml_finalise_begin_hook"
.LASF20:
	.string	"caml_major_slice_end_hook"
.LASF13:
	.string	"unsigned int"
.LASF31:
	.string	"descr"
.LASF7:
	.string	"char"
.LASF34:
	.string	"caml_check_field_access"
.LASF35:
	.string	"caml_check_value_is_closure"
.LASF2:
	.string	"long long int"
.LASF39:
	.string	"clambda_checks.c"
.LASF33:
	.string	"offset"
.LASF26:
	.string	"header_t"
.LASF14:
	.string	"short int"
.LASF29:
	.string	"caml_global_data"
.LASF41:
	.string	"_FILE"
.LASF0:
	.string	"long int"
.LASF5:
	.string	"wpos"
.LASF3:
	.string	"long double"
.LASF18:
	.string	"caml_timing_hook"
.LASF37:
	.string	"abort"
.LASF16:
	.string	"intnat"
	.ident	"GCC: (GNU) 9.2.0"
