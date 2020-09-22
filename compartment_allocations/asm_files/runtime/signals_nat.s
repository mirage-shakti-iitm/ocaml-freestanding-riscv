	.file	"signals_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.handle_signal,"ax",@progbits
	.align	1
	.type	handle_signal, @function
handle_signal:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	lw	s1,errno
	lla	a1,handle_signal
	call	signal
	sext.w	a4,s0
	li	a5,63
	bgtu	a4,a5,.L1
	ld	a5,caml_try_leave_blocking_section_hook
	jalr	a5
	beq	a0,zero,.L3
	li	a1,1
	mv	a0,s0
	call	caml_execute_signal_exn
	call	caml_raise_if_exception
	ld	a5,caml_enter_blocking_section_hook
	jalr	a5
.L4:
	sw	s1,errno,a5
.L1:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L3:
	mv	a0,s0
	call	caml_record_signal
	j	.L4
	.size	handle_signal, .-handle_signal
	.section	.text.caml_garbage_collection,"ax",@progbits
	.align	1
	.globl	caml_garbage_collection
	.type	caml_garbage_collection, @function
caml_garbage_collection:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,Caml_state
	ld	a2,208(a5)
	srli	a5,a2,3
	ld	a1,caml_frame_descriptors_mask
	and	a5,a5,a1
.L8:
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	ld	a4,0(a4)
	ld	a3,0(a4)
	beq	a2,a3,.L7
	addi	a5,a5,1
	and	a5,a1,a5
	j	.L8
.L7:
	lhu	a5,10(a4)
	slli	a5,a5,1
	add	a4,a4,a5
	addi	a3,a4,13
	lbu	a2,12(a4)
	mv	a1,a2
	li	a5,0
	li	a0,0
	j	.L9
.L10:
	add	a4,a3,a5
	lbu	a4,0(a4)
	add	a0,a0,a4
	addi	a0,a0,2
	addi	a5,a5,1
.L9:
	blt	a5,a1,.L10
	li	a1,3
	addi	a0,a0,-1
	call	caml_alloc_small_dispatch
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_garbage_collection, .-caml_garbage_collection
	.section	.text.caml_set_signal_action,"ax",@progbits
	.align	1
	.globl	caml_set_signal_action
	.type	caml_set_signal_action, @function
caml_set_signal_action:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a5,1
	bleu	a1,a5,.L19
	lla	a1,handle_signal
.L13:
	call	signal
	beq	a0,zero,.L16
	lla	a5,handle_signal
	beq	a0,a5,.L20
	li	a0,0
.L14:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L19:
	li	a1,0
	j	.L13
.L20:
	li	a0,2
	j	.L14
.L16:
	li	a0,-1
	j	.L14
	.size	caml_set_signal_action, .-caml_set_signal_action
	.section	.text.caml_init_signals,"ax",@progbits
	.align	1
	.globl	caml_init_signals
	.type	caml_init_signals, @function
caml_init_signals:
	ret
	.size	caml_init_signals, .-caml_init_signals
	.section	.text.caml_setup_stack_overflow_detection,"ax",@progbits
	.align	1
	.globl	caml_setup_stack_overflow_detection
	.type	caml_setup_stack_overflow_detection, @function
caml_setup_stack_overflow_detection:
	ret
	.size	caml_setup_stack_overflow_detection, .-caml_setup_stack_overflow_detection
	.ident	"GCC: (GNU) 9.2.0"
