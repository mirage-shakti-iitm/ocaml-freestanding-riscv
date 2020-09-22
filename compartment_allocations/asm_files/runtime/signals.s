	.file	"signals.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_enter_blocking_section_default,"ax",@progbits
	.align	1
	.type	caml_enter_blocking_section_default, @function
caml_enter_blocking_section_default:
	li	a5,1
	sd	a5,caml_async_signal_mode,a4
	ret
	.size	caml_enter_blocking_section_default, .-caml_enter_blocking_section_default
	.section	.text.caml_leave_blocking_section_default,"ax",@progbits
	.align	1
	.type	caml_leave_blocking_section_default, @function
caml_leave_blocking_section_default:
	sd	zero,caml_async_signal_mode,a5
	ret
	.size	caml_leave_blocking_section_default, .-caml_leave_blocking_section_default
	.section	.text.caml_try_leave_blocking_section_default,"ax",@progbits
	.align	1
	.type	caml_try_leave_blocking_section_default, @function
caml_try_leave_blocking_section_default:
	lla	a5,caml_async_signal_mode
	li	a0,0
	fence iorw,ow; amoswap.d.aq a0,a0,0(a5)
	sext.w	a0,a0
	ret
	.size	caml_try_leave_blocking_section_default, .-caml_try_leave_blocking_section_default
	.section	.text.caml_set_action_pending,"ax",@progbits
	.align	1
	.globl	caml_set_action_pending
	.type	caml_set_action_pending, @function
caml_set_action_pending:
	li	a5,1
	sw	a5,caml_something_to_do,a4
	ld	a5,Caml_state
	ld	a4,56(a5)
	sd	a4,8(a5)
	ret
	.size	caml_set_action_pending, .-caml_set_action_pending
	.section	.text.caml_record_signal,"ax",@progbits
	.align	1
	.globl	caml_record_signal
	.type	caml_record_signal, @function
caml_record_signal:
	addi	sp,sp,-16
	sd	ra,8(sp)
	slli	a5,a0,3
	lla	a0,.LANCHOR0
	add	a0,a0,a5
	li	a5,1
	sd	a5,0(a0)
	sd	a5,signals_are_pending,a4
	call	caml_set_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_record_signal, .-caml_record_signal
	.section	.text.caml_update_young_limit,"ax",@progbits
	.align	1
	.globl	caml_update_young_limit
	.type	caml_update_young_limit, @function
caml_update_young_limit:
	ld	a5,Caml_state
	ld	a3,72(a5)
	ld	a4,caml_memprof_young_trigger
	bgeu	a4,a3,.L8
	mv	a4,a3
.L8:
	sd	a4,8(a5)
	lw	a4,caml_something_to_do
	beq	a4,zero,.L7
	ld	a4,56(a5)
	sd	a4,8(a5)
.L7:
	ret
	.size	caml_update_young_limit, .-caml_update_young_limit
	.section	.text.caml_request_major_slice,"ax",@progbits
	.align	1
	.globl	caml_request_major_slice
	.type	caml_request_major_slice, @function
caml_request_major_slice:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,Caml_state
	li	a4,1
	sd	a4,264(a5)
	call	caml_set_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_request_major_slice, .-caml_request_major_slice
	.section	.text.caml_request_minor_gc,"ax",@progbits
	.align	1
	.globl	caml_request_minor_gc
	.type	caml_request_minor_gc, @function
caml_request_minor_gc:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,Caml_state
	li	a4,1
	sd	a4,272(a5)
	call	caml_set_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_request_minor_gc, .-caml_request_minor_gc
	.section	.text.caml_convert_signal_number,"ax",@progbits
	.align	1
	.globl	caml_convert_signal_number
	.type	caml_convert_signal_number, @function
caml_convert_signal_number:
	bge	a0,zero,.L15
	sext.w	a5,a0
	li	a4,-29
	bleu	a5,a4,.L15
	not	a0,a0
	slli	a0,a0,2
	lla	a5,.LANCHOR1
	add	a0,a5,a0
	lw	a0,0(a0)
.L15:
	ret
	.size	caml_convert_signal_number, .-caml_convert_signal_number
	.section	.text.caml_rev_convert_signal_number,"ax",@progbits
	.align	1
	.globl	caml_rev_convert_signal_number
	.type	caml_rev_convert_signal_number, @function
caml_rev_convert_signal_number:
	li	a4,0
	j	.L17
.L18:
	addiw	a4,a4,1
.L17:
	sext.w	a5,a4
	li	a3,27
	bgtu	a5,a3,.L21
	slli	a3,a4,2
	lla	a5,.LANCHOR1
	add	a5,a5,a3
	lw	a5,0(a5)
	bne	a5,a0,.L18
	not	a0,a4
	ret
