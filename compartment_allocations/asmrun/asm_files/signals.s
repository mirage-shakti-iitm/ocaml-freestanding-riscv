	.file	"signals.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.type	caml_enter_blocking_section_default, @function
caml_enter_blocking_section_default:
.LFB14:
	.file 1 "signals.c"
	.loc 1 87 1
	.cfi_startproc
	.loc 1 88 3
	.loc 1 89 3
	.loc 1 89 26 is_stmt 0
	li	a5,1
	sd	a5,caml_async_signal_mode,a4
	.loc 1 90 1
	ret
	.cfi_endproc
.LFE14:
	.size	caml_enter_blocking_section_default, .-caml_enter_blocking_section_default
	.align	1
	.type	caml_leave_blocking_section_default, @function
caml_leave_blocking_section_default:
.LFB15:
	.loc 1 93 1 is_stmt 1
	.cfi_startproc
	.loc 1 94 3
	.loc 1 95 3
	.loc 1 95 26 is_stmt 0
	sd	zero,caml_async_signal_mode,a5
	.loc 1 96 1
	ret
	.cfi_endproc
.LFE15:
	.size	caml_leave_blocking_section_default, .-caml_leave_blocking_section_default
	.align	1
	.type	caml_try_leave_blocking_section_default, @function
caml_try_leave_blocking_section_default:
.LFB16:
	.loc 1 99 1 is_stmt 1
	.cfi_startproc
	.loc 1 100 3
	.loc 1 101 3
	lla	a5,caml_async_signal_mode
	li	a0,0
	fence iorw,ow; amoswap.d.aq a0,a0,0(a5)
.LVL0:
	.loc 1 102 3
	.loc 1 103 1 is_stmt 0
	sext.w	a0,a0
.LVL1:
	ret
	.cfi_endproc
.LFE16:
	.size	caml_try_leave_blocking_section_default, .-caml_try_leave_blocking_section_default
	.align	1
	.globl	caml_record_signal
	.type	caml_record_signal, @function
caml_record_signal:
.LFB13:
	.loc 1 72 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 73 3
	.loc 1 73 39 is_stmt 0
	slli	a5,a0,3
	lla	a0,caml_pending_signals
.LVL3:
	add	a0,a0,a5
	li	a5,1
	sd	a5,0(a0)
	.loc 1 74 3 is_stmt 1
	.loc 1 74 28 is_stmt 0
	sd	a5,caml_signals_are_pending,a4
	.loc 1 78 3 is_stmt 1
	.loc 1 78 20 is_stmt 0
	ld	a5,caml_young_alloc_end
	sd	a5,caml_young_limit,a4
	.loc 1 80 1
	ret
	.cfi_endproc
.LFE13:
	.size	caml_record_signal, .-caml_record_signal
	.align	1
	.globl	caml_request_major_slice
	.type	caml_request_major_slice, @function
caml_request_major_slice:
.LFB20:
	.loc 1 203 1 is_stmt 1
	.cfi_startproc
	.loc 1 204 3
	.loc 1 204 30 is_stmt 0
	li	a5,1
	sw	a5,caml_requested_major_slice,a4
	.loc 1 208 3 is_stmt 1
	.loc 1 208 20 is_stmt 0
	ld	a5,caml_young_alloc_end
	sd	a5,caml_young_limit,a4
	.loc 1 214 1
	ret
	.cfi_endproc
.LFE20:
	.size	caml_request_major_slice, .-caml_request_major_slice
	.align	1
	.globl	caml_request_minor_gc
	.type	caml_request_minor_gc, @function
caml_request_minor_gc:
.LFB21:
	.loc 1 217 1 is_stmt 1
	.cfi_startproc
	.loc 1 218 3
	.loc 1 218 27 is_stmt 0
	li	a5,1
	sw	a5,caml_requested_minor_gc,a4
	.loc 1 222 3 is_stmt 1
	.loc 1 222 20 is_stmt 0
	ld	a5,caml_young_alloc_end
	sd	a5,caml_young_limit,a4
	.loc 1 225 1
	ret
	.cfi_endproc
.LFE21:
	.size	caml_request_minor_gc, .-caml_request_minor_gc
	.align	1
	.globl	caml_convert_signal_number
	.type	caml_convert_signal_number, @function
caml_convert_signal_number:
.LFB22:
	.loc 1 322 1 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 323 3
	.loc 1 323 6 is_stmt 0
	bge	a0,zero,.L8
	.loc 1 323 26 discriminator 1
	sext.w	a5,a0
	.loc 1 323 17 discriminator 1
	li	a4,-29
	bleu	a5,a4,.L8
	.loc 1 324 5 is_stmt 1
	.loc 1 324 32 is_stmt 0
	not	a0,a0
.LVL5:
	.loc 1 324 25
	slli	a0,a0,2
	lla	a5,.LANCHOR0
.LVL6:
	add	a0,a5,a0
	lw	a0,0(a0)
.L8:
	.loc 1 327 1
	ret
	.cfi_endproc
.LFE22:
	.size	caml_convert_signal_number, .-caml_convert_signal_number
	.align	1
	.globl	caml_rev_convert_signal_number
	.type	caml_rev_convert_signal_number, @function
caml_rev_convert_signal_number:
.LFB23:
	.loc 1 330 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 331 3
	.loc 1 332 3
	.loc 1 332 10 is_stmt 0
	li	a4,0
	.loc 1 332 3
	j	.L10
.LVL8:
.L11:
	.loc 1 332 56 is_stmt 1 discriminator 2
	.loc 1 332 57 is_stmt 0 discriminator 2
	addiw	a4,a4,1
.LVL9:
.L10:
	.loc 1 332 15 is_stmt 1 discriminator 1
	.loc 1 332 17 is_stmt 0 discriminator 1
	sext.w	a5,a4
	.loc 1 332 3 discriminator 1
	li	a3,27
	bgtu	a5,a3,.L14
	.loc 1 333 5 is_stmt 1
	.loc 1 333 31 is_stmt 0
	slli	a3,a4,2
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	lw	a5,0(a5)
	.loc 1 333 8
	bne	a5,a0,.L11
	.loc 1 333 36 is_stmt 1 discriminator 1
	.loc 1 333 46 is_stmt 0 discriminator 1
	not	a0,a4
.LVL10:
	ret
.LVL11:
.L14:
	.loc 1 335 1
	ret
	.cfi_endproc
.LFE23:
	.size	caml_rev_convert_signal_number, .-caml_rev_convert_signal_number
	.align	1
	.globl	caml_execute_signal
	.type	caml_execute_signal, @function
caml_execute_signal:
.LFB19:
	.loc 1 140 1 is_stmt 1
	.cfi_startproc
.LVL12:
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	mv	s0,a0
	mv	s2,a1
	.loc 1 141 3
	.loc 1 142 3
	.loc 1 147 3
	.loc 1 150 3
	addi	a0,sp,12
.LVL13:
	call	sigemptyset
.LVL14:
	.loc 1 151 3
	mv	a1,s0
	addi	a0,sp,12
	call	sigaddset
.LVL15:
	.loc 1 152 3
	addi	a2,sp,8
	addi	a1,sp,12
	li	a0,0
	call	sigprocmask
