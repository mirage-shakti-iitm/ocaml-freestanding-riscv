	.file	"signals_asm.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	handle_signal, @function
handle_signal:
.LFB9:
	.file 1 "signals_asm.c"
	.loc 1 91 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 92 3
	.loc 1 94 3
	.loc 1 94 15 is_stmt 0
	lw	s1,errno
.LVL1:
	.loc 1 98 3 is_stmt 1
	.loc 1 98 15 is_stmt 0
	sext.w	a4,a0
	.loc 1 98 6
	li	a5,63
	bgtu	a4,a5,.L1
	mv	s0,a0
	.loc 1 99 3 is_stmt 1
	.loc 1 99 7 is_stmt 0
	ld	a5,caml_try_leave_blocking_section_hook
	jalr	a5
.LVL2:
	.loc 1 99 6
	beq	a0,zero,.L3
	.loc 1 100 5 is_stmt 1
	li	a1,1
	mv	a0,s0
	call	caml_execute_signal
.LVL3:
	.loc 1 101 5
	ld	a5,caml_enter_blocking_section_hook
	jalr	a5
.LVL4:
.L4:
	.loc 1 112 3
	.loc 1 112 9 is_stmt 0
	sw	s1,errno,a5
.L1:
	.loc 1 113 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL5:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL6:
.L3:
	.cfi_restore_state
	.loc 1 103 5 is_stmt 1
	mv	a0,s0
	call	caml_record_signal
.LVL7:
	j	.L4
	.cfi_endproc
.LFE9:
	.size	handle_signal, .-handle_signal
	.align	1
	.globl	caml_garbage_collection
	.type	caml_garbage_collection, @function
caml_garbage_collection:
.LFB8:
	.loc 1 74 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 75 3
	.loc 1 75 20 is_stmt 0
	ld	a5,caml_young_trigger
	sd	a5,caml_young_limit,a4
	.loc 1 76 3 is_stmt 1
	.loc 1 76 7 is_stmt 0
	lw	a4,caml_requested_major_slice
	.loc 1 76 6
	bne	a4,zero,.L7
	.loc 1 76 34 discriminator 1
	lw	a4,caml_requested_minor_gc
	bne	a4,zero,.L7
	.loc 1 77 22 discriminator 2
	ld	a4,caml_young_ptr
	sub	a5,a4,a5
	.loc 1 76 61 discriminator 2
	li	a4,4096
	addi	a4,a4,-2048
	bgt	a5,a4,.L8
.L7:
	.loc 1 78 5 is_stmt 1
	call	caml_gc_dispatch
.LVL8:
.L8:
	.loc 1 87 3
	call	caml_process_pending_signals
.LVL9:
	.loc 1 88 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	caml_garbage_collection, .-caml_garbage_collection
	.align	1
	.globl	caml_set_signal_action
	.type	caml_set_signal_action, @function
caml_set_signal_action:
.LFB10:
	.loc 1 116 1 is_stmt 1
	.cfi_startproc
.LVL10:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	mv	s0,a0
	.loc 1 117 3
	.loc 1 119 3
	.loc 1 125 3
	beq	a1,zero,.L11
	li	a5,1
	beq	a1,a5,.L12
	.loc 1 135 5
	lla	a5,handle_signal
	sd	a5,16(sp)
	.loc 1 135 5
	sw	zero,28(sp)
	.loc 1 136 5
	j	.L14
.L11:
	.loc 1 127 5
	.loc 1 127 23 is_stmt 0
	sd	zero,16(sp)
	.loc 1 128 5 is_stmt 1
	.loc 1 128 21 is_stmt 0
	sw	zero,28(sp)
	.loc 1 129 5 is_stmt 1
.L14:
	.loc 1 138 3
	addi	a0,sp,24
.LVL11:
	call	sigemptyset
.LVL12:
	.loc 1 139 3
	.loc 1 139 7 is_stmt 0
	mv	a2,sp
	addi	a1,sp,16
	mv	a0,s0
	call	sigaction
.LVL13:
	.loc 1 139 6
	li	a5,-1
	beq	a0,a5,.L15
	.loc 1 140 3 is_stmt 1
	.loc 1 140 10 is_stmt 0
	ld	a5,0(sp)
.LVL14:
	.loc 1 150 3 is_stmt 1
	.loc 1 150 6 is_stmt 0
	lla	a4,handle_signal
	beq	a5,a4,.L16
	.loc 1 152 8 is_stmt 1
	.loc 1 152 11 is_stmt 0
	beq	a5,zero,.L20
	.loc 1 155 12
	li	a0,0
.LVL15:
.L15:
	.loc 1 156 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL16:
.L12:
	.cfi_restore_state
	.loc 1 131 5 is_stmt 1
	.loc 1 131 23 is_stmt 0
	sd	zero,16(sp)
	.loc 1 132 5 is_stmt 1
	.loc 1 132 21 is_stmt 0
	sw	zero,28(sp)
	.loc 1 133 5 is_stmt 1
	j	.L14
.LVL17:
.L20:
	.loc 1 153 12 is_stmt 0
	li	a0,1
	j	.L15
.L16:
	.loc 1 151 12
	li	a0,2
	j	.L15
	.cfi_endproc
.LFE10:
	.size	caml_set_signal_action, .-caml_set_signal_action
	.align	1
	.globl	caml_init_signals
	.type	caml_init_signals, @function
caml_init_signals:
.LFB11:
	.loc 1 251 1 is_stmt 1
	.cfi_startproc
	.loc 1 288 1
	ret
	.cfi_endproc
