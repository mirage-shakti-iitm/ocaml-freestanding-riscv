	.file	"custom.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.globl	caml_alloc_custom
	.type	caml_alloc_custom, @function
caml_alloc_custom:
.LFB12:
	.file 1 "custom.c"
	.loc 1 32 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	mv	s2,a0
	mv	s0,a2
	mv	s1,a3
	.loc 1 33 3
	.loc 1 34 3
	lla	a4,caml_local_roots
	ld	s3,0(a4)
.LVL1:
	.loc 1 35 3
	li	a5,1
	sd	a5,72(sp)
	.loc 1 35 3
	.loc 1 35 3
	sd	s3,8(sp)
	addi	a3,sp,8
.LVL2:
	sd	a3,0(a4)
	sd	a5,24(sp)
	sd	a5,16(sp)
	addi	a5,sp,72
	sd	a5,32(sp)
.LVL3:
	.loc 1 37 3
	.loc 1 37 38 is_stmt 0
	addi	a1,a1,7
.LVL4:
	.loc 1 37 43
	srli	a1,a1,3
.LVL5:
	.loc 1 37 10
	addi	a0,a1,1
.LVL6:
	.loc 1 38 3 is_stmt 1
	.loc 1 38 6 is_stmt 0
	li	a5,256
	bgtu	a0,a5,.L2
	.loc 1 39 5 is_stmt 1
	.loc 1 39 14 is_stmt 0
	li	a1,255
	call	caml_alloc_small
.LVL7:
	.loc 1 39 12
	sd	a0,72(sp)
	.loc 1 40 5 is_stmt 1
	.loc 1 40 28 is_stmt 0
	sd	s2,0(a0)
	.loc 1 41 5 is_stmt 1
	.loc 1 41 12 is_stmt 0
	ld	a5,8(s2)
	.loc 1 41 8
	beq	a5,zero,.L11
.L3:
	.loc 1 43 7 is_stmt 1
	ld	s2,72(sp)
.LVL8:
.LBB5:
.LBB6:
	.file 2 "caml/minor_gc.h"
	.loc 2 109 3
	.loc 2 110 3
	.loc 2 110 10 is_stmt 0
	lla	a5,caml_custom_table
	ld	a4,24(a5)
	.loc 2 110 22
	ld	a5,32(a5)
	.loc 2 110 6
	bgeu	a4,a5,.L12
.LVL9:
.L5:
	.loc 2 114 3 is_stmt 1
	.loc 2 114 12 is_stmt 0
	lla	a4,caml_custom_table
	ld	a5,24(a4)
	.loc 2 114 17
	addi	a3,a5,24
	sd	a3,24(a4)
.LVL10:
	.loc 2 115 3 is_stmt 1
	.loc 2 115 14 is_stmt 0
	sd	s2,0(a5)
	.loc 2 116 3 is_stmt 1
	.loc 2 116 12 is_stmt 0
	sd	s0,8(a5)
	.loc 2 117 3 is_stmt 1
	.loc 2 117 12 is_stmt 0
	sd	s1,16(a5)
.LVL11:
.LBE6:
.LBE5:
	.loc 1 46 7 is_stmt 1
	.loc 1 46 10 is_stmt 0
	beq	s0,zero,.L4
	.loc 1 47 9 is_stmt 1
	.loc 1 47 12 is_stmt 0
	bne	s1,zero,.L6
	.loc 1 47 27
	li	s1,1
.LVL12:
.L6:
	.loc 1 48 9 is_stmt 1
	.loc 1 48 44 is_stmt 0
	fcvt.d.lu	fa5,s0
	.loc 1 48 59
	fcvt.d.lu	fa4,s1
	.loc 1 48 57
	fdiv.d	fa5,fa5,fa4
	.loc 1 48 41
	lla	a5,caml_extra_heap_resources_minor
.LVL13:
	fld	fa4,0(a5)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a5)
	.loc 1 49 9 is_stmt 1
	.loc 1 49 12 is_stmt 0
	fld	fa4,.LC0,a5
	fgt.d	s0,fa5,fa4
.LVL14:
	beq	s0,zero,.L4
	.loc 1 50 11 is_stmt 1
	call	caml_request_minor_gc
.LVL15:
	.loc 1 51 11
	call	caml_gc_dispatch
.LVL16:
	j	.L4
.LVL17:
.L11:
	.loc 1 41 31 is_stmt 0 discriminator 1
	beq	s0,zero,.L4
	j	.L3
.LVL18:
.L12:
.LBB8:
.LBB7:
	.loc 2 111 5 is_stmt 1
	.loc 2 112 5
	lla	a0,caml_custom_table
.LVL19:
	call	caml_realloc_custom_table
.LVL20:
	j	.L5
.LVL21:
.L2:
.LBE7:
.LBE8:
	.loc 1 56 5
	.loc 1 56 14 is_stmt 0
	li	a1,255
	call	caml_alloc_shr
.LVL22:
	.loc 1 56 12
	sd	a0,72(sp)
	.loc 1 57 5 is_stmt 1
	.loc 1 57 28 is_stmt 0
	sd	s2,0(a0)
	.loc 1 58 5 is_stmt 1
	mv	a1,s1
	mv	a0,s0
	call	caml_adjust_gc_speed
.LVL23:
	.loc 1 59 5
	.loc 1 59 14 is_stmt 0
	ld	a0,72(sp)
	call	caml_check_urgent_gc
.LVL24:
	.loc 1 59 12
	sd	a0,72(sp)
.LVL25:
.L4:
	.loc 1 61 3 is_stmt 1
.LBB9:
	.loc 1 61 3
	.loc 1 61 3
	sd	s3,caml_local_roots,a5
	.loc 1 61 3
