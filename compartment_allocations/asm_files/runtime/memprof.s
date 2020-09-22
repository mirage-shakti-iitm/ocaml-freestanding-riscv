	.file	"memprof.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.mt_generate_uniform,"ax",@progbits
	.align	1
	.type	mt_generate_uniform, @function
mt_generate_uniform:
	lw	a4,mt_index
	li	a5,624
	beq	a4,a5,.L8
.L3:
	lla	a2,mt_index
	lw	a3,0(a2)
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,mt_state
	add	a5,a5,a4
	lw	a5,0(a5)
	srliw	a4,a5,11
	xor	a5,a5,a4
	sext.w	a1,a5
	slliw	a4,a5,7
	li	a5,-1658040320
	addi	a5,a5,1664
	and	a5,a5,a4
	sext.w	a5,a5
	xor	a4,a5,a1
	slliw	a5,a4,15
	li	a1,-272236544
	and	a5,a5,a1
	sext.w	a5,a5
	xor	a5,a5,a4
	srliw	a4,a5,18
	xor	a5,a5,a4
	addiw	a3,a3,1
	sw	a3,0(a2)
	fcvt.d.wu	fa4,a5
	fld	fa5,.LC0,a5
	fmul.d	fa5,fa4,fa5
	fld	fa0,.LC1,a5
	fadd.d	fa0,fa5,fa0
	ret
.L8:
	li	a4,0
.L2:
	li	a5,226
	bgt	a4,a5,.L9
	lla	a3,mt_state
	slli	a2,a4,2
	add	a2,a3,a2
	lw	a5,0(a2)
	li	a1,-2147483648
	and	a5,a5,a1
	sext.w	a5,a5
	addiw	a6,a4,1
	slli	a1,a6,2
	add	a1,a3,a1
	lw	a1,0(a1)
	li	a0,-2147483648
	xori	a0,a0,-1
	and	a1,a1,a0
	or	a5,a5,a1
	addiw	a4,a4,397
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	srliw	a3,a5,1
	xor	a4,a4,a3
	sext.w	a4,a4
	andi	a5,a5,1
	negw	a5,a5
	li	a3,-1727483904
	addi	a3,a3,223
	and	a5,a3,a5
	sext.w	a5,a5
	xor	a5,a4,a5
	sw	a5,0(a2)
	mv	a4,a6
	j	.L2
.L9:
	li	a4,227
.L5:
	li	a5,622
	bgt	a4,a5,.L10
	lla	a3,mt_state
	slli	a2,a4,2
	add	a2,a3,a2
	lw	a5,0(a2)
	li	a1,-2147483648
	and	a5,a5,a1
	sext.w	a5,a5
	addiw	a6,a4,1
	slli	a1,a6,2
	add	a1,a3,a1
	lw	a1,0(a1)
	li	a0,-2147483648
	xori	a0,a0,-1
	and	a1,a1,a0
	or	a5,a5,a1
	addiw	a4,a4,-227
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	srliw	a3,a5,1
	xor	a4,a4,a3
	sext.w	a4,a4
	andi	a5,a5,1
	negw	a5,a5
	li	a3,-1727483904
	addi	a3,a3,223
	and	a5,a3,a5
	sext.w	a5,a5
	xor	a5,a4,a5
	sw	a5,0(a2)
	mv	a4,a6
	j	.L5
.L10:
	lla	a1,mt_state
	lla	a2,mt_state+4096
	lw	a5,-1604(a2)
	li	a4,-2147483648
	and	a5,a5,a4
	sext.w	a5,a5
	lw	a4,0(a1)
	li	a3,-2147483648
	xori	a3,a3,-1
	and	a4,a4,a3
	or	a5,a5,a4
	lw	a4,1584(a1)
	srliw	a3,a5,1
	xor	a4,a4,a3
	sext.w	a4,a4
	andi	a5,a5,1
	negw	a5,a5
	li	a3,-1727483904
	addi	a3,a3,223
	and	a5,a3,a5
	sext.w	a5,a5
	xor	a5,a4,a5
	sw	a5,-1604(a2)
	sw	zero,mt_index,a5
	j	.L3
	.size	mt_generate_uniform, .-mt_generate_uniform
	.section	.text.mark_deleted,"ax",@progbits
	.align	1
	.type	mark_deleted, @function
mark_deleted:
	lla	a3,.LANCHOR0
	ld	a5,0(a3)
	slli	a4,a0,1
	add	a4,a4,a0
	slli	a4,a4,4
	add	a5,a5,a4
	lhu	a4,32(a5)
	ori	a4,a4,128
	sh	a4,32(a5)
	li	a4,1
	sd	a4,24(a5)
	sd	a4,0(a5)
	ld	a5,40(a3)
	bleu	a5,a0,.L11
	sd	a0,.LANCHOR0+40,a5
.L11:
	ret
	.size	mark_deleted, .-mark_deleted
	.section	.text.caml_memprof_init,"ax",@progbits
	.align	1
	.type	caml_memprof_init, @function
caml_memprof_init:
	li	a5,1
	sw	a5,init,a4
	li	a5,624
	sw	a5,mt_index,a4
	li	a5,42
	sw	a5,mt_state,a4
	li	a4,1
.L14:
	li	a5,623
	bgtu	a4,a5,.L16
	addi	a5,a4,-1
	lla	a3,mt_state
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	srliw	a2,a5,30
	xor	a2,a5,a2
	li	a5,1812434944
	addiw	a5,a5,-1691
	mulw	a5,a5,a2
	addw	a5,a4,a5
	slli	a2,a4,2
	add	a3,a3,a2
	sw	a5,0(a3)
	addi	a4,a4,1
	j	.L14
.L16:
	ret
	.size	caml_memprof_init, .-caml_memprof_init
	.section	.text.check_action_pending,"ax",@progbits
	.align	1
	.type	check_action_pending, @function
check_action_pending:
	lw	a5,caml_memprof_suspended
	bne	a5,zero,.L20
	lla	a5,.LANCHOR0
	ld	a4,32(a5)
	ld	a5,16(a5)
	bltu	a4,a5,.L23
.L20:
	ret
.L23:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_set_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	check_action_pending, .-check_action_pending
	.section	.text.realloc_trackst,"ax",@progbits
	.align	1
	.type	realloc_trackst, @function
