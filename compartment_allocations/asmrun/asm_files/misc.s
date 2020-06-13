	.file	"misc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_gc_message
	.type	caml_gc_message, @function
caml_gc_message:
.LFB8:
	.file 1 "misc.c"
	.loc 1 57 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -56
	.cfi_offset 8, -64
	sd	a2,32(sp)
	sd	a3,40(sp)
	sd	a4,48(sp)
	sd	a5,56(sp)
	sd	a6,64(sp)
	sd	a7,72(sp)
	.loc 1 58 3
	.loc 1 58 21 is_stmt 0
	ld	a5,caml_verb_gc
	and	a0,a0,a5
.LVL1:
	.loc 1 58 6
	bne	a0,zero,.L4
.LVL2:
.L1:
	.loc 1 65 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.LVL3:
.L4:
	.cfi_restore_state
.LBB2:
	.loc 1 59 5 is_stmt 1
	.loc 1 60 5
	addi	a2,sp,32
	sd	a2,8(sp)
	.loc 1 61 5
	lla	s0,stderr
	ld	a0,0(s0)
	call	vfprintf
.LVL4:
	.loc 1 62 5
	.loc 1 63 5
	ld	a0,0(s0)
	call	fflush
.LVL5:
.LBE2:
	.loc 1 65 1 is_stmt 0
	j	.L1
	.cfi_endproc
.LFE8:
	.size	caml_gc_message, .-caml_gc_message
	.align	1
	.globl	caml_fatal_error
	.type	caml_fatal_error, @function
caml_fatal_error:
.LFB9:
	.loc 1 68 1 is_stmt 1
	.cfi_startproc
.LVL6:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 69 3
	ld	a1,stderr
	call	fputs
.LVL7:
	.loc 1 70 3
	li	a0,2
	call	exit
.LVL8:
	.cfi_endproc
.LFE9:
	.size	caml_fatal_error, .-caml_fatal_error
	.align	1
	.globl	caml_fatal_error_arg
	.type	caml_fatal_error_arg, @function
caml_fatal_error_arg:
.LFB10:
	.loc 1 74 1
	.cfi_startproc
.LVL9:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	mv	a2,a1
	.loc 1 75 3
	mv	a1,a0
.LVL10:
	ld	a0,stderr
.LVL11:
	call	fprintf
.LVL12:
	.loc 1 76 3
	li	a0,2
	call	exit
.LVL13:
	.cfi_endproc
.LFE10:
	.size	caml_fatal_error_arg, .-caml_fatal_error_arg
	.align	1
	.globl	caml_fatal_error_arg2
	.type	caml_fatal_error_arg2, @function
caml_fatal_error_arg2:
.LFB11:
	.loc 1 81 1
	.cfi_startproc
.LVL14:
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
	mv	s0,a2
	mv	s1,a3
	.loc 1 82 3
	lla	s2,stderr
	mv	a2,a1
.LVL15:
	mv	a1,a0
.LVL16:
	ld	a0,0(s2)
.LVL17:
	call	fprintf
.LVL18:
	.loc 1 83 3
	mv	a2,s1
	mv	a1,s0
	ld	a0,0(s2)
	call	fprintf
.LVL19:
	.loc 1 84 3
	li	a0,2
	call	exit
.LVL20:
	.cfi_endproc
.LFE11:
	.size	caml_fatal_error_arg2, .-caml_fatal_error_arg2
	.align	1
	.globl	caml_ext_table_init
	.type	caml_ext_table_init, @function
caml_ext_table_init:
.LFB12:
	.loc 1 91 1
	.cfi_startproc
.LVL21:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 92 3
	.loc 1 92 13 is_stmt 0
	sw	zero,0(a0)
	.loc 1 93 3 is_stmt 1
	.loc 1 93 17 is_stmt 0
	sw	a1,4(a0)
	.loc 1 94 3 is_stmt 1
	.loc 1 94 19 is_stmt 0
	slli	a0,a1,3
.LVL22:
	call	caml_stat_alloc
.LVL23:
	.loc 1 94 17
	sd	a0,8(s0)
	.loc 1 95 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL24:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	caml_ext_table_init, .-caml_ext_table_init
	.align	1
	.globl	caml_ext_table_add
	.type	caml_ext_table_add, @function
caml_ext_table_add:
.LFB13:
	.loc 1 98 1 is_stmt 1
	.cfi_startproc
.LVL25:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s0,a0
	mv	s1,a1
	.loc 1 99 3
	.loc 1 100 3
	.loc 1 100 10 is_stmt 0
	lw	a4,0(a0)
	.loc 1 100 23
	lw	a5,4(a0)
	.loc 1 100 6
	bge	a4,a5,.L16
.LVL26:
.L14:
	.loc 1 105 3 is_stmt 1
	.loc 1 105 7 is_stmt 0
	lw	a0,0(s0)
.LVL27:
	.loc 1 106 3 is_stmt 1
	.loc 1 106 6 is_stmt 0
	ld	a5,8(s0)
	.loc 1 106 16
	slli	a4,a0,3
	add	a5,a5,a4
	.loc 1 106 22
	sd	s1,0(a5)
	.loc 1 107 3 is_stmt 1
	.loc 1 107 6 is_stmt 0
	lw	a5,0(s0)
	.loc 1 107 12
	addiw	a5,a5,1
	sw	a5,0(s0)
	.loc 1 108 3 is_stmt 1
	.loc 1 109 1 is_stmt 0
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
.LVL28:
	ld	s1,8(sp)
	.cfi_restore 9