.L21:
	ret
	.size	caml_rev_convert_signal_number, .-caml_rev_convert_signal_number
	.section	.text.caml_execute_signal_exn,"ax",@progbits
	.align	1
	.globl	caml_execute_signal_exn
	.type	caml_execute_signal_exn, @function
caml_execute_signal_exn:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	slli	a5,a0,3
	ld	a4,caml_signal_handlers
	add	a5,a5,a4
	ld	s0,0(a5)
	call	caml_rev_convert_signal_number
	slli	a1,a0,1
	addi	a1,a1,1
	mv	a0,s0
	call	caml_callback_exn
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_execute_signal_exn, .-caml_execute_signal_exn
	.section	.text.caml_process_pending_signals_exn,"ax",@progbits
	.align	1
	.globl	caml_process_pending_signals_exn
	.type	caml_process_pending_signals_exn, @function
caml_process_pending_signals_exn:
	ld	a5,signals_are_pending
	beq	a5,zero,.L32
	sd	zero,signals_are_pending,a5
	li	a4,0
.L26:
	li	a5,63
	bgt	a4,a5,.L39
	slli	a3,a4,3
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	ld	a5,0(a5)
	bne	a5,zero,.L33
	addiw	a4,a4,1
	j	.L26
.L39:
	li	a5,0
	j	.L27
.L33:
	li	a5,1
.L27:
	beq	a5,zero,.L34
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	s0,0
	j	.L29
.L30:
	addiw	s0,s0,1
.L29:
	li	a5,63
	bgt	s0,a5,.L40
	slli	a4,s0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	ld	a5,0(a5)
	beq	a5,zero,.L30
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,0(a5)
	li	a1,0
	mv	a0,s0
	call	caml_execute_signal_exn
	andi	a4,a0,3
	li	a5,2
	bne	a4,a5,.L30
.L24:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L40:
	li	a0,1
	j	.L24
.L32:
	li	a0,1
	ret
.L34:
	li	a0,1
	ret
	.size	caml_process_pending_signals_exn, .-caml_process_pending_signals_exn
	.section	.text.caml_enter_blocking_section,"ax",@progbits
	.align	1
	.globl	caml_enter_blocking_section
	.type	caml_enter_blocking_section, @function
caml_enter_blocking_section:
	addi	sp,sp,-16
	sd	ra,8(sp)
.L43:
	call	caml_process_pending_signals_exn
	call	caml_raise_if_exception
	ld	a5,caml_enter_blocking_section_hook
	jalr	a5
	ld	a5,signals_are_pending
	beq	a5,zero,.L41
	ld	a5,caml_leave_blocking_section_hook
	jalr	a5
	j	.L43
.L41:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_enter_blocking_section, .-caml_enter_blocking_section
	.section	.text.caml_leave_blocking_section,"ax",@progbits
	.align	1
	.globl	caml_leave_blocking_section
	.type	caml_leave_blocking_section, @function