realloc_trackst:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	lla	a5,.LANCHOR0
	ld	s0,16(a5)
	ld	a5,8(a5)
	bgtu	s0,a5,.L25
	slli	a4,s0,2
	bleu	a5,a4,.L28
	li	a4,128
	beq	a5,a4,.L29
.L25:
	slli	s0,s0,1
	li	a5,127
	bgtu	s0,a5,.L27
	li	s0,128
.L27:
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,4
	ld	a0,.LANCHOR0
	call	caml_stat_resize_noexc
	beq	a0,zero,.L31
	lla	a5,.LANCHOR0
	sd	a0,0(a5)
	sd	s0,8(a5)
	li	a0,1
.L26:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L28:
	li	a0,1
	j	.L26
.L29:
	li	a0,1
	j	.L26
.L31:
	li	a0,0
	j	.L26
	.size	realloc_trackst, .-realloc_trackst
	.section	.text.flush_deleted,"ax",@progbits
	.align	1
	.type	flush_deleted, @function
flush_deleted:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a4,.LANCHOR0+40
	mv	a1,a4
	j	.L34
.L36:
	slli	a2,a1,1
	add	a2,a2,a1
	slli	a0,a2,4
	add	a3,a3,a0
	ld	t1,0(a5)
	ld	a7,8(a5)
	ld	a6,16(a5)
	ld	a0,24(a5)
	ld	a2,32(a5)
	ld	a5,40(a5)
	sd	t1,0(a3)
	sd	a7,8(a3)
	sd	a6,16(a3)
	sd	a0,24(a3)
	sd	a2,32(a3)
	sd	a5,40(a3)
	addi	a1,a1,1
.L35:
	addi	a4,a4,1
	ld	a5,.LANCHOR0+24
	beq	a5,a4,.L41
.L37:
	ld	a5,.LANCHOR0+32
	beq	a5,a4,.L42
.L34:
	ld	a5,.LANCHOR0+16
	bleu	a5,a4,.L43
	ld	a3,.LANCHOR0
	slli	a2,a4,1
	add	a2,a2,a4
	slli	a5,a2,4
	add	a5,a3,a5
	lhu	a2,32(a5)
	andi	a2,a2,128
	bne	a2,zero,.L35
	ld	a2,40(a5)
	beq	a2,zero,.L36
	sd	a1,0(a2)
	j	.L36
.L41:
	sd	a1,.LANCHOR0+24,a5
	j	.L37
.L42:
	sd	a1,.LANCHOR0+32,a5
	j	.L34
.L43:
	lla	a5,.LANCHOR0
	sd	a1,16(a5)
	sd	a1,40(a5)
	call	realloc_trackst
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	flush_deleted, .-flush_deleted
	.section	.text.mt_generate_geom,"ax",@progbits
	.align	1
	.type	mt_generate_geom, @function
mt_generate_geom:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	mt_generate_uniform
	fcvt.s.d	fa0,fa0
	call	logf
	fcvt.d.s	fa0,fa0
	fld	fa5,one_log1m_lambda,a5
	fmul.d	fa0,fa0,fa5
	fld	fa5,.LC2,a5
	fadd.d	fa0,fa0,fa5
	fld	fa5,.LC3,a5
	fgt.d	a5,fa0,fa5
	bne	a5,zero,.L46
	fcvt.lu.d a0,fa0,rtz
.L44:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L46:
	li	a0,-1
	srli	a0,a0,2
	j	.L44
	.size	mt_generate_geom, .-mt_generate_geom
	.section	.text.mt_generate_binom,"ax",@progbits
	.align	1
	.type	mt_generate_binom, @function
mt_generate_binom:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	li	s0,0
.L49:
	ld	a5,next_mt_generate_geom
	bgeu	a5,s1,.L52
	call	mt_generate_geom
	lla	a4,next_mt_generate_geom
	ld	a5,0(a4)
	add	a5,a5,a0
	sd	a5,0(a4)
	addi	s0,s0,1
	j	.L49
.L52:
	sub	a5,a5,s1
	sd	a5,next_mt_generate_geom,a4
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	mt_generate_binom, .-mt_generate_binom
	.section	.text.capture_callstack_postponed,"ax",@progbits
	.align	1
	.type	capture_callstack_postponed, @function
capture_callstack_postponed:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	li	a3,-1
	ld	a2,callstack_size
	lla	a1,callstack_buffer_len
	lla	a0,callstack_buffer
	call	caml_collect_current_callstack
	bne	a0,zero,.L54
	ld	s0,caml_atom_table
	addi	s0,s0,8
.L53:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L54:
	mv	s1,a0
	li	a1,0
	call	caml_alloc_shr_no_track_noexc
	mv	s0,a0
	bne	a0,zero,.L56
	ld	s0,caml_atom_table
	addi	s0,s0,8
	j	.L53
.L56:
	slli	a2,s1,3
	ld	a1,callstack_buffer
	call	memcpy
	ld	a5,callstack_buffer_len
	li	a4,256
	ble	a5,a4,.L53
	slli	s1,s1,3
	ble	a5,s1,.L53
	lla	s1,callstack_buffer
	ld	a0,0(s1)
	call	caml_stat_free
	sd	zero,0(s1)
	sd	zero,callstack_buffer_len,a5
	j	.L53
	.size	capture_callstack_postponed, .-capture_callstack_postponed
	.section	.text.shift_sample,"ax",@progbits
	.align	1
	.type	shift_sample, @function
shift_sample:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a4,caml_memprof_young_trigger
	ld	a5,Caml_state
	ld	a3,48(a5)
	sub	a5,a4,a3
	srai	a5,a5,3
	bleu	a5,a0,.L59
	slli	a0,a0,3
	sub	a0,a4,a0
	sd	a0,caml_memprof_young_trigger,a5
.L60:
	call	caml_update_young_limit
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L59:
	sd	a3,caml_memprof_young_trigger,a5
	j	.L60
	.size	shift_sample, .-shift_sample
	.section	.text.capture_callstack,"ax",@progbits
	.align	1
	.type	capture_callstack, @function