.LVL29:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL30:
.L16:
	.cfi_restore_state
	.loc 1 101 5 is_stmt 1
	.loc 1 101 19 is_stmt 0
	slliw	a5,a5,1
	sext.w	a1,a5
	sw	a5,4(a0)
	.loc 1 102 5 is_stmt 1
	.loc 1 103 7 is_stmt 0
	slli	a1,a1,3
	ld	a0,8(a0)
	call	caml_stat_resize
.LVL31:
	.loc 1 102 19
	sd	a0,8(s0)
	j	.L14
	.cfi_endproc
.LFE13:
	.size	caml_ext_table_add, .-caml_ext_table_add
	.align	1
	.globl	caml_ext_table_remove
	.type	caml_ext_table_remove, @function
caml_ext_table_remove:
.LFB14:
	.loc 1 112 1 is_stmt 1
	.cfi_startproc
.LVL32:
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
	mv	s1,a0
	mv	s3,a1
	.loc 1 113 3
	.loc 1 114 3
.LVL33:
	.loc 1 114 10 is_stmt 0
	li	s0,0
	.loc 1 114 3
	j	.L18
.LVL34:
.L19:
	.loc 1 114 30 is_stmt 1 discriminator 2
	.loc 1 114 31 is_stmt 0 discriminator 2
	addiw	s0,s0,1
.LVL35:
.L18:
	.loc 1 114 15 is_stmt 1 discriminator 1
	.loc 1 114 22 is_stmt 0 discriminator 1
	lw	a5,0(s1)
	.loc 1 114 3 discriminator 1
	ble	a5,s0,.L22
	.loc 1 115 5 is_stmt 1
	.loc 1 115 12 is_stmt 0
	ld	a5,8(s1)
	.loc 1 115 22
	slli	s2,s0,3
	add	a5,a5,s2
	ld	a0,0(a5)
	.loc 1 115 8
	bne	a0,s3,.L19
	.loc 1 116 7 is_stmt 1
	call	caml_stat_free
.LVL36:
	.loc 1 117 7
	.loc 1 117 19 is_stmt 0
	ld	a0,8(s1)
	.loc 1 117 48
	addi	a1,s0,1
	slli	a1,a1,3
	.loc 1 118 19
	lw	a2,0(s1)
	.loc 1 118 26
	subw	a2,a2,s0
	.loc 1 118 30
	addiw	a2,a2,-1
	.loc 1 117 7
	slli	a2,a2,3
	add	a1,a0,a1
	add	a0,a0,s2
	call	memmove
.LVL37:
	.loc 1 119 7 is_stmt 1
	.loc 1 119 10 is_stmt 0
	lw	a5,0(s1)
	.loc 1 119 16
	addiw	a5,a5,-1
	sw	a5,0(s1)
	j	.L19
.L22:
	.loc 1 122 1
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
.LVL38:
	ld	s1,24(sp)
	.cfi_restore 9
.LVL39:
	ld	s2,16(sp)
	.cfi_restore 18
	ld	s3,8(sp)
	.cfi_restore 19
.LVL40:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_ext_table_remove, .-caml_ext_table_remove
	.align	1
	.globl	caml_ext_table_clear
	.type	caml_ext_table_clear, @function
caml_ext_table_clear:
.LFB15:
	.loc 1 125 1 is_stmt 1
	.cfi_startproc
.LVL41:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	.loc 1 126 3
	.loc 1 127 3
	.loc 1 127 6 is_stmt 0
	bne	a1,zero,.L27
.LVL42:
.L25:
	.loc 1 130 3 is_stmt 1
	.loc 1 130 13 is_stmt 0
	sw	zero,0(s1)
	.loc 1 131 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL43:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL44:
.L27:
	.cfi_restore_state
	.loc 1 128 12
	li	s0,0
.LVL45:
.L24:
	.loc 1 128 17 is_stmt 1 discriminator 1
	.loc 1 128 24 is_stmt 0 discriminator 1
	lw	a5,0(s1)
	.loc 1 128 5 discriminator 1
	ble	a5,s0,.L25
	.loc 1 128 37 is_stmt 1 discriminator 3
	.loc 1 128 55 is_stmt 0 discriminator 3
	ld	a5,8(s1)
	.loc 1 128 65 discriminator 3
	slli	a4,s0,3
	add	a5,a5,a4
	.loc 1 128 37 discriminator 3
	ld	a0,0(a5)
	call	caml_stat_free
.LVL46:
	.loc 1 128 32 is_stmt 1 discriminator 3
	.loc 1 128 33 is_stmt 0 discriminator 3
	addiw	s0,s0,1
.LVL47:
	j	.L24
	.cfi_endproc
.LFE15:
	.size	caml_ext_table_clear, .-caml_ext_table_clear
	.align	1
	.globl	caml_ext_table_free
	.type	caml_ext_table_free, @function
caml_ext_table_free:
.LFB16:
	.loc 1 134 1 is_stmt 1
	.cfi_startproc
.LVL48:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 135 3
	call	caml_ext_table_clear
.LVL49:
	.loc 1 136 3
	ld	a0,8(s0)
	call	caml_stat_free
.LVL50:
	.loc 1 137 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL51:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	caml_ext_table_free, .-caml_ext_table_free
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"[ocaml] (use Sys.enable_runtime_warnings to control these warnings)\n"
	.text
	.align	1
	.globl	caml_runtime_warnings_active
	.type	caml_runtime_warnings_active, @function
caml_runtime_warnings_active:
.LFB17:
	.loc 1 190 1 is_stmt 1
	.cfi_startproc
	.loc 1 191 3
	.loc 1 191 7 is_stmt 0
	ld	a5,caml_runtime_warnings
	.loc 1 191 6
	beq	a5,zero,.L33
	.loc 1 192 3 is_stmt 1
	.loc 1 192 7 is_stmt 0
	lw	a5,caml_runtime_warnings_first
	.loc 1 192 6
	bne	a5,zero,.L39
	.loc 1 197 10
	li	a0,1
	.loc 1 198 1
	ret