.LBE9:
	.loc 1 61 3
	.loc 1 62 1 is_stmt 0
	ld	a0,72(sp)
	ld	ra,120(sp)
	.cfi_restore 1
	ld	s0,112(sp)
	.cfi_restore 8
	ld	s1,104(sp)
	.cfi_restore 9
.LVL26:
	ld	s2,96(sp)
	.cfi_restore 18
	ld	s3,88(sp)
	.cfi_restore 19
.LVL27:
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
.LVL28:
	jr	ra
	.cfi_endproc
.LFE12:
	.size	caml_alloc_custom, .-caml_alloc_custom
	.align	1
	.globl	caml_register_custom_operations
	.type	caml_register_custom_operations, @function
caml_register_custom_operations:
.LFB13:
	.loc 1 72 1 is_stmt 1
	.cfi_startproc
.LVL29:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 73 3
	.loc 1 74 5 is_stmt 0
	li	a0,16
.LVL30:
	call	caml_stat_alloc
.LVL31:
	.loc 1 75 3 is_stmt 1
	.loc 1 76 3
	.loc 1 77 3
	.loc 1 77 10 is_stmt 0
	sd	s0,0(a0)
	.loc 1 78 3 is_stmt 1
	.loc 1 78 11 is_stmt 0
	lla	a5,custom_ops_table
	ld	a4,0(a5)
	sd	a4,8(a0)
	.loc 1 79 3 is_stmt 1
	.loc 1 79 20 is_stmt 0
	sd	a0,0(a5)
	.loc 1 80 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL32:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	caml_register_custom_operations, .-caml_register_custom_operations
	.align	1
	.globl	caml_find_custom_operations
	.type	caml_find_custom_operations, @function
caml_find_custom_operations:
.LFB14:
	.loc 1 83 1 is_stmt 1
	.cfi_startproc
.LVL33:
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
	mv	s2,a0
	.loc 1 84 3
	.loc 1 85 3
	.loc 1 85 10 is_stmt 0
	ld	s0,custom_ops_table
.LVL34:
.L16:
	.loc 1 85 30 is_stmt 1 discriminator 1
	.loc 1 85 3 is_stmt 0 discriminator 1
	beq	s0,zero,.L15
	.loc 1 86 5 is_stmt 1
	.loc 1 86 17 is_stmt 0
	ld	s1,0(s0)
	.loc 1 86 9
	mv	a1,s2
	ld	a0,0(s1)
	call	strcmp
.LVL35:
	.loc 1 86 8
	beq	a0,zero,.L19
	.loc 1 85 41 is_stmt 1 discriminator 2
	.loc 1 85 43 is_stmt 0 discriminator 2
	ld	s0,8(s0)
.LVL36:
	j	.L16
.L19:
	.loc 1 86 57
	mv	s0,s1
.LVL37:
.L15:
	.loc 1 88 1
	mv	a0,s0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
.LVL38:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	caml_find_custom_operations, .-caml_find_custom_operations
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"_final"
	.text
	.align	1
	.globl	caml_final_custom_operations
	.type	caml_final_custom_operations, @function
caml_final_custom_operations:
.LFB15:
	.loc 1 93 1 is_stmt 1
	.cfi_startproc
.LVL39:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	mv	s1,a0
	.loc 1 94 3
	.loc 1 95 3
	.loc 1 96 3
	.loc 1 96 10 is_stmt 0
	ld	a5,custom_ops_final_table
.LVL40:
.L22:
	.loc 1 96 36 is_stmt 1 discriminator 1
	.loc 1 96 3 is_stmt 0 discriminator 1
	beq	a5,zero,.L26
	.loc 1 97 5 is_stmt 1
	.loc 1 97 10 is_stmt 0
	ld	s0,0(a5)
	.loc 1 97 15
	ld	a4,8(s0)
	.loc 1 97 8
	beq	a4,s1,.L21
	.loc 1 96 47 is_stmt 1 discriminator 2
	.loc 1 96 49 is_stmt 0 discriminator 2
	ld	a5,8(a5)
.LVL41:
	j	.L22
.L26:
	.loc 1 98 3 is_stmt 1
	.loc 1 98 9 is_stmt 0
	li	a0,56
.LVL42:
	call	caml_stat_alloc
.LVL43:
	mv	s0,a0
.LVL44:
	.loc 1 99 3 is_stmt 1
	.loc 1 99 19 is_stmt 0
	lla	a5,.LC1
	sd	a5,0(a0)
	.loc 1 100 3 is_stmt 1
	.loc 1 100 17 is_stmt 0
	sd	s1,8(a0)
	.loc 1 101 3 is_stmt 1
	.loc 1 101 16 is_stmt 0
	sd	zero,16(a0)
	.loc 1 102 3 is_stmt 1
	.loc 1 102 13 is_stmt 0
	sd	zero,24(a0)
	.loc 1 103 3 is_stmt 1
	.loc 1 103 18 is_stmt 0
	sd	zero,32(a0)
	.loc 1 104 3 is_stmt 1
	.loc 1 104 20 is_stmt 0
	sd	zero,40(a0)
	.loc 1 105 3 is_stmt 1
	.loc 1 105 20 is_stmt 0
	sd	zero,48(a0)
	.loc 1 106 3 is_stmt 1
	.loc 1 106 7 is_stmt 0
	li	a0,16
	call	caml_stat_alloc
.LVL45:
	.loc 1 107 3 is_stmt 1
	.loc 1 107 10 is_stmt 0
	sd	s0,0(a0)
	.loc 1 108 3 is_stmt 1
	.loc 1 108 11 is_stmt 0
	lla	a5,custom_ops_final_table
	ld	a4,0(a5)
	sd	a4,8(a0)
	.loc 1 109 3 is_stmt 1
	.loc 1 109 26 is_stmt 0
	sd	a0,0(a5)
	.loc 1 110 3 is_stmt 1