.LVL16:
	.loc 1 174 3
	.loc 1 174 13 is_stmt 0
	slli	a5,s0,3
	ld	a4,caml_signal_handlers
	add	a5,a5,a4
	.loc 1 174 11
	ld	s1,0(a5)
.LVL17:
	.loc 1 176 5 is_stmt 1
	.loc 1 178 14 is_stmt 0
	mv	a0,s0
	call	caml_rev_convert_signal_number
.LVL18:
	slli	a1,a0,1
	.loc 1 176 11
	addi	a1,a1,1
	mv	a0,s1
	call	caml_callback_exn
.LVL19:
	mv	s1,a0
.LVL20:
	.loc 1 185 3 is_stmt 1
	.loc 1 185 6 is_stmt 0
	beq	s2,zero,.L20
	.loc 1 188 10 is_stmt 1
	.loc 1 188 14 is_stmt 0
	andi	a5,a0,3
	.loc 1 188 13
	li	a4,2
	beq	a5,a4,.L21
.L17:
	.loc 1 194 3 is_stmt 1
	.loc 1 194 7 is_stmt 0
	andi	a5,s1,3
	.loc 1 194 6
	li	a4,2
	beq	a5,a4,.L22
	.loc 1 195 1
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.LVL21:
	ld	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL22:
.L20:
	.cfi_restore_state
	.loc 1 187 5 is_stmt 1
	li	a2,0
	addi	a1,sp,8
	li	a0,0
	call	sigprocmask
.LVL23:
	j	.L17
.L21:
	.loc 1 190 5
	mv	a1,s0
	addi	a0,sp,8
	call	sigdelset
.LVL24:
	.loc 1 191 5
	li	a2,0
	addi	a1,sp,8
	li	a0,0
	call	sigprocmask
.LVL25:
	j	.L17
.L22:
	.loc 1 194 33 discriminator 1
	andi	a0,s1,-4
	call	caml_raise
.LVL26:
	.cfi_endproc
.LFE19:
	.size	caml_execute_signal, .-caml_execute_signal
	.align	1
	.globl	caml_process_pending_signals
	.type	caml_process_pending_signals, @function
caml_process_pending_signals:
.LFB12:
	.loc 1 50 1
	.cfi_startproc
	.loc 1 51 3
	.loc 1 53 3
	.loc 1 53 7 is_stmt 0
	ld	a5,caml_signals_are_pending
	.loc 1 53 6
	beq	a5,zero,.L29
	.loc 1 50 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 54 5 is_stmt 1
	.loc 1 54 30 is_stmt 0
	sd	zero,caml_signals_are_pending,a5
	.loc 1 55 5 is_stmt 1
.LVL27:
	.loc 1 55 12 is_stmt 0
	li	s0,0
	.loc 1 55 5
	j	.L25
.LVL28:
.L33:
	.loc 1 57 9 is_stmt 1
	.loc 1 57 33 is_stmt 0
	lla	a5,caml_pending_signals
	add	a5,a5,a4
	sd	zero,0(a5)
	.loc 1 58 9 is_stmt 1
	li	a1,0
	mv	a0,s0
	call	caml_execute_signal
.LVL29:
.L26:
	.loc 1 55 27 discriminator 2
	.loc 1 55 28 is_stmt 0 discriminator 2
	addiw	s0,s0,1
.LVL30:
.L25:
	.loc 1 55 17 is_stmt 1 discriminator 1
	.loc 1 55 5 is_stmt 0 discriminator 1
	li	a5,63
	bgt	s0,a5,.L32
	.loc 1 56 7 is_stmt 1
	.loc 1 56 31 is_stmt 0
	slli	a4,s0,3
	lla	a5,caml_pending_signals
	add	a5,a5,a4
	ld	a5,0(a5)
	.loc 1 56 10
	beq	a5,zero,.L26
	j	.L33
.L32:
	.loc 1 62 1
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
.LVL31:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L29:
	ret
	.cfi_endproc
.LFE12:
	.size	caml_process_pending_signals, .-caml_process_pending_signals
	.align	1
	.globl	caml_enter_blocking_section
	.type	caml_enter_blocking_section, @function
caml_enter_blocking_section:
.LFB17:
	.loc 1 113 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
.L36:
	.loc 1 114 3
	.loc 1 116 5
	call	caml_process_pending_signals
.LVL32:
	.loc 1 117 5
	ld	a5,caml_enter_blocking_section_hook
	jalr	a5
.LVL33:
	.loc 1 120 5
	.loc 1 120 9 is_stmt 0
	ld	a5,caml_signals_are_pending
	.loc 1 120 8
	beq	a5,zero,.L34
	.loc 1 121 5 is_stmt 1
	ld	a5,caml_leave_blocking_section_hook
	jalr	a5
.LVL34:
	.loc 1 114 9
	.loc 1 116 5 is_stmt 0
	j	.L36
.L34:
	.loc 1 123 1
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	caml_enter_blocking_section, .-caml_enter_blocking_section
	.align	1
	.globl	caml_leave_blocking_section
	.type	caml_leave_blocking_section, @function
caml_leave_blocking_section:
.LFB18:
	.loc 1 126 1 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 127 3
	.loc 1 129 3
	.loc 1 129 15 is_stmt 0
	lla	s0,errno
	lw	s1,0(s0)
.LVL35:
	.loc 1 130 3 is_stmt 1
	ld	a5,caml_leave_blocking_section_hook
	jalr	a5
.LVL36:
	.loc 1 131 3
	call	caml_process_pending_signals
.LVL37:
	.loc 1 132 3
	.loc 1 132 9 is_stmt 0
	sw	s1,0(s0)
	.loc 1 133 1
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
.LVL38:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	caml_leave_blocking_section, .-caml_leave_blocking_section
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Sys.signal: unavailable signal"
	.text
	.align	1
	.globl	caml_install_signal_handler
	.type	caml_install_signal_handler, @function
caml_install_signal_handler:
.LFB24:
	.loc 1 340 1 is_stmt 1
	.cfi_startproc
.LVL39:
	addi	sp,sp,-192
	.cfi_def_cfa_offset 192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 341 3
	lla	a4,caml_local_roots
	ld	s1,0(a4)
.LVL40:
	.loc 1 341 3
	.loc 1 341 3
	sd	s1,96(sp)
	li	a5,1
	sd	a5,112(sp)
	li	a3,2
	sd	a3,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	sp,128(sp)