.L39:
	.loc 1 190 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 193 5 is_stmt 1
	ld	a3,stderr
	li	a2,68
	li	a1,1
	lla	a0,.LC0
	call	fwrite
.LVL52:
	.loc 1 195 5
	.loc 1 195 33 is_stmt 0
	sw	zero,caml_runtime_warnings_first,a5
	.loc 1 197 10
	li	a0,1
	.loc 1 198 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L33:
	.loc 1 191 38
	li	a0,0
	ret
	.cfi_endproc
.LFE17:
	.size	caml_runtime_warnings_active, .-caml_runtime_warnings_active
	.globl	caml_runtime_warnings
	.globl	caml_verb_gc
	.globl	caml_finalise_end_hook
	.globl	caml_finalise_begin_hook
	.globl	caml_minor_gc_end_hook
	.globl	caml_minor_gc_begin_hook
	.globl	caml_major_slice_end_hook
	.globl	caml_major_slice_begin_hook
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_runtime_warnings, @object
	.size	caml_runtime_warnings, 8
caml_runtime_warnings:
	.zero	8
	.type	caml_verb_gc, @object
	.size	caml_verb_gc, 8
caml_verb_gc:
	.zero	8
	.type	caml_finalise_end_hook, @object
	.size	caml_finalise_end_hook, 8
caml_finalise_end_hook:
	.zero	8
	.type	caml_finalise_begin_hook, @object
	.size	caml_finalise_begin_hook, 8
caml_finalise_begin_hook:
	.zero	8
	.type	caml_minor_gc_end_hook, @object
	.size	caml_minor_gc_end_hook, 8
caml_minor_gc_end_hook:
	.zero	8
	.type	caml_minor_gc_begin_hook, @object
	.size	caml_minor_gc_begin_hook, 8
caml_minor_gc_begin_hook:
	.zero	8
	.type	caml_major_slice_end_hook, @object
	.size	caml_major_slice_end_hook, 8
caml_major_slice_end_hook:
	.zero	8
	.type	caml_major_slice_begin_hook, @object
	.size	caml_major_slice_begin_hook, 8
caml_major_slice_begin_hook:
	.zero	8
	.section	.sdata,"aw"
	.align	2
	.type	caml_runtime_warnings_first, @object
	.size	caml_runtime_warnings_first, 4
caml_runtime_warnings_first:
	.word	1
	.text