.LVL46:
.L21:
	.loc 1 111 1 is_stmt 0
	mv	a0,s0
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL47:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	caml_final_custom_operations, .-caml_final_custom_operations
	.align	1
	.globl	caml_init_custom_operations
	.type	caml_init_custom_operations, @function
caml_init_custom_operations:
.LFB16:
	.loc 1 119 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 120 3
	lla	a0,caml_int32_ops
	call	caml_register_custom_operations
.LVL48:
	.loc 1 121 3
	lla	a0,caml_nativeint_ops
	call	caml_register_custom_operations
.LVL49:
	.loc 1 122 3
	lla	a0,caml_int64_ops
	call	caml_register_custom_operations
.LVL50:
	.loc 1 123 3
	lla	a0,caml_ba_ops
	call	caml_register_custom_operations
.LVL51:
	.loc 1 124 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	caml_init_custom_operations, .-caml_init_custom_operations
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1072693248
	.section	.sbss,"aw",@nobits
	.align	3
	.type	custom_ops_final_table, @object
	.size	custom_ops_final_table, 8
custom_ops_final_table:
	.zero	8
	.type	custom_ops_table, @object
	.size	custom_ops_table, 8
custom_ops_table:
	.zero	8
	.text
.Letext0:
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "caml/config.h"
	.file 5 "caml/misc.h"
	.file 6 "caml/mlvalues.h"
	.file 7 "caml/alloc.h"
	.file 8 "caml/custom.h"
	.file 9 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 10 "caml/fail.h"
	.file 11 "caml/freelist.h"
	.file 12 "caml/major_gc.h"
	.file 13 "caml/address_class.h"
	.file 14 "caml/memory.h"
	.file 15 "caml/signals.h"
	.file 16 "/home/sai/ocaml-freestanding-riscv/nolibc/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb79
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF128
	.byte	0xc
	.4byte	.LASF129
	.4byte	.LASF130
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF7
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
	.byte	0x5
	.4byte	0x47
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x4
	.byte	0x5b
	.byte	0xe
	.4byte	0x2d
	.byte	0x5
	.4byte	0x76
	.byte	0x3
	.4byte	.LASF9
	.byte	0x4
	.byte	0x5c
	.byte	0x17
	.4byte	0x40
	.byte	0x3
	.4byte	.LASF10
	.byte	0x5
	.byte	0x21
	.byte	0x10
	.4byte	0x34
	.byte	0x6
	.byte	0x8
	.4byte	0xa5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0xb8
	.byte	0x6
	.byte	0x8
	.4byte	0xc3
	.byte	0x5
	.4byte	0xb8
	.byte	0x7
	.byte	0x8
	.4byte	.LASF13
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF14
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF15
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF16
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF17
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0xac
	.byte	0x8
	.4byte	.LASF18
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0xac
	.byte	0x9
	.byte	0x8
	.byte	0xa
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x169
	.byte	0x10
	.4byte	0x87
	.byte	0xa
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x171
	.byte	0x10
	.4byte	0x87
	.byte	0x3
	.4byte	.LASF21
	.byte	0x6
	.byte	0x3c
	.byte	0x10
	.4byte	0x76
	.byte	0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x3d
	.byte	0x11
	.4byte	0x87
	.byte	0x3
	.4byte	.LASF23
	.byte	0x6
	.byte	0x3e
	.byte	0x11
	.4byte	0x87
	.byte	0xb
	.4byte	0x134
	.4byte	0x157
	.byte	0xc
	.byte	0
	.byte	0xa
	.4byte	.LASF24
	.byte	0x6
	.2byte	0x15c
	.byte	0x15
	.4byte	0x14c
	.byte	0xa
	.4byte	.LASF25
	.byte	0x6
	.2byte	0x171
	.byte	0xe
	.4byte	0x128
	.byte	0x3
	.4byte	.LASF26
	.byte	0x7
	.byte	0x37
	.byte	0x10
	.4byte	0x17d
	.byte	0x6
	.byte	0x8
	.4byte	0x183
	.byte	0xd
	.4byte	0x18e
	.byte	0xe
	.4byte	0x128
	.byte	0
	.byte	0xf
	.4byte	.LASF36
	.byte	0x38
	.byte	0x8
	.byte	0x19
	.byte	0x8
	.4byte	0x1f7
	.byte	0x10
	.4byte	.LASF27
	.byte	0x8
	.byte	0x1a
	.byte	0x9
	.4byte	0x9f
	.byte	0
	.byte	0x10
	.4byte	.LASF28
	.byte	0x8
	.byte	0x1b
	.byte	0xa
	.4byte	0x17d
	.byte	0x8
	.byte	0x10
	.4byte	.LASF29
	.byte	0x8
	.byte	0x1c
	.byte	0x9
	.4byte	0x20b
	.byte	0x10
	.byte	0x10
	.4byte	.LASF30
	.byte	0x8
	.byte	0x1d
	.byte	0xc
	.4byte	0x220
	.byte	0x18
	.byte	0x10
	.4byte	.LASF31
	.byte	0x8
	.byte	0x1e
	.byte	0xa
	.4byte	0x241
	.byte	0x20
	.byte	0x10
	.4byte	.LASF32
	.byte	0x8
	.byte	0x21
	.byte	0xd
	.4byte	0x256
	.byte	0x28
	.byte	0x10
	.4byte	.LASF33
	.byte	0x8
	.byte	0x22
	.byte	0x9
	.4byte	0x20b
	.byte	0x30
	.byte	0
	.byte	0x11
	.4byte	0x47
	.4byte	0x20b
	.byte	0xe
	.4byte	0x128
	.byte	0xe
	.4byte	0x128
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x1f7
	.byte	0x11
	.4byte	0x76
	.4byte	0x220
	.byte	0xe
	.4byte	0x128
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x211
	.byte	0xd
	.4byte	0x23b
	.byte	0xe
	.4byte	0x128
	.byte	0xe
	.4byte	0x23b
	.byte	0xe
	.4byte	0x23b
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x87
	.byte	0x6
	.byte	0x8
	.4byte	0x226
	.byte	0x11
	.4byte	0x87
	.4byte	0x256
	.byte	0xe
	.4byte	0x10c
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x247
	.byte	0x8
	.4byte	.LASF34
	.byte	0x8
	.byte	0x3a
	.byte	0x10
	.4byte	0x47
	.byte	0x3
	.4byte	.LASF35
	.byte	0x9
	.byte	0x4
	.byte	0xd
	.4byte	0x47
	.byte	0xf
	.4byte	.LASF37
	.byte	0x4
	.byte	0xa
	.byte	0x2c
	.byte	0x8
	.4byte	0x28f
	.byte	0x12
	.string	"buf"
	.byte	0xa
	.byte	0x2d
	.byte	0xe
	.4byte	0x268
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF38
	.byte	0xa
	.byte	0x3e
	.byte	0x24
	.4byte	0x29b
	.byte	0x6
	.byte	0x8
	.4byte	0x274
	.byte	0x8
	.4byte	.LASF39
	.byte	0xa
	.byte	0x3f
	.byte	0xe
	.4byte	0x128
	.byte	0x8
	.4byte	.LASF40
	.byte	0xb
	.byte	0x1a
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF41
	.byte	0xc
	.byte	0x24
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF42
	.byte	0xc
	.byte	0x25
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF43
	.byte	0xc
	.byte	0x26
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF44
	.byte	0xc
	.byte	0x27
	.byte	0xf
	.4byte	0x2e9
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF45
	.byte	0x8
	.4byte	.LASF46
	.byte	0xc
	.byte	0x28
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF47
	.byte	0xc
	.byte	0x28
	.byte	0x25
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF48
	.byte	0xc
	.byte	0x29
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF49
	.byte	0xc
	.byte	0x3e
	.byte	0x12
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF50
	.byte	0xc
	.byte	0x3f
	.byte	0x10
	.4byte	0x87
	.byte	0x8
	.4byte	.LASF51
	.byte	0xc
	.byte	0x40
	.byte	0xe
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF52
	.byte	0xc
	.byte	0x42
	.byte	0xc
	.4byte	0x47
	.byte	0xb
	.4byte	0x2e9
	.4byte	0x354
	.byte	0x13
	.4byte	0x40
	.byte	0x31
	.byte	0
	.byte	0x14
	.4byte	.LASF53
	.byte	0xc
	.byte	0x43
	.byte	0x8
	.4byte	0x344
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x14
	.4byte	.LASF54
	.byte	0xc
	.byte	0x44
	.byte	0x5
	.4byte	0x47
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x14
	.4byte	.LASF55
	.byte	0xc
	.byte	0x45
	.byte	0x8
	.4byte	0x2e9
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x8
	.4byte	.LASF56
	.byte	0xc
	.byte	0x46
	.byte	0xf
	.4byte	0x2e9
	.byte	0x8
	.4byte	.LASF57
	.byte	0xc
	.byte	0x4a
	.byte	0x13
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF58
	.byte	0xd
	.byte	0x31
	.byte	0xf
	.4byte	0x3ba
	.byte	0x6
	.byte	0x8
	.4byte	0x128
	.byte	0x8
	.4byte	.LASF59
	.byte	0xd
	.byte	0x31
	.byte	0x22
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF60
	.byte	0xd
	.byte	0x32
	.byte	0xf
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF61
	.byte	0xd
	.byte	0x32
	.byte	0x27
	.4byte	0x9f
	.byte	0x8
	.4byte	.LASF62
	.byte	0x2
	.byte	0x18
	.byte	0x13
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF63
	.byte	0x2
	.byte	0x18
	.byte	0x2c
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF64
	.byte	0x2
	.byte	0x19
	.byte	0x13
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF65
	.byte	0x2
	.byte	0x19
	.byte	0x24
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF66
	.byte	0x2
	.byte	0x1a
	.byte	0x13
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF67
	.byte	0x2
	.byte	0x1b
	.byte	0x10
	.4byte	0x93
	.byte	0x8
	.4byte	.LASF68
	.byte	0x2
	.byte	0x1c
	.byte	0xc
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF69
	.byte	0x2
	.byte	0x1d
	.byte	0xf
	.4byte	0x2e9
	.byte	0xf
	.4byte	.LASF70
	.byte	0x38
	.byte	0x2
	.byte	0x29
	.byte	0x8
	.4byte	0x4ad
	.byte	0x10
	.4byte	.LASF71
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x4ad
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x4ad
	.byte	0x8
	.byte	0x10
	.4byte	.LASF72
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x4ad
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x4ad
	.byte	0x18
	.byte	0x10
	.4byte	.LASF73
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x4ad
	.byte	0x20
	.byte	0x10
	.4byte	.LASF74
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF75
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x3ba
	.byte	0x8
	.4byte	.LASF70
	.byte	0x2
	.byte	0x2a
	.byte	0x22
	.4byte	0x444
	.byte	0xf
	.4byte	.LASF76
	.byte	0x10
	.byte	0x2
	.byte	0x2c
	.byte	0x8
	.4byte	0x4e7
	.byte	0x10
	.4byte	.LASF77
	.byte	0x2
	.byte	0x2d
	.byte	0x9
	.4byte	0x128
	.byte	0
	.byte	0x10
	.4byte	.LASF78
	.byte	0x2
	.byte	0x2e
	.byte	0xc
	.4byte	0x140
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF79
	.byte	0x38
	.byte	0x2
	.byte	0x31
	.byte	0x8
	.4byte	0x550
	.byte	0x10
	.4byte	.LASF71
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x550
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x550
	.byte	0x8
	.byte	0x10
	.4byte	.LASF72
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x550
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x550
	.byte	0x18
	.byte	0x10
	.4byte	.LASF73
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x550
	.byte	0x20
	.byte	0x10
	.4byte	.LASF74
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF75
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x4bf
	.byte	0x8
	.4byte	.LASF79
	.byte	0x2
	.byte	0x32
	.byte	0x27
	.4byte	0x4e7
	.byte	0xf
	.4byte	.LASF80
	.byte	0x18
	.byte	0x2
	.byte	0x34
	.byte	0x8
	.4byte	0x597
	.byte	0x10
	.4byte	.LASF81
	.byte	0x2
	.byte	0x35
	.byte	0x9
	.4byte	0x128
	.byte	0
	.byte	0x12
	.string	"mem"
	.byte	0x2
	.byte	0x36
	.byte	0xc
	.4byte	0x140
	.byte	0x8
	.byte	0x12
	.string	"max"
	.byte	0x2
	.byte	0x37
	.byte	0xc
	.4byte	0x140
	.byte	0x10
	.byte	0
	.byte	0xf
	.4byte	.LASF82
	.byte	0x38
	.byte	0x2
	.byte	0x3a
	.byte	0x8
	.4byte	0x600
	.byte	0x10
	.4byte	.LASF71
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x600
	.byte	0
	.byte	0x12
	.string	"end"
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x600
	.byte	0x8
	.byte	0x10
	.4byte	.LASF72
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x600
	.byte	0x10
	.byte	0x12
	.string	"ptr"
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x600
	.byte	0x18
	.byte	0x10
	.4byte	.LASF73
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x600
	.byte	0x20
	.byte	0x10
	.4byte	.LASF74
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x28
	.byte	0x10
	.4byte	.LASF75
	.byte	0x2
	.byte	0x3a
	.byte	0x1a
	.4byte	0x93
	.byte	0x30
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x562
	.byte	0x8
	.4byte	.LASF82
	.byte	0x2
	.byte	0x3b
	.byte	0x25
	.4byte	0x597
	.byte	0x8
	.4byte	.LASF83
	.byte	0xe
	.byte	0x3f
	.byte	0x10
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF84
	.byte	0xe
	.byte	0xb7
	.byte	0x10
	.4byte	0x87
	.byte	0xf
	.4byte	.LASF85
	.byte	0x40
	.byte	0xe
	.byte	0xf3
	.byte	0x8
	.4byte	0x66c
	.byte	0x10
	.4byte	.LASF86
	.byte	0xe
	.byte	0xf4
	.byte	0x1d
	.4byte	0x66c
	.byte	0
	.byte	0x10
	.4byte	.LASF87
	.byte	0xe
	.byte	0xf5
	.byte	0xa
	.4byte	0x76
	.byte	0x8
	.byte	0x10
	.4byte	.LASF88
	.byte	0xe
	.byte	0xf6
	.byte	0xa
	.4byte	0x76
	.byte	0x10
	.byte	0x10
	.4byte	.LASF89
	.byte	0xe
	.byte	0xf7
	.byte	0xa
	.4byte	0x672
	.byte	0x18
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x62a
	.byte	0xb
	.4byte	0x3ba
	.4byte	0x682
	.byte	0x13
	.4byte	0x40
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF90
	.byte	0xe
	.byte	0xfa
	.byte	0x26
	.4byte	0x66c
	.byte	0x8
	.4byte	.LASF91
	.byte	0xf
	.byte	0x1e
	.byte	0x1c
	.4byte	0x82
	.byte	0xb
	.4byte	0x82
	.4byte	0x6a5
	.byte	0xc
	.byte	0
	.byte	0x5
	.4byte	0x69a
	.byte	0x8
	.4byte	.LASF92
	.byte	0xf
	.byte	0x1f
	.byte	0x1c
	.4byte	0x6a5
	.byte	0x8
	.4byte	.LASF93
	.byte	0xf
	.byte	0x20
	.byte	0x19
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF94
	.byte	0xf
	.byte	0x21
	.byte	0x15
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF95
	.byte	0xf
	.byte	0x22
	.byte	0x15
	.4byte	0x4e
	.byte	0x8
	.4byte	.LASF96
	.byte	0xf
	.byte	0x2e
	.byte	0x13
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF97
	.byte	0xf
	.byte	0x2f
	.byte	0x13
	.4byte	0xb8
	.byte	0x15
	.4byte	0x47
	.byte	0x8
	.4byte	.LASF98
	.byte	0xf
	.byte	0x30
	.byte	0x12
	.4byte	0x703
	.byte	0x6
	.byte	0x8
	.4byte	0x6f2
	.byte	0x8
	.4byte	.LASF99
	.byte	0xf
	.byte	0x31
	.byte	0x1d
	.4byte	0xbe
	.byte	0xf
	.4byte	.LASF100
	.byte	0x10
	.byte	0x1
	.byte	0x40
	.byte	0x8
	.4byte	0x73d
	.byte	0x12
	.string	"ops"
	.byte	0x1
	.byte	0x41
	.byte	0x1e
	.4byte	0x73d
	.byte	0
	.byte	0x10
	.4byte	.LASF86
	.byte	0x1
	.byte	0x42
	.byte	0x23
	.4byte	0x743
	.byte	0x8
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x18e
	.byte	0x6
	.byte	0x8
	.4byte	0x715
	.byte	0x16
	.4byte	.LASF101
	.byte	0x1
	.byte	0x45
	.byte	0x28
	.4byte	0x743
	.byte	0x9
	.byte	0x3
	.8byte	custom_ops_table
	.byte	0x16
	.4byte	.LASF102
	.byte	0x1
	.byte	0x5a
	.byte	0x28
	.4byte	0x743
	.byte	0x9
	.byte	0x3
	.8byte	custom_ops_final_table
	.byte	0x8
	.4byte	.LASF103
	.byte	0x1
	.byte	0x71
	.byte	0x21
	.4byte	0x18e
	.byte	0x8
	.4byte	.LASF104
	.byte	0x1
	.byte	0x72
	.byte	0x21
	.4byte	0x18e
	.byte	0x8
	.4byte	.LASF105
	.byte	0x1
	.byte	0x73
	.byte	0x21
	.4byte	0x18e
	.byte	0x8
	.4byte	.LASF106
	.byte	0x1
	.byte	0x74
	.byte	0x21
	.4byte	0x18e
	.byte	0x17
	.4byte	.LASF110
	.byte	0x1
	.byte	0x76
	.byte	0x6
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f8
	.byte	0x18
	.8byte	.LVL48
	.4byte	0x8c8
	.byte	0x18
	.8byte	.LVL49
	.4byte	0x8c8
	.byte	0x18
	.8byte	.LVL50
	.4byte	0x8c8
	.byte	0x18
	.8byte	.LVL51
	.4byte	0x8c8
	.byte	0
	.byte	0x19
	.4byte	.LASF107
	.byte	0x1
	.byte	0x5c
	.byte	0x1c
	.4byte	0x73d
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x873
	.byte	0x1a
	.string	"fn"
	.byte	0x1
	.byte	0x5c
	.byte	0x43
	.4byte	0x171
	.4byte	.LLST14
	.byte	0x1b
	.string	"l"
	.byte	0x1
	.byte	0x5e
	.byte	0x23
	.4byte	0x743
	.4byte	.LLST15
	.byte	0x1b
	.string	"ops"
	.byte	0x1
	.byte	0x5f
	.byte	0x1e
	.4byte	0x73d
	.4byte	.LLST16
	.byte	0x1c
	.8byte	.LVL43
	.4byte	0xb10
	.4byte	0x85f
	.byte	0x1d
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x38
	.byte	0
	.byte	0x1e
	.8byte	.LVL45
	.4byte	0xb10
	.byte	0x1d
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF108
	.byte	0x1
	.byte	0x52
	.byte	0x1c
	.4byte	0x73d
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x8c8
	.byte	0x1f
	.4byte	.LASF109
	.byte	0x1
	.byte	0x52
	.byte	0x3f
	.4byte	0x9f
	.4byte	.LLST12
	.byte	0x1b
	.string	"l"
	.byte	0x1
	.byte	0x54
	.byte	0x23
	.4byte	0x743
	.4byte	.LLST13
	.byte	0x1e
	.8byte	.LVL35
	.4byte	0xb1c
	.byte	0x1d
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF111
	.byte	0x1
	.byte	0x47
	.byte	0x11
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x916
	.byte	0x1a
	.string	"ops"
	.byte	0x1
	.byte	0x47
	.byte	0x4c
	.4byte	0x73d
	.4byte	.LLST11
	.byte	0x20
	.string	"l"
	.byte	0x1
	.byte	0x49
	.byte	0x23
	.4byte	0x743
	.byte	0x1
	.byte	0x5a
	.byte	0x1e
	.8byte	.LVL31
	.4byte	0xb10
	.byte	0x1d
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.byte	0x1c
	.byte	0x12
	.4byte	0x128
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xac2
	.byte	0x1a
	.string	"ops"
	.byte	0x1
	.byte	0x1c
	.byte	0x3f
	.4byte	0x73d
	.4byte	.LLST0
	.byte	0x1f
	.4byte	.LASF74
	.byte	0x1
	.byte	0x1d
	.byte	0x2c
	.4byte	0x87
	.4byte	.LLST1
	.byte	0x1a
	.string	"mem"
	.byte	0x1
	.byte	0x1e
	.byte	0x2d
	.4byte	0x140
	.4byte	.LLST2
	.byte	0x1a
	.string	"max"
	.byte	0x1
	.byte	0x1f
	.byte	0x2d
	.4byte	0x140
	.4byte	.LLST3
	.byte	0x21
	.4byte	.LASF113
	.byte	0x1
	.byte	0x21
	.byte	0xc
	.4byte	0x140
	.4byte	.LLST4
	.byte	0x21
	.4byte	.LASF114
	.byte	0x1
	.byte	0x22
	.byte	0x3
	.4byte	0x66c
	.4byte	.LLST5
	.byte	0x16
	.4byte	.LASF115
	.byte	0x1
	.byte	0x23
	.byte	0x3
	.4byte	0x128
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x16
	.4byte	.LASF116
	.byte	0x1
	.byte	0x23
	.byte	0x3
	.4byte	0x62a
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x22
	.4byte	.LASF117
	.byte	0x1
	.byte	0x23
	.byte	0x3
	.4byte	0x47
	.byte	0
	.byte	0x23
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x9ea
	.byte	0x21
	.4byte	.LASF118
	.byte	0x1
	.byte	0x3d
	.byte	0x3
	.4byte	0x128
	.4byte	.LLST10
	.byte	0
	.byte	0x24
	.4byte	0xac2
	.8byte	.LBB5
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2b
	.byte	0x7
	.4byte	0xa3f
	.byte	0x25
	.4byte	0xaf1
	.4byte	.LLST6
	.byte	0x25
	.4byte	0xae5
	.4byte	.LLST7
	.byte	0x25
	.4byte	0xadb
	.4byte	.LLST8
	.byte	0x26
	.4byte	0xacf
	.byte	0x27
	.4byte	.Ldebug_ranges0+0
	.byte	0x28
	.4byte	0xafd
	.4byte	.LLST9
	.byte	0x18
	.8byte	.LVL20
	.4byte	0xb28
	.byte	0
	.byte	0
	.byte	0x1c
	.8byte	.LVL7
	.4byte	0xb34
	.4byte	0xa64
	.byte	0x1d
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x7
	.byte	0x33
	.byte	0x25
	.byte	0x23
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0xff
	.byte	0
	.byte	0x18
	.8byte	.LVL15
	.4byte	0xb40
	.byte	0x18
	.8byte	.LVL16
	.4byte	0xb4c
	.byte	0x1c
	.8byte	.LVL22
	.4byte	0xb58
	.4byte	0xa96
	.byte	0x1d
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8
	.byte	0xff
	.byte	0
	.byte	0x1c
	.8byte	.LVL23
	.4byte	0xb64
	.4byte	0xab4
	.byte	0x1d
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1d
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x18
	.8byte	.LVL24
	.4byte	0xb70
	.byte	0
	.byte	0x29
	.4byte	.LASF131
	.byte	0x2
	.byte	0x6a
	.byte	0x14
	.byte	0x3
	.4byte	0xb0a
	.byte	0x2a
	.string	"tbl"
	.byte	0x2
	.byte	0x6a
	.byte	0x43
	.4byte	0xb0a
	.byte	0x2a
	.string	"v"
	.byte	0x2
	.byte	0x6a
	.byte	0x4e
	.4byte	0x128
	.byte	0x2a
	.string	"mem"
	.byte	0x2
	.byte	0x6b
	.byte	0x32
	.4byte	0x140
	.byte	0x2a
	.string	"max"
	.byte	0x2
	.byte	0x6b
	.byte	0x40
	.4byte	0x140
	.byte	0x2b
	.string	"elt"
	.byte	0x2
	.byte	0x6d
	.byte	0x1b
	.4byte	0x600
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	0x597
	.byte	0x2c
	.4byte	.LASF119
	.4byte	.LASF119
	.byte	0xe
	.byte	0x67
	.byte	0x1c
	.byte	0x2c
	.4byte	.LASF120
	.4byte	.LASF120
	.byte	0x10
	.byte	0xb
	.byte	0x5
	.byte	0x2c
	.4byte	.LASF121
	.4byte	.LASF121
	.byte	0x2
	.byte	0x46
	.byte	0xd
	.byte	0x2c
	.4byte	.LASF122
	.4byte	.LASF122
	.byte	0x7
	.byte	0x1f
	.byte	0x12
	.byte	0x2c
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0xf
	.byte	0x25
	.byte	0x6
	.byte	0x2c
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x2
	.byte	0x3f
	.byte	0x11
	.byte	0x2c
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0xe
	.byte	0x26
	.byte	0x12
	.byte	0x2c
	.4byte	.LASF126
	.4byte	.LASF126
	.byte	0xe
	.byte	0x32
	.byte	0x11
	.byte	0x2c
	.4byte	.LASF127
	.4byte	.LASF127
	.byte	0xe
	.byte	0x37
	.byte	0x12
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x29
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0x2c
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
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL42-.Ltext0
	.8byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL47-.Ltext0
	.8byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL43-1-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL33-.Ltext0
	.8byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL38-.Ltext0
	.8byte	.LFE14-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL34-.Ltext0
	.8byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST11:
	.8byte	.LVL29-.Ltext0
	.8byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL30-.Ltext0
	.8byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL32-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0
	.8byte	.LVL9-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL19-.Ltext0
	.2byte	0x2
	.byte	0x7a
	.byte	0
	.8byte	.LVL19-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL25-.Ltext0
	.8byte	.LFE12-.Ltext0
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
	.8byte	.LVL5-.Ltext0
	.2byte	0x3
	.byte	0x7b
	.byte	0x79
	.byte	0x9f
	.8byte	.LVL5-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL7-1-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.8byte	.LVL7-1-.Ltext0
	.8byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.byte	0x70
	.8byte	.LVL15-1-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL25-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL6-.Ltext0
	.8byte	.LVL7-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL7-1-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0xa
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x7
	.byte	0x33
	.byte	0x25
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.8byte	.LVL21-.Ltext0
	.8byte	.LVL22-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL22-1-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0xa
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x7
	.byte	0x33
	.byte	0x25
	.byte	0x23
	.byte	0x1
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x63
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL25-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x91
	.byte	0x48
	.8byte	.LVL28-.Ltext0
	.8byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x58
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL8-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	.LVL18-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x62
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL13-.Ltext0
	.8byte	.LVL15-1-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.byte	0x68
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.8byte	.LBB5-.Ltext0
	.8byte	.LBE5-.Ltext0
	.8byte	.LBB8-.Ltext0
	.8byte	.LBE8-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF96:
	.string	"caml_enter_blocking_section_hook"