.LFE11:
	.size	caml_init_signals, .-caml_init_signals
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 3 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 4 "/home/sai/ocaml-freestanding-riscv/nolibc/include/stdio.h"
	.file 5 "/home/sai/ocaml-freestanding-riscv/nolibc/include/errno.h"
	.file 6 "caml/config.h"
	.file 7 "caml/misc.h"
	.file 8 "caml/mlvalues.h"
	.file 9 "caml/fail.h"
	.file 10 "caml/freelist.h"
	.file 11 "caml/major_gc.h"
	.file 12 "caml/address_class.h"
	.file 13 "caml/minor_gc.h"
	.file 14 "caml/memory.h"
	.file 15 "caml/signals.h"
	.file 16 "caml/stack.h"
	.file 17 "caml/io.h"
	.file 18 "caml/spacetime.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc30
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF163
	.byte	0xc
	.4byte	.LASF164
	.4byte	.LASF165
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x4
	.byte	0xd
	.4byte	0x39
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	0x39
	.byte	0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x5
	.byte	0xd
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF10
	.byte	0x10
	.byte	0x2
	.byte	0x6
	.byte	0x8
	.4byte	0x86
	.byte	0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.byte	0xc
	.4byte	0x91
	.byte	0
	.byte	0x6
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.byte	0xe
	.4byte	0x45
	.byte	0x8
	.byte	0x6
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.byte	0x9
	.4byte	0x39
	.byte	0xc
	.byte	0
	.byte	0x7
	.4byte	0x91
	.byte	0x8
	.4byte	0x39
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x86
	.byte	0xa
	.4byte	.LASF17
	.byte	0x5
	.byte	0x4
	.byte	0xc
	.4byte	0x39
	.byte	0xb
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.4byte	.LASF6
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.4byte	0xb6
	.byte	0xb
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0xb
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0xb
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x5
	.4byte	.LASF11
	.byte	0x18
	.byte	0x4
	.byte	0x8
	.byte	0x10
	.4byte	0x100
	.byte	0x6
	.4byte	.LASF12
	.byte	0x4
	.byte	0x9
	.byte	0xe
	.4byte	0x131
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x4
	.byte	0xa
	.byte	0xb
	.4byte	0x137
	.byte	0x8
	.byte	0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0xb
	.byte	0xb
	.4byte	0x137
	.byte	0x10
	.byte	0
	.byte	0xc
	.4byte	0xaa
	.4byte	0x119
	.byte	0x8
	.4byte	0x119
	.byte	0x8
	.4byte	0x11f
	.byte	0x8
	.4byte	0xaa
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0xcb
	.byte	0x9
	.byte	0x8
	.4byte	0x12c
	.byte	0xb
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0xd
	.4byte	0x125
	.byte	0x9
	.byte	0x8
	.4byte	0x100
	.byte	0x9
	.byte	0x8
	.4byte	0x125
	.byte	0x2
	.4byte	.LASF16
	.byte	0x4
	.byte	0xc
	.byte	0x3
	.4byte	0xcb
	.byte	0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0x11
	.byte	0xe
	.4byte	0x155
	.byte	0x9
	.byte	0x8
	.4byte	0x13d
	.byte	0xa
	.4byte	.LASF19
	.byte	0x4
	.byte	0x12
	.byte	0xe
	.4byte	0x155
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.byte	0x1c
	.byte	0xe
	.4byte	0x155
	.byte	0xb
	.byte	0x4
	.byte	0x7
	.4byte	.LASF21
	.byte	0x2
	.4byte	.LASF22
	.byte	0x6
	.byte	0x50
	.byte	0x1a
	.4byte	0xb6
	.byte	0xb
	.byte	0x2
	.byte	0x5
	.4byte	.LASF23
	.byte	0xb
	.byte	0x2
	.byte	0x7
	.4byte	.LASF24
	.byte	0x2
	.4byte	.LASF25
	.byte	0x6
	.byte	0x5b
	.byte	0xe
	.4byte	0xa3
	.byte	0x4
	.4byte	0x194
	.byte	0x2
	.4byte	.LASF26
	.byte	0x6
	.byte	0x5c
	.byte	0x17
	.4byte	0xb6
	.byte	0x2
	.4byte	.LASF27
	.byte	0x7
	.byte	0x21
	.byte	0x10
	.4byte	0xaa
	.byte	0x2
	.4byte	.LASF28
	.byte	0x7
	.byte	0x5c
	.byte	0x10
	.4byte	0x1c9
	.byte	0x9
	.byte	0x8
	.4byte	0x1d4
	.byte	0x4
	.4byte	0x1c9
	.byte	0xe
	.byte	0xa
	.4byte	.LASF29
	.byte	0x7
	.byte	0x5d
	.byte	0x19
	.4byte	0x1bd
	.byte	0xa
	.4byte	.LASF30
	.byte	0x7
	.byte	0x5d
	.byte	0x36
	.4byte	0x1bd
	.byte	0xa
	.4byte	.LASF31
	.byte	0x7
	.byte	0x5e
	.byte	0x19
	.4byte	0x1bd
	.byte	0xa
	.4byte	.LASF32
	.byte	0x7
	.byte	0x5e
	.byte	0x33
	.4byte	0x1bd
	.byte	0xa
	.4byte	.LASF33
	.byte	0x7
	.byte	0x5f
	.byte	0x19
	.4byte	0x1bd
	.byte	0xa
	.4byte	.LASF34
	.byte	0x7
	.byte	0x5f
	.byte	0x33
	.4byte	0x1bd
	.byte	0xf
	.byte	0x8
	.byte	0x10
	.4byte	.LASF35
	.byte	0x7
	.2byte	0x169
	.byte	0x10
	.4byte	0x1a5
	.byte	0x10
	.4byte	.LASF36
	.byte	0x7
	.2byte	0x171
	.byte	0x10
	.4byte	0x1a5
	.byte	0x2
	.4byte	.LASF37
	.byte	0x8
	.byte	0x3c
	.byte	0x10
	.4byte	0x194
	.byte	0x2
	.4byte	.LASF38
	.byte	0x8
	.byte	0x3d
	.byte	0x11
	.4byte	0x1a5
	.byte	0x2
	.4byte	.LASF39
	.byte	0x8
	.byte	0x3e
	.byte	0x11
	.4byte	0x1a5
	.byte	0x11
	.4byte	0x245
	.4byte	0x268
	.byte	0x12
	.byte	0
	.byte	0x10
	.4byte	.LASF40
	.byte	0x8
	.2byte	0x15c
	.byte	0x15
	.4byte	0x25d
	.byte	0x10
	.4byte	.LASF41
	.byte	0x8
	.2byte	0x171
	.byte	0xe
	.4byte	0x239
	.byte	0x5
	.4byte	.LASF42
	.byte	0x4
	.byte	0x9
	.byte	0x2c
	.byte	0x8
	.4byte	0x29d
	.byte	0x13
	.string	"buf"
	.byte	0x9
	.byte	0x2d
	.byte	0xe
	.4byte	0x2d
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF43
	.byte	0x9
	.byte	0x3e
	.byte	0x24
	.4byte	0x2a9
	.byte	0x9
	.byte	0x8
	.4byte	0x282
	.byte	0xa
	.4byte	.LASF44
	.byte	0x9
	.byte	0x3f
	.byte	0xe
	.4byte	0x239
	.byte	0xa
	.4byte	.LASF45
	.byte	0xa
	.byte	0x1a
	.byte	0x10
	.4byte	0x1b1
	.byte	0xa
	.4byte	.LASF46
	.byte	0xb
	.byte	0x24
	.byte	0xc
	.4byte	0x39
	.byte	0xa
	.4byte	.LASF47
	.byte	0xb
	.byte	0x25
	.byte	0xc
	.4byte	0x39
	.byte	0xa
	.4byte	.LASF48
	.byte	0xb
	.byte	0x26
	.byte	0x10
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF49
	.byte	0xb
	.byte	0x27
	.byte	0xf
	.4byte	0x2f7
	.byte	0xb
	.byte	0x8
	.byte	0x4
	.4byte	.LASF50
	.byte	0xa
	.4byte	.LASF51
	.byte	0xb
	.byte	0x28
	.byte	0x10
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF52
	.byte	0xb
	.byte	0x28
	.byte	0x25
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF53
	.byte	0xb
	.byte	0x29
	.byte	0x10
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF54
	.byte	0xb
	.byte	0x3e
	.byte	0x12
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF55
	.byte	0xb
	.byte	0x3f
	.byte	0x10
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF56
	.byte	0xb
	.byte	0x40
	.byte	0xe
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF57
	.byte	0xb
	.byte	0x42
	.byte	0xc
	.4byte	0x39
	.byte	0x11
	.4byte	0x2f7
	.4byte	0x362
	.byte	0x14
	.4byte	0xb6
	.byte	0x31
	.byte	0
	.byte	0x15
	.4byte	.LASF58
	.byte	0xb
	.byte	0x43
	.byte	0x8
	.4byte	0x352
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0x15
	.4byte	.LASF59
	.byte	0xb
	.byte	0x44
	.byte	0x5
	.4byte	0x39
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0x15
	.4byte	.LASF60
	.byte	0xb
	.byte	0x45
	.byte	0x8
	.4byte	0x2f7
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0xa
	.4byte	.LASF61
	.byte	0xb
	.byte	0x46
	.byte	0xf
	.4byte	0x2f7
	.byte	0xa
	.4byte	.LASF62
	.byte	0xb
	.byte	0x4a
	.byte	0x13
	.4byte	0x1c9
	.byte	0xa
	.4byte	.LASF63
	.byte	0xc
	.byte	0x31
	.byte	0xf
	.4byte	0x3c8
	.byte	0x9
	.byte	0x8
	.4byte	0x239
	.byte	0xa
	.4byte	.LASF64
	.byte	0xc
	.byte	0x31
	.byte	0x22
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF65
	.byte	0xc
	.byte	0x32
	.byte	0xf
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF66
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF67
	.byte	0xd
	.byte	0x18
	.byte	0x13
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF68
	.byte	0xd
	.byte	0x18
	.byte	0x2c
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF69
	.byte	0xd
	.byte	0x19
	.byte	0x13
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF70
	.byte	0xd
	.byte	0x19
	.byte	0x24
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF71
	.byte	0xd
	.byte	0x1a
	.byte	0x13
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF72
	.byte	0xd
	.byte	0x1b
	.byte	0x10
	.4byte	0x1b1
	.byte	0xa
	.4byte	.LASF73
	.byte	0xd
	.byte	0x1c
	.byte	0xc
	.4byte	0x39
	.byte	0xa
	.4byte	.LASF74
	.byte	0xd
	.byte	0x1d
	.byte	0xf
	.4byte	0x2f7
	.byte	0x5
	.4byte	.LASF75
	.byte	0x38
	.byte	0xd
	.byte	0x29
	.byte	0x8
	.4byte	0x4bb
	.byte	0x6
	.4byte	.LASF76
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x4bb
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x4bb
	.byte	0x8
	.byte	0x6
	.4byte	.LASF77
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x4bb
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x4bb
	.byte	0x18
	.byte	0x6
	.4byte	.LASF78
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x4bb
	.byte	0x20
	.byte	0x6
	.4byte	.LASF79
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x1b1
	.byte	0x28
	.byte	0x6
	.4byte	.LASF80
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x1b1
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF75
	.byte	0xd
	.byte	0x2a
	.byte	0x22
	.4byte	0x452
	.byte	0x5
	.4byte	.LASF81
	.byte	0x10
	.byte	0xd
	.byte	0x2c
	.byte	0x8
	.4byte	0x4f5
	.byte	0x6
	.4byte	.LASF82
	.byte	0xd
	.byte	0x2d
	.byte	0x9
	.4byte	0x239
	.byte	0
	.byte	0x6
	.4byte	.LASF83
	.byte	0xd
	.byte	0x2e
	.byte	0xc
	.4byte	0x251
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF84
	.byte	0x38
	.byte	0xd
	.byte	0x31
	.byte	0x8
	.4byte	0x55e
	.byte	0x6
	.4byte	.LASF76
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x55e
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x55e
	.byte	0x8
	.byte	0x6
	.4byte	.LASF77
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x55e
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x55e
	.byte	0x18
	.byte	0x6
	.4byte	.LASF78
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x55e
	.byte	0x20
	.byte	0x6
	.4byte	.LASF79
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x1b1
	.byte	0x28
	.byte	0x6
	.4byte	.LASF80
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x1b1
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x4cd
	.byte	0xa
	.4byte	.LASF84
	.byte	0xd
	.byte	0x32
	.byte	0x27
	.4byte	0x4f5
	.byte	0x5
	.4byte	.LASF85
	.byte	0x18
	.byte	0xd
	.byte	0x34
	.byte	0x8
	.4byte	0x5a5
	.byte	0x6
	.4byte	.LASF86
	.byte	0xd
	.byte	0x35
	.byte	0x9
	.4byte	0x239
	.byte	0
	.byte	0x13
	.string	"mem"
	.byte	0xd
	.byte	0x36
	.byte	0xc
	.4byte	0x251
	.byte	0x8
	.byte	0x13
	.string	"max"
	.byte	0xd
	.byte	0x37
	.byte	0xc
	.4byte	0x251
	.byte	0x10
	.byte	0
	.byte	0x5
	.4byte	.LASF87
	.byte	0x38
	.byte	0xd
	.byte	0x3a
	.byte	0x8
	.4byte	0x60e
	.byte	0x6
	.4byte	.LASF76
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x60e
	.byte	0
	.byte	0x13
	.string	"end"
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x60e
	.byte	0x8
	.byte	0x6
	.4byte	.LASF77
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x60e
	.byte	0x10
	.byte	0x13
	.string	"ptr"
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x60e
	.byte	0x18
	.byte	0x6
	.4byte	.LASF78
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x60e
	.byte	0x20
	.byte	0x6
	.4byte	.LASF79
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x1b1
	.byte	0x28
	.byte	0x6
	.4byte	.LASF80
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x1b1
	.byte	0x30
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x570
	.byte	0xa
	.4byte	.LASF87
	.byte	0xd
	.byte	0x3b
	.byte	0x25
	.4byte	0x5a5
	.byte	0xa
	.4byte	.LASF88
	.byte	0xe
	.byte	0x3f
	.byte	0x10
	.4byte	0x39
	.byte	0xa
	.4byte	.LASF89
	.byte	0xe
	.byte	0xb7
	.byte	0x10
	.4byte	0x1a5
	.byte	0x5
	.4byte	.LASF90
	.byte	0x40
	.byte	0xe
	.byte	0xf3
	.byte	0x8
	.4byte	0x67a
	.byte	0x6
	.4byte	.LASF91
	.byte	0xe
	.byte	0xf4
	.byte	0x1d
	.4byte	0x67a
	.byte	0
	.byte	0x6
	.4byte	.LASF92
	.byte	0xe
	.byte	0xf5
	.byte	0xa
	.4byte	0x194
	.byte	0x8
	.byte	0x6
	.4byte	.LASF93
	.byte	0xe
	.byte	0xf6
	.byte	0xa
	.4byte	0x194
	.byte	0x10
	.byte	0x6
	.4byte	.LASF94
	.byte	0xe
	.byte	0xf7
	.byte	0xa
	.4byte	0x680
	.byte	0x18
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x638
	.byte	0x11
	.4byte	0x3c8
	.4byte	0x690
	.byte	0x14
	.4byte	0xb6
	.byte	0x4
	.byte	0
	.byte	0xa
	.4byte	.LASF95
	.byte	0xe
	.byte	0xfa
	.byte	0x26
	.4byte	0x67a
	.byte	0xa
	.4byte	.LASF96
	.byte	0xf
	.byte	0x1e
	.byte	0x1c
	.4byte	0x1a0
	.byte	0x11
	.4byte	0x1a0
	.4byte	0x6b3
	.byte	0x12
	.byte	0
	.byte	0x4
	.4byte	0x6a8
	.byte	0xa
	.4byte	.LASF97
	.byte	0xf
	.byte	0x1f
	.byte	0x1c
	.4byte	0x6b3
	.byte	0xa
	.4byte	.LASF98
	.byte	0xf
	.byte	0x20
	.byte	0x19
	.4byte	0x40
	.byte	0xa
	.4byte	.LASF99
	.byte	0xf
	.byte	0x21
	.byte	0x15
	.4byte	0x40
	.byte	0xa
	.4byte	.LASF100
	.byte	0xf
	.byte	0x22
	.byte	0x15
	.4byte	0x40
	.byte	0xa
	.4byte	.LASF101
	.byte	0xf
	.byte	0x2e
	.byte	0x13
	.4byte	0x1c9
	.byte	0xa
	.4byte	.LASF102
	.byte	0xf
	.byte	0x2f
	.byte	0x13
	.4byte	0x1c9
	.byte	0x16
	.4byte	0x39
	.byte	0xa
	.4byte	.LASF103
	.byte	0xf
	.byte	0x30
	.byte	0x12
	.4byte	0x711
	.byte	0x9
	.byte	0x8
	.4byte	0x700
	.byte	0xa
	.4byte	.LASF104
	.byte	0xf
	.byte	0x31
	.byte	0x1d
	.4byte	0x1cf
	.byte	0x17
	.byte	0x10
	.byte	0x10
	.byte	0x5b
	.byte	0x9
	.4byte	0x761
	.byte	0x6
	.4byte	.LASF105
	.byte	0x10
	.byte	0x5c
	.byte	0xb
	.4byte	0x1a5
	.byte	0
	.byte	0x6
	.4byte	.LASF106
	.byte	0x10
	.byte	0x5d
	.byte	0x12
	.4byte	0x18d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF107
	.byte	0x10
	.byte	0x5e
	.byte	0x12
	.4byte	0x18d
	.byte	0xa
	.byte	0x6
	.4byte	.LASF108
	.byte	0x10
	.byte	0x5f
	.byte	0x12
	.4byte	0x761
	.byte	0xc
	.byte	0
	.byte	0x11
	.4byte	0x18d
	.4byte	0x771
	.byte	0x14
	.4byte	0xb6
	.byte	0
	.byte	0
	.byte	0x2
	.4byte	.LASF109
	.byte	0x10
	.byte	0x60
	.byte	0x3
	.4byte	0x723
	.byte	0xa
	.4byte	.LASF110
	.byte	0x10
	.byte	0x64
	.byte	0x17
	.4byte	0x789
	.byte	0x9
	.byte	0x8
	.4byte	0x78f
	.byte	0x9
	.byte	0x8
	.4byte	0x771
	.byte	0xa
	.4byte	.LASF111
	.byte	0x10
	.byte	0x65
	.byte	0xc
	.4byte	0x39
	.byte	0x16
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF112
	.byte	0x10
	.byte	0x70
	.byte	0x12
	.4byte	0x7b2
	.byte	0x9
	.byte	0x8
	.4byte	0x7a1
	.byte	0xa
	.4byte	.LASF113
	.byte	0x10
	.byte	0x73
	.byte	0xf
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF114
	.byte	0x10
	.byte	0x74
	.byte	0xf
	.4byte	0x137
	.byte	0xa
	.4byte	.LASF115
	.byte	0x10
	.byte	0x75
	.byte	0x10
	.4byte	0x1a5
	.byte	0xa
	.4byte	.LASF116
	.byte	0x10
	.byte	0x76
	.byte	0x10
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF117
	.byte	0x10
	.byte	0x77
	.byte	0xf
	.4byte	0x137
	.byte	0x11
	.4byte	0x3c8
	.4byte	0x7ff
	.byte	0x12
	.byte	0
	.byte	0xa
	.4byte	.LASF118
	.byte	0x10
	.byte	0x78
	.byte	0x10
	.4byte	0x7f4
	.byte	0x11
	.4byte	0x125
	.4byte	0x816
	.byte	0x12
	.byte	0
	.byte	0xa
	.4byte	.LASF119
	.byte	0x10
	.byte	0x79
	.byte	0xd
	.4byte	0x80b
	.byte	0xa
	.4byte	.LASF120
	.byte	0x10
	.byte	0x7a
	.byte	0xf
	.4byte	0x194
	.byte	0x11
	.4byte	0x839
	.4byte	0x839
	.byte	0x12
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x194
	.byte	0xa
	.4byte	.LASF121
	.byte	0x10
	.byte	0x7b
	.byte	0x11
	.4byte	0x82e
	.byte	0x2
	.4byte	.LASF122
	.byte	0x11
	.byte	0x24
	.byte	0xe
	.4byte	0xa3
	.byte	0x18
	.4byte	.LASF123
	.4byte	0x10058
	.byte	0x11
	.byte	0x27
	.byte	0x8
	.4byte	0x920
	.byte	0x13
	.string	"fd"
	.byte	0x11
	.byte	0x28
	.byte	0x7
	.4byte	0x39
	.byte	0
	.byte	0x6
	.4byte	.LASF83
	.byte	0x11
	.byte	0x29
	.byte	0xf
	.4byte	0x84b
	.byte	0x8
	.byte	0x13
	.string	"end"
	.byte	0x11
	.byte	0x2a
	.byte	0xa
	.4byte	0x137
	.byte	0x10
	.byte	0x6
	.4byte	.LASF124
	.byte	0x11
	.byte	0x2b
	.byte	0xa
	.4byte	0x137
	.byte	0x18
	.byte	0x13
	.string	"max"
	.byte	0x11
	.byte	0x2c
	.byte	0xa
	.4byte	0x137
	.byte	0x20
	.byte	0x6
	.4byte	.LASF125
	.byte	0x11
	.byte	0x2d
	.byte	0xa
	.4byte	0x21d
	.byte	0x28
	.byte	0x6
	.4byte	.LASF91
	.byte	0x11
	.byte	0x2e
	.byte	0x14
	.4byte	0x920
	.byte	0x30
	.byte	0x6
	.4byte	.LASF126
	.byte	0x11
	.byte	0x2e
	.byte	0x1c
	.4byte	0x920
	.byte	0x38
	.byte	0x6
	.4byte	.LASF127
	.byte	0x11
	.byte	0x2f
	.byte	0x7
	.4byte	0x39
	.byte	0x40
	.byte	0x6
	.4byte	.LASF128
	.byte	0x11
	.byte	0x30
	.byte	0x7
	.4byte	0x39
	.byte	0x44
	.byte	0x6
	.4byte	.LASF129
	.byte	0x11
	.byte	0x31
	.byte	0x7
	.4byte	0x39
	.byte	0x48
	.byte	0x6
	.4byte	.LASF130
	.byte	0x11
	.byte	0x32
	.byte	0x7
	.4byte	0x39
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF131
	.byte	0x11
	.byte	0x33
	.byte	0x8
	.4byte	0x926
	.byte	0x50
	.byte	0x19
	.4byte	.LASF132
	.byte	0x11
	.byte	0x34
	.byte	0xa
	.4byte	0x137
	.4byte	0x10050
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x857
	.byte	0x11
	.4byte	0x125
	.4byte	0x937
	.byte	0x1a
	.4byte	0xb6
	.2byte	0xffff
	.byte	0
	.byte	0x7
	.4byte	0x942
	.byte	0x8
	.4byte	0x920
	.byte	0
	.byte	0xa
	.4byte	.LASF133
	.byte	0x11
	.byte	0x69
	.byte	0x13
	.4byte	0x94e
	.byte	0x9
	.byte	0x8
	.4byte	0x937
	.byte	0xa
	.4byte	.LASF134
	.byte	0x11
	.byte	0x6a
	.byte	0x13
	.4byte	0x94e
	.byte	0xa
	.4byte	.LASF135
	.byte	0x11
	.byte	0x6b
	.byte	0x13
	.4byte	0x94e
	.byte	0xa
	.4byte	.LASF136
	.byte	0x11
	.byte	0x6c
	.byte	0x13
	.4byte	0x1c9
	.byte	0xa
	.4byte	.LASF137
	.byte	0x11
	.byte	0x6e
	.byte	0x1d
	.4byte	0x920
	.byte	0x17
	.byte	0x18
	.byte	0x12
	.byte	0x79
	.byte	0x9
	.4byte	0x9b5
	.byte	0x6
	.4byte	.LASF138
	.byte	0x12
	.byte	0x7d
	.byte	0x9
	.4byte	0x239
	.byte	0
	.byte	0x6
	.4byte	.LASF139
	.byte	0x12
	.byte	0x7e
	.byte	0x9
	.4byte	0x239
	.byte	0x8
	.byte	0x6
	.4byte	.LASF91
	.byte	0x12
	.byte	0x82
	.byte	0x9
	.4byte	0x239
	.byte	0x10
	.byte	0
	.byte	0x2
	.4byte	.LASF140
	.byte	0x12
	.byte	0x83
	.byte	0x3
	.4byte	0x984
	.byte	0x5
	.4byte	.LASF141
	.byte	0x10
	.byte	0x12
	.byte	0x96
	.byte	0x10
	.4byte	0x9e9
	.byte	0x6
	.4byte	.LASF142
	.byte	0x12
	.byte	0x97
	.byte	0xd
	.4byte	0x9e9
	.byte	0
	.byte	0x6
	.4byte	.LASF91
	.byte	0x12
	.byte	0x98
	.byte	0x17
	.4byte	0x9ef
	.byte	0x8
	.byte	0
	.byte	0x9
	.byte	0x8
	.4byte	0x17a
	.byte	0x9
	.byte	0x8
	.4byte	0x9c1
	.byte	0x2
	.4byte	.LASF141
	.byte	0x12
	.byte	0x99
	.byte	0x3
	.4byte	0x9c1
	.byte	0xa
	.4byte	.LASF143
	.byte	0x12
	.byte	0x9b
	.byte	0x13
	.4byte	0xa0d
	.byte	0x9
	.byte	0x8
	.4byte	0x9e9
	.byte	0xa
	.4byte	.LASF144
	.byte	0x12
	.byte	0x9c
	.byte	0x15
	.4byte	0xa1f
	.byte	0x9
	.byte	0x8
	.4byte	0x9f5
	.byte	0xa
	.4byte	.LASF145
	.byte	0x12
	.byte	0xa0
	.byte	0xe
	.4byte	0x239
	.byte	0xa
	.4byte	.LASF146
	.byte	0x12
	.byte	0xa1
	.byte	0xf
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF147
	.byte	0x12
	.byte	0xa2
	.byte	0xf
	.4byte	0x3c8
	.byte	0xa
	.4byte	.LASF148
	.byte	0x12
	.byte	0xa4
	.byte	0x1a
	.4byte	0xa55
	.byte	0x9
	.byte	0x8
	.4byte	0x9b5
	.byte	0x2
	.4byte	.LASF149
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.4byte	0x91
	.byte	0xa
	.4byte	.LASF150
	.byte	0x1
	.byte	0x35
	.byte	0xd
	.4byte	0x125
	.byte	0xa
	.4byte	.LASF151
	.byte	0x1
	.byte	0x35
	.byte	0x26
	.4byte	0x125
	.byte	0x1b
	.4byte	.LASF166
	.byte	0x1
	.byte	0xfa
	.byte	0x6
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.byte	0x1c
	.4byte	.LASF167
	.byte	0x1
	.byte	0x73
	.byte	0x5
	.4byte	0x39
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xb42
	.byte	0x1d
	.4byte	.LASF152
	.byte	0x1
	.byte	0x73
	.byte	0x20
	.4byte	0x39
	.4byte	.LLST2
	.byte	0x1d
	.4byte	.LASF153
	.byte	0x1
	.byte	0x73
	.byte	0x2b
	.4byte	0x39
	.4byte	.LLST3
	.byte	0x1e
	.4byte	.LASF154
	.byte	0x1
	.byte	0x75
	.byte	0x12
	.4byte	0xa5b
	.4byte	.LLST4
	.byte	0x1f
	.4byte	.LASF155
	.byte	0x1
	.byte	0x77
	.byte	0x14
	.4byte	0x51
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1f
	.4byte	.LASF156
	.byte	0x1
	.byte	0x77
	.byte	0x1c
	.4byte	0x51
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x20
	.8byte	.LVL12
	.4byte	0xbeb
	.4byte	0xb21
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.8byte	.LVL13
	.4byte	0xbf7
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF168
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0xbb2
	.byte	0x24
	.string	"sig"
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.4byte	0x39
	.4byte	.LLST0
	.byte	0x1e
	.4byte	.LASF157
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	0x39
	.4byte	.LLST1
	.byte	0x20
	.8byte	.LVL3
	.4byte	0xc03
	.4byte	0xb9d
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x22
	.8byte	.LVL7
	.4byte	0xc0f
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x25
	.4byte	.LASF169
	.byte	0x1
	.byte	0x49
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0xbeb
	.byte	0x26
	.8byte	.LVL8
	.4byte	0xc1b
	.byte	0x26
	.8byte	.LVL9
	.4byte	0xc27
	.byte	0
	.byte	0x27
	.4byte	.LASF158
	.4byte	.LASF158
	.byte	0x2
	.byte	0x11
	.byte	0x5
	.byte	0x27
	.4byte	.LASF10
	.4byte	.LASF10
	.byte	0x2
	.byte	0xd
	.byte	0x5
	.byte	0x27
	.4byte	.LASF159
	.4byte	.LASF159
	.byte	0xf
	.byte	0x28
	.byte	0x6
	.byte	0x27
	.4byte	.LASF160
	.4byte	.LASF160
	.byte	0xf
	.byte	0x29
	.byte	0x6
	.byte	0x27
	.4byte	.LASF161
	.4byte	.LASF161
	.byte	0xd
	.byte	0x3f
	.byte	0x11
	.byte	0x27
	.4byte	.LASF162
	.4byte	.LASF162
	.byte	0xf
	.byte	0x2a
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
	.byte	0x4
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x13
	.byte	0x1
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
	.byte	0x18
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x6
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
	.byte	0x19
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
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
.LLST2:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL11-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL12-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL12-1-.Ltext0
	.8byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	.LVL16-.Ltext0
	.8byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL14-.Ltext0
	.8byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL17-.Ltext0
	.8byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL2-1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL2-1-.Ltext0
	.8byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL1-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL6-.Ltext0
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
.LASF139:
	.string	"count"