.Letext0:
	.file 2 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stdarg.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 5 "caml/config.h"
	.file 6 "caml/misc.h"
	.file 7 "caml/mlvalues.h"
	.file 8 "caml/freelist.h"
	.file 9 "caml/major_gc.h"
	.file 10 "caml/address_class.h"
	.file 11 "caml/minor_gc.h"
	.file 12 "caml/memory.h"
	.file 13 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.file 14 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdlib.h"
	.file 15 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb83
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF122
	.byte	0xc
	.4byte	.LASF123
	.4byte	.LASF124
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
	.4byte	.LASF125
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
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x4
	.byte	0x10
	.byte	0x4
	.4byte	.LASF6
	.byte	0x6
	.4byte	.LASF28
	.byte	0x18
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.4byte	0xaf
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
	.byte	0x9
	.byte	0xe
	.4byte	0xe0
	.byte	0
	.byte	0x7
	.4byte	.LASF8
	.byte	0x4
	.byte	0xa
	.byte	0xb
	.4byte	0xe6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0xb
	.byte	0xb
	.4byte	0xe6
	.byte	0x10
	.byte	0
	.byte	0x8
	.4byte	0x52
	.4byte	0xc8
	.byte	0x9
	.4byte	0xc8
	.byte	0x9
	.4byte	0xce
	.byte	0x9
	.4byte	0x52
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x7a
	.byte	0xa
	.byte	0x8
	.4byte	0xdb
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0xb
	.4byte	0xd4
	.byte	0xa
	.byte	0x8
	.4byte	0xaf
	.byte	0xa
	.byte	0x8
	.4byte	0xd4
	.byte	0x2
	.4byte	.LASF11
	.byte	0x4
	.byte	0xc
	.byte	0x3
	.4byte	0x7a
	.byte	0xc
	.4byte	.LASF12
	.byte	0x4
	.byte	0x11
	.byte	0xe
	.4byte	0x104
	.byte	0xa
	.byte	0x8
	.4byte	0xec
	.byte	0xc
	.4byte	.LASF13
	.byte	0x4
	.byte	0x12
	.byte	0xe
	.4byte	0x104
	.byte	0xc
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1c
	.byte	0xe
	.4byte	0x104
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF17
	.byte	0x2
	.4byte	.LASF18
	.byte	0x5
	.byte	0x5b
	.byte	0xe
	.4byte	0x4b
	.byte	0x2
	.4byte	.LASF19
	.byte	0x5
	.byte	0x5c
	.byte	0x17
	.4byte	0x5e
	.byte	0x2
	.4byte	.LASF20
	.byte	0x6
	.byte	0x21
	.byte	0x10
	.4byte	0x52
	.byte	0x2
	.4byte	.LASF21
	.byte	0x6
	.byte	0x5c
	.byte	0x10
	.4byte	0x167
	.byte	0xa
	.byte	0x8
	.4byte	0x16d
	.byte	0xd
	.byte	0xc
	.4byte	.LASF22
	.byte	0x6
	.byte	0x5d
	.byte	0x19
	.4byte	0x15b
	.byte	0xc
	.4byte	.LASF23
	.byte	0x6
	.byte	0x5d
	.byte	0x36
	.4byte	0x15b
	.byte	0xc
	.4byte	.LASF24
	.byte	0x6
	.byte	0x5e
	.byte	0x19
	.4byte	0x15b
	.byte	0xc
	.4byte	.LASF25
	.byte	0x6
	.byte	0x5e
	.byte	0x33
	.4byte	0x15b
	.byte	0xc
	.4byte	.LASF26
	.byte	0x6
	.byte	0x5f
	.byte	0x19
	.4byte	0x15b
	.byte	0xc
	.4byte	.LASF27
	.byte	0x6
	.byte	0x5f
	.byte	0x33
	.4byte	0x15b
	.byte	0xe
	.4byte	.LASF29
	.byte	0x10
	.byte	0x6
	.2byte	0x152
	.byte	0x8
	.4byte	0x1ef
	.byte	0xf
	.4byte	.LASF30
	.byte	0x6
	.2byte	0x153
	.byte	0x7
	.4byte	0x65
	.byte	0
	.byte	0xf
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x154
	.byte	0x7
	.4byte	0x65
	.byte	0x4
	.byte	0xf
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x155
	.byte	0xb
	.4byte	0x1ef
	.byte	0x8
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x1f5
	.byte	0x10
	.byte	0x8
	.byte	0x11
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x169
	.byte	0x10
	.4byte	0x143
	.byte	0x11
	.4byte	.LASF34
	.byte	0x6
	.2byte	0x171
	.byte	0x10
	.4byte	0x143
	.byte	0x2
	.4byte	.LASF35
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.4byte	0x137
	.byte	0x2
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3d
	.byte	0x11
	.4byte	0x143
	.byte	0x2
	.4byte	.LASF37
	.byte	0x7
	.byte	0x3e
	.byte	0x11
	.4byte	0x143
	.byte	0x12
	.4byte	0x21d
	.4byte	0x240
	.byte	0x13
	.byte	0
	.byte	0x11
	.4byte	.LASF38
	.byte	0x7
	.2byte	0x15c
	.byte	0x15
	.4byte	0x235
	.byte	0x11
	.4byte	.LASF39
	.byte	0x7
	.2byte	0x171
	.byte	0xe
	.4byte	0x211
	.byte	0xc
	.4byte	.LASF40
	.byte	0x8
	.byte	0x1a
	.byte	0x10
	.4byte	0x14f
	.byte	0xc
	.4byte	.LASF41
	.byte	0x9
	.byte	0x24
	.byte	0xc
	.4byte	0x65
	.byte	0xc
	.4byte	.LASF42
	.byte	0x9
	.byte	0x25
	.byte	0xc
	.4byte	0x65
	.byte	0xc
	.4byte	.LASF43
	.byte	0x9
	.byte	0x26
	.byte	0x10
	.4byte	0x143
	.byte	0xc
	.4byte	.LASF44
	.byte	0x9
	.byte	0x27
	.byte	0xf
	.4byte	0x296
	.byte	0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF45
	.byte	0xc
	.4byte	.LASF46
	.byte	0x9
	.byte	0x28
	.byte	0x10
	.4byte	0x143
	.byte	0xc
	.4byte	.LASF47
	.byte	0x9
	.byte	0x28
	.byte	0x25
	.4byte	0x143
	.byte	0xc
	.4byte	.LASF48
	.byte	0x9
	.byte	0x29
	.byte	0x10
	.4byte	0x143
	.byte	0xc
	.4byte	.LASF49
	.byte	0x9
	.byte	0x3e
	.byte	0x12
	.4byte	0xe6
	.byte	0xc
	.4byte	.LASF50
	.byte	0x9
	.byte	0x3f
	.byte	0x10
	.4byte	0x143
	.byte	0xc
	.4byte	.LASF51
	.byte	0x9
	.byte	0x40
	.byte	0xe
	.4byte	0xe6
	.byte	0xc
	.4byte	.LASF52
	.byte	0x9
	.byte	0x42
	.byte	0xc
	.4byte	0x65
	.byte	0x12
	.4byte	0x296
	.4byte	0x301
	.byte	0x14
	.4byte	0x5e
	.byte	0x31
	.byte	0
	.byte	0x15
	.4byte	.LASF53
	.byte	0x9
	.byte	0x43
	.byte	0x8
	.4byte	0x2f1
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x15
	.4byte	.LASF54
	.byte	0x9
	.byte	0x44
	.byte	0x5
	.4byte	0x65
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x15
	.4byte	.LASF55
	.byte	0x9
	.byte	0x45
	.byte	0x8
	.4byte	0x296
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0xc
	.4byte	.LASF56
	.byte	0x9
	.byte	0x46
	.byte	0xf
	.4byte	0x296
	.byte	0xc
	.4byte	.LASF57
	.byte	0x9
	.byte	0x4a
	.byte	0x13
	.4byte	0x167
	.byte	0xc
	.4byte	.LASF58
	.byte	0xa
	.byte	0x31
	.byte	0xf
	.4byte	0x367
	.byte	0xa
	.byte	0x8
	.4byte	0x211
	.byte	0xc
	.4byte	.LASF59
	.byte	0xa
	.byte	0x31
	.byte	0x22
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF60
	.byte	0xa
	.byte	0x32
	.byte	0xf
	.4byte	0xe6
	.byte	0xc
	.4byte	.LASF61
	.byte	0xa
	.byte	0x32
	.byte	0x27
	.4byte	0xe6
	.byte	0xc
	.4byte	.LASF62
	.byte	0xb
	.byte	0x18
	.byte	0x13
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF63
	.byte	0xb
	.byte	0x18
	.byte	0x2c
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF64
	.byte	0xb
	.byte	0x19
	.byte	0x13
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF65
	.byte	0xb
	.byte	0x19
	.byte	0x24
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF66
	.byte	0xb
	.byte	0x1a
	.byte	0x13
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF67
	.byte	0xb
	.byte	0x1b
	.byte	0x10
	.4byte	0x14f
	.byte	0xc
	.4byte	.LASF68
	.byte	0xb
	.byte	0x1c
	.byte	0xc
	.4byte	0x65
	.byte	0xc
	.4byte	.LASF69
	.byte	0xb
	.byte	0x1d
	.byte	0xf
	.4byte	0x296
	.byte	0x6
	.4byte	.LASF70
	.byte	0x38
	.byte	0xb
	.byte	0x29
	.byte	0x8
	.4byte	0x45a
	.byte	0x7
	.4byte	.LASF71
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x45a
	.byte	0
	.byte	0x16
	.string	"end"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x45a
	.byte	0x8
	.byte	0x7
	.4byte	.LASF72
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x45a
	.byte	0x10
	.byte	0x16
	.string	"ptr"
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x45a
	.byte	0x18
	.byte	0x7
	.4byte	.LASF73
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x45a
	.byte	0x20
	.byte	0x7
	.4byte	.LASF30
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x14f
	.byte	0x28
	.byte	0x7
	.4byte	.LASF74
	.byte	0xb
	.byte	0x29
	.byte	0x17
	.4byte	0x14f
	.byte	0x30
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x367
	.byte	0xc
	.4byte	.LASF70
	.byte	0xb
	.byte	0x2a
	.byte	0x22
	.4byte	0x3f1
	.byte	0x6
	.4byte	.LASF75
	.byte	0x10
	.byte	0xb
	.byte	0x2c
	.byte	0x8
	.4byte	0x494
	.byte	0x7
	.4byte	.LASF76
	.byte	0xb
	.byte	0x2d
	.byte	0x9
	.4byte	0x211
	.byte	0
	.byte	0x7
	.4byte	.LASF77
	.byte	0xb
	.byte	0x2e
	.byte	0xc
	.4byte	0x229
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	.LASF78
	.byte	0x38
	.byte	0xb
	.byte	0x31
	.byte	0x8
	.4byte	0x4fd
	.byte	0x7
	.4byte	.LASF71
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fd
	.byte	0
	.byte	0x16
	.string	"end"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fd
	.byte	0x8
	.byte	0x7
	.4byte	.LASF72
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fd
	.byte	0x10
	.byte	0x16
	.string	"ptr"
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fd
	.byte	0x18
	.byte	0x7
	.4byte	.LASF73
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x4fd
	.byte	0x20
	.byte	0x7
	.4byte	.LASF30
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x14f
	.byte	0x28
	.byte	0x7
	.4byte	.LASF74
	.byte	0xb
	.byte	0x31
	.byte	0x1c
	.4byte	0x14f
	.byte	0x30
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x46c
	.byte	0xc
	.4byte	.LASF78
	.byte	0xb
	.byte	0x32
	.byte	0x27
	.4byte	0x494
	.byte	0x6
	.4byte	.LASF79
	.byte	0x18
	.byte	0xb
	.byte	0x34
	.byte	0x8
	.4byte	0x544
	.byte	0x7
	.4byte	.LASF80
	.byte	0xb
	.byte	0x35
	.byte	0x9
	.4byte	0x211
	.byte	0
	.byte	0x16
	.string	"mem"
	.byte	0xb
	.byte	0x36
	.byte	0xc
	.4byte	0x229
	.byte	0x8
	.byte	0x16
	.string	"max"
	.byte	0xb
	.byte	0x37
	.byte	0xc
	.4byte	0x229
	.byte	0x10
	.byte	0
	.byte	0x6
	.4byte	.LASF81
	.byte	0x38
	.byte	0xb
	.byte	0x3a
	.byte	0x8
	.4byte	0x5ad
	.byte	0x7
	.4byte	.LASF71
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5ad
	.byte	0
	.byte	0x16
	.string	"end"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5ad
	.byte	0x8
	.byte	0x7
	.4byte	.LASF72
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5ad
	.byte	0x10
	.byte	0x16
	.string	"ptr"
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5ad
	.byte	0x18
	.byte	0x7
	.4byte	.LASF73
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x5ad
	.byte	0x20
	.byte	0x7
	.4byte	.LASF30
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x14f
	.byte	0x28
	.byte	0x7
	.4byte	.LASF74
	.byte	0xb
	.byte	0x3a
	.byte	0x1a
	.4byte	0x14f
	.byte	0x30
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x50f
	.byte	0xc
	.4byte	.LASF81
	.byte	0xb
	.byte	0x3b
	.byte	0x25
	.4byte	0x544
	.byte	0xc
	.4byte	.LASF82
	.byte	0xc
	.byte	0x3f
	.byte	0x10
	.4byte	0x65
	.byte	0x2
	.4byte	.LASF83
	.byte	0xc
	.byte	0x4b
	.byte	0xf
	.4byte	0x1f5
	.byte	0xc
	.4byte	.LASF84
	.byte	0xc
	.byte	0xb7
	.byte	0x10
	.4byte	0x143
	.byte	0x6
	.4byte	.LASF85
	.byte	0x40
	.byte	0xc
	.byte	0xf3
	.byte	0x8
	.4byte	0x625
	.byte	0x7
	.4byte	.LASF86
	.byte	0xc
	.byte	0xf4
	.byte	0x1d
	.4byte	0x625
	.byte	0
	.byte	0x7
	.4byte	.LASF87
	.byte	0xc
	.byte	0xf5
	.byte	0xa
	.4byte	0x137
	.byte	0x8
	.byte	0x7
	.4byte	.LASF88
	.byte	0xc
	.byte	0xf6
	.byte	0xa
	.4byte	0x137
	.byte	0x10
	.byte	0x7
	.4byte	.LASF89
	.byte	0xc
	.byte	0xf7
	.byte	0xa
	.4byte	0x62b
	.byte	0x18
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x5e3
	.byte	0x12
	.4byte	0x367
	.4byte	0x63b
	.byte	0x14
	.4byte	0x5e
	.byte	0x4
	.byte	0
	.byte	0xc
	.4byte	.LASF90
	.byte	0xc
	.byte	0xfa
	.byte	0x26
	.4byte	0x625
	.byte	0x17
	.4byte	0x16e
	.byte	0x1
	.byte	0x1b
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_slice_begin_hook
	.byte	0x17
	.4byte	0x17a
	.byte	0x1
	.byte	0x1c
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_slice_end_hook
	.byte	0x17
	.4byte	0x186
	.byte	0x1
	.byte	0x1d
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_minor_gc_begin_hook
	.byte	0x17
	.4byte	0x192
	.byte	0x1
	.byte	0x1e
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_minor_gc_end_hook
	.byte	0x17
	.4byte	0x19e
	.byte	0x1
	.byte	0x1f
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_finalise_begin_hook
	.byte	0x17
	.4byte	0x1aa
	.byte	0x1
	.byte	0x20
	.byte	0x12
	.byte	0x9
	.byte	0x3
	.8byte	caml_finalise_end_hook
	.byte	0x17
	.4byte	0x1f7
	.byte	0x1
	.byte	0x36
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_verb_gc
	.byte	0x17
	.4byte	0x204
	.byte	0x1
	.byte	0xba
	.byte	0x9
	.byte	0x9
	.byte	0x3
	.8byte	caml_runtime_warnings
	.byte	0x18
	.4byte	.LASF94
	.byte	0x1
	.byte	0xbb
	.byte	0xc
	.4byte	0x65
	.byte	0x9
	.byte	0x3
	.8byte	caml_runtime_warnings_first
	.byte	0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0xbd
	.byte	0x5
	.4byte	0x65
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x736
	.byte	0x1a
	.8byte	.LVL52
	.4byte	0xb10
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x8
	.byte	0x44
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LASF92
	.byte	0x1
	.byte	0x85
	.byte	0x6
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x79a
	.byte	0x1d
	.string	"tbl"
	.byte	0x1
	.byte	0x85
	.byte	0x2d
	.4byte	0x79a
	.4byte	.LLST20
	.byte	0x1e
	.4byte	.LASF91
	.byte	0x1
	.byte	0x85
	.byte	0x36
	.4byte	0x65
	.4byte	.LLST21
	.byte	0x1f
	.8byte	.LVL49
	.4byte	0x7a0
	.4byte	0x78c
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x20
	.8byte	.LVL50
	.4byte	0xb1b
	.byte	0
	.byte	0xa
	.byte	0x8
	.4byte	0x1b6
	.byte	0x1c
	.4byte	.LASF93
	.byte	0x1
	.byte	0x7c
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x7fa
	.byte	0x1d
	.string	"tbl"
	.byte	0x1
	.byte	0x7c
	.byte	0x2e
	.4byte	0x79a
	.4byte	.LLST17
	.byte	0x1e
	.4byte	.LASF91
	.byte	0x1
	.byte	0x7c
	.byte	0x37
	.4byte	0x65
	.4byte	.LLST18
	.byte	0x21
	.string	"i"
	.byte	0x1
	.byte	0x7e
	.byte	0x7
	.4byte	0x65
	.4byte	.LLST19
	.byte	0x20
	.8byte	.LVL46
	.4byte	0xb1b
	.byte	0
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0x6f
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x861
	.byte	0x1d
	.string	"tbl"
	.byte	0x1
	.byte	0x6f
	.byte	0x2f
	.4byte	0x79a
	.4byte	.LLST14
	.byte	0x1e
	.4byte	.LASF96
	.byte	0x1
	.byte	0x6f
	.byte	0x44
	.4byte	0x5cb
	.4byte	.LLST15
	.byte	0x21
	.string	"i"
	.byte	0x1
	.byte	0x71
	.byte	0x7
	.4byte	0x65
	.4byte	.LLST16
	.byte	0x20
	.8byte	.LVL36
	.4byte	0xb1b
	.byte	0x20
	.8byte	.LVL37
	.4byte	0xb27
	.byte	0
	.byte	0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0x61
	.byte	0x5
	.4byte	0x65
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x8c1
	.byte	0x1d
	.string	"tbl"
	.byte	0x1
	.byte	0x61
	.byte	0x2b
	.4byte	0x79a
	.4byte	.LLST11
	.byte	0x1e
	.4byte	.LASF96
	.byte	0x1
	.byte	0x61
	.byte	0x40
	.4byte	0x5cb
	.4byte	.LLST12
	.byte	0x21
	.string	"res"
	.byte	0x1
	.byte	0x63
	.byte	0x7
	.4byte	0x65
	.4byte	.LLST13
	.byte	0x20
	.8byte	.LVL31
	.4byte	0xb33
	.byte	0
	.byte	0x1c
	.4byte	.LASF99
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x90d
	.byte	0x1d
	.string	"tbl"
	.byte	0x1
	.byte	0x5a
	.byte	0x2d
	.4byte	0x79a
	.4byte	.LLST9
	.byte	0x1e
	.4byte	.LASF100
	.byte	0x1
	.byte	0x5a
	.byte	0x36
	.4byte	0x65
	.4byte	.LLST10
	.byte	0x20
	.8byte	.LVL23
	.4byte	0xb3f
	.byte	0
	.byte	0x22
	.4byte	.LASF101
	.byte	0x1
	.byte	0x4f
	.byte	0x11
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x9bd
	.byte	0x1e
	.4byte	.LASF102
	.byte	0x1
	.byte	0x4f
	.byte	0x2e
	.4byte	0xe6
	.4byte	.LLST5
	.byte	0x1e
	.4byte	.LASF103
	.byte	0x1
	.byte	0x4f
	.byte	0x3a
	.4byte	0xe6
	.4byte	.LLST6
	.byte	0x1e
	.4byte	.LASF104
	.byte	0x1
	.byte	0x50
	.byte	0x2e
	.4byte	0xe6
	.4byte	.LLST7
	.byte	0x1e
	.4byte	.LASF105
	.byte	0x1
	.byte	0x50
	.byte	0x3a
	.4byte	0xe6
	.4byte	.LLST8
	.byte	0x1f
	.8byte	.LVL18
	.4byte	0xb4b
	.4byte	0x98b
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x1f
	.8byte	.LVL19
	.4byte	0xb4b
	.4byte	0x9a9
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1a
	.8byte	.LVL20
	.4byte	0xb57
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF106
	.byte	0x1
	.byte	0x49
	.byte	0x11
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xa2f
	.byte	0x1d
	.string	"fmt"
	.byte	0x1
	.byte	0x49
	.byte	0x2d
	.4byte	0xe6
	.4byte	.LLST3
	.byte	0x1d
	.string	"arg"
	.byte	0x1
	.byte	0x49
	.byte	0x38
	.4byte	0xe6
	.4byte	.LLST4
	.byte	0x1f
	.8byte	.LVL12
	.4byte	0xb4b
	.4byte	0xa1b
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x1a
	.8byte	.LVL13
	.4byte	0xb57
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LASF107
	.byte	0x1
	.byte	0x43
	.byte	0x11
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xa8a
	.byte	0x1d
	.string	"msg"
	.byte	0x1
	.byte	0x43
	.byte	0x29
	.4byte	0xe6
	.4byte	.LLST2
	.byte	0x1f
	.8byte	.LVL7
	.4byte	0xb63
	.4byte	0xa76
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x1a
	.8byte	.LVL8
	.4byte	0xb57
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LASF108
	.byte	0x1
	.byte	0x38
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xb10
	.byte	0x1e
	.4byte	.LASF109
	.byte	0x1
	.byte	0x38
	.byte	0x1b
	.4byte	0x65
	.4byte	.LLST0
	.byte	0x1d
	.string	"msg"
	.byte	0x1
	.byte	0x38
	.byte	0x28
	.4byte	0xe6
	.4byte	.LLST1
	.byte	0x23
	.byte	0x24
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x25
	.string	"ap"
	.byte	0x1
	.byte	0x3b
	.byte	0xd
	.4byte	0x3f
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x1f
	.8byte	.LVL4
	.4byte	0xb6e
	.4byte	0xb01
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x20
	.8byte	.LVL5
	.4byte	0xb7a
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LASF116
	.4byte	.LASF118
	.byte	0xf
	.byte	0
	.byte	0x27
	.4byte	.LASF110
	.4byte	.LASF110
	.byte	0xc
	.byte	0x85
	.byte	0x11
	.byte	0x27
	.4byte	.LASF111
	.4byte	.LASF111
	.byte	0xd
	.byte	0x9
	.byte	0x7
	.byte	0x27
	.4byte	.LASF112
	.4byte	.LASF112
	.byte	0xc
	.byte	0x8f
	.byte	0x1c
	.byte	0x27
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0xc
	.byte	0x67
	.byte	0x1c
	.byte	0x27
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x4
	.byte	0xe
	.byte	0x5
	.byte	0x27
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0xe
	.byte	0x7
	.byte	0x6
	.byte	0x26
	.4byte	.LASF117
	.4byte	.LASF119
	.byte	0xf
	.byte	0
	.byte	0x27
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x4
	.byte	0x15
	.byte	0x5
	.byte	0x27
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0x4
	.byte	0xd
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
.LLST20:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL49-1-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL51-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST21:
	.8byte	.LVL48-.Ltext0
	.8byte	.LVL49-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL49-1-.Ltext0
	.8byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL44-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST18:
	.8byte	.LVL41-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL45-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST19:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL39-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL32-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	.LVL40-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL26-.Ltext0
	.8byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL30-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL22-.Ltext0
	.8byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL24-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL23-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL23-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL18-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL18-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL15-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL18-1-.Ltext0
	.8byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL12-1-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL1-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL3-.Ltext0
	.8byte	.LVL4-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL4-1-.Ltext0
	.8byte	.LFE8-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
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
.LASF73:
	.string	"limit"