.LVL41:
	.loc 1 342 3
	sd	a5,88(sp)
	.loc 1 342 3
	.loc 1 342 3
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,0(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
.LVL42:
	.loc 1 343 3
	.loc 1 345 3
	.loc 1 345 36 is_stmt 0
	srai	a0,a0,1
.LVL43:
	.loc 1 345 9
	sext.w	a0,a0
	call	caml_convert_signal_number
.LVL44:
	.loc 1 346 3 is_stmt 1
	.loc 1 346 15 is_stmt 0
	sext.w	a4,a0
	.loc 1 346 6
	li	a5,63
	bgtu	a4,a5,.L52
	mv	s0,a0
	.loc 1 348 3 is_stmt 1
	ld	a5,0(sp)
	li	a4,1
	beq	a5,a4,.L49
	li	a4,3
	bne	a5,a4,.L50
	.loc 1 353 9 is_stmt 0
	li	a1,1
.L42:
.LVL45:
	.loc 1 359 3 is_stmt 1
	.loc 1 359 12 is_stmt 0
	mv	a0,s0
.LVL46:
	call	caml_set_signal_action
.LVL47:
	.loc 1 360 3 is_stmt 1
	li	a5,1
	beq	a0,a5,.L43
	li	a5,2
	beq	a0,a5,.L44
	beq	a0,zero,.L53
	.loc 1 387 5
	li	a0,1
.LVL48:
	call	caml_sys_error
.LVL49:
	j	.L46
.LVL50:
.L52:
	.loc 1 347 5
	lla	a0,.LC0
.LVL51:
	call	caml_invalid_argument
.LVL52:
.L49:
	.loc 1 348 3 is_stmt 0
	li	a1,0
	j	.L42
.L50:
	.loc 1 356 9
	li	a1,2
	j	.L42
.LVL53:
.L53:
	.loc 1 362 5 is_stmt 1
	.loc 1 362 9 is_stmt 0
	li	a5,1
	sd	a5,88(sp)
	.loc 1 363 5 is_stmt 1
.LVL54:
.L46:
	.loc 1 389 3
	.loc 1 389 7 is_stmt 0
	ld	a5,0(sp)
	andi	a5,a5,1
	.loc 1 389 6
	bne	a5,zero,.L47
	.loc 1 390 5 is_stmt 1
	.loc 1 390 30 is_stmt 0
	ld	a5,caml_signal_handlers
	.loc 1 390 8
	beq	a5,zero,.L54
.L48:
	.loc 1 394 5 is_stmt 1
	.loc 1 394 18 is_stmt 0
	slli	s0,s0,3
	.loc 1 394 5
	ld	a5,0(sp)
	ld	a1,0(a5)
	ld	a0,caml_signal_handlers
	add	a0,s0,a0
	call	caml_modify
.LVL55:
.L47:
	.loc 1 396 3 is_stmt 1
	call	caml_process_pending_signals
.LVL56:
	.loc 1 397 3
.LBB2:
	.loc 1 397 3
	.loc 1 397 3
	sd	s1,caml_local_roots,a5
	.loc 1 397 3
.LBE2:
	.loc 1 397 3
	.loc 1 398 1 is_stmt 0
	ld	a0,88(sp)
	ld	ra,184(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,176(sp)
	.cfi_restore 8
	ld	s1,168(sp)
	.cfi_restore 9
.LVL57:
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
.LVL58:
	jr	ra
.LVL59:
.L43:
	.cfi_restore_state
	.loc 1 365 5 is_stmt 1
	.loc 1 365 9 is_stmt 0
	li	a5,3
	sd	a5,88(sp)
	.loc 1 366 5 is_stmt 1
	j	.L46
.L44:
	.loc 1 382 5
	.loc 1 382 11 is_stmt 0
	li	a1,0
	li	a0,1
.LVL60:
	call	caml_alloc_small
.LVL61:
	.loc 1 382 9
	sd	a0,88(sp)
	.loc 1 383 5 is_stmt 1
	.loc 1 383 21 is_stmt 0
	slli	a5,s0,3
	ld	a4,caml_signal_handlers
	add	a5,a5,a4
	ld	a5,0(a5)
	.loc 1 383 19
	sd	a5,0(a0)
	.loc 1 385 5 is_stmt 1
	j	.L46
.L54:
	.loc 1 391 7
	.loc 1 391 30 is_stmt 0
	li	a1,0
	li	a0,64
	call	caml_alloc
.LVL62:
	.loc 1 391 28
	lla	a5,caml_signal_handlers
	sd	a0,0(a5)
	.loc 1 392 7 is_stmt 1
	mv	a0,a5
	call	caml_register_global_root
.LVL63:
	j	.L48
	.cfi_endproc
.LFE24:
	.size	caml_install_signal_handler, .-caml_install_signal_handler
	.globl	caml_requested_minor_gc
	.globl	caml_requested_major_slice
	.globl	caml_try_leave_blocking_section_hook
	.globl	caml_leave_blocking_section_hook
	.globl	caml_enter_blocking_section_hook
	.comm	caml_pending_signals,512,8
	.globl	caml_signals_are_pending
	.comm	caml_major_work_credit,8,8
	.comm	caml_major_ring_index,4,4
	.comm	caml_major_ring,400,8
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	posix_signals, @object
	.size	posix_signals, 112
posix_signals:
	.word	-1
	.word	-1
	.word	1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_requested_minor_gc, @object
	.size	caml_requested_minor_gc, 4
caml_requested_minor_gc:
	.zero	4
	.type	caml_requested_major_slice, @object
	.size	caml_requested_major_slice, 4
caml_requested_major_slice:
	.zero	4
	.type	caml_signal_handlers, @object
	.size	caml_signal_handlers, 8
caml_signal_handlers:
	.zero	8
	.type	caml_async_signal_mode, @object
	.size	caml_async_signal_mode, 8
caml_async_signal_mode:
	.zero	8
	.type	caml_signals_are_pending, @object
	.size	caml_signals_are_pending, 8
caml_signals_are_pending:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	caml_try_leave_blocking_section_hook, @object
	.size	caml_try_leave_blocking_section_hook, 8
caml_try_leave_blocking_section_hook:
	.dword	caml_try_leave_blocking_section_default
	.type	caml_leave_blocking_section_hook, @object
	.size	caml_leave_blocking_section_hook, 8
caml_leave_blocking_section_hook:
	.dword	caml_leave_blocking_section_default
	.type	caml_enter_blocking_section_hook, @object
	.size	caml_enter_blocking_section_hook, 8
caml_enter_blocking_section_hook:
	.dword	caml_enter_blocking_section_default
	.text
.Letext0:
	.file 2 "/home/sai/ocaml-freestanding-riscv/nolibc/include/signal.h"
	.file 3 "caml/config.h"
	.file 4 "/home/sai/Shakti-TEE-Build/riscv/lib/gcc/riscv64-unknown-elf/9.2.0/include/stddef.h"
	.file 5 "caml/misc.h"
	.file 6 "/home/sai/ocaml-freestanding-riscv/nolibc/include/errno.h"
	.file 7 "caml/mlvalues.h"
	.file 8 "caml/callback.h"
	.file 9 "caml/fail.h"
	.file 10 "caml/freelist.h"
	.file 11 "caml/major_gc.h"
	.file 12 "caml/address_class.h"
	.file 13 "caml/minor_gc.h"
	.file 14 "caml/memory.h"
	.file 15 "caml/roots.h"
	.file 16 "caml/signals.h"
	.file 17 "caml/sys.h"
	.file 18 "caml/alloc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd56
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF141
	.byte	0xc
	.4byte	.LASF142
	.4byte	.LASF143
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
	.4byte	.LASF15
	.byte	0x6
	.byte	0x4
	.byte	0xc
	.4byte	0x39
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4
	.byte	0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.4byte	.LASF7
	.byte	0x3
	.byte	0x5b
	.byte	0xe
	.4byte	0x64
	.byte	0x4
	.4byte	0x80
	.byte	0x2
	.4byte	.LASF8
	.byte	0x3
	.byte	0x5c
	.byte	0x17
	.4byte	0x6b
	.byte	0x2
	.4byte	.LASF9
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.4byte	0x6b
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x6
	.byte	0x10
	.byte	0x4
	.4byte	.LASF11
	.byte	0x2
	.4byte	.LASF12
	.byte	0x5
	.byte	0x21
	.byte	0x10
	.4byte	0x9d
	.byte	0x7
	.byte	0x8
	.4byte	0xc9
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x5c
	.byte	0x10
	.4byte	0xdc
	.byte	0x7
	.byte	0x8
	.4byte	0xe7
	.byte	0x4
	.4byte	0xdc
	.byte	0x8
	.byte	0x5
	.4byte	.LASF16
	.byte	0x5
	.byte	0x5d
	.byte	0x19
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF17
	.byte	0x5
	.byte	0x5d
	.byte	0x36
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF18
	.byte	0x5
	.byte	0x5e
	.byte	0x19
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF19
	.byte	0x5
	.byte	0x5e
	.byte	0x33
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF20
	.byte	0x5
	.byte	0x5f
	.byte	0x19
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF21
	.byte	0x5
	.byte	0x5f
	.byte	0x33
	.4byte	0xd0
	.byte	0x2
	.4byte	.LASF22
	.byte	0x5
	.byte	0xcc
	.byte	0xe
	.4byte	0xc9
	.byte	0x9
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x169
	.byte	0x10
	.4byte	0x91
	.byte	0x9
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x171
	.byte	0x10
	.4byte	0x91
	.byte	0x2
	.4byte	.LASF25
	.byte	0x7
	.byte	0x3c
	.byte	0x10
	.4byte	0x80
	.byte	0x2
	.4byte	.LASF26
	.byte	0x7
	.byte	0x3d
	.byte	0x11
	.4byte	0x91
	.byte	0x2
	.4byte	.LASF27
	.byte	0x7
	.byte	0x3e
	.byte	0x11
	.4byte	0x91
	.byte	0xa
	.4byte	0x162
	.4byte	0x185
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	.LASF28
	.byte	0x7
	.2byte	0x15c
	.byte	0x15
	.4byte	0x17a
	.byte	0x9
	.4byte	.LASF29
	.byte	0x7
	.2byte	0x171
	.byte	0xe
	.4byte	0x156
	.byte	0x7
	.byte	0x8
	.4byte	0x156
	.byte	0x5
	.4byte	.LASF30
	.byte	0x8
	.byte	0x39
	.byte	0x10
	.4byte	0x39
	.byte	0xc
	.4byte	.LASF63
	.byte	0x4
	.byte	0x9
	.byte	0x2c
	.byte	0x8
	.4byte	0x1cc
	.byte	0xd
	.string	"buf"
	.byte	0x9
	.byte	0x2d
	.byte	0xe
	.4byte	0x2d
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF31
	.byte	0x9
	.byte	0x3e
	.byte	0x24
	.4byte	0x1d8
	.byte	0x7
	.byte	0x8
	.4byte	0x1b1
	.byte	0x5
	.4byte	.LASF32
	.byte	0x9
	.byte	0x3f
	.byte	0xe
	.4byte	0x156
	.byte	0x5
	.4byte	.LASF33
	.byte	0xa
	.byte	0x1a
	.byte	0x10
	.4byte	0xb7
	.byte	0x5
	.4byte	.LASF34
	.byte	0xb
	.byte	0x24
	.byte	0xc
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF35
	.byte	0xb
	.byte	0x25
	.byte	0xc
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF36
	.byte	0xb
	.byte	0x26
	.byte	0x10
	.4byte	0x91
	.byte	0x5
	.4byte	.LASF37
	.byte	0xb
	.byte	0x27
	.byte	0xf
	.4byte	0x226
	.byte	0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF38
	.byte	0x5
	.4byte	.LASF39
	.byte	0xb
	.byte	0x28
	.byte	0x10
	.4byte	0x91
	.byte	0x5
	.4byte	.LASF40
	.byte	0xb
	.byte	0x28
	.byte	0x25
	.4byte	0x91
	.byte	0x5
	.4byte	.LASF41
	.byte	0xb
	.byte	0x29
	.byte	0x10
	.4byte	0x91
	.byte	0x5
	.4byte	.LASF42
	.byte	0xb
	.byte	0x3e
	.byte	0x12
	.4byte	0xc3
	.byte	0x5
	.4byte	.LASF43
	.byte	0xb
	.byte	0x3f
	.byte	0x10
	.4byte	0x91
	.byte	0x5
	.4byte	.LASF44
	.byte	0xb
	.byte	0x40
	.byte	0xe
	.4byte	0xc3
	.byte	0x5
	.4byte	.LASF45
	.byte	0xb
	.byte	0x42
	.byte	0xc
	.4byte	0x39
	.byte	0xa
	.4byte	0x226
	.4byte	0x291
	.byte	0xe
	.4byte	0x6b
	.byte	0x31
	.byte	0
	.byte	0xf
	.4byte	.LASF46
	.byte	0xb
	.byte	0x43
	.byte	0x8
	.4byte	0x281
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring
	.byte	0xf
	.4byte	.LASF47
	.byte	0xb
	.byte	0x44
	.byte	0x5
	.4byte	0x39
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_ring_index
	.byte	0xf
	.4byte	.LASF48
	.byte	0xb
	.byte	0x45
	.byte	0x8
	.4byte	0x226
	.byte	0x9
	.byte	0x3
	.8byte	caml_major_work_credit
	.byte	0x5
	.4byte	.LASF49
	.byte	0xb
	.byte	0x46
	.byte	0xf
	.4byte	0x226
	.byte	0x5
	.4byte	.LASF50
	.byte	0xb
	.byte	0x4a
	.byte	0x13
	.4byte	0xdc
	.byte	0x5
	.4byte	.LASF51
	.byte	0xc
	.byte	0x31
	.byte	0xf
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF52
	.byte	0xc
	.byte	0x31
	.byte	0x22
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF53
	.byte	0xc
	.byte	0x32
	.byte	0xf
	.4byte	0xc3
	.byte	0x5
	.4byte	.LASF54
	.byte	0xc
	.byte	0x32
	.byte	0x27
	.4byte	0xc3
	.byte	0x5
	.4byte	.LASF55
	.byte	0xd
	.byte	0x18
	.byte	0x13
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF56
	.byte	0xd
	.byte	0x18
	.byte	0x2c
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF57
	.byte	0xd
	.byte	0x19
	.byte	0x13
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF58
	.byte	0xd
	.byte	0x19
	.byte	0x24
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF59
	.byte	0xd
	.byte	0x1a
	.byte	0x13
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF60
	.byte	0xd
	.byte	0x1b
	.byte	0x10
	.4byte	0xb7
	.byte	0x5
	.4byte	.LASF61
	.byte	0xd
	.byte	0x1c
	.byte	0xc
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF62
	.byte	0xd
	.byte	0x1d
	.byte	0xf
	.4byte	0x226
	.byte	0xc
	.4byte	.LASF64
	.byte	0x38
	.byte	0xd
	.byte	0x29
	.byte	0x8
	.4byte	0x3e4
	.byte	0x10
	.4byte	.LASF65
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x3e4
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x3e4
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x3e4
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x3e4
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0x3e4
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0xb7
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xd
	.byte	0x29
	.byte	0x17
	.4byte	0xb7
	.byte	0x30
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x19f
	.byte	0x5
	.4byte	.LASF64
	.byte	0xd
	.byte	0x2a
	.byte	0x22
	.4byte	0x37b
	.byte	0xc
	.4byte	.LASF70
	.byte	0x10
	.byte	0xd
	.byte	0x2c
	.byte	0x8
	.4byte	0x41e
	.byte	0x10
	.4byte	.LASF71
	.byte	0xd
	.byte	0x2d
	.byte	0x9
	.4byte	0x156
	.byte	0
	.byte	0x10
	.4byte	.LASF72
	.byte	0xd
	.byte	0x2e
	.byte	0xc
	.4byte	0x16e
	.byte	0x8
	.byte	0
	.byte	0xc
	.4byte	.LASF73
	.byte	0x38
	.byte	0xd
	.byte	0x31
	.byte	0x8
	.4byte	0x487
	.byte	0x10
	.4byte	.LASF65
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x487
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x487
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x487
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x487
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0x487
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0xb7
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xd
	.byte	0x31
	.byte	0x1c
	.4byte	0xb7
	.byte	0x30
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x3f6
	.byte	0x5
	.4byte	.LASF73
	.byte	0xd
	.byte	0x32
	.byte	0x27
	.4byte	0x41e
	.byte	0xc
	.4byte	.LASF74
	.byte	0x18
	.byte	0xd
	.byte	0x34
	.byte	0x8
	.4byte	0x4ce
	.byte	0x10
	.4byte	.LASF75
	.byte	0xd
	.byte	0x35
	.byte	0x9
	.4byte	0x156
	.byte	0
	.byte	0xd
	.string	"mem"
	.byte	0xd
	.byte	0x36
	.byte	0xc
	.4byte	0x16e
	.byte	0x8
	.byte	0xd
	.string	"max"
	.byte	0xd
	.byte	0x37
	.byte	0xc
	.4byte	0x16e
	.byte	0x10
	.byte	0
	.byte	0xc
	.4byte	.LASF76
	.byte	0x38
	.byte	0xd
	.byte	0x3a
	.byte	0x8
	.4byte	0x537
	.byte	0x10
	.4byte	.LASF65
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x537
	.byte	0
	.byte	0xd
	.string	"end"
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x537
	.byte	0x8
	.byte	0x10
	.4byte	.LASF66
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x537
	.byte	0x10
	.byte	0xd
	.string	"ptr"
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x537
	.byte	0x18
	.byte	0x10
	.4byte	.LASF67
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0x537
	.byte	0x20
	.byte	0x10
	.4byte	.LASF68
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0xb7
	.byte	0x28
	.byte	0x10
	.4byte	.LASF69
	.byte	0xd
	.byte	0x3a
	.byte	0x1a
	.4byte	0xb7
	.byte	0x30
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x499
	.byte	0x5
	.4byte	.LASF76
	.byte	0xd
	.byte	0x3b
	.byte	0x25
	.4byte	0x4ce
	.byte	0x5
	.4byte	.LASF77
	.byte	0xe
	.byte	0x3f
	.byte	0x10
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF78
	.byte	0xe
	.byte	0xb7
	.byte	0x10
	.4byte	0x91
	.byte	0xc
	.4byte	.LASF79
	.byte	0x40
	.byte	0xe
	.byte	0xf3
	.byte	0x8
	.4byte	0x5a3
	.byte	0x10
	.4byte	.LASF80
	.byte	0xe
	.byte	0xf4
	.byte	0x1d
	.4byte	0x5a3
	.byte	0
	.byte	0x10
	.4byte	.LASF81
	.byte	0xe
	.byte	0xf5
	.byte	0xa
	.4byte	0x80
	.byte	0x8
	.byte	0x10
	.4byte	.LASF82
	.byte	0xe
	.byte	0xf6
	.byte	0xa
	.4byte	0x80
	.byte	0x10
	.byte	0x10
	.4byte	.LASF83
	.byte	0xe
	.byte	0xf7
	.byte	0xa
	.4byte	0x5a9
	.byte	0x18
	.byte	0
	.byte	0x7
	.byte	0x8
	.4byte	0x561
	.byte	0xa
	.4byte	0x19f
	.4byte	0x5b9
	.byte	0xe
	.4byte	0x6b
	.byte	0x4
	.byte	0
	.byte	0x5
	.4byte	.LASF84
	.byte	0xe
	.byte	0xfa
	.byte	0x26
	.4byte	0x5a3
	.byte	0x2
	.4byte	.LASF85
	.byte	0xf
	.byte	0x18
	.byte	0x10
	.4byte	0x5d1
	.byte	0x7
	.byte	0x8
	.4byte	0x5d7
	.byte	0x11
	.4byte	0x5e7
	.byte	0x12
	.4byte	0x156
	.byte	0x12
	.4byte	0x19f
	.byte	0
	.byte	0x5
	.4byte	.LASF86
	.byte	0xf
	.byte	0x1e
	.byte	0x10
	.4byte	0x91
	.byte	0x11
	.4byte	0x5fe
	.byte	0x12
	.4byte	0x5c5
	.byte	0
	.byte	0x5
	.4byte	.LASF87
	.byte	0xf
	.byte	0x28
	.byte	0x13
	.4byte	0x60a
	.byte	0x7
	.byte	0x8
	.4byte	0x5f3
	.byte	0x5
	.4byte	.LASF88
	.byte	0x10
	.byte	0x1e
	.byte	0x1c
	.4byte	0x8c
	.byte	0xa
	.4byte	0x8c
	.4byte	0x627
	.byte	0xb
	.byte	0
	.byte	0x4
	.4byte	0x61c
	.byte	0x5
	.4byte	.LASF89
	.byte	0x10
	.byte	0x1f
	.byte	0x1c
	.4byte	0x627
	.byte	0x5
	.4byte	.LASF90
	.byte	0x10
	.byte	0x20
	.byte	0x19
	.4byte	0x40
	.byte	0x5
	.4byte	.LASF91
	.byte	0x10
	.byte	0x21
	.byte	0x15
	.4byte	0x40
	.byte	0x5
	.4byte	.LASF92
	.byte	0x10
	.byte	0x22
	.byte	0x15
	.4byte	0x40
	.byte	0x5
	.4byte	.LASF93
	.byte	0x10
	.byte	0x2e
	.byte	0x13
	.4byte	0xdc
	.byte	0x5
	.4byte	.LASF94
	.byte	0x10
	.byte	0x2f
	.byte	0x13
	.4byte	0xdc
	.byte	0x13
	.4byte	0x39
	.byte	0x5
	.4byte	.LASF95
	.byte	0x10
	.byte	0x30
	.byte	0x12
	.4byte	0x685
	.byte	0x7
	.byte	0x8
	.4byte	0x674
	.byte	0x5
	.4byte	.LASF96
	.byte	0x10
	.byte	0x31
	.byte	0x1d
	.4byte	0xe2
	.byte	0x5
	.4byte	.LASF97
	.byte	0x11
	.byte	0x25
	.byte	0x12
	.4byte	0x6a3
	.byte	0x7
	.byte	0x8
	.4byte	0x130
	.byte	0x14
	.4byte	0x610
	.byte	0x1
	.byte	0x2c
	.byte	0x9
	.byte	0x3
	.8byte	caml_signals_are_pending
	.byte	0x14
	.4byte	0x62c
	.byte	0x1
	.byte	0x2d
	.byte	0x9
	.byte	0x3
	.8byte	caml_pending_signals
	.byte	0x15
	.4byte	.LASF98
	.byte	0x1
	.byte	0x54
	.byte	0x18
	.4byte	0x8c
	.byte	0x9
	.byte	0x3
	.8byte	caml_async_signal_mode
	.byte	0x14
	.4byte	0x65c
	.byte	0x1
	.byte	0x69
	.byte	0x9
	.byte	0x3
	.8byte	caml_enter_blocking_section_hook
	.byte	0x14
	.4byte	0x668
	.byte	0x1
	.byte	0x6b
	.byte	0x9
	.byte	0x3
	.8byte	caml_leave_blocking_section_hook
	.byte	0x14
	.4byte	0x679
	.byte	0x1
	.byte	0x6d
	.byte	0x9
	.byte	0x3
	.8byte	caml_try_leave_blocking_section_hook
	.byte	0x15
	.4byte	.LASF99
	.byte	0x1
	.byte	0x89
	.byte	0xe
	.4byte	0x156
	.byte	0x9
	.byte	0x3
	.8byte	caml_signal_handlers
	.byte	0x16
	.4byte	0x644
	.byte	0x1
	.byte	0xc7
	.byte	0xe
	.byte	0x9
	.byte	0x3
	.8byte	caml_requested_major_slice
	.byte	0x16
	.4byte	0x650
	.byte	0x1
	.byte	0xc8
	.byte	0xe
	.byte	0x9
	.byte	0x3
	.8byte	caml_requested_minor_gc
	.byte	0xa
	.4byte	0x39
	.4byte	0x75e
	.byte	0xe
	.4byte	0x6b
	.byte	0x1b
	.byte	0
	.byte	0x17
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x13a
	.byte	0xc
	.4byte	0x74e
	.byte	0x9
	.byte	0x3
	.8byte	posix_signals
	.byte	0x18
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x153
	.byte	0x10
	.4byte	0x156
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x94c
	.byte	0x19
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x153
	.byte	0x32
	.4byte	0x156
	.4byte	.LLST11
	.byte	0x19
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x153
	.byte	0x47
	.4byte	0x156
	.4byte	.LLST12
	.byte	0x1a
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x155
	.byte	0x3
	.4byte	0x5a3
	.4byte	.LLST13
	.byte	0x17
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x155
	.byte	0x3
	.4byte	0x561
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x1b
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x155
	.byte	0x3
	.4byte	0x39
	.byte	0
	.byte	0x1c
	.string	"res"
	.byte	0x1
	.2byte	0x156
	.byte	0x3
	.4byte	0x156
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x17
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x156
	.byte	0x3
	.4byte	0x561
	.byte	0x3
	.byte	0x91
	.byte	0xd8,0x7e
	.byte	0x1b
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x156
	.byte	0x3
	.4byte	0x39
	.byte	0
	.byte	0x1d
	.string	"sig"
	.byte	0x1
	.2byte	0x157
	.byte	0x7
	.4byte	0x39
	.4byte	.LLST14
	.byte	0x1d
	.string	"act"
	.byte	0x1
	.2byte	0x157
	.byte	0xc
	.4byte	0x39
	.4byte	.LLST15
	.byte	0x1a
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x157
	.byte	0x11
	.4byte	0x39
	.4byte	.LLST16
	.byte	0x1e
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x874
	.byte	0x1a
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x18d
	.byte	0x3
	.4byte	0x156
	.4byte	.LLST17
	.byte	0
	.byte	0x1f
	.8byte	.LVL44
	.4byte	0x990
	.4byte	0x88f
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x26
	.byte	0
	.byte	0x1f
	.8byte	.LVL47
	.4byte	0xcbc
	.4byte	0x8a7
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL49
	.4byte	0xcc8
	.4byte	0x8be
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x1f
	.8byte	.LVL52
	.4byte	0xcd4
	.4byte	0x8dd
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0x21
	.8byte	.LVL55
	.4byte	0xce0
	.byte	0x21
	.8byte	.LVL56
	.4byte	0xc76
	.byte	0x1f
	.8byte	.LVL61
	.4byte	0xcec
	.4byte	0x913
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x1f
	.8byte	.LVL62
	.4byte	0xcf8
	.4byte	0x930
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x22
	.8byte	.LVL63
	.4byte	0xd04
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	caml_signal_handlers
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x149
	.byte	0x10
	.4byte	0x39
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x990
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x149
	.byte	0x33
	.4byte	0x39
	.4byte	.LLST3
	.byte	0x1d
	.string	"i"
	.byte	0x1
	.2byte	0x14b
	.byte	0x7
	.4byte	0x39
	.4byte	.LLST4
	.byte	0
	.byte	0x18
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x141
	.byte	0x10
	.4byte	0x39
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x9c5
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x141
	.byte	0x2f
	.4byte	0x39
	.4byte	.LLST2
	.byte	0
	.byte	0x23
	.4byte	.LASF114
	.byte	0x1
	.byte	0xd8
	.byte	0x6
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0x23
	.4byte	.LASF115
	.byte	0x1
	.byte	0xca
	.byte	0x6
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0x24
	.4byte	.LASF120
	.byte	0x1
	.byte	0x8b
	.byte	0x6
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xb78
	.byte	0x25
	.4byte	.LASF101
	.byte	0x1
	.byte	0x8b
	.byte	0x1e
	.4byte	0x39
	.4byte	.LLST5
	.byte	0x25
	.4byte	.LASF116
	.byte	0x1
	.byte	0x8b
	.byte	0x31
	.4byte	0x39
	.4byte	.LLST6
	.byte	0x26
	.string	"res"
	.byte	0x1
	.byte	0x8d
	.byte	0x9
	.4byte	0x156
	.4byte	.LLST7
	.byte	0x27
	.4byte	.LASF117
	.byte	0x1
	.byte	0x8e
	.byte	0x9
	.4byte	0x156
	.4byte	.LLST8
	.byte	0x15
	.4byte	.LASF118
	.byte	0x1
	.byte	0x93
	.byte	0xc
	.4byte	0x45
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x15
	.4byte	.LASF119
	.byte	0x1
	.byte	0x93
	.byte	0x13
	.4byte	0x45
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1f
	.8byte	.LVL14
	.4byte	0xd11
	.4byte	0xa8d
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x1f
	.8byte	.LVL15
	.4byte	0xd1d
	.4byte	0xaab
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL16
	.4byte	0xd29
	.4byte	0xace
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x1f
	.8byte	.LVL18
	.4byte	0x94c
	.4byte	0xae6
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL19
	.4byte	0xd35
	.4byte	0xafe
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL23
	.4byte	0xd29
	.4byte	0xb20
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x1f
	.8byte	.LVL24
	.4byte	0xd41
	.4byte	0xb3e
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1f
	.8byte	.LVL25
	.4byte	0xd29
	.4byte	0xb60
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x22
	.8byte	.LVL26
	.4byte	0xd4d
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x79
	.byte	0
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LASF121
	.byte	0x1
	.byte	0x7d
	.byte	0x11
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0xbb4
	.byte	0x27
	.4byte	.LASF122
	.byte	0x1
	.byte	0x7f
	.byte	0x7
	.4byte	0x39
	.4byte	.LLST10
	.byte	0x21
	.8byte	.LVL37
	.4byte	0xc76
	.byte	0
	.byte	0x28
	.4byte	.LASF123
	.byte	0x1
	.byte	0x70
	.byte	0x11
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xbe0
	.byte	0x21
	.8byte	.LVL32
	.4byte	0xc76
	.byte	0
	.byte	0x29
	.4byte	.LASF144
	.byte	0x1
	.byte	0x62
	.byte	0xc
	.4byte	0x39
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xc13
	.byte	0x26
	.string	"res"
	.byte	0x1
	.byte	0x64
	.byte	0xa
	.4byte	0x80
	.4byte	.LLST0
	.byte	0
	.byte	0x2a
	.4byte	.LASF124
	.byte	0x1
	.byte	0x5c
	.byte	0xd
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.byte	0x2a
	.4byte	.LASF125
	.byte	0x1
	.byte	0x56
	.byte	0xd
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.byte	0x24
	.4byte	.LASF126
	.byte	0x1
	.byte	0x47
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0xc76
	.byte	0x25
	.4byte	.LASF101
	.byte	0x1
	.byte	0x47
	.byte	0x1d
	.4byte	0x39
	.4byte	.LLST1
	.byte	0
	.byte	0x24
	.4byte	.LASF127
	.byte	0x1
	.byte	0x31
	.byte	0x6
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xcbc
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x33
	.byte	0x7
	.4byte	0x39
	.4byte	.LLST9
	.byte	0x22
	.8byte	.LVL29
	.4byte	0x9f9
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LASF128
	.4byte	.LASF128
	.byte	0x10
	.byte	0x2c
	.byte	0x5
	.byte	0x2b
	.4byte	.LASF129
	.4byte	.LASF129
	.byte	0x11
	.byte	0x1d
	.byte	0x11
	.byte	0x2b
	.4byte	.LASF130
	.4byte	.LASF130
	.byte	0x9
	.byte	0x65
	.byte	0x11
	.byte	0x2b
	.4byte	.LASF131
	.4byte	.LASF131
	.byte	0xe
	.byte	0x35
	.byte	0x11
	.byte	0x2b
	.4byte	.LASF132
	.4byte	.LASF132
	.byte	0x12
	.byte	0x1f
	.byte	0x12
	.byte	0x2b
	.4byte	.LASF133
	.4byte	.LASF133
	.byte	0x12
	.byte	0x1e
	.byte	0x12
	.byte	0x2c
	.4byte	.LASF134
	.4byte	.LASF134
	.byte	0xe
	.2byte	0x22b
	.byte	0x11
	.byte	0x2b
	.4byte	.LASF135
	.4byte	.LASF135
	.byte	0x2
	.byte	0x11
	.byte	0x5
	.byte	0x2b
	.4byte	.LASF136
	.4byte	.LASF136
	.byte	0x2
	.byte	0xf
	.byte	0x5
	.byte	0x2b
	.4byte	.LASF137
	.4byte	.LASF137
	.byte	0x2
	.byte	0x14
	.byte	0x5
	.byte	0x2b
	.4byte	.LASF138
	.4byte	.LASF138
	.byte	0x8
	.byte	0x24
	.byte	0x12
	.byte	0x2b
	.4byte	.LASF139
	.4byte	.LASF139
	.byte	0x2
	.byte	0x10
	.byte	0x5
	.byte	0x2b
	.4byte	.LASF140
	.4byte	.LASF140
	.byte	0x9
	.byte	0x49
	.byte	0x11
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
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x2
	.byte	0x18
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0x19
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1c
	.byte	0xb
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x2a
	.byte	0x2e
	.byte	0
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
	.byte	0x2b
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST11:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL43-.Ltext0
	.8byte	.LVL44-1-.Ltext0
	.2byte	0x4
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.8byte	0
	.8byte	0
.LLST12:
	.8byte	.LVL39-.Ltext0
	.8byte	.LVL44-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST13:
	.8byte	.LVL40-.Ltext0
	.8byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL59-.Ltext0
	.8byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST14:
	.8byte	.LVL44-.Ltext0
	.8byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL50-.Ltext0
	.8byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL51-.Ltext0
	.8byte	.LVL52-1-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	.LVL52-.Ltext0
	.8byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST15:
	.8byte	.LVL45-.Ltext0
	.8byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	0
	.8byte	0
.LLST16:
	.8byte	.LVL47-.Ltext0
	.8byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL53-.Ltext0
	.8byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL59-.Ltext0
	.8byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST17:
	.8byte	.LVL56-.Ltext0
	.8byte	.LVL58-.Ltext0
	.2byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.8byte	.LVL58-.Ltext0
	.8byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST3:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL10-.Ltext0
	.8byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	.LVL11-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST4:
	.8byte	.LVL7-.Ltext0
	.8byte	.LVL8-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL8-.Ltext0
	.8byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.8byte	0
	.8byte	0
.LLST2:
	.8byte	.LVL4-.Ltext0
	.8byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL5-.Ltext0
	.8byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x5f
	.8byte	.LVL6-.Ltext0
	.8byte	.LFE22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST5:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL13-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST6:
	.8byte	.LVL12-.Ltext0
	.8byte	.LVL14-1-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.8byte	.LVL14-1-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST7:
	.8byte	.LVL20-.Ltext0
	.8byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	.LVL22-.Ltext0
	.8byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST8:
	.8byte	.LVL17-.Ltext0
	.8byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST10:
	.8byte	.LVL35-.Ltext0
	.8byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x59
	.8byte	0
	.8byte	0
.LLST0:
	.8byte	.LVL0-.Ltext0
	.8byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	0
	.8byte	0
.LLST1:
	.8byte	.LVL2-.Ltext0
	.8byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.8byte	.LVL3-.Ltext0
	.8byte	.LFE13-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.8byte	0
	.8byte	0
.LLST9:
	.8byte	.LVL27-.Ltext0
	.8byte	.LVL28-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.8byte	.LVL28-.Ltext0
	.8byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x58
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
.LASF93:
	.string	"caml_enter_blocking_section_hook"
.LASF67:
	.string	"limit"
.LASF94:
	.string	"caml_leave_blocking_section_hook"
.LASF55:
	.string	"caml_young_alloc_start"
.LASF143:
	.string	"/home/sai/ocaml-freestanding-riscv/build/asmrun"
.LASF0:
	.string	"sigjmp_buf"
.LASF14:
	.string	"caml_timing_hook"
.LASF103:
	.string	"caml__frame"
.LASF120:
	.string	"caml_execute_signal"
.LASF90:
	.string	"caml_something_to_do"
.LASF59:
	.string	"caml_young_trigger"
.LASF107:
	.string	"caml__dummy_res"
.LASF5:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF74:
	.string	"caml_custom_elt"
.LASF35:
	.string	"caml_gc_subphase"
.LASF144:
	.string	"caml_try_leave_blocking_section_default"
.LASF118:
	.string	"nsigs"
.LASF45:
	.string	"caml_major_window"
.LASF58:
	.string	"caml_young_limit"
.LASF130:
	.string	"caml_invalid_argument"
.LASF125:
	.string	"caml_enter_blocking_section_default"
.LASF88:
	.string	"caml_signals_are_pending"
.LASF22:
	.string	"char_os"
.LASF56:
	.string	"caml_young_alloc_end"
.LASF117:
	.string	"handler"
.LASF141:
	.string	"GNU C17 9.2.0 -mcmodel=medany -mcmodel=medany -mtune=rocket -march=rv64imafdc -mabi=lp64d -g -g -O2 -Og -fno-strict-aliasing -fwrapv"
.LASF25:
	.string	"value"
.LASF95:
	.string	"caml_try_leave_blocking_section_hook"
.LASF37:
	.string	"caml_extra_heap_resources"
.LASF63:
	.string	"longjmp_buffer"
.LASF18:
	.string	"caml_minor_gc_begin_hook"
.LASF123:
	.string	"caml_enter_blocking_section"
.LASF61:
	.string	"caml_in_minor_collection"
.LASF84:
	.string	"caml_local_roots"
.LASF133:
	.string	"caml_alloc"
.LASF89:
	.string	"caml_pending_signals"
.LASF124:
	.string	"caml_leave_blocking_section_default"
.LASF30:
	.string	"caml_callback_depth"
.LASF85:
	.string	"scanning_action"
.LASF50:
	.string	"caml_major_gc_hook"
.LASF115:
	.string	"caml_request_major_slice"
.LASF49:
	.string	"caml_gc_clock"
.LASF82:
	.string	"nitems"
.LASF21:
	.string	"caml_finalise_end_hook"
.LASF10:
	.string	"long long int"
.LASF86:
	.string	"caml_incremental_roots_count"
.LASF44:
	.string	"caml_gc_sweep_hp"
.LASF126:
	.string	"caml_record_signal"
.LASF46:
	.string	"caml_major_ring"
.LASF66:
	.string	"threshold"
.LASF83:
	.string	"tables"
.LASF7:
	.string	"intnat"
.LASF3:
	.string	"long int"
.LASF102:
	.string	"action"
.LASF101:
	.string	"signal_number"
.LASF72:
	.string	"offset"
.LASF69:
	.string	"reserve"
.LASF121:
	.string	"caml_leave_blocking_section"
.LASF109:
	.string	"caml__temp_result"
.LASF77:
	.string	"caml_huge_fallback_count"
.LASF75:
	.string	"block"
.LASF33:
	.string	"caml_fl_cur_wsz"
.LASF24:
	.string	"caml_runtime_warnings"
.LASF114:
	.string	"caml_request_minor_gc"
.LASF131:
	.string	"caml_modify"
.LASF26:
	.string	"header_t"
.LASF91:
	.string	"caml_requested_major_slice"
.LASF17:
	.string	"caml_major_slice_end_hook"
.LASF113:
	.string	"caml_convert_signal_number"
.LASF28:
	.string	"caml_atom_table"
.LASF11:
	.string	"long double"
.LASF20:
	.string	"caml_finalise_begin_hook"
.LASF62:
	.string	"caml_extra_heap_resources_minor"
.LASF136:
	.string	"sigaddset"
.LASF40:
	.string	"caml_dependent_allocated"
.LASF119:
	.string	"sigs"
.LASF98:
	.string	"caml_async_signal_mode"
.LASF27:
	.string	"mlsize_t"
.LASF108:
	.string	"oldact"
.LASF79:
	.string	"caml__roots_block"
.LASF105:
	.string	"caml__dummy_signal_number"
.LASF8:
	.string	"uintnat"
.LASF52:
	.string	"caml_young_end"
.LASF2:
	.string	"unsigned int"
.LASF64:
	.string	"caml_ref_table"
.LASF139:
	.string	"sigdelset"
.LASF104:
	.string	"caml__roots_signal_number"
.LASF128:
	.string	"caml_set_signal_action"
.LASF116:
	.string	"in_signal_handler"
.LASF71:
	.string	"ephe"
.LASF16:
	.string	"caml_major_slice_begin_hook"
.LASF6:
	.string	"short unsigned int"
.LASF15:
	.string	"errno"
.LASF127:
	.string	"caml_process_pending_signals"
.LASF51:
	.string	"caml_young_start"
.LASF122:
	.string	"saved_errno"
.LASF13:
	.string	"char"
.LASF135:
	.string	"sigemptyset"
.LASF132:
	.string	"caml_alloc_small"
.LASF87:
	.string	"caml_scan_roots_hook"
.LASF47:
	.string	"caml_major_ring_index"
.LASF140:
	.string	"caml_raise"
.LASF92:
	.string	"caml_requested_minor_gc"
.LASF100:
	.string	"posix_signals"
.LASF34:
	.string	"caml_gc_phase"
.LASF60:
	.string	"caml_minor_heap_wsz"
.LASF23:
	.string	"caml_verb_gc"
.LASF19:
	.string	"caml_minor_gc_end_hook"
.LASF31:
	.string	"caml_external_raise"
.LASF111:
	.string	"caml_rev_convert_signal_number"
.LASF4:
	.string	"long unsigned int"
.LASF53:
	.string	"caml_code_area_start"
.LASF96:
	.string	"caml_async_action_hook"
.LASF38:
	.string	"double"
.LASF32:
	.string	"caml_exn_bucket"
.LASF29:
	.string	"caml_global_data"
.LASF68:
	.string	"size"
.LASF110:
	.string	"caml_install_signal_handler"
.LASF138:
	.string	"caml_callback_exn"
.LASF129:
	.string	"caml_sys_error"
.LASF41:
	.string	"caml_fl_wsz_at_phase_change"
.LASF76:
	.string	"caml_custom_table"
.LASF142:
	.string	"signals.c"
.LASF97:
	.string	"caml_exe_name"
.LASF137:
	.string	"sigprocmask"
.LASF54:
	.string	"caml_code_area_end"
.LASF1:
	.string	"sigset_t"
.LASF36:
	.string	"caml_allocated_words"
.LASF81:
	.string	"ntables"
.LASF39:
	.string	"caml_dependent_size"
.LASF42:
	.string	"caml_heap_start"
.LASF12:
	.string	"asize_t"
.LASF57:
	.string	"caml_young_ptr"
.LASF43:
	.string	"total_heap_size"
.LASF65:
	.string	"base"
.LASF48:
	.string	"caml_major_work_credit"
.LASF134:
	.string	"caml_register_global_root"
.LASF73:
	.string	"caml_ephe_ref_table"
.LASF70:
	.string	"caml_ephe_ref_elt"
.LASF112:
	.string	"signo"
.LASF80:
	.string	"next"
.LASF78:
	.string	"caml_use_huge_pages"
.LASF99:
	.string	"caml_signal_handlers"
.LASF106:
	.string	"caml__roots_res"
	.ident	"GCC: (GNU) 9.2.0"