.LASF74:
	.string	"caml_extra_heap_resources_minor"
.LASF149:
	.string	"signal_handler"
.LASF6:
	.string	"size_t"
.LASF73:
	.string	"caml_in_minor_collection"
.LASF93:
	.string	"nitems"
.LASF54:
	.string	"caml_heap_start"
.LASF22:
	.string	"uint64_t"
.LASF142:
	.string	"table"
.LASF114:
	.string	"caml_bottom_of_stack"
.LASF36:
	.string	"caml_runtime_warnings"
.LASF126:
	.string	"prev"
.LASF4:
	.string	"sa_flags"
.LASF60:
	.string	"caml_major_work_credit"
.LASF38:
	.string	"header_t"
.LASF14:
	.string	"wend"
.LASF148:
	.string	"caml_all_allocation_points"
.LASF0:
	.string	"sigjmp_buf"
.LASF78:
	.string	"limit"
.LASF101:
	.string	"caml_enter_blocking_section_hook"
.LASF91:
	.string	"next"
.LASF120:
	.string	"caml_globals_inited"
.LASF105:
	.string	"retaddr"
.LASF64:
	.string	"caml_young_end"
.LASF61:
	.string	"caml_gc_clock"
.LASF28:
	.string	"caml_timing_hook"
.LASF8:
	.string	"long long int"