.LASF73:
	.string	"limit"
.LASF97:
	.string	"caml_leave_blocking_section_hook"
.LASF105:
	.string	"caml_int64_ops"
.LASF62:
	.string	"caml_young_alloc_start"
.LASF130:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF35:
	.string	"sigjmp_buf"
.LASF12:
	.string	"caml_timing_hook"
.LASF114:
	.string	"caml__frame"
.LASF93:
	.string	"caml_something_to_do"
.LASF66:
	.string	"caml_young_trigger"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF80:
	.string	"caml_custom_elt"
.LASF42:
	.string	"caml_gc_subphase"
.LASF115:
	.string	"result"
.LASF52:
	.string	"caml_major_window"
.LASF65:
	.string	"caml_young_limit"
.LASF91:
	.string	"caml_signals_are_pending"
.LASF63:
	.string	"caml_young_alloc_end"
.LASF128:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF21:
	.string	"value"
.LASF98:
	.string	"caml_try_leave_blocking_section_hook"
.LASF70:
	.string	"caml_ref_table"
.LASF37:
	.string	"longjmp_buffer"
.LASF15:
	.string	"caml_minor_gc_begin_hook"
.LASF125:
	.string	"caml_alloc_shr"
.LASF68:
	.string	"caml_in_minor_collection"