caml_leave_blocking_section:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	lla	s0,errno
	lw	s1,0(s0)
	ld	a5,caml_leave_blocking_section_hook
	jalr	a5
	li	a5,1
	sd	a5,signals_are_pending,a4
	call	caml_process_pending_signals_exn
	call	caml_raise_if_exception
	sw	s1,0(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_leave_blocking_section, .-caml_leave_blocking_section
	.section	.text.caml_do_pending_actions_exn,"ax",@progbits
	.align	1
	.globl	caml_do_pending_actions_exn
	.type	caml_do_pending_actions_exn, @function
caml_do_pending_actions_exn:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	sw	zero,caml_something_to_do,a5
	li	a0,1
	call	caml_check_urgent_gc
	call	caml_update_young_limit
	call	caml_process_pending_signals_exn
	mv	s0,a0
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L48
	call	caml_memprof_handle_postponed_exn
	mv	s0,a0
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L48
	call	caml_final_do_calls_exn
	mv	s0,a0
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L48
	li	s0,1
	j	.L47
.L48:
	call	caml_set_action_pending
.L47:
	mv	a0,s0
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_do_pending_actions_exn, .-caml_do_pending_actions_exn
	.section	.text.caml_process_pending_actions_with_root,"ax",@progbits
	.align	1
	.globl	caml_process_pending_actions_with_root
	.type	caml_process_pending_actions_with_root, @function
caml_process_pending_actions_with_root:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	a0,8(sp)
	lw	a5,caml_something_to_do
	bne	a5,zero,.L57
.L53:
	ld	a0,8(sp)
.L55:
	call	caml_raise_if_exception
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
.L57:
	ld	a5,Caml_state
	ld	s0,280(a5)
	sd	s0,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_do_pending_actions_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L58
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L53
.L58:
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L55
	.size	caml_process_pending_actions_with_root, .-caml_process_pending_actions_with_root
	.section	.text.caml_process_pending_actions_exn,"ax",@progbits
	.align	1
	.globl	caml_process_pending_actions_exn
	.type	caml_process_pending_actions_exn, @function
caml_process_pending_actions_exn:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	li	a5,1
	sd	a5,8(sp)
	lw	a5,caml_something_to_do
	bne	a5,zero,.L64
.L60:
	ld	a0,8(sp)
.L59:
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
.L64:
	ld	a5,Caml_state
	ld	s0,280(a5)
	sd	s0,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_do_pending_actions_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L65
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L60
.L65:
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L59
	.size	caml_process_pending_actions_exn, .-caml_process_pending_actions_exn
	.section	.text.caml_process_pending_actions,"ax",@progbits
	.align	1
	.globl	caml_process_pending_actions
	.type	caml_process_pending_actions, @function
caml_process_pending_actions:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	li	a5,1
	sd	a5,8(sp)
	lw	a5,caml_something_to_do
	bne	a5,zero,.L71
.L67:
	ld	a0,8(sp)
.L69:
	call	caml_raise_if_exception
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
.L71:
	ld	a5,Caml_state
	ld	s0,280(a5)
	sd	s0,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_do_pending_actions_exn
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L72
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L67
.L72:
	ld	a5,Caml_state
	sd	s0,280(a5)
	j	.L69
	.size	caml_process_pending_actions, .-caml_process_pending_actions
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Sys.signal: unavailable signal"
	.section	.text.caml_install_signal_handler,"ax",@progbits
	.align	1
	.globl	caml_install_signal_handler
	.type	caml_install_signal_handler, @function
caml_install_signal_handler:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
	li	a5,1
	sd	a5,112(sp)
	li	a3,2
	sd	a3,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	sp,128(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	srai	a0,a0,1
	sext.w	a0,a0
	call	caml_convert_signal_number
	sext.w	a4,a0
	li	a5,63
	bgtu	a4,a5,.L85
	mv	s0,a0
	ld	a5,0(sp)
	li	a4,1
	beq	a5,a4,.L82
	li	a4,3
	bne	a5,a4,.L83
	li	a1,1
.L75:
	mv	a0,s0
	call	caml_set_signal_action
	li	a5,1
	beq	a0,a5,.L76
	li	a5,2
	beq	a0,a5,.L77
	beq	a0,zero,.L86
	li	a0,1
	call	caml_sys_error
.L85:
	lla	a0,.LC0
	call	caml_invalid_argument
.L82:
	li	a1,0
	j	.L75
.L83:
	li	a1,2
	j	.L75
.L86:
	li	a5,1
	sd	a5,88(sp)
.L79:
	ld	a5,0(sp)
	andi	a5,a5,1
	bne	a5,zero,.L80
	ld	a5,caml_signal_handlers
	beq	a5,zero,.L87
.L81:
	slli	s0,s0,3
	ld	a5,0(sp)
	ld	a1,0(a5)
	ld	a0,caml_signal_handlers
	add	a0,s0,a0
	call	caml_modify
.L80:
	call	caml_process_pending_signals_exn
	call	caml_raise_if_exception
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
.L76:
	li	a5,3
	sd	a5,88(sp)
	j	.L79
.L77:
	li	a1,0
	li	a0,1
	call	caml_alloc_small
	sd	a0,88(sp)
	slli	a5,s0,3
	ld	a4,caml_signal_handlers
	add	a5,a5,a4
	ld	a5,0(a5)
	sd	a5,0(a0)
	j	.L79
.L87:
	li	a1,0
	li	a0,64
	call	caml_alloc
	lla	a5,caml_signal_handlers
	sd	a0,0(a5)
	mv	a0,a5
	call	caml_register_global_root
	j	.L81
	.size	caml_install_signal_handler, .-caml_install_signal_handler
	.globl	caml_try_leave_blocking_section_hook
	.globl	caml_leave_blocking_section_hook
	.globl	caml_enter_blocking_section_hook
	.globl	caml_pending_signals
	.globl	caml_something_to_do
	.section	.rodata
	.align	3
	.set	.LANCHOR1,. + 0
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
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_pending_signals, @object
	.size	caml_pending_signals, 512
caml_pending_signals:
	.zero	512
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_signal_handlers, @object
	.size	caml_signal_handlers, 8
caml_signal_handlers:
	.zero	8
	.type	caml_async_signal_mode, @object
	.size	caml_async_signal_mode, 8
caml_async_signal_mode:
	.zero	8
	.type	signals_are_pending, @object
	.size	signals_are_pending, 8
signals_are_pending:
	.zero	8
	.type	caml_something_to_do, @object
	.size	caml_something_to_do, 4
caml_something_to_do:
	.zero	4
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
	.ident	"GCC: (GNU) 9.2.0"