.LASF111:
	.string	"memmove"
.LASF62:
	.string	"caml_young_alloc_start"
.LASF124:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF40:
	.string	"caml_fl_cur_wsz"
.LASF7:
	.string	"write"
.LASF21:
	.string	"caml_timing_hook"
.LASF106:
	.string	"caml_fatal_error_arg"
.LASF9:
	.string	"wend"
.LASF16:
	.string	"short int"
.LASF2:
	.string	"size_t"
.LASF79:
	.string	"caml_custom_elt"
.LASF42:
	.string	"caml_gc_subphase"
.LASF95:
	.string	"caml_ext_table_remove"
.LASF120:
	.string	"vfprintf"
.LASF8:
	.string	"wpos"
.LASF65:
	.string	"caml_young_limit"
.LASF96:
	.string	"data"
.LASF83:
	.string	"caml_stat_block"
.LASF63:
	.string	"caml_young_alloc_end"
.LASF1:
	.string	"va_list"
.LASF122:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF35:
	.string	"value"
.LASF27:
	.string	"caml_finalise_end_hook"
.LASF70:
	.string	"caml_ref_table"
.LASF32:
	.string	"contents"
.LASF24:
	.string	"caml_minor_gc_begin_hook"
.LASF68:
	.string	"caml_in_minor_collection"
