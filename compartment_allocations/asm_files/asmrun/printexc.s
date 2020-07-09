	.file	"printexc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	add_char, @function
add_char:
.LFB8:
	.file 1 "printexc.c"
	.loc 1 39 1
	.cfi_startproc
.LVL0:
	.loc 1 40 3
	.loc 1 40 10 is_stmt 0
	ld	a5,0(a0)
	.loc 1 40 21
	ld	a4,8(a0)
	.loc 1 40 6
	bgeu	a5,a4,.L1
	.loc 1 40 28 is_stmt 1 discriminator 1
	.loc 1 40 38 is_stmt 0 discriminator 1
	addi	a4,a5,1
	sd	a4,0(a0)
	.loc 1 40 42 discriminator 1
	sb	a1,0(a5)
.L1:
	.loc 1 41 1
	ret
	.cfi_endproc
.LFE8:
	.size	add_char, .-add_char
	.align	1
	.type	add_string, @function
add_string:
.LFB9:
	.loc 1 44 1 is_stmt 1
	.cfi_startproc
.LVL1:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	mv	s0,a0
	mv	s2,a1
	.loc 1 45 3
	.loc 1 45 13 is_stmt 0
	mv	a0,a1
.LVL2:
	call	strlen
.LVL3:
	.loc 1 45 7
	sext.w	s1,a0
.LVL4:
	.loc 1 46 3 is_stmt 1
	.loc 1 46 10 is_stmt 0
	ld	a0,0(s0)
	.loc 1 46 16
	add	a4,a0,s1
	.loc 1 46 27
	ld	a5,8(s0)
	.loc 1 46 6
	bleu	a4,a5,.L4
	.loc 1 46 34 is_stmt 1 discriminator 1
	.loc 1 46 38 is_stmt 0 discriminator 1
	subw	s1,a5,a0
.LVL5:
.L4:
	.loc 1 47 3 is_stmt 1
	.loc 1 47 6 is_stmt 0
	bgt	s1,zero,.L7
.L5:
	.loc 1 48 3 is_stmt 1
	.loc 1 48 12 is_stmt 0
	ld	a0,0(s0)
	add	s1,a0,s1
.LVL6:
	sd	s1,0(s0)
	.loc 1 49 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL7:
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
.LVL8:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL9:
.L7:
	.cfi_restore_state
	.loc 1 47 16 is_stmt 1 discriminator 1
	mv	a2,s1
	mv	a1,s2
	call	memmove
.LVL10:
	j	.L5
	.cfi_endproc
.LFE9:
	.size	add_string, .-add_string
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	", "
	.align	3
.LC1:
	.string	"%ld"
	.text
	.align	1
	.globl	caml_format_exception
	.type	caml_format_exception, @function
caml_format_exception:
.LFB10:
	.loc 1 52 1
	.cfi_startproc