.LASF126:
	.string	"caml_adjust_gc_speed"
.LASF90:
	.string	"caml_local_roots"
.LASF33:
	.string	"compare_ext"
.LASF28:
	.string	"finalize"
.LASF92:
	.string	"caml_pending_signals"
.LASF102:
	.string	"custom_ops_final_table"
.LASF27:
	.string	"identifier"
.LASF57:
	.string	"caml_major_gc_hook"
.LASF56:
	.string	"caml_gc_clock"
.LASF88:
	.string	"nitems"
.LASF18:
	.string	"caml_finalise_end_hook"
.LASF124:
	.string	"caml_gc_dispatch"
.LASF2:
	.string	"long long int"
.LASF103:
	.string	"caml_int32_ops"
.LASF51:
	.string	"caml_gc_sweep_hp"
.LASF53:
	.string	"caml_major_ring"
.LASF72:
	.string	"threshold"
.LASF89:
	.string	"tables"
.LASF8:
	.string	"intnat"
.LASF0:
	.string	"long int"
.LASF78:
	.string	"offset"
.LASF75:
	.string	"reserve"
.LASF118:
	.string	"caml__temp_result"
.LASF101:
	.string	"custom_ops_table"
.LASF83:
	.string	"caml_huge_fallback_count"
.LASF81:
	.string	"block"