.LASF97:
	.string	"caml_runtime_warnings_active"
.LASF81:
	.string	"caml_custom_table"
.LASF90:
	.string	"caml_local_roots"
.LASF66:
	.string	"caml_young_trigger"
.LASF110:
	.string	"caml_stat_free"
.LASF108:
	.string	"caml_gc_message"
.LASF57:
	.string	"caml_major_gc_hook"
.LASF103:
	.string	"arg1"
.LASF56:
	.string	"caml_gc_clock"
.LASF88:
	.string	"nitems"
.LASF13:
	.string	"stderr"
.LASF5:
	.string	"long long int"
.LASF51:
	.string	"caml_gc_sweep_hp"
.LASF53:
	.string	"caml_major_ring"
.LASF72:
	.string	"threshold"
.LASF89:
	.string	"tables"
.LASF18:
	.string	"intnat"
.LASF3:
	.string	"long int"
.LASF77:
	.string	"offset"
.LASF74:
	.string	"reserve"
.LASF91:
	.string	"free_entries"
.LASF82:
	.string	"caml_huge_fallback_count"
.LASF80:
	.string	"block"
.LASF123:
	.string	"misc.c"
.LASF34:
	.string	"caml_runtime_warnings"
.LASF114:
	.string	"fprintf"
.LASF36:
	.string	"header_t"