capture_callstack:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	a3,a0
	ld	a2,callstack_size
	lla	a1,callstack_buffer_len
	lla	a0,callstack_buffer
	call	caml_collect_current_callstack
	mv	s0,a0
	li	a1,0
	call	caml_alloc
	mv	s1,a0
	slli	a2,s0,3
	ld	a1,callstack_buffer
	call	memcpy
	ld	a5,callstack_buffer_len
	li	a4,256
	ble	a5,a4,.L62
	slli	s0,s0,3
	bgt	a5,s0,.L65
.L62:
	mv	a0,s1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L65:
	lla	s0,callstack_buffer
	ld	a0,0(s0)
	call	caml_stat_free
	sd	zero,0(s0)
	sd	zero,callstack_buffer_len,a5
	j	.L62
	.size	capture_callstack, .-capture_callstack
	.section	.text.handle_entry_callbacks_exn,"ax",@progbits
	.align	1
	.type	handle_entry_callbacks_exn, @function
handle_entry_callbacks_exn:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	lla	a3,.LANCHOR0
	ld	s0,0(a3)
	ld	a4,0(a0)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	add	s0,s0,a5
	ld	a5,32(a3)
	beq	a4,a5,.L87
.L67:
	ld	a5,32(s0)
	andi	a5,a5,384
	bne	a5,zero,.L81
	lhu	a5,32(s0)
	andi	a5,a5,16
	beq	a5,zero,.L88
.L69:
	ld	a5,32(s0)
	andi	a5,a5,36
	li	a4,4
	beq	a5,a4,.L89
.L74:
	ld	a5,32(s0)
	andi	a3,a5,72
	li	a4,8
	beq	a3,a4,.L90
	li	s2,1
.L66:
	mv	a0,s2
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L87:
	addi	a5,a5,1
	sd	a5,.LANCHOR0+32,a4
	j	.L67
.L88:
	lhu	a5,32(s0)
	ori	a5,a5,16
	sh	a5,32(s0)
	li	a1,0
	li	a0,4
	call	caml_alloc_small
	mv	a1,a0
	ld	a5,8(s0)
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,0(a0)
	ld	a5,16(s0)
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,8(a0)
	ld	a5,32(s0)
	srli	a5,a5,1
	andi	a5,a5,1
	slli	a5,a5,1
	addi	a5,a5,1
	sd	a5,16(a0)
	ld	a5,24(s0)
	sd	a5,24(a0)
	li	a5,1
	sd	a5,24(s0)
	lhu	a5,32(s0)
	andi	a5,a5,1
	beq	a5,zero,.L70
	ld	a5,tracker
	ld	a0,0(a5)
.L71:
	ld	a4,0(s1)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	lhu	a4,32(a5)
	ori	a4,a4,256
	sh	a4,32(a5)
	lla	s0,callback_running
	li	a4,1
	sw	a4,0(s0)
	sd	s1,40(a5)
	call	caml_callback_exn
	mv	s2,a0
	sw	zero,0(s0)
	ld	a4,0(s1)
	li	a5,-1
	beq	a4,a5,.L82
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,40(a5)
	lhu	a4,32(a5)
	andi	a4,a4,-257
	sh	a4,32(a5)
	andi	a5,a0,3
	li	a4,2
	beq	a5,a4,.L73
	li	a5,1
	beq	a0,a5,.L73
.L72:
	ld	a5,0(s1)
	li	a4,-1
	beq	a5,a4,.L66
	slli	s0,a5,1
	add	s0,s0,a5
	slli	a5,s0,4
	ld	s0,.LANCHOR0
	add	s0,s0,a5
	ld	a5,0(s2)
	sd	a5,24(s0)
	andi	a4,a5,1
	bne	a4,zero,.L69
	ld	a4,Caml_state
	ld	a3,40(a4)
	bgeu	a5,a3,.L69
	ld	a4,32(a4)
	bleu	a5,a4,.L69
	ld	a5,0(s1)
	ld	a4,.LANCHOR0+24
	bgeu	a5,a4,.L69
	sd	a5,.LANCHOR0+24,a4
	j	.L69
.L70:
	ld	a5,tracker
	ld	a0,8(a5)
	j	.L71
.L73:
	ld	a0,0(s1)
	call	mark_deleted
	li	a5,-1
	sd	a5,0(s1)
	j	.L72
.L82:
	li	s2,1
	j	.L72
.L89:
	lhu	a5,32(s0)
	ori	a5,a5,32
	sh	a5,32(s0)
	ld	a1,24(s0)
	li	a3,1
	sd	a3,24(s0)
	ld	a5,tracker
	ld	a0,16(a5)
	ld	a4,0(s1)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	lhu	a4,32(a5)
	ori	a4,a4,256
	sh	a4,32(a5)
	lla	s0,callback_running
	sw	a3,0(s0)
	sd	s1,40(a5)
	call	caml_callback_exn
	mv	s2,a0
	sw	zero,0(s0)
	ld	a4,0(s1)
	li	a5,-1
	beq	a4,a5,.L83
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,40(a5)
	lhu	a4,32(a5)
	andi	a4,a4,-257
	sh	a4,32(a5)
	andi	a5,a0,3
	li	a4,2
	beq	a5,a4,.L76
	li	a5,1
	beq	a0,a5,.L76
.L75:
	ld	a5,0(s1)
	li	a4,-1
	beq	a5,a4,.L66
	slli	s0,a5,1
	add	s0,s0,a5
	slli	a5,s0,4
	ld	s0,.LANCHOR0
	add	s0,s0,a5
	ld	a5,0(s2)
	sd	a5,24(s0)
	andi	a4,a5,1
	bne	a4,zero,.L74
	ld	a4,Caml_state
	ld	a3,40(a4)
	bgeu	a5,a3,.L74
	ld	a4,32(a4)
	bleu	a5,a4,.L74
	ld	a5,0(s1)
	ld	a4,.LANCHOR0+24
	bgeu	a5,a4,.L74
	sd	a5,.LANCHOR0+24,a4
	j	.L74
.L76:
	ld	a0,0(s1)
	call	mark_deleted
	li	a5,-1
	sd	a5,0(s1)
	j	.L75
.L83:
	li	s2,1
	j	.L75
.L90:
	andi	a5,a5,5
	li	a4,1
	beq	a5,a4,.L77
	ld	a5,tracker
	ld	a0,32(a5)