.LASF53:
	.string	"caml_fl_wsz_at_phase_change"
.LASF131:
	.string	"buff"
.LASF118:
	.string	"caml_globals"
.LASF57:
	.string	"caml_major_window"
.LASF146:
	.string	"caml_spacetime_trie_node_ptr"
.LASF107:
	.string	"num_live"
.LASF5:
	.string	"long int"
.LASF97:
	.string	"caml_pending_signals"
.LASF41:
	.string	"caml_global_data"
.LASF20:
	.string	"stdin"
.LASF98:
	.string	"caml_something_to_do"
.LASF50:
	.string	"double"
.LASF48:
	.string	"caml_allocated_words"
.LASF109:
	.string	"frame_descr"
.LASF13:
	.string	"wpos"
.LASF94:
	.string	"tables"
.LASF141:
	.string	"shape_table"
.LASF157:
	.string	"saved_errno"
.LASF113:
	.string	"caml_top_of_stack"
.LASF104:
	.string	"caml_async_action_hook"
.LASF1:
	.string	"sigset_t"
.LASF35:
	.string	"caml_verb_gc"
.LASF72:
	.string	"caml_minor_heap_wsz"
.LASF55:
	.string	"total_heap_size"
.LASF133:
	.string	"caml_channel_mutex_free"