.LASF23:
	.string	"caml_major_slice_end_hook"
.LASF121:
	.string	"fflush"
.LASF38:
	.string	"caml_atom_table"
.LASF6:
	.string	"long double"
.LASF26:
	.string	"caml_finalise_begin_hook"
.LASF69:
	.string	"caml_extra_heap_resources_minor"
.LASF29:
	.string	"ext_table"
.LASF47:
	.string	"caml_dependent_allocated"
.LASF37:
	.string	"mlsize_t"
.LASF85:
	.string	"caml__roots_block"
.LASF31:
	.string	"capacity"
.LASF19:
	.string	"uintnat"
.LASF59:
	.string	"caml_young_end"
.LASF15:
	.string	"unsigned int"
.LASF94:
	.string	"caml_runtime_warnings_first"
.LASF112:
	.string	"caml_stat_resize"
.LASF99:
	.string	"caml_ext_table_init"
.LASF76:
	.string	"ephe"
.LASF101:
	.string	"caml_fatal_error_arg2"
.LASF22:
	.string	"caml_major_slice_begin_hook"
.LASF17:
	.string	"short unsigned int"
.LASF28:
	.string	"_FILE"
.LASF58:
	.string	"caml_young_start"
.LASF100:
	.string	"init_capa"
.LASF10:
	.string	"char"