.L78:
	lhu	a5,32(s0)
	ori	a5,a5,64
	sh	a5,32(s0)
	ld	a1,24(s0)
	li	a3,1
	sd	a3,24(s0)
	ld	a4,0(s1)
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	lhu	a4,32(a5)
	ori	a4,a4,256
	sh	a4,32(a5)
	lla	s0,callback_running
	sw	a3,0(s0)
	sd	s1,40(a5)
	call	caml_callback_exn
	mv	s2,a0
	sw	zero,0(s0)
	ld	a4,0(s1)
	li	a5,-1
	beq	a4,a5,.L85
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a4,a5,4
	ld	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,40(a5)
	lhu	a4,32(a5)
	andi	a4,a4,-257
	sh	a4,32(a5)
	andi	a5,a0,3
	li	a4,2
	beq	a5,a4,.L80
	li	a5,1
	bne	a0,a5,.L66
.L80:
	ld	a0,0(s1)
	call	mark_deleted
	li	a5,-1
	sd	a5,0(s1)
	j	.L66
.L77:
	ld	a5,tracker
	ld	a0,24(a5)
	j	.L78
.L85:
	li	s2,1
	j	.L66
.L81:
	li	s2,1
	j	.L66
	.size	handle_entry_callbacks_exn, .-handle_entry_callbacks_exn
	.section	.text.caml_memprof_handle_postponed_exn,"ax",@progbits
	.align	1
	.globl	caml_memprof_handle_postponed_exn
	.type	caml_memprof_handle_postponed_exn, @function
caml_memprof_handle_postponed_exn:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	lw	a5,caml_memprof_suspended
	bne	a5,zero,.L97
	li	a5,1
	sw	a5,caml_memprof_suspended,a4
	li	s0,1
.L93:
	lla	a5,.LANCHOR0
	ld	a4,32(a5)
	ld	a5,16(a5)
	bgeu	a4,a5,.L95
	sd	a4,8(sp)
	addi	a0,sp,8
	call	handle_entry_callbacks_exn
	mv	s0,a0
	andi	a4,a0,3
	li	a5,2
	bne	a4,a5,.L93
.L95:
	sw	zero,caml_memprof_suspended,a5
	call	check_action_pending
	call	flush_deleted
.L91:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
.L97:
	li	s0,1
	j	.L91
	.size	caml_memprof_handle_postponed_exn, .-caml_memprof_handle_postponed_exn
	.section	.text.caml_memprof_oldify_young_roots,"ax",@progbits
	.align	1
	.globl	caml_memprof_oldify_young_roots
	.type	caml_memprof_oldify_young_roots, @function
caml_memprof_oldify_young_roots:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	s0,.LANCHOR0+24
.L100:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L103
	slli	a4,s0,1
	add	a4,a4,s0
	slli	a3,a4,4
	ld	a5,.LANCHOR0
	add	a5,a5,a3
	addi	a1,a5,24
	ld	a0,24(a5)
	call	caml_oldify_one
	addi	s0,s0,1
	j	.L100
.L103:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_oldify_young_roots, .-caml_memprof_oldify_young_roots
	.section	.text.caml_memprof_minor_update,"ax",@progbits
	.align	1
	.globl	caml_memprof_minor_update
	.type	caml_memprof_minor_update, @function
caml_memprof_minor_update:
	ld	a6,.LANCHOR0+24
	mv	a5,a6
	j	.L105
.L107:
	li	a3,1
	sd	a3,0(a4)
	lhu	a3,32(a4)
	ori	a3,a3,8
	sh	a3,32(a4)
.L106:
	addi	a5,a5,1
.L105:
	ld	a4,.LANCHOR0+16
	bleu	a4,a5,.L114
	slli	a4,a5,1
	add	a4,a4,a5
	slli	a3,a4,4
	ld	a4,.LANCHOR0
	add	a4,a4,a3
	ld	a3,0(a4)
	andi	a2,a3,1
	bne	a2,zero,.L106
	ld	a2,Caml_state
	ld	a1,40(a2)
	bgeu	a3,a1,.L106
	ld	a2,32(a2)
	bleu	a3,a2,.L106
	ld	a2,-8(a3)
	bne	a2,zero,.L107
	ld	a3,0(a3)
	sd	a3,0(a4)
	lhu	a3,32(a4)
	ori	a3,a3,4
	sh	a3,32(a4)
	j	.L106
.L114:
	ld	a5,.LANCHOR0+32
	bgtu	a5,a6,.L115
	lla	a5,.LANCHOR0
	ld	a4,16(a5)
	sd	a4,24(a5)
	ret
.L115:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	a6,.LANCHOR0+32,a5
	call	check_action_pending
	lla	a5,.LANCHOR0
	ld	a4,16(a5)
	sd	a4,24(a5)
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_minor_update, .-caml_memprof_minor_update
	.section	.text.caml_memprof_do_roots,"ax",@progbits
	.align	1
	.globl	caml_memprof_do_roots
	.type	caml_memprof_do_roots, @function
caml_memprof_do_roots:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	li	s0,0
.L117:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L120
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a5,a5,4
	ld	a4,.LANCHOR0
	add	a5,a4,a5
	addi	a1,a5,24
	ld	a0,24(a5)
	jalr	s1
	addi	s0,s0,1
	j	.L117
.L120:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_memprof_do_roots, .-caml_memprof_do_roots
	.section	.text.caml_memprof_update_clean_phase,"ax",@progbits
	.align	1
	.globl	caml_memprof_update_clean_phase
	.type	caml_memprof_update_clean_phase, @function
caml_memprof_update_clean_phase:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a5,0
	j	.L122
.L124:
	ld	a3,-8(a3)
	andi	a3,a3,768
	bne	a3,zero,.L123
	li	a3,1
	sd	a3,0(a4)
	lhu	a3,32(a4)
	ori	a3,a3,8
	sh	a3,32(a4)
.L123:
	addi	a5,a5,1
.L122:
	ld	a4,.LANCHOR0+16
	bleu	a4,a5,.L127
	slli	a4,a5,1
	add	a4,a4,a5
	slli	a3,a4,4
	ld	a4,.LANCHOR0
	add	a4,a4,a3
	ld	a3,0(a4)
	andi	a2,a3,1
	bne	a2,zero,.L123
	ld	a2,Caml_state
	ld	a1,40(a2)
	bgeu	a3,a1,.L124
	ld	a2,32(a2)
	bgtu	a3,a2,.L123
	j	.L124