.LASF40:
	.string	"caml_fl_cur_wsz"
.LASF20:
	.string	"caml_runtime_warnings"
.LASF22:
	.string	"header_t"
.LASF108:
	.string	"caml_find_custom_operations"
.LASF94:
	.string	"caml_requested_major_slice"
.LASF14:
	.string	"caml_major_slice_end_hook"
.LASF24:
	.string	"caml_atom_table"
.LASF3:
	.string	"long double"
.LASF17:
	.string	"caml_finalise_begin_hook"
.LASF69:
	.string	"caml_extra_heap_resources_minor"
.LASF36:
	.string	"custom_operations"
.LASF47:
	.string	"caml_dependent_allocated"
.LASF30:
	.string	"hash"
.LASF23:
	.string	"mlsize_t"
.LASF113:
	.string	"wosize"
.LASF85:
	.string	"caml__roots_block"
.LASF9:
	.string	"uintnat"
.LASF110:
	.string	"caml_init_custom_operations"
.LASF59:
	.string	"caml_young_end"
.LASF111:
	.string	"caml_register_custom_operations"
.LASF4:
	.string	"unsigned int"
.LASF131:
	.string	"add_to_custom_table"
.LASF121:
	.string	"caml_realloc_custom_table"
.LASF120:
	.string	"strcmp"