.LVL11:
	addi	sp,sp,-384
	.cfi_def_cfa_offset 384
	sd	ra,376(sp)
	sd	s0,368(sp)
	sd	s1,360(sp)
	sd	s2,352(sp)
	sd	s3,344(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s1,a0
	.loc 1 53 3
	.loc 1 54 3
	.loc 1 55 3
	.loc 1 56 3
	.loc 1 57 3
	.loc 1 59 3
	.loc 1 59 11 is_stmt 0
	addi	a5,sp,80
	sd	a5,64(sp)
	.loc 1 60 3 is_stmt 1
	.loc 1 60 11 is_stmt 0
	addi	a5,sp,335
	sd	a5,72(sp)
	.loc 1 61 3 is_stmt 1
	.loc 1 61 7 is_stmt 0
	lbu	a5,-8(a0)
	.loc 1 61 6
	bne	a5,zero,.L9
	.loc 1 62 5 is_stmt 1
	.loc 1 62 22 is_stmt 0
	ld	a5,0(a0)
	.loc 1 62 5
	ld	a1,0(a5)
	addi	a0,sp,64
.LVL12:
	call	add_string
.LVL13:
	.loc 1 64 5 is_stmt 1
	.loc 1 64 9 is_stmt 0
	ld	a5,-8(s1)
	srli	a5,a5,10
	.loc 1 64 8
	li	a4,2
	beq	a5,a4,.L24
	.loc 1 72 13
	li	s3,1
.LVL14:
.L10:
	.loc 1 74 5 is_stmt 1
	li	a1,40
	addi	a0,sp,64
	call	add_char
.LVL15:
	.loc 1 75 5
	.loc 1 75 12 is_stmt 0
	mv	s0,s3
	.loc 1 75 5
	j	.L11
.LVL16:
.L24:
	.loc 1 65 9 discriminator 1
	ld	a5,8(s1)
	andi	a4,a5,1
	.loc 1 64 30 discriminator 1
	bne	a4,zero,.L20
	.loc 1 66 9
	lbu	a5,-8(a5)
	.loc 1 65 33
	beq	a5,zero,.L25
	.loc 1 72 13
	li	s3,1
	j	.L10
.L25:
	.loc 1 67 9
	ld	a0,0(s1)
	call	caml_is_special_exception
.LVL17:
	.loc 1 66 37
	beq	a0,zero,.L22
	.loc 1 68 7 is_stmt 1
	.loc 1 68 14 is_stmt 0
	ld	s1,8(s1)
.LVL18:
	.loc 1 69 7 is_stmt 1
	.loc 1 69 13 is_stmt 0
	li	s3,0
	j	.L10
.LVL19:
.L20:
	.loc 1 72 13
	li	s3,1
	j	.L10
.L22:
	li	s3,1
	j	.L10
.LVL20:
.L27:
	.loc 1 76 22 is_stmt 1 discriminator 1
	lla	a1,.LC0
	addi	a0,sp,64
	call	add_string
.LVL21:
	j	.L12
.LVL22:
.L28:
	.loc 1 79 9
	srai	a3,s2,1
	lla	a2,.LC1
	li	a1,64
	mv	a0,sp
	call	snprintf
.LVL23:
	.loc 1 81 9
	mv	a1,sp
	addi	a0,sp,64
	call	add_string
.LVL24:
	j	.L14
.L15:
	.loc 1 87 9
	li	a1,95
	addi	a0,sp,64
	call	add_char
.LVL25:
.L14:
	.loc 1 75 45 discriminator 2
	.loc 1 75 46 is_stmt 0 discriminator 2
	addi	s0,s0,1
.LVL26:
.L11:
	.loc 1 75 21 is_stmt 1 discriminator 1
	.loc 1 75 25 is_stmt 0 discriminator 1
	mv	s2,s1
	ld	a5,-8(s1)
	srli	a5,a5,10
	.loc 1 75 5 discriminator 1
	bleu	a5,s0,.L26
	.loc 1 76 7 is_stmt 1
	.loc 1 76 10 is_stmt 0
	bltu	s3,s0,.L27
.L12:
	.loc 1 77 7 is_stmt 1
	.loc 1 77 11 is_stmt 0
	slli	a5,s0,3
	add	a5,a5,s2
	.loc 1 77 9
	ld	s2,0(a5)
.LVL27:
	.loc 1 78 7 is_stmt 1
	.loc 1 78 11 is_stmt 0
	andi	a5,s2,1
	.loc 1 78 10
	bne	a5,zero,.L28
	.loc 1 82 14 is_stmt 1
	.loc 1 82 18 is_stmt 0
	lbu	a4,-8(s2)
	.loc 1 82 17
	li	a5,252
	bne	a4,a5,.L15
	.loc 1 83 9 is_stmt 1
	li	a1,34
	addi	a0,sp,64
	call	add_char
.LVL28:
	.loc 1 84 9
	mv	a1,s2
	addi	a0,sp,64
	call	add_string
.LVL29:
	.loc 1 85 9
	li	a1,34
	addi	a0,sp,64
	call	add_char
.LVL30:
	j	.L14
.LVL31:
.L26:
	.loc 1 90 5
	li	a1,41
	addi	a0,sp,64
	call	add_char
.LVL32:
	j	.L17
.LVL33:
.L9:
	.loc 1 92 5
	ld	a1,0(a0)
	addi	a0,sp,64
	call	add_string
.LVL34:
.L17:
	.loc 1 94 3
	.loc 1 94 7 is_stmt 0
	ld	a5,64(sp)
	.loc 1 94 12
	sb	zero,0(a5)
	.loc 1 95 3 is_stmt 1
	.loc 1 95 15 is_stmt 0
	ld	s0,64(sp)
	addi	a5,sp,80
	sub	s0,s0,a5
	.loc 1 95 26
	addi	s0,s0,1
.LVL35:
	.loc 1 96 3 is_stmt 1
	.loc 1 96 9 is_stmt 0
	mv	a0,s0
	call	caml_stat_alloc_noexc
.LVL36:
	mv	s1,a0
.LVL37:
	.loc 1 97 3 is_stmt 1
	.loc 1 97 6 is_stmt 0
	beq	a0,zero,.L8
	.loc 1 98 3 is_stmt 1
	mv	a2,s0
	addi	a1,sp,80
	call	memmove
.LVL38:
	.loc 1 99 3
.L8:
	.loc 1 100 1 is_stmt 0
	mv	a0,s1
	ld	ra,376(sp)
	.cfi_restore 1
	ld	s0,368(sp)
	.cfi_restore 8
.LVL39:
	ld	s1,360(sp)
	.cfi_restore 9
.LVL40:
	ld	s2,352(sp)
	.cfi_restore 18
	ld	s3,344(sp)
	.cfi_restore 19
	addi	sp,sp,384
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	caml_format_exception, .-caml_format_exception
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Pervasives.do_at_exit"
	.align	3
.LC3:
	.string	"Fatal error: exception %s\n"
	.text
	.align	1
	.type	default_fatal_uncaught_exception, @function
default_fatal_uncaught_exception:
.LFB11:
	.loc 1 111 1 is_stmt 1
	.cfi_startproc
.LVL41:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.loc 1 112 3
	.loc 1 113 3
	.loc 1 114 3
	.loc 1 117 3
	.loc 1 117 9 is_stmt 0
	call	caml_format_exception
.LVL42:
	mv	s0,a0
.LVL43:
	.loc 1 120 3 is_stmt 1
	.loc 1 120 26 is_stmt 0
	lla	a5,caml_backtrace_active
	lw	s3,0(a5)
.LVL44:
	.loc 1 121 3 is_stmt 1
	.loc 1 121 23 is_stmt 0
	lw	s2,caml_backtrace_pos
.LVL45:
	.loc 1 122 3 is_stmt 1
	.loc 1 122 25 is_stmt 0
	sw	zero,0(a5)
	.loc 1 123 3 is_stmt 1
	.loc 1 123 13 is_stmt 0
	lla	a0,.LC2
	call	caml_named_value
.LVL46:
	.loc 1 124 3 is_stmt 1
	.loc 1 124 6 is_stmt 0
	beq	a0,zero,.L30
	.loc 1 124 24 is_stmt 1 discriminator 1
	li	a1,1
	ld	a0,0(a0)
.LVL47:
	call	caml_callback_exn
.LVL48:
.L30:
	.loc 1 125 3
	.loc 1 125 25 is_stmt 0
	lla	s1,caml_backtrace_active
	sw	s3,0(s1)
	.loc 1 126 3 is_stmt 1
	.loc 1 126 22 is_stmt 0
	sw	s2,caml_backtrace_pos,a5
	.loc 1 128 3 is_stmt 1
	mv	a2,s0
	lla	a1,.LC3
	ld	a0,stderr
	call	fprintf
.LVL49:
	.loc 1 129 3
	mv	a0,s0
	call	caml_stat_free
.LVL50:
	.loc 1 131 3
	.loc 1 131 29 is_stmt 0
	lw	a5,0(s1)
	.loc 1 131 6
	bne	a5,zero,.L33
.L29:
	.loc 1 133 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL51:
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
.LVL52:
	ld	s3,8(sp)
	.cfi_restore 19
.LVL53:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL54:
.L33:
	.cfi_restore_state
	.loc 1 132 5 is_stmt 1
	call	caml_print_exception_backtrace
.LVL55:
	.loc 1 133 1 is_stmt 0
	j	.L29
	.cfi_endproc
.LFE11:
	.size	default_fatal_uncaught_exception, .-default_fatal_uncaught_exception
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Printexc.handle_uncaught_exception"
	.text
	.align	1
	.globl	caml_fatal_uncaught_exception
	.type	caml_fatal_uncaught_exception, @function
caml_fatal_uncaught_exception:
.LFB12:
	.loc 1 138 1 is_stmt 1
	.cfi_startproc
.LVL56:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 139 3
	.loc 1 141 3
	.loc 1 142 5 is_stmt 0
	lla	a0,.LC4
.LVL57:
	call	caml_named_value
.LVL58:
	.loc 1 143 3 is_stmt 1
	.loc 1 143 6 is_stmt 0
	beq	a0,zero,.L35
	.loc 1 145 5 is_stmt 1
	li	a2,1
	mv	a1,s0
	ld	a0,0(a0)
.LVL59:
	call	caml_callback2
.LVL60:
.L36:
	.loc 1 149 3
	.loc 1 149 7 is_stmt 0
	lw	a5,caml_abort_on_uncaught_exn
	.loc 1 149 6
	bne	a5,zero,.L39
	.loc 1 152 5 is_stmt 1
	li	a0,2
	call	exit
.LVL61:
.L35:
	.loc 1 147 5
	mv	a0,s0
.LVL62:
	call	default_fatal_uncaught_exception
.LVL63:
	j	.L36
.L39:
	.loc 1 150 5
	call	abort
.LVL64:
	.cfi_endproc
.LFE12:
	.size	caml_fatal_uncaught_exception, .-caml_fatal_uncaught_exception
	.globl	caml_abort_on_uncaught_exn
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.sbss,"aw",@nobits
	.align	2
	.type	caml_abort_on_uncaught_exn, @object
	.size	caml_abort_on_uncaught_exn, 4
caml_abort_on_uncaught_exn:
	.zero	4
	.text
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/config.h"
	.file 5 "caml/misc.h"
	.file 6 "caml/mlvalues.h"
	.file 7 "caml/backtrace.h"
	.file 8 "caml/callback.h"
	.file 9 "caml/debugger.h"
	.file 10 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 11 "caml/fail.h"
	.file 12 "caml/freelist.h"
	.file 13 "caml/major_gc.h"
	.file 14 "caml/address_class.h"
	.file 15 "caml/minor_gc.h"
	.file 16 "caml/memory.h"
	.file 17 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdlib.h"
	.file 18 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc60
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF126
	.byte	0xc
	.4byte	.LASF127
	.4byte	.LASF128
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
	.4byte	.LASF43
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
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0x149
	.byte	0x9
	.byte	0x8
	.4byte	0x14f
	.byte	0xc
	.byte	0xb
	.4byte	.LASF20
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0x13d
	.byte	0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0x13d
	.byte	0xd
	.byte	0x8
	.byte	0xe
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x169
	.byte	0x10
	.4byte	0x125
	.byte	0xe
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x171
	.byte	0x10
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF28
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x119
	.byte	0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0x3d
	.byte	0x11
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF30
	.byte	0x6
	.byte	0x3e
	.byte	0x11
	.4byte	0x125
	.byte	0xf
	.4byte	0x1c0
	.4byte	0x1e3
	.byte	0x10
	.byte	0
	.byte	0xe
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x15c
	.byte	0x15
	.4byte	0x1d8
	.byte	0xe
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x171
	.byte	0xe
	.4byte	0x1b4
	.byte	0xb
	.4byte	.LASF33
	.byte	0x7
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF34
	.byte	0x7
	.byte	0x41
	.byte	0x10
	.4byte	0x198
	.byte	0xb
	.4byte	.LASF35
	.byte	0x7
	.byte	0x52
	.byte	0x1d
	.4byte	0x221
	.byte	0x9
	.byte	0x8
	.4byte	0x209
	.byte	0xb
	.4byte	.LASF36
	.byte	0x7
	.byte	0x53
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF37
	.byte	0x7
	.byte	0x61
	.byte	0x12
	.4byte	0x1b4
	.byte	0x9
	.byte	0x8
	.4byte	0x1b4
	.byte	0xb
	.4byte	.LASF38
	.byte	0x8
	.byte	0x39
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF39
	.byte	0x9
	.byte	0x1a
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF40
	.byte	0x9
	.byte	0x1b
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF41
	.byte	0x9
	.byte	0x1c
	.byte	0x10
	.4byte	0x125
	.byte	0x3
	.4byte	.LASF42
	.byte	0xa
	.byte	0x4
	.byte	0xd
	.4byte	0x47
	.byte	0x5
	.4byte	.LASF44
	.byte	0x4
	.byte	0xb
	.byte	0x2c
	.byte	0x8
	.4byte	0x29c
	.byte	0x11
	.string	"buf"
	.byte	0xb
	.byte	0x2d
	.byte	0xe
	.4byte	0x275
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF45
	.byte	0xb
	.byte	0x3e
	.byte	0x24
	.4byte	0x2a8
	.byte	0x9
	.byte	0x8
	.4byte	0x281
	.byte	0xb
	.4byte	.LASF46
	.byte	0xb
	.byte	0x3f
	.byte	0xe
	.4byte	0x1b4
	.byte	0xb
	.4byte	.LASF47
	.byte	0xc
	.byte	0x1a
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF48
	.byte	0xd
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF49
	.byte	0xd
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF50
	.byte	0xd
	.byte	0x26
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF51
	.byte	0xd
	.byte	0x27
	.byte	0xf
	.4byte	0x2f6
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF52
	.byte	0xb
	.4byte	.LASF53
	.byte	0xd
	.byte	0x28
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF54
	.byte	0xd
	.byte	0x28
	.byte	0x25
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF55
	.byte	0xd
	.byte	0x29
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF56
	.byte	0xd
	.byte	0x3e
	.byte	0x12
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF57
	.byte	0xd
	.byte	0x3f
	.byte	0x10
	.4byte	0x125
	.byte	0xb
	.4byte	.LASF58
	.byte	0xd
	.byte	0x40
	.byte	0xe
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF59
	.byte	0xd
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xf
	.4byte	0x2f6
	.4byte	0x361
	.byte	0x12
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x13
	.4byte	.LASF60
	.byte	0xd
	.byte	0x43
	.byte	0x8
	.4byte	0x351
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x13
	.4byte	.LASF61
	.byte	0xd
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x13
	.4byte	.LASF62
	.byte	0xd
	.byte	0x45
	.byte	0x8
	.4byte	0x2f6
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0xb
	.4byte	.LASF63
	.byte	0xd
	.byte	0x46
	.byte	0xf
	.4byte	0x2f6
	.byte	0xb
	.4byte	.LASF64
	.byte	0xd
	.byte	0x4a
	.byte	0x13
	.4byte	0x149
	.byte	0xb
	.4byte	.LASF65
	.byte	0xe
	.byte	0x31
	.byte	0xf
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF66
	.byte	0xe
	.byte	0x31
	.byte	0x22
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF67
	.byte	0xe
	.byte	0x32
	.byte	0xf
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF68
	.byte	0xe
	.byte	0x32
	.byte	0x27
	.4byte	0xc8
	.byte	0xb
	.4byte	.LASF69
	.byte	0xf
	.byte	0x18
	.byte	0x13
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF70
	.byte	0xf
	.byte	0x18
	.byte	0x2c
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF71
	.byte	0xf
	.byte	0x19
	.byte	0x13
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF72
	.byte	0xf
	.byte	0x19
	.byte	0x24
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF73
	.byte	0xf
	.byte	0x1a
	.byte	0x13
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF74
	.byte	0xf
	.byte	0x1b
	.byte	0x10
	.4byte	0x131
	.byte	0xb
	.4byte	.LASF75
	.byte	0xf
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF76
	.byte	0xf
	.byte	0x1d
	.byte	0xf
	.4byte	0x2f6
	.byte	0x5
	.4byte	.LASF77
	.byte	0x38
	.byte	0xf
	.byte	0x29
	.byte	0x8
	.4byte	0x4b4
	.byte	0x6
	.4byte	.LASF78
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x4b4
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x4b4
	.byte	0x8
	.byte	0x6
	.4byte	.LASF79
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x4b4
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x4b4
	.byte	0x18
	.byte	0x6
	.4byte	.LASF80
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x4b4
	.byte	0x20
	.byte	0x6
	.4byte	.LASF81
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF82
	.byte	0xf
	.byte	0x29
	.byte	0x17
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF77
	.byte	0xf
	.byte	0x2a
	.byte	0x22
	.4byte	0x44b
	.byte	0x5
	.4byte	.LASF83
	.byte	0x10
	.byte	0xf
	.byte	0x2c
	.byte	0x8
	.4byte	0x4ee
	.byte	0x6
	.4byte	.LASF84
	.byte	0xf
	.byte	0x2d
	.byte	0x9
	.4byte	0x1b4
	.byte	0
	.byte	0x6
	.4byte	.LASF85
	.byte	0xf
	.byte	0x2e
	.byte	0xc
	.4byte	0x1cc
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF86
	.byte	0x38
	.byte	0xf
	.byte	0x31
	.byte	0x8
	.4byte	0x557
	.byte	0x6
	.4byte	.LASF78
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x557
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x557
	.byte	0x8
	.byte	0x6
	.4byte	.LASF79
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x557
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x557
	.byte	0x18
	.byte	0x6
	.4byte	.LASF80
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x557
	.byte	0x20
	.byte	0x6
	.4byte	.LASF81
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF82
	.byte	0xf
	.byte	0x31
	.byte	0x1c
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x4c6
	.byte	0xb
	.4byte	.LASF86
	.byte	0xf
	.byte	0x32
	.byte	0x27
	.4byte	0x4ee
	.byte	0x5
	.4byte	.LASF87
	.byte	0x18
	.byte	0xf
	.byte	0x34
	.byte	0x8
	.4byte	0x59e
	.byte	0x6
	.4byte	.LASF88
	.byte	0xf
	.byte	0x35
	.byte	0x9
	.4byte	0x1b4
	.byte	0
	.byte	0x11
	.string	"mem"
	.byte	0xf
	.byte	0x36
	.byte	0xc
	.4byte	0x1cc
	.byte	0x8
	.byte	0x11
	.string	"max"
	.byte	0xf
	.byte	0x37
	.byte	0xc
	.4byte	0x1cc
	.byte	0x10
	.byte	0
	.byte	0x5
	.4byte	.LASF89
	.byte	0x38
	.byte	0xf
	.byte	0x3a
	.byte	0x8
	.4byte	0x607
	.byte	0x6
	.4byte	.LASF78
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x607
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x607
	.byte	0x8
	.byte	0x6
	.4byte	.LASF79
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x607
	.byte	0x10
	.byte	0x11
	.string	"ptr"
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x607
	.byte	0x18
	.byte	0x6
	.4byte	.LASF80
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x607
	.byte	0x20
	.byte	0x6
	.4byte	.LASF81
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x131
	.byte	0x28
	.byte	0x6
	.4byte	.LASF82
	.byte	0xf
	.byte	0x3a
	.byte	0x1a
	.4byte	0x131
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x569
	.byte	0xb
	.4byte	.LASF89
	.byte	0xf
	.byte	0x3b
	.byte	0x25
	.4byte	0x59e
	.byte	0xb
	.4byte	.LASF90
	.byte	0x10
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0xb
	.4byte	.LASF91
	.byte	0x10
	.byte	0xb7
	.byte	0x10
	.4byte	0x125
	.byte	0x5
	.4byte	.LASF92
	.byte	0x40
	.byte	0x10
	.byte	0xf3
	.byte	0x8
	.4byte	0x673
	.byte	0x6
	.4byte	.LASF93
	.byte	0x10
	.byte	0xf4
	.byte	0x1d
	.4byte	0x673
	.byte	0
	.byte	0x6
	.4byte	.LASF94
	.byte	0x10
	.byte	0xf5
	.byte	0xa
	.4byte	0x119
	.byte	0x8
	.byte	0x6
	.4byte	.LASF95
	.byte	0x10
	.byte	0xf6
	.byte	0xa
	.4byte	0x119
	.byte	0x10
	.byte	0x6
	.4byte	.LASF96
	.byte	0x10
	.byte	0xf7
	.byte	0xa
	.4byte	0x679
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x631
	.byte	0xf
	.4byte	0x23f
	.4byte	0x689
	.byte	0x12
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0xb
	.4byte	.LASF97
	.byte	0x10
	.byte	0xfa
	.byte	0x26
	.4byte	0x673
	.byte	0x14
	.4byte	.LASF98
	.2byte	0x110
	.byte	0x1
	.byte	0x20
	.byte	0x8
	.4byte	0x6cb
	.byte	0x11
	.string	"ptr"
	.byte	0x1
	.byte	0x21
	.byte	0xa
	.4byte	0xc8
	.byte	0
	.byte	0x11
	.string	"end"
	.byte	0x1
	.byte	0x22
	.byte	0xa
	.4byte	0xc8
	.byte	0x8
	.byte	0x6
	.4byte	.LASF99
	.byte	0x1
	.byte	0x23
	.byte	0x8
	.4byte	0x6cb
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	0xb6
	.4byte	0x6db
	.byte	0x12
	.4byte	0x40
	.byte	0xff
	.byte	0
	.byte	0x13
	.4byte	.LASF100
	.byte	0x1
	.byte	0x87
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_abort_on_uncaught_exn
	.byte	0x15
	.4byte	.LASF105
	.byte	0x1
	.byte	0x89
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x7a8
	.byte	0x16
	.string	"exn"
	.byte	0x1
	.byte	0x89
	.byte	0x2a
	.4byte	0x1b4
	.4byte	.LLST14
	.byte	0x17
	.4byte	.LASF101
	.byte	0x1
	.byte	0x8b
	.byte	0xa
	.4byte	0x23f
	.4byte	.LLST15
	.byte	0x18
	.8byte	.LVL58
	.4byte	0xbc7
	.4byte	0x74e
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0
	.byte	0x18
	.8byte	.LVL60
	.4byte	0xbd3
	.4byte	0x76b
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x18
	.8byte	.LVL61
	.4byte	0xbdf
	.4byte	0x782
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0x18
	.8byte	.LVL63
	.4byte	0x7a8
	.4byte	0x79a
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1a
	.8byte	.LVL64
	.4byte	0xbeb
	.byte	0
	.byte	0x1b
	.4byte	.LASF110
	.byte	0x1
	.byte	0x6e
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x8b0
	.byte	0x16
	.string	"exn"
	.byte	0x1
	.byte	0x6e
	.byte	0x34
	.4byte	0x1b4
	.4byte	.LLST9
	.byte	0x1c
	.string	"msg"
	.byte	0x1
	.byte	0x70
	.byte	0xa
	.4byte	0xc8
	.4byte	.LLST10
	.byte	0x17
	.4byte	.LASF102
	.byte	0x1
	.byte	0x71
	.byte	0xb
	.4byte	0x23f
	.4byte	.LLST11
	.byte	0x17
	.4byte	.LASF103
	.byte	0x1
	.byte	0x72
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST12
	.byte	0x17
	.4byte	.LASF104
	.byte	0x1
	.byte	0x72
	.byte	0x1f
	.4byte	0x47
	.4byte	.LLST13
	.byte	0x18
	.8byte	.LVL42
	.4byte	0x8b0
	.4byte	0x82f
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x18
	.8byte	.LVL46
	.4byte	0xbc7
	.4byte	0x84e
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0x18
	.8byte	.LVL48
	.4byte	0xbf7
	.4byte	0x865
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x18
	.8byte	.LVL49
	.4byte	0xc03
	.4byte	0x88a
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL50
	.4byte	0xc0f
	.4byte	0x8a2
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1a
	.8byte	.LVL55
	.4byte	0xc1b
	.byte	0
	.byte	0x1d
	.4byte	.LASF106
	.byte	0x1
	.byte	0x33
	.byte	0x13
	.4byte	0xc8
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xaf9
	.byte	0x16
	.string	"exn"
	.byte	0x1
	.byte	0x33
	.byte	0x2f
	.4byte	0x1b4
	.4byte	.LLST3
	.byte	0x17
	.4byte	.LASF107
	.byte	0x1
	.byte	0x35
	.byte	0xc
	.4byte	0x1cc
	.4byte	.LLST4
	.byte	0x1c
	.string	"i"
	.byte	0x1
	.byte	0x35
	.byte	0x13
	.4byte	0x1cc
	.4byte	.LLST5
	.byte	0x17
	.4byte	.LASF108
	.byte	0x1
	.byte	0x36
	.byte	0x9
	.4byte	0x1b4
	.4byte	.LLST6
	.byte	0x1c
	.string	"v"
	.byte	0x1
	.byte	0x36
	.byte	0x11
	.4byte	0x1b4
	.4byte	.LLST7
	.byte	0x1e
	.string	"buf"
	.byte	0x1
	.byte	0x37
	.byte	0x14
	.4byte	0x695
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x1f
	.4byte	.LASF109
	.byte	0x1
	.byte	0x38
	.byte	0x8
	.4byte	0xaf9
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7d
	.byte	0x1c
	.string	"res"
	.byte	0x1
	.byte	0x39
	.byte	0xa
	.4byte	0xc8
	.4byte	.LLST8
	.byte	0x18
	.8byte	.LVL13
	.4byte	0xb09
	.4byte	0x967
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0
	.byte	0x18
	.8byte	.LVL15
	.4byte	0xb8e
	.4byte	0x986
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0x1a
	.8byte	.LVL17
	.4byte	0xc27
	.byte	0x18
	.8byte	.LVL21
	.4byte	0xb09
	.4byte	0x9b9
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0x18
	.8byte	.LVL23
	.4byte	0xc33
	.4byte	0x9ec
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x4
	.byte	0x82
	.byte	0
	.byte	0x31
	.byte	0x26
	.byte	0
	.byte	0x18
	.8byte	.LVL24
	.4byte	0xb09
	.4byte	0xa0b
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL25
	.4byte	0xb8e
	.4byte	0xa2a
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x5f
	.byte	0
	.byte	0x18
	.8byte	.LVL28
	.4byte	0xb8e
	.4byte	0xa49
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x22
	.byte	0
	.byte	0x18
	.8byte	.LVL29
	.4byte	0xb09
	.4byte	0xa68
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL30
	.4byte	0xb8e
	.4byte	0xa87
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x22
	.byte	0
	.byte	0x18
	.8byte	.LVL32
	.4byte	0xb8e
	.4byte	0xaa6
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0x29
	.byte	0
	.byte	0x18
	.8byte	.LVL34
	.4byte	0xb09
	.4byte	0xabf
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7d
	.byte	0
	.byte	0x18
	.8byte	.LVL36
	.4byte	0xc3f
	.4byte	0xad7
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x20
	.8byte	.LVL38
	.4byte	0xc4b
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x7d
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	0xb6
	.4byte	0xb09
	.byte	0x12
	.4byte	0x40
	.byte	0x3f
	.byte	0
	.byte	0x1b
	.4byte	.LASF111
	.byte	0x1
	.byte	0x2b
	.byte	0xd
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xb88
	.byte	0x16
	.string	"buf"
	.byte	0x1
	.byte	0x2b
	.byte	0x2a
	.4byte	0xb88
	.4byte	.LLST0
	.byte	0x16
	.string	"s"
	.byte	0x1
	.byte	0x2b
	.byte	0x3b
	.4byte	0xb0
	.4byte	.LLST1
	.byte	0x1c
	.string	"len"
	.byte	0x1
	.byte	0x2d
	.byte	0x7
	.4byte	0x47
	.4byte	.LLST2
	.byte	0x18
	.8byte	.LVL3
	.4byte	0xc57
	.4byte	0xb6d
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x20
	.8byte	.LVL10
	.4byte	0xc4b
	.byte	0x19
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x695
	.byte	0x1b
	.4byte	.LASF112
	.byte	0x1
	.byte	0x26
	.byte	0xd
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xbc7
	.byte	0x21
	.string	"buf"
	.byte	0x1
	.byte	0x26
	.byte	0x28
	.4byte	0xb88
	.byte	0x1
	.byte	0x5a
	.byte	0x21
	.string	"c"
	.byte	0x1
	.byte	0x26
	.byte	0x32
	.4byte	0xb6
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x22
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0x8
	.byte	0x2e
	.byte	0x14
	.byte	0x22
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x8
	.byte	0x1f
	.byte	0x12
	.byte	0x22
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x11
	.byte	0x7
	.byte	0x6
	.byte	0x22
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x11
	.byte	0x6
	.byte	0x6
	.byte	0x22
	.4byte	.LASF117
	.4byte	.LASF117
	.byte	0x8
	.byte	0x24
	.byte	0x12
	.byte	0x22
	.4byte	.LASF118
	.4byte	.LASF118
	.byte	0x2
	.byte	0xe
	.byte	0x5
	.byte	0x22
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0x10
	.byte	0x85
	.byte	0x11
	.byte	0x22
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x7
	.byte	0x81
	.byte	0x11
	.byte	0x22
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0xb
	.byte	0x40
	.byte	0x5
	.byte	0x22
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0x2
	.byte	0x14
	.byte	0x5
	.byte	0x22
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0x10
	.byte	0x6c
	.byte	0x1c
	.byte	0x22
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x12
	.byte	0x9
	.byte	0x7
	.byte	0x22
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0x12
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x15
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
	.byte	0x87,0x1
	.byte	0x19
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0x1
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
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
.LLST14:
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL57-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL61-.Ltext0
	.8byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL54-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL46-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL54-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL54-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL34-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL15-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL37-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL40-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL3-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL3-1-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL9-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x59
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
.LASF40:
	.string	"caml_debugger_fork_mode"
.LASF76:
	.string	"caml_extra_heap_resources_minor"
.LASF8:
	.string	"size_t"
.LASF75:
	.string	"caml_in_minor_collection"
.LASF95:
	.string	"nitems"
.LASF56:
	.string	"caml_heap_start"
.LASF27:
	.string	"caml_runtime_warnings"
.LASF32:
	.string	"caml_global_data"
.LASF62:
	.string	"caml_major_work_credit"
.LASF29:
	.string	"header_t"
.LASF105:
	.string	"caml_fatal_uncaught_exception"
.LASF6:
	.string	"wend"
.LASF42:
	.string	"sigjmp_buf"
.LASF80:
	.string	"limit"
.LASF114:
	.string	"caml_callback2"
.LASF10:
	.string	"stdout"
.LASF109:
	.string	"intbuf"
.LASF110:
	.string	"default_fatal_uncaught_exception"
.LASF93:
	.string	"next"
.LASF66:
	.string	"caml_young_end"
.LASF19:
	.string	"caml_timing_hook"
.LASF2:
	.string	"long long int"
.LASF55:
	.string	"caml_fl_wsz_at_phase_change"
.LASF59:
	.string	"caml_major_window"
.LASF0:
	.string	"long int"
.LASF38:
	.string	"caml_callback_depth"
.LASF12:
	.string	"stdin"
.LASF112:
	.string	"add_char"
.LASF39:
	.string	"caml_debugger_in_use"
.LASF108:
	.string	"bucket"
.LASF83:
	.string	"caml_ephe_ref_elt"
.LASF52:
	.string	"double"
.LASF50:
	.string	"caml_allocated_words"
.LASF34:
	.string	"backtrace_slot"
.LASF5:
	.string	"wpos"
.LASF96:
	.string	"tables"
.LASF106:
	.string	"caml_format_exception"
.LASF26:
	.string	"caml_verb_gc"
.LASF74:
	.string	"caml_minor_heap_wsz"
.LASF57:
	.string	"total_heap_size"
.LASF60:
	.string	"caml_major_ring"
.LASF41:
	.string	"caml_event_count"
.LASF28:
	.string	"value"
.LASF69:
	.string	"caml_young_alloc_start"
.LASF88:
	.string	"block"
.LASF13:
	.string	"unsigned int"
.LASF47:
	.string	"caml_fl_cur_wsz"
.LASF118:
	.string	"fprintf"
.LASF70:
	.string	"caml_young_alloc_end"
.LASF16:
	.string	"intnat"
.LASF1:
	.string	"long unsigned int"
.LASF103:
	.string	"saved_backtrace_active"
.LASF37:
	.string	"caml_backtrace_last_exn"
.LASF30:
	.string	"mlsize_t"
.LASF100:
	.string	"caml_abort_on_uncaught_exn"
.LASF104:
	.string	"saved_backtrace_pos"
.LASF99:
	.string	"data"
.LASF43:
	.string	"_FILE"
.LASF81:
	.string	"size"
.LASF15:
	.string	"short unsigned int"
.LASF17:
	.string	"uintnat"
.LASF36:
	.string	"caml_backtrace_pos"
.LASF126:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF87:
	.string	"caml_custom_elt"
.LASF64:
	.string	"caml_major_gc_hook"
.LASF119:
	.string	"caml_stat_free"
.LASF127:
	.string	"printexc.c"
.LASF101:
	.string	"handle_uncaught_exception"
.LASF4:
	.string	"write"
.LASF61:
	.string	"caml_major_ring_index"
.LASF18:
	.string	"asize_t"
.LASF3:
	.string	"long double"
.LASF102:
	.string	"at_exit"
.LASF54:
	.string	"caml_dependent_allocated"
.LASF90:
	.string	"caml_huge_fallback_count"
.LASF97:
	.string	"caml_local_roots"
.LASF125:
	.string	"strlen"
.LASF86:
	.string	"caml_ephe_ref_table"
.LASF23:
	.string	"caml_minor_gc_end_hook"
.LASF98:
	.string	"stringbuf"
.LASF117:
	.string	"caml_callback_exn"
.LASF65:
	.string	"caml_young_start"
.LASF123:
	.string	"caml_stat_alloc_noexc"
.LASF20:
	.string	"caml_major_slice_begin_hook"
.LASF78:
	.string	"base"
.LASF79:
	.string	"threshold"
.LASF22:
	.string	"caml_minor_gc_begin_hook"
.LASF24:
	.string	"caml_finalise_begin_hook"
.LASF14:
	.string	"short int"
.LASF33:
	.string	"caml_backtrace_active"
.LASF111:
	.string	"add_string"
.LASF9:
	.string	"FILE"
.LASF115:
	.string	"exit"
.LASF89:
	.string	"caml_custom_table"
.LASF94:
	.string	"ntables"
.LASF63:
	.string	"caml_gc_clock"
.LASF67:
	.string	"caml_code_area_start"
.LASF46:
	.string	"caml_exn_bucket"
.LASF7:
	.string	"char"
.LASF45:
	.string	"caml_external_raise"
.LASF116:
	.string	"abort"
.LASF31:
	.string	"caml_atom_table"
.LASF121:
	.string	"caml_is_special_exception"
.LASF85:
	.string	"offset"
.LASF120:
	.string	"caml_print_exception_backtrace"
.LASF122:
	.string	"snprintf"
.LASF58:
	.string	"caml_gc_sweep_hp"
.LASF113:
	.string	"caml_named_value"
.LASF72:
	.string	"caml_young_limit"
.LASF11:
	.string	"stderr"
.LASF82:
	.string	"reserve"
.LASF73:
	.string	"caml_young_trigger"
.LASF124:
	.string	"memmove"
.LASF91:
	.string	"caml_use_huge_pages"
.LASF68:
	.string	"caml_code_area_end"
.LASF128:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF53:
	.string	"caml_dependent_size"
.LASF51:
	.string	"caml_extra_heap_resources"
.LASF107:
	.string	"start"
.LASF71:
	.string	"caml_young_ptr"
.LASF25:
	.string	"caml_finalise_end_hook"
.LASF21:
	.string	"caml_major_slice_end_hook"
.LASF48:
	.string	"caml_gc_phase"
.LASF92:
	.string	"caml__roots_block"
.LASF35:
	.string	"caml_backtrace_buffer"
.LASF77:
	.string	"caml_ref_table"
.LASF84:
	.string	"ephe"
.LASF44:
	.string	"longjmp_buffer"
.LASF49:
	.string	"caml_gc_subphase"
	.ident	"GCC: (GNU) 9.2.0"