.LASF58:
	.string	"caml_major_ring"
.LASF37:
	.string	"value"
.LASF67:
	.string	"caml_young_alloc_start"
.LASF168:
	.string	"handle_signal"
.LASF86:
	.string	"block"
.LASF21:
	.string	"unsigned int"
.LASF45:
	.string	"caml_fl_cur_wsz"
.LASF134:
	.string	"caml_channel_mutex_lock"
.LASF68:
	.string	"caml_young_alloc_end"
.LASF25:
	.string	"intnat"
.LASF136:
	.string	"caml_channel_mutex_unlock_exn"
.LASF7:
	.string	"long unsigned int"
.LASF108:
	.string	"live_ofs"
.LASF39:
	.string	"mlsize_t"
.LASF132:
	.string	"name"
.LASF11:
	.string	"_FILE"
.LASF79:
	.string	"size"
.LASF24:
	.string	"short unsigned int"
.LASF26:
	.string	"uintnat"
.LASF163:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF85:
	.string	"caml_custom_elt"
.LASF62:
	.string	"caml_major_gc_hook"
.LASF99:
	.string	"caml_requested_major_slice"
.LASF152:
	.string	"signo"
.LASF167:
	.string	"caml_set_signal_action"
.LASF145:
	.string	"caml_spacetime_trie_root"