.LASF77:
	.string	"ephe"
.LASF123:
	.string	"caml_request_minor_gc"
.LASF106:
	.string	"caml_ba_ops"
.LASF13:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF117:
	.string	"caml__dummy_result"
.LASF58:
	.string	"caml_young_start"
.LASF11:
	.string	"char"
.LASF122:
	.string	"caml_alloc_small"
.LASF116:
	.string	"caml__roots_result"
.LASF54:
	.string	"caml_major_ring_index"
.LASF95:
	.string	"caml_requested_minor_gc"
.LASF41:
	.string	"caml_gc_phase"
.LASF67:
	.string	"caml_minor_heap_wsz"
.LASF19:
	.string	"caml_verb_gc"
.LASF16:
	.string	"caml_minor_gc_end_hook"
.LASF38:
	.string	"caml_external_raise"
.LASF26:
	.string	"final_fun"
.LASF112:
	.string	"caml_alloc_custom"
.LASF127:
	.string	"caml_check_urgent_gc"
.LASF1:
	.string	"long unsigned int"
.LASF60:
	.string	"caml_code_area_start"
.LASF99:
	.string	"caml_async_action_hook"
.LASF45:
	.string	"double"
.LASF119:
	.string	"caml_stat_alloc"
.LASF39:
	.string	"caml_exn_bucket"