.L127:
	sd	zero,.LANCHOR0+32,a5
	call	check_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_update_clean_phase, .-caml_memprof_update_clean_phase
	.section	.text.caml_memprof_invert_tracked,"ax",@progbits
	.align	1
	.globl	caml_memprof_invert_tracked
	.type	caml_memprof_invert_tracked, @function
caml_memprof_invert_tracked:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	s0,0
.L129:
	ld	a5,.LANCHOR0+16
	bleu	a5,s0,.L132
	slli	a5,s0,1
	add	a5,a5,s0
	slli	a4,a5,4
	ld	a1,.LANCHOR0
	add	a1,a1,a4
	ld	a0,0(a1)
	call	caml_invert_root
	addi	s0,s0,1
	j	.L129
.L132:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_invert_tracked, .-caml_memprof_invert_tracked
	.section	.text.caml_memprof_track_alloc_shr,"ax",@progbits
	.align	1
	.globl	caml_memprof_track_alloc_shr
	.type	caml_memprof_track_alloc_shr, @function
caml_memprof_track_alloc_shr:
	fld	fa5,lambda,a5
	fmv.d.x	fa4,zero
	feq.d	a5,fa5,fa4
	bne	a5,zero,.L138
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s0,a0
	lw	a5,caml_memprof_suspended
	beq	a5,zero,.L141
.L133:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L141:
	ld	a0,-8(a0)
	srli	a0,a0,10
	addi	a0,a0,1
	call	mt_generate_binom
	mv	s1,a0
	beq	a0,zero,.L133
	call	capture_callstack_postponed
	mv	s2,a0
	beq	a0,zero,.L133
	ld	s3,-8(s0)
	srli	s3,s3,10
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,1
	sd	a5,16(a4)
	call	realloc_trackst
	beq	a0,zero,.L142
	lla	a4,.LANCHOR0
	ld	a5,0(a4)
	ld	a3,16(a4)
	slli	a4,a3,1
	add	a4,a4,a3
	slli	a4,a4,4
	addi	a4,a4,-48
	add	a5,a5,a4
	sd	s0,0(a5)
	sd	s1,8(a5)
	sd	s3,16(a5)
	sd	s2,24(a5)
	sd	zero,40(a5)
	lhu	a4,32(a5)
	andi	a4,a4,-512
	sh	a4,32(a5)
.L136:
	call	check_action_pending
	j	.L133
.L142:
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,-1
	sd	a5,16(a4)
	j	.L136
.L138:
	ret
	.size	caml_memprof_track_alloc_shr, .-caml_memprof_track_alloc_shr
	.section	.text.caml_memprof_renew_minor_sample,"ax",@progbits
	.align	1
	.globl	caml_memprof_renew_minor_sample
	.type	caml_memprof_renew_minor_sample, @function
caml_memprof_renew_minor_sample:
	addi	sp,sp,-16
	sd	ra,8(sp)
	fld	fa5,lambda,a5
	fmv.d.x	fa4,zero
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L144
	ld	a5,Caml_state
	ld	a5,48(a5)
	sd	a5,caml_memprof_young_trigger,a4
.L145:
	call	caml_update_young_limit
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L144:
	call	mt_generate_geom
	ld	a4,Caml_state
	ld	a5,0(a4)
	ld	a3,48(a4)
	sub	a5,a5,a3
	srai	a5,a5,3
	bgeu	a5,a0,.L146
	sd	a3,caml_memprof_young_trigger,a5
.L146:
	ld	a4,0(a4)
	li	a5,1
	sub	a0,a5,a0
	slli	a0,a0,3
	add	a0,a4,a0
	sd	a0,caml_memprof_young_trigger,a5
	j	.L145
	.size	caml_memprof_renew_minor_sample, .-caml_memprof_renew_minor_sample
	.section	.text.caml_memprof_track_young,"ax",@progbits
	.align	1
	.globl	caml_memprof_track_young
	.type	caml_memprof_track_young, @function