.LASF102:
	.string	"fmt1"
.LASF104:
	.string	"fmt2"
.LASF54:
	.string	"caml_major_ring_index"
.LASF119:
	.string	"__builtin_fputs"
.LASF41:
	.string	"caml_gc_phase"
.LASF67:
	.string	"caml_minor_heap_wsz"
.LASF33:
	.string	"caml_verb_gc"
.LASF25:
	.string	"caml_minor_gc_end_hook"
.LASF117:
	.string	"fputs"
.LASF52:
	.string	"caml_major_window"
.LASF116:
	.string	"fwrite"
.LASF4:
	.string	"long unsigned int"
.LASF125:
	.string	"__builtin_va_list"
.LASF45:
	.string	"double"
.LASF109:
	.string	"level"
.LASF39:
	.string	"caml_global_data"
.LASF30:
	.string	"size"
.LASF93:
	.string	"caml_ext_table_clear"
.LASF92:
	.string	"caml_ext_table_free"
.LASF64:
	.string	"caml_young_ptr"
.LASF60:
	.string	"caml_code_area_start"
.LASF48:
	.string	"caml_fl_wsz_at_phase_change"
.LASF14:
	.string	"stdin"
.LASF107:
	.string	"caml_fatal_error"
.LASF61:
	.string	"caml_code_area_end"
.LASF44:
	.string	"caml_extra_heap_resources"
.LASF43:
	.string	"caml_allocated_words"
.LASF0:
	.string	"__gnuc_va_list"
.LASF87:
	.string	"ntables"
.LASF46:
	.string	"caml_dependent_size"
.LASF49:
	.string	"caml_heap_start"
.LASF105:
	.string	"arg2"
.LASF118:
	.string	"__builtin_fwrite"
.LASF20:
	.string	"asize_t"
.LASF11:
	.string	"FILE"
.LASF50:
	.string	"total_heap_size"
.LASF71:
	.string	"base"
.LASF55:
	.string	"caml_major_work_credit"
.LASF115:
	.string	"exit"
.LASF98:
	.string	"caml_ext_table_add"
.LASF78:
	.string	"caml_ephe_ref_table"
.LASF75:
	.string	"caml_ephe_ref_elt"
.LASF12:
	.string	"stdout"
.LASF86:
	.string	"next"
.LASF84:
	.string	"caml_use_huge_pages"
.LASF113:
	.string	"caml_stat_alloc"
	.ident	"GCC: (GNU) 9.2.0"