.LASF111:
	.string	"caml_frame_descriptors_mask"
.LASF18:
	.string	"stdout"
.LASF17:
	.string	"errno"
.LASF158:
	.string	"sigemptyset"
.LASF162:
	.string	"caml_process_pending_signals"
.LASF12:
	.string	"write"
.LASF112:
	.string	"caml_stack_usage_hook"
.LASF59:
	.string	"caml_major_ring_index"
.LASF27:
	.string	"asize_t"
.LASF143:
	.string	"caml_spacetime_static_shape_tables"
.LASF9:
	.string	"long double"
.LASF164:
	.string	"signals_asm.c"
.LASF153:
	.string	"action"
.LASF52:
	.string	"caml_dependent_allocated"
.LASF88:
	.string	"caml_huge_fallback_count"
.LASF96:
	.string	"caml_signals_are_pending"
.LASF95:
	.string	"caml_local_roots"
.LASF150:
	.string	"caml_system__code_begin"
.LASF119:
	.string	"caml_globals_map"
.LASF84:
	.string	"caml_ephe_ref_table"
.LASF10:
	.string	"sigaction"
.LASF155:
	.string	"sigact"
.LASF32:
	.string	"caml_minor_gc_end_hook"
.LASF161:
	.string	"caml_gc_dispatch"