caml_memprof_track_young:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	s3,152(sp)
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s6,128(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	sd	s10,96(sp)
	sd	s11,88(sp)
	fsd	fs0,72(sp)
	fsd	fs1,64(sp)
	sd	a0,8(sp)
	sd	a2,24(sp)
	addi	a5,a0,1
	sd	a5,16(sp)
	fld	fs0,lambda,a5
	lw	s7,caml_memprof_suspended
	bne	s7,zero,.L183
	mv	s6,a3
	bne	a1,zero,.L151
	ld	a0,caml_memprof_young_trigger
	addi	a0,a0,-8
	ld	a5,Caml_state
	ld	a5,0(a5)
	sub	a0,a0,a5
	srai	a0,a0,3
	call	mt_generate_binom
	addiw	s1,a0,1
	call	caml_memprof_renew_minor_sample
	call	capture_callstack_postponed
	mv	s0,a0
	bne	a0,zero,.L184
.L148:
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	ld	s2,160(sp)
	ld	s3,152(sp)
	ld	s4,144(sp)
	ld	s5,136(sp)
	ld	s6,128(sp)
	ld	s7,120(sp)
	ld	s8,112(sp)
	ld	s9,104(sp)
	ld	s10,96(sp)
	ld	s11,88(sp)
	fld	fs0,72(sp)
	fld	fs1,64(sp)
	addi	sp,sp,192
	jr	ra
.L183:
	call	caml_memprof_renew_minor_sample
	j	.L148
.L184:
	slli	s1,s1,32
	srli	s1,s1,32
	ld	a5,Caml_state
	ld	s2,0(a5)
	addi	s2,s2,8
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,1
	sd	a5,16(a4)
	call	realloc_trackst
	beq	a0,zero,.L185
	lla	a4,.LANCHOR0
	ld	a5,0(a4)
	ld	a3,16(a4)
	slli	a4,a3,1
	add	a4,a4,a3
	slli	a4,a4,4
	addi	a4,a4,-48
	add	a5,a5,a4
	sd	s2,0(a5)
	sd	s1,8(a5)
	ld	a4,8(sp)
	sd	a4,16(a5)
	sd	s0,24(a5)
	sd	zero,40(a5)
	lhu	a4,32(a5)
	ori	a4,a4,1
	andi	a4,a4,-511
	sh	a4,32(a5)
.L153:
	call	check_action_pending
	j	.L148
.L185:
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,-1
	sd	a5,16(a4)
	j	.L153
.L151:
	ld	a4,Caml_state
	ld	a5,0(a4)
	ld	s0,caml_memprof_young_trigger
	sub	s0,s0,a5
	srai	s0,s0,3
	ld	a3,16(sp)
	mv	s2,a3
	slli	a3,a3,3
	sd	a3,40(sp)
	add	a5,a5,a3
	sd	a5,0(a4)
	call	caml_memprof_renew_minor_sample
	li	a5,1
	sw	a5,caml_memprof_suspended,a4
	ld	a5,24(sp)
	addiw	s4,a5,-1
	sd	s7,32(sp)
	mv	s9,s7
	addi	s11,sp,56
	li	s10,1
	j	.L154
.L155:
	lw	s3,8(sp)
	j	.L156
.L158:
	addiw	s1,s1,1
	call	mt_generate_geom
	sub	s0,s0,a0
.L157:
	bgt	s0,s2,.L158
	bne	s1,zero,.L186
.L159:
	addiw	s4,s4,-1
.L154:
	blt	s4,zero,.L166
	beq	s6,zero,.L155
	add	a5,s6,s4
	lbu	s3,0(a5)
	addiw	s3,s3,1
.L156:
	addiw	a5,s3,1
	slli	a5,a5,32
	srli	a5,a5,32
	sub	s2,s2,a5
	li	s1,0
	j	.L157
.L186:
	mv	a0,s4
	call	capture_callstack
	mv	s8,a0
	slli	s1,s1,32
	srli	s1,s1,32
	slli	s3,s3,32
	srli	s3,s3,32
	li	s5,69206016
	add	s5,s2,s5
	slli	s5,s5,1
	addi	s5,s5,1
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,1
	sd	a5,16(a4)
	call	realloc_trackst
	beq	a0,zero,.L187
	lla	a4,.LANCHOR0
	ld	a5,0(a4)
	ld	a3,16(a4)
	slli	a4,a3,1
	add	a4,a4,a3
	slli	a4,a4,4
	addi	a4,a4,-48
	add	a5,a5,a4
	sd	s5,0(a5)
	sd	s1,8(a5)
	sd	s3,16(a5)
	sd	s8,24(a5)
	sd	zero,40(a5)
	lhu	a4,32(a5)
	ori	a4,a4,1
	andi	a4,a4,-511
	sh	a4,32(a5)
	addi	a3,a3,-1
.L161:
	sd	a3,48(sp)
	li	a5,-1
	beq	a3,a5,.L159
	addi	a0,sp,48
	call	handle_entry_callbacks_exn
	mv	s10,a0
	ld	a4,48(sp)
	li	a5,-1
	beq	a4,a5,.L188
.L163:
	andi	a5,s10,3
	li	a4,2
	beq	a5,a4,.L166
	ld	a4,48(sp)
	li	a5,-1
	beq	a4,a5,.L159
	li	a5,1
	beq	s9,a5,.L189
.L165:
	slli	a4,s9,3
	add	a4,s11,a4
	ld	a3,48(sp)
	sd	a3,0(a4)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,4
	ld	a3,.LANCHOR0
	add	a5,a3,a5
	sd	a4,40(a5)
	addiw	s9,s9,1
	j	.L159
.L187:
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,-1
	sd	a5,16(a4)
	li	a3,-1
	j	.L161
.L188:
	fld	fs1,lambda,a5
	feq.d	a5,fs1,fs0
	bne	a5,zero,.L178
	fmv.d.x	fa5,zero
	feq.d	a5,fs1,fa5
	beq	a5,zero,.L190
	fmv.d	fs0,fs1
	li	s0,0
	li	a5,1
	sd	a5,32(sp)
	j	.L163
.L190:
	call	mt_generate_geom
	sub	s0,s2,a0
	addi	s0,s0,1
	fmv.d	fs0,fs1
	li	a5,1
	sd	a5,32(sp)
	j	.L163
.L178:
	li	a5,1
	sd	a5,32(sp)
	j	.L163
.L189:
	ld	a5,24(sp)
	slli	a0,a5,3
	call	caml_stat_alloc_noexc
	mv	s11,a0
	beq	a0,zero,.L180
	ld	a5,56(sp)
	sd	a5,0(a0)
	li	a4,-1
	beq	a5,a4,.L165
	slli	a4,a5,1
	add	a5,a4,a5
	slli	a5,a5,4
	ld	a4,.LANCHOR0
	add	a5,a4,a5
	sd	a0,40(a5)
	j	.L165
.L180:
	addi	s11,sp,56
.L166:
	sw	zero,caml_memprof_suspended,a5
	call	check_action_pending
	ld	a5,32(sp)
	bne	a5,zero,.L191
.L168:
	andi	a5,s10,3
	li	a4,2
	beq	a5,a4,.L169
	ld	a4,Caml_state
	ld	a5,0(a4)
	ld	a3,40(sp)
	neg	s0,a3
	sub	a5,a5,a3
	ld	a4,72(a4)
	bltu	a5,a4,.L192
.L174:
	ld	a4,Caml_state
	ld	a5,0(a4)
	add	a5,a5,s0
	sd	a5,0(a4)
	ld	a0,16(sp)
	call	shift_sample
	j	.L175
.L191:
	call	flush_deleted
	j	.L168
.L171:
	addiw	s7,s7,1
.L169:
	bge	s7,s9,.L193
	slli	a4,s7,3
	add	a4,s11,a4
	ld	a3,0(a4)
	li	a5,-1
	beq	a3,a5,.L171
	lla	a2,.LANCHOR0
	ld	a5,0(a2)
	li	a1,48
	mul	a3,a3,a1
	add	a5,a5,a3
	li	a3,1
	sd	a3,0(a5)
	lhu	a3,32(a5)
	ori	a3,a3,8
	sh	a3,32(a5)
	ld	a3,32(a2)
	ld	a5,0(a4)
	bleu	a3,a5,.L171
	sd	a5,.LANCHOR0+32,a4
	call	check_action_pending
	j	.L171
.L193:
	addi	a5,sp,56
	beq	s11,a5,.L173
	mv	a0,s11
	call	caml_stat_free
.L173:
	andi	a0,s10,-4
	call	caml_raise
.L192:
	call	caml_gc_dispatch
	j	.L174
.L176:
	addiw	s7,s7,1
.L175:
	bge	s7,s9,.L194
	slli	a4,s7,3
	add	a4,s11,a4
	ld	a2,0(a4)
	li	a5,-1
	beq	a2,a5,.L176
	lla	a1,.LANCHOR0
	ld	a3,0(a1)
	slli	a5,a2,1
	add	a5,a5,a2
	slli	a5,a5,4
	add	a3,a3,a5
	ld	a5,Caml_state
	ld	a2,0(a5)
	ld	a5,0(a3)
	srai	a5,a5,1
	slli	a5,a5,48
	srli	a5,a5,48
	addi	a5,a5,1
	slli	a5,a5,3
	add	a5,a2,a5
	sd	a5,0(a3)
	sd	zero,40(a3)
	ld	a5,0(a4)
	ld	a4,24(a1)
	bgeu	a5,a4,.L176
	sd	a5,.LANCHOR0+24,a4
	j	.L176
.L194:
	addi	a5,sp,56
	beq	s11,a5,.L148
	mv	a0,s11
	call	caml_stat_free
	j	.L148
	.size	caml_memprof_track_young, .-caml_memprof_track_young
	.section	.text.caml_memprof_track_interned,"ax",@progbits
	.align	1
	.globl	caml_memprof_track_interned
	.type	caml_memprof_track_interned, @function
caml_memprof_track_interned:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	sd	s6,0(sp)
	mv	s0,a0
	mv	s3,a1
	addi	a5,a0,8
	ld	a4,Caml_state
	ld	a3,40(a4)
	bgeu	a5,a3,.L204
	ld	a4,32(a4)
	bgtu	a5,a4,.L205
	li	s4,0
	j	.L196
.L204:
	li	s4,0
.L196:
	fld	fa5,lambda,a5
	fmv.d.x	fa4,zero
	feq.d	a5,fa5,fa4
	bne	a5,zero,.L195
	lw	a5,caml_memprof_suspended
	bne	a5,zero,.L195
	li	s2,0
	j	.L203
.L205:
	li	s4,1
	j	.L196
.L200:
	beq	s2,zero,.L198
	sub	a0,s0,s1
	srai	a0,a0,3
	call	mt_generate_binom
	addi	s6,a0,1
	ld	s1,0(s5)
	srli	s1,s1,10
	addi	s5,s5,8
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,1
	sd	a5,16(a4)
	call	realloc_trackst
	beq	a0,zero,.L207
	lla	a4,.LANCHOR0
	ld	a5,0(a4)
	ld	a3,16(a4)
	slli	a4,a3,1
	add	a4,a4,a3
	slli	a4,a4,4
	addi	a4,a4,-48
	add	a5,a5,a4
	sd	s5,0(a5)
	sd	s6,8(a5)
	sd	s1,16(a5)
	sd	s2,24(a5)
	sd	zero,40(a5)
	lhu	a4,32(a5)
	andi	a4,a4,-2
	or	a4,s4,a4
	ori	a4,a4,2
	andi	a4,a4,-509
	sh	a4,32(a5)
.L203:
	call	mt_generate_geom
	sub	a5,s3,s0
	srai	a5,a5,3
	bltu	a5,a0,.L198
	slli	s1,a0,3
	add	s1,s0,s1
.L199:
	ld	a5,0(s0)
	srli	a5,a5,10
	addi	a5,a5,1
	slli	a5,a5,3
	mv	s5,s0
	add	s0,s0,a5
	bgtu	s1,s0,.L199
	bne	s2,zero,.L200
	call	capture_callstack_postponed
	mv	s2,a0
	j	.L200
.L207:
	lla	a4,.LANCHOR0
	ld	a5,16(a4)
	addi	a5,a5,-1
	sd	a5,16(a4)
	j	.L203
.L198:
	call	check_action_pending
.L195:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	ld	s6,0(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_memprof_track_interned, .-caml_memprof_track_interned
	.section	.text.caml_memprof_shutdown,"ax",@progbits
	.align	1
	.globl	caml_memprof_shutdown
	.type	caml_memprof_shutdown, @function
caml_memprof_shutdown:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	sw	zero,init,a5
	sw	zero,started,a5
	lla	a5,lambda
	sd	zero,0(a5)
	sw	zero,caml_memprof_suspended,a5
	lla	s0,.LANCHOR0
	sd	zero,16(s0)
	sd	zero,40(s0)
	sd	zero,24(s0)
	sd	zero,32(s0)
	ld	a0,0(s0)
	call	caml_stat_free
	sd	zero,0(s0)
	sd	zero,8(s0)
	lla	s0,callstack_buffer
	ld	a0,0(s0)
	call	caml_stat_free
	sd	zero,0(s0)
	sd	zero,callstack_buffer_len,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_shutdown, .-caml_memprof_shutdown
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC4:
	.string	"Gc.Memprof.start: already started."
	.align	3
.LC5:
	.string	"Gc.Memprof.start"
	.section	.text.caml_memprof_start,"ax",@progbits
	.align	1
	.globl	caml_memprof_start
	.type	caml_memprof_start, @function
caml_memprof_start:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	fsd	fs0,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,3
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	fld	fs0,0(a0)
	lw	a5,started
	bne	a5,zero,.L225
	srai	s0,a1,1
	blt	s0,zero,.L212
	fmv.d.x	fa5,zero
	fge.d	a5,fs0,fa5
	beq	a5,zero,.L212
	fld	fa5,.LC2,a5
	fgt.d	a5,fs0,fa5
	bne	a5,zero,.L212
	lw	a5,init
	beq	a5,zero,.L226
.L216:
	fsd	fs0,lambda,a5
	fmv.d.x	fa5,zero
	fgt.d	a5,fs0,fa5
	beq	a5,zero,.L217
	fld	fa5,.LC2,a5
	feq.d	a5,fs0,fa5
	beq	a5,zero,.L227
	fmv.d.x	fa0,zero
.L219:
	fsd	fa0,one_log1m_lambda,a5
	call	mt_generate_geom
	sd	a0,next_mt_generate_geom,a5
.L217:
	call	caml_memprof_renew_minor_sample
	sd	s0,callstack_size,a5
	li	a5,1
	sw	a5,started,a4
	lla	a0,tracker
	ld	a5,8(sp)
	sd	a5,0(a0)
	call	caml_register_generational_global_root
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	fld	fs0,104(sp)
	addi	sp,sp,144
	jr	ra
.L225:
	lla	a0,.LC4
	call	caml_failwith
.L212:
	lla	a0,.LC5
	call	caml_invalid_argument
.L226:
	call	caml_memprof_init
	j	.L216
.L227:
	fneg.d	fa0,fs0
	call	caml_log1p
	fld	fa5,.LC2,a5
	fdiv.d	fa0,fa5,fa0
	j	.L219
	.size	caml_memprof_start, .-caml_memprof_start
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"Gc.Memprof.stop: not started."
	.section	.text.caml_memprof_stop,"ax",@progbits
	.align	1
	.globl	caml_memprof_stop
	.type	caml_memprof_stop, @function
caml_memprof_stop:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	lw	a5,started
	beq	a5,zero,.L234
	call	caml_memprof_handle_postponed_exn
	call	caml_raise_if_exception
	li	a5,0
	j	.L230
.L234:
	lla	a0,.LC6
	call	caml_failwith
.L231:
	addi	a5,a5,1
.L230:
	ld	a4,.LANCHOR0+16
	bleu	a4,a5,.L235
	slli	a4,a5,1
	add	a4,a4,a5
	slli	a3,a4,4
	ld	a4,.LANCHOR0
	add	a4,a4,a3
	ld	a4,40(a4)
	beq	a4,zero,.L231
	li	a3,-1
	sd	a3,0(a4)
	j	.L231
.L235:
	lla	s0,.LANCHOR0
	sd	zero,16(s0)
	sd	zero,40(s0)
	sd	zero,24(s0)
	sd	zero,32(s0)
	ld	a0,0(s0)
	call	caml_stat_free
	sd	zero,0(s0)
	sd	zero,8(s0)
	lla	a5,lambda
	sd	zero,0(a5)
	call	caml_memprof_renew_minor_sample
	sw	zero,started,a5
	lla	a0,tracker
	call	caml_remove_generational_global_root
	lla	s0,callstack_buffer
	ld	a0,0(s0)
	call	caml_stat_free
	sd	zero,0(s0)
	sd	zero,callstack_buffer_len,a5
	li	a0,1
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_stop, .-caml_memprof_stop
	.section	.text.caml_memprof_init_th_ctx,"ax",@progbits
	.align	1
	.globl	caml_memprof_init_th_ctx
	.type	caml_memprof_init_th_ctx, @function
caml_memprof_init_th_ctx:
	sw	zero,0(a0)
	sw	zero,4(a0)
	ret
	.size	caml_memprof_init_th_ctx, .-caml_memprof_init_th_ctx
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"Thread.exit called from a memprof callback."
	.section	.text.caml_memprof_stop_th_ctx,"ax",@progbits
	.align	1
	.globl	caml_memprof_stop_th_ctx
	.type	caml_memprof_stop_th_ctx, @function
caml_memprof_stop_th_ctx:
	lw	a5,4(a0)
	bne	a5,zero,.L242
	ret
.L242:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC7
	call	caml_fatal_error
	.size	caml_memprof_stop_th_ctx, .-caml_memprof_stop_th_ctx
	.section	.text.caml_memprof_save_th_ctx,"ax",@progbits
	.align	1
	.globl	caml_memprof_save_th_ctx
	.type	caml_memprof_save_th_ctx, @function
caml_memprof_save_th_ctx:
	lw	a5,caml_memprof_suspended
	sw	a5,0(a0)
	lw	a5,callback_running
	sw	a5,4(a0)
	ret
	.size	caml_memprof_save_th_ctx, .-caml_memprof_save_th_ctx
	.section	.text.caml_memprof_restore_th_ctx,"ax",@progbits
	.align	1
	.globl	caml_memprof_restore_th_ctx
	.type	caml_memprof_restore_th_ctx, @function
caml_memprof_restore_th_ctx:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a5,0(a0)
	sw	a5,caml_memprof_suspended,a4
	lw	a5,4(a0)
	sw	a5,callback_running,a4
	call	check_action_pending
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_memprof_restore_th_ctx, .-caml_memprof_restore_th_ctx
	.globl	caml_memprof_young_trigger
	.globl	caml_memprof_suspended
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1039138816
	.align	3
.LC1:
	.word	0
	.word	1038090240
	.align	3
.LC2:
	.word	0
	.word	1072693248
	.align	3
.LC3:
	.word	0
	.word	1137704960
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	trackst, @object
	.size	trackst, 48
trackst:
	.zero	48
	.type	mt_state, @object
	.size	mt_state, 2496
mt_state:
	.zero	2496
	.section	.sbss,"aw",@nobits
	.align	3
	.type	next_mt_generate_geom, @object
	.size	next_mt_generate_geom, 8
next_mt_generate_geom:
	.zero	8
	.type	callstack_buffer_len, @object
	.size	callstack_buffer_len, 8
callstack_buffer_len:
	.zero	8
	.type	callstack_buffer, @object
	.size	callstack_buffer, 8
callstack_buffer:
	.zero	8
	.type	started, @object
	.size	started, 4
started:
	.zero	4
	.type	init, @object
	.size	init, 4
init:
	.zero	4
	.type	caml_memprof_young_trigger, @object
	.size	caml_memprof_young_trigger, 8
caml_memprof_young_trigger:
	.zero	8
	.type	tracker, @object
	.size	tracker, 8
tracker:
	.zero	8
	.type	callstack_size, @object
	.size	callstack_size, 8
callstack_size:
	.zero	8
	.type	callback_running, @object
	.size	callback_running, 4
callback_running:
	.zero	4
	.type	caml_memprof_suspended, @object
	.size	caml_memprof_suspended, 4
caml_memprof_suspended:
	.zero	4
	.type	one_log1m_lambda, @object
	.size	one_log1m_lambda, 8
one_log1m_lambda:
	.zero	8
	.type	lambda, @object
	.size	lambda, 8
lambda:
	.zero	8
	.type	mt_index, @object
	.size	mt_index, 4
mt_index:
	.zero	4
	.ident	"GCC: (GNU) 9.2.0"