.LASF25:
	.string	"caml_global_data"
.LASF100:
	.string	"custom_operations_list"
.LASF74:
	.string	"size"
.LASF109:
	.string	"ident"
.LASF29:
	.string	"compare"
.LASF48:
	.string	"caml_fl_wsz_at_phase_change"
.LASF82:
	.string	"caml_custom_table"
.LASF32:
	.string	"deserialize"
.LASF61:
	.string	"caml_code_area_end"
.LASF44:
	.string	"caml_extra_heap_resources"
.LASF34:
	.string	"caml_compare_unordered"
.LASF87:
	.string	"ntables"
.LASF46:
	.string	"caml_dependent_size"
.LASF49:
	.string	"caml_heap_start"
.LASF129:
	.string	"custom.c"
.LASF31:
	.string	"serialize"
.LASF10:
	.string	"asize_t"
.LASF64:
	.string	"caml_young_ptr"
.LASF104:
	.string	"caml_nativeint_ops"
.LASF50:
	.string	"total_heap_size"
.LASF71:
	.string	"base"
.LASF55:
	.string	"caml_major_work_credit"
.LASF107:
	.string	"caml_final_custom_operations"
.LASF79:
	.string	"caml_ephe_ref_table"
.LASF76:
	.string	"caml_ephe_ref_elt"
.LASF86:
	.string	"next"
.LASF84:
	.string	"caml_use_huge_pages"
.LASF43:
	.string	"caml_allocated_words"
	.ident	"GCC: (GNU) 9.2.0"