.LASF144:
	.string	"caml_spacetime_dynamic_shape_tables"
.LASF156:
	.string	"oldsigact"
.LASF63:
	.string	"caml_young_start"
.LASF29:
	.string	"caml_major_slice_begin_hook"
.LASF76:
	.string	"base"
.LASF125:
	.string	"mutex"
.LASF77:
	.string	"threshold"
.LASF31:
	.string	"caml_minor_gc_begin_hook"
.LASF147:
	.string	"caml_spacetime_finaliser_trie_root"
.LASF127:
	.string	"revealed"
.LASF33:
	.string	"caml_finalise_begin_hook"
.LASF23:
	.string	"short int"
.LASF115:
	.string	"caml_last_return_address"
.LASF81:
	.string	"caml_ephe_ref_elt"
.LASF106:
	.string	"frame_size"
.LASF124:
	.string	"curr"
.LASF159:
	.string	"caml_execute_signal"
.LASF166:
	.string	"caml_init_signals"
.LASF16:
	.string	"FILE"
.LASF123:
	.string	"channel"
.LASF103:
	.string	"caml_try_leave_blocking_section_hook"
.LASF87:
	.string	"caml_custom_table"
.LASF110:
	.string	"caml_frame_descriptors"
.LASF121:
	.string	"caml_frametable"
.LASF160:
	.string	"caml_record_signal"
.LASF92:
	.string	"ntables"
.LASF56:
	.string	"caml_gc_sweep_hp"
.LASF102:
	.string	"caml_leave_blocking_section_hook"
.LASF65:
	.string	"caml_code_area_start"
.LASF44:
	.string	"caml_exn_bucket"
.LASF15:
	.string	"char"
.LASF135:
	.string	"caml_channel_mutex_unlock"
.LASF43:
	.string	"caml_external_raise"
.LASF40:
	.string	"caml_atom_table"
.LASF154:
	.string	"oldact"
.LASF117:
	.string	"caml_exception_pointer"
.LASF83:
	.string	"offset"
.LASF100:
	.string	"caml_requested_minor_gc"
.LASF3:
	.string	"sa_mask"
.LASF138:
	.string	"profinfo"
.LASF169:
	.string	"caml_garbage_collection"
.LASF140:
	.string	"allocation_point"
.LASF70:
	.string	"caml_young_limit"
.LASF19:
	.string	"stderr"
.LASF151:
	.string	"caml_system__code_end"
.LASF80:
	.string	"reserve"
.LASF71:
	.string	"caml_young_trigger"
.LASF89:
	.string	"caml_use_huge_pages"
.LASF66:
	.string	"caml_code_area_end"
.LASF130:
	.string	"flags"
.LASF137:
	.string	"caml_all_opened_channels"
.LASF165:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF2:
	.string	"sa_handler"
.LASF128:
	.string	"old_revealed"
.LASF51:
	.string	"caml_dependent_size"
.LASF49:
	.string	"caml_extra_heap_resources"
.LASF116:
	.string	"caml_gc_regs"
.LASF122:
	.string	"file_offset"
.LASF69:
	.string	"caml_young_ptr"
.LASF34:
	.string	"caml_finalise_end_hook"
.LASF129:
	.string	"refcount"
.LASF30:
	.string	"caml_major_slice_end_hook"
.LASF46:
	.string	"caml_gc_phase"
.LASF90:
	.string	"caml__roots_block"
.LASF75:
	.string	"caml_ref_table"
.LASF82:
	.string	"ephe"
.LASF42:
	.string	"longjmp_buffer"
.LASF47:
	.string	"caml_gc_subphase"
	.ident	"GCC: (GNU) 9.2.0"
