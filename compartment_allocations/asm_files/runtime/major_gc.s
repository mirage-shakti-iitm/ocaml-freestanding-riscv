	.file	"major_gc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.init_sweep_phase,"ax",@progbits
	.align	1
	.type	init_sweep_phase, @function
init_sweep_phase:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	lla	s0,caml_gc_sweep_hp
	lla	s1,caml_heap_start
	ld	a5,0(s1)
	sd	a5,0(s0)
	ld	a5,caml_fl_p_init_merge
	jalr	a5
	li	a5,2
	sw	a5,caml_gc_phase,a4
	ld	a5,0(s1)
	sd	a5,chunk,a4
	sd	a5,0(s0)
	ld	a4,-16(a5)
	add	a5,a5,a4
	sd	a5,limit,a4
	ld	a5,caml_fl_cur_wsz
	sd	a5,caml_fl_wsz_at_phase_change,a4
	ld	a5,caml_major_gc_hook
	beq	a5,zero,.L1
	jalr	a5
.L1:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	init_sweep_phase, .-init_sweep_phase
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Growing gray_vals to %luk bytes\n"
	.align	3
.LC1:
	.string	"No room for growing gray_vals\n"
	.section	.text.realloc_gray_vals,"ax",@progbits
	.align	1
	.type	realloc_gray_vals, @function
realloc_gray_vals:
	ld	a5,Caml_state
	ld	a4,328(a5)
	srai	a5,a4,63
	andi	a5,a5,31
	add	a5,a5,a4
	srai	a5,a5,5
	ld	a2,gray_vals_size
	bgtu	a5,a2,.L12
	srli	a2,a2,1
	slli	a2,a2,3
	ld	a5,gray_vals
	add	a2,a5,a2
	sd	a2,gray_vals_cur,a5
	sw	zero,heap_is_pure,a5
	ret
.L12:
	addi	sp,sp,-16
	sd	ra,8(sp)
	slli	a2,a2,3
	srli	a2,a2,9
	lla	a1,.LC0
	li	a0,8
	call	caml_gc_message
	ld	a1,gray_vals_size
	slli	a1,a1,4
	ld	a0,gray_vals
	call	caml_stat_resize_noexc
	beq	a0,zero,.L13
	sd	a0,gray_vals,a5
	lla	a3,gray_vals_size
	ld	a5,0(a3)
	slli	a4,a5,3
	add	a4,a0,a4
	sd	a4,gray_vals_cur,a2
	slli	a4,a5,1
	sd	a4,0(a3)
	slli	a5,a5,4
	add	a0,a0,a5
	sd	a0,gray_vals_end,a5
.L4:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L13:
	lla	a1,.LC1
	li	a0,8
	call	caml_gc_message
	ld	a5,gray_vals
	sd	a5,gray_vals_cur,a4
	sw	zero,heap_is_pure,a5
	j	.L4
	.size	realloc_gray_vals, .-realloc_gray_vals
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Starting new major GC cycle\n"
	.section	.text.start_cycle,"ax",@progbits
	.align	1
	.type	start_cycle, @function
start_cycle:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC2
	li	a0,1
	call	caml_gc_message
	call	caml_darken_all_roots_start
	sw	zero,caml_gc_phase,a5
	li	a5,10
	sw	a5,caml_gc_subphase,a4
	sd	zero,markhp,a5
	li	a5,1
	sw	a5,ephe_list_pure,a4
	lla	a5,caml_ephe_list_head
	sd	a5,ephes_checked_if_pure,a4
	sd	a5,ephes_to_check,a4
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	start_cycle, .-start_cycle
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Cleaning %ld words\n"
	.section	.text.clean_slice,"ax",@progbits
	.align	1
	.type	clean_slice, @function
clean_slice:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	sd	s7,24(sp)
	sd	s8,16(sp)
	sd	s9,8(sp)
	mv	s6,a0
	mv	a2,a0
	lla	a1,.LC3
	li	a0,64
	call	caml_gc_message
	j	.L17
.L19:
	srli	s5,s5,10
	li	s4,2
	li	s7,0
	j	.L21
.L33:
	mv	a0,s2
	call	caml_realloc_ephe_ref_table
.L26:
	ld	a5,24(s2)
	addi	a4,a5,16
	sd	a4,24(s2)
	sd	s1,0(a5)
	sd	s4,8(a5)
.L22:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L23
	andi	a5,s0,1
	bne	a5,zero,.L23
	mv	s2,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,3
	beq	a0,zero,.L23
	addi	s9,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L24
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L24
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L24
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L24
	li	a4,246
	beq	a5,a4,.L24
	li	a4,253
	beq	a5,a4,.L24
	sd	s0,0(s3)
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s0,a4,.L22
	ld	a4,32(a5)
	bleu	s0,a4,.L22
	ld	s2,112(a5)
	ld	a4,24(s2)
	ld	a5,32(s2)
	bltu	a4,a5,.L26
	j	.L33
.L24:
	ld	a5,0(s9)
	andi	a5,a5,768
	bne	a5,zero,.L23
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s2,a4,.L27
	ld	a5,32(a5)
	bgtu	s2,a5,.L23
.L27:
	ld	a5,caml_ephe_none
	sd	a5,0(s3)
	li	s7,1
.L23:
	addi	s4,s4,1
.L21:
	bleu	s5,s4,.L34
	slli	s3,s4,3
	add	s3,s3,s1
	ld	s0,0(s3)
	j	.L22
.L34:
	ld	a4,8(s1)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L29
	beq	s7,zero,.L29
	sd	a5,8(s1)
.L29:
	sd	s1,ephes_to_check,a5
	ld	a0,-8(s1)
	srli	a0,a0,10
	sub	s6,s6,a0
	addi	s6,s6,-1
.L17:
	ble	s6,zero,.L16
	ld	a5,ephes_to_check
	ld	s1,0(a5)
	beq	s1,zero,.L18
	ld	s5,-8(s1)
	andi	a4,s5,768
	bne	a4,zero,.L19
	ld	a4,0(s1)
	sd	a4,0(a5)
	addi	s6,s6,-1
	j	.L17
.L18:
	call	init_sweep_phase
.L16:
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	ld	s4,48(sp)
	ld	s5,40(sp)
	ld	s6,32(sp)
	ld	s7,24(sp)
	ld	s8,16(sp)
	ld	s9,8(sp)
	addi	sp,sp,96
	jr	ra
	.size	clean_slice, .-clean_slice
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Sweeping %ld words\n"
	.section	.text.sweep_slice,"ax",@progbits
	.align	1
	.type	sweep_slice, @function
sweep_slice:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	mv	a2,a0
	lla	a1,.LC4
	li	a0,64
	call	caml_gc_message
	j	.L36
.L38:
	addi	a0,a4,8
	ld	a5,caml_fl_p_merge_block
	jalr	a5
	sd	a0,caml_gc_sweep_hp,a5
	j	.L36
.L39:
	addi	a4,a4,8
	sd	a4,caml_fl_merge,a5
	j	.L36
.L37:
	lla	a4,chunk
	ld	a5,0(a4)
	ld	a5,-8(a5)
	sd	a5,0(a4)
	beq	a5,zero,.L47
	sd	a5,caml_gc_sweep_hp,a4
	ld	a4,-16(a5)
	add	a5,a5,a4
	sd	a5,limit,a4
.L36:
	ble	s0,zero,.L35
	ld	a4,caml_gc_sweep_hp
	ld	a1,limit
	bgeu	a4,a1,.L37
	ld	a3,0(a4)
	srli	a5,a3,10
	sub	s0,s0,a5
	addi	s0,s0,-1
	addi	a5,a5,1
	slli	a5,a5,3
	add	a5,a4,a5
	sd	a5,caml_gc_sweep_hp,a2
	andi	a5,a3,768
	beq	a5,zero,.L38
	li	a2,512
	beq	a5,a2,.L39
	andi	a3,a3,-769
	sd	a3,0(a4)
	j	.L36
.L47:
	ld	a4,Caml_state
	ld	a5,320(a4)
	addi	a5,a5,1
	sd	a5,320(a4)
	li	a5,3
	sw	a5,caml_gc_phase,a4
	call	caml_request_minor_gc
.L35:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	sweep_slice, .-sweep_slice
	.section	.text.mark_ephe_aux,"ax",@progbits
	.align	1
	.type	mark_ephe_aux, @function
mark_ephe_aux:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	sd	s5,40(sp)
	sd	s6,32(sp)
	sd	s7,24(sp)
	sd	s8,16(sp)
	sd	s9,8(sp)
	sd	s10,0(sp)
	mv	s2,a0
	mv	s3,a1
	ld	a5,ephes_to_check
	ld	s1,0(a5)
	ld	s6,-8(s1)
	ld	s0,8(s1)
	ld	a5,caml_ephe_none
	beq	a5,s0,.L49
	mv	s7,s1
	andi	a5,s0,1
	beq	a5,zero,.L71
.L49:
	ld	a5,0(s3)
	addi	a5,a5,-1
	sd	a5,0(s3)
	mv	a0,s2
.L64:
	ld	a5,ephes_checked_if_pure
	ld	a4,ephes_to_check
	beq	a5,a4,.L72
	ld	a3,0(s1)
	sd	a3,0(a4)
	ld	a4,0(a5)
	sd	a4,0(s1)
	sd	s1,0(a5)
	sd	s1,ephes_checked_if_pure,a5
.L48:
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	ld	s4,48(sp)
	ld	s5,40(sp)
	ld	s6,32(sp)
	ld	s7,24(sp)
	ld	s8,16(sp)
	ld	s9,8(sp)
	ld	s10,0(sp)
	addi	sp,sp,96
	jr	ra
.L71:
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L49
	ld	a5,-8(s0)
	andi	a5,a5,768
	bne	a5,zero,.L49
	andi	a5,s6,768
	beq	a5,zero,.L67
	li	s8,1
.L50:
	srli	s6,s6,10
	li	s5,2
	j	.L51
.L67:
	li	s8,0
	j	.L50
.L73:
	sd	s0,0(s4)
.L52:
	ld	a5,caml_ephe_none
	beq	a5,s0,.L53
	andi	a5,s0,1
	bne	a5,zero,.L53
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L53
	addi	s10,s0,-8
	lbu	a4,-8(s0)
	li	a5,250
	bne	a4,a5,.L54
	ld	s0,0(s0)
	andi	a5,s0,1
	bne	a5,zero,.L54
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a5,a0,7
	beq	a5,zero,.L54
	lbu	a5,-8(s0)
	li	a4,250
	beq	a5,a4,.L54
	li	a4,246
	beq	a5,a4,.L54
	li	a4,253
	bne	a5,a4,.L73
.L54:
	ld	a5,0(s10)
	andi	a5,a5,768
	bne	a5,zero,.L53
	li	s8,0
.L53:
	addi	s5,s5,1
.L51:
	beq	s8,zero,.L55
	bgeu	s5,s6,.L55
	slli	s4,s5,3
	add	s4,s4,s7
	ld	s0,0(s4)
	j	.L52
.L55:
	ld	a5,0(s3)
	sub	s5,a5,s5
	addi	s5,s5,-1
	sd	s5,0(s3)
	bne	s8,zero,.L74
	sd	s1,ephes_to_check,a5
	mv	a0,s2
	j	.L48
.L74:
	ld	s0,8(s1)
	andi	a5,s0,1
	beq	a5,zero,.L75
.L58:
	mv	a0,s2
	j	.L64
.L75:
	mv	s5,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a5,a0,1
	beq	a5,zero,.L58
	ld	s3,-8(s0)
	andi	a5,s3,0xff
	li	a3,250
	beq	a5,a3,.L76
	li	a3,249
	beq	a5,a3,.L77
.L60:
	andi	a5,s3,768
	bne	a5,zero,.L58
	sw	zero,ephe_list_pure,a5
	andi	a5,s3,-769
	ori	a5,a5,256
	sd	a5,-8(s0)
	addi	a5,s2,8
	sd	s0,0(s2)
	ld	a4,gray_vals_end
	bgeu	a5,a4,.L78
	mv	s2,a5
	j	.L58
.L76:
	ld	s4,0(s0)
	andi	a5,s4,1
	bne	a5,zero,.L60
	mv	s6,a5
	beq	a5,zero,.L79
.L61:
	sd	s4,8(s1)
	bne	s6,zero,.L60
	ld	a5,Caml_state
	ld	a3,40(a5)
	bleu	a3,s4,.L60
	ld	a4,32(a5)
	bleu	s4,a4,.L60
	bgeu	s5,a3,.L62
	bgtu	s5,a4,.L60
.L62:
	ld	s4,112(a5)
	ld	a4,24(s4)
	ld	a5,32(s4)
	bgeu	a4,a5,.L80
.L63:
	ld	a5,24(s4)
	addi	a4,a5,16
	sd	a4,24(s4)
	sd	s1,0(a5)
	li	a4,1
	sd	a4,8(a5)
	j	.L60
.L79:
	mv	a0,s4
	call	caml_page_table_lookup
	andi	a5,a0,7
	beq	a5,zero,.L60
	lbu	a5,-8(s4)
	li	a4,250
	beq	a5,a4,.L60
	li	a4,246
	beq	a5,a4,.L60
	li	a4,253
	bne	a5,a4,.L61
	j	.L60
.L80:
	mv	a0,s4
	call	caml_realloc_ephe_ref_table
	j	.L63
.L77:
	srli	s0,s3,10
	slli	s0,s0,3
	sub	s0,s5,s0
	ld	s3,-8(s0)
	j	.L60
.L78:
	lla	s0,gray_vals_cur
	sd	a5,0(s0)
	call	realloc_gray_vals
	ld	s2,0(s0)
	j	.L58
.L72:
	sd	s1,ephes_checked_if_pure,a5
	sd	s1,ephes_to_check,a5
	j	.L48
	.size	mark_ephe_aux, .-mark_ephe_aux
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Marking %ld words\n"
	.align	3
.LC6:
	.string	"Subphase = %d\n"
	.section	.text.mark_slice,"ax",@progbits
	.align	1
	.type	mark_slice, @function
mark_slice:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	sd	a0,24(sp)
	sw	zero,44(sp)
	mv	a2,a0
	lla	a1,.LC5
	li	a0,64
	call	caml_gc_message
	lw	a2,caml_gc_subphase
	lla	a1,.LC6
	li	a0,64
	call	caml_gc_message
	ld	s6,gray_vals_cur
	ld	s0,current_value
	ld	s5,current_index
	j	.L82
.L83:
	beq	s0,zero,.L84
	addi	s10,s0,-8
	ld	s4,-8(s0)
	srli	s7,s4,10
	add	a0,a0,s5
	andi	a4,s4,0xff
	li	a5,250
	bleu	a4,a5,.L114
	ori	s4,s4,768
	sd	s4,-8(s0)
	ld	a5,24(sp)
	sub	s7,a5,s7
	addi	s7,s7,-1
	sd	s7,24(sp)
	li	s0,0
.L82:
	ld	a0,24(sp)
	ble	a0,zero,.L115
	bne	s0,zero,.L83
	ld	a5,gray_vals
	bgeu	a5,s6,.L83
	ld	s0,-8(s6)
	addi	s6,s6,-8
	j	.L83
.L114:
	mv	s9,s5
	bleu	s5,s7,.L86
	mv	s9,s7
.L86:
	mv	s5,s7
	bleu	s7,a0,.L87
	mv	s5,a0
.L87:
	mv	s1,s9
	j	.L88
.L119:
	ld	a5,8(sp)
	ld	s11,0(a5)
	andi	a5,s11,1
	sd	a5,16(sp)
	beq	a5,zero,.L116
.L91:
	sd	s11,0(s2)
	ld	a5,16(sp)
	bne	a5,zero,.L92
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,s11,.L92
	ld	a3,32(a5)
	bleu	s11,a3,.L92
	ld	a2,8(sp)
	bgeu	a2,a4,.L93
	bgtu	a2,a3,.L92
.L93:
	ld	s11,104(a5)
	ld	a4,24(s11)
	ld	a5,32(s11)
	bgeu	a4,a5,.L117
.L94:
	ld	a5,24(s11)
	addi	a4,a5,8
	sd	a4,24(s11)
	sd	s2,0(a5)
	j	.L92
.L116:
	mv	a0,s11
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L92
	lbu	a5,-8(s11)
	li	a4,250
	beq	a5,a4,.L92
	li	a4,246
	beq	a5,a4,.L92
	li	a4,253
	bne	a5,a4,.L91
	j	.L92
.L117:
	mv	a0,s11
	call	caml_realloc_ref_table
	j	.L94
.L120:
	srli	s3,s8,10
	slli	s3,s3,3
	sub	s3,a3,s3
	ld	s8,-8(s3)
	j	.L92
.L121:
	lla	s2,gray_vals_cur
	sd	a5,0(s2)
	call	realloc_gray_vals
	ld	s6,0(s2)
.L89:
	addi	s1,s1,1
.L88:
	bgeu	s1,s5,.L118
	slli	s2,s1,3
	add	s2,s2,s0
	ld	s3,0(s2)
	andi	a5,s3,1
	bne	a5,zero,.L89
	sd	s3,8(sp)
	mv	a0,s3
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L89
	mv	a3,s3
	ld	s8,-8(s3)
	andi	a5,s8,0xff
	li	a4,250
	beq	a5,a4,.L119
	li	a4,249
	beq	a5,a4,.L120
.L92:
	andi	a5,s8,768
	bne	a5,zero,.L89
	sw	zero,ephe_list_pure,a5
	andi	s8,s8,-769
	ori	s8,s8,256
	sd	s8,-8(s3)
	addi	a5,s6,8
	sd	s3,0(s6)
	ld	a4,gray_vals_end
	bgeu	a5,a4,.L121
	mv	s6,a5
	j	.L89
.L118:
	bleu	s7,s5,.L96
	sd	zero,24(sp)
	j	.L82
.L96:
	ori	s4,s4,768
	sd	s4,0(s10)
	sub	a5,s9,s5
	ld	s5,24(sp)
	add	a5,a5,s5
	addi	a5,a5,-1
	sd	a5,24(sp)
	li	s5,0
	li	s0,0
	j	.L82
.L84:
	ld	a5,markhp
	beq	a5,zero,.L98
	ld	a4,limit
	beq	a5,a4,.L122
	ld	a4,0(a5)
	andi	a2,a4,768
	li	a3,256
	beq	a2,a3,.L123
.L101:
	srli	a4,a4,10
	addi	a4,a4,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,markhp,a4
	j	.L82
.L122:
	lla	a4,chunk
	ld	a5,0(a4)
	ld	a5,-8(a5)
	sd	a5,0(a4)
	beq	a5,zero,.L124
	sd	a5,markhp,a4
	ld	a4,-16(a5)
	add	a5,a5,a4
	sd	a5,limit,a4
	j	.L82
.L124:
	sd	zero,markhp,a5
	j	.L82
.L123:
	addi	s0,a5,8
	j	.L101
.L98:
	lw	a5,heap_is_pure
	bne	a5,zero,.L102
	li	a5,1
	sw	a5,heap_is_pure,a4
	ld	a5,caml_heap_start
	sd	a5,chunk,a4
	sd	a5,markhp,a4
	ld	a4,-16(a5)
	add	a5,a5,a4
	sd	a5,limit,a4
	j	.L82
.L102:
	lw	a5,caml_gc_subphase
	li	a4,10
	beq	a5,a4,.L125
	ld	a4,ephes_to_check
	ld	a4,0(a4)
	bne	a4,zero,.L126
	lw	a4,ephe_list_pure
	bne	a4,zero,.L105
	li	a5,1
	sw	a5,ephe_list_pure,a4
	ld	a5,ephes_checked_if_pure
	sd	a5,ephes_to_check,a4
	j	.L82
.L125:
	lla	s1,gray_vals_cur
	sd	s6,0(s1)
	call	caml_darken_all_roots_slice
	sd	a0,24(sp)
	ld	s6,0(s1)
	ble	a0,zero,.L82
	li	a5,11
	sw	a5,caml_gc_subphase,a4
	j	.L82
.L126:
	addi	a2,sp,44
	addi	a1,sp,24
	mv	a0,s6
	call	mark_ephe_aux
	mv	s6,a0
	j	.L82
.L105:
	li	a4,11
	beq	a5,a4,.L106
	li	a4,12
	bne	a5,a4,.L82
	li	a5,1
	sw	a5,caml_gc_phase,a4
	call	caml_final_update_clean_phase
	call	caml_memprof_update_clean_phase
	ld	a5,caml_ephe_list_head
	beq	a5,zero,.L109
	lla	a5,caml_ephe_list_head
	sd	a5,ephes_to_check,a4
.L110:
	sd	zero,24(sp)
	j	.L82
.L106:
	lla	s1,gray_vals_cur
	sd	s6,0(s1)
	call	caml_final_update_mark_phase
	ld	s6,0(s1)
	ld	a5,gray_vals
	bgeu	a5,s6,.L108
	ld	s0,-8(s6)
	addi	s6,s6,-8
.L108:
	ld	a5,ephes_checked_if_pure
	sd	a5,ephes_to_check,a4
	li	a5,12
	sw	a5,caml_gc_subphase,a4
	j	.L82
.L109:
	call	init_sweep_phase
	j	.L110
.L115:
	sd	s6,gray_vals_cur,a5
	sd	s0,current_value,a5
	sd	s5,current_index,a5
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	ld	s3,120(sp)
	ld	s4,112(sp)
	ld	s5,104(sp)
	ld	s6,96(sp)
	ld	s7,88(sp)
	ld	s8,80(sp)
	ld	s9,72(sp)
	ld	s10,64(sp)
	ld	s11,56(sp)
	addi	sp,sp,160
	jr	ra
	.size	mark_slice, .-mark_slice
	.section	.text.caml_darken,"ax",@progbits
	.align	1
	.globl	caml_darken
	.type	caml_darken, @function
caml_darken:
	andi	a5,a0,1
	beq	a5,zero,.L135
	ret
.L135:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L127
	ld	a5,-8(s0)
	andi	a4,a5,0xff
	li	a3,249
	beq	a4,a3,.L136
.L129:
	andi	a3,a5,768
	bne	a3,zero,.L127
	sw	zero,ephe_list_pure,a3
	li	a3,250
	bgtu	a4,a3,.L130
	andi	a5,a5,-769
	ori	a5,a5,256
	sd	a5,-8(s0)
	lla	a3,gray_vals_cur
	ld	a4,0(a3)
	addi	a5,a4,8
	sd	a5,0(a3)
	sd	s0,0(a4)
	ld	a4,gray_vals_end
	bltu	a5,a4,.L127
	call	realloc_gray_vals
	j	.L127
.L136:
	srli	a5,a5,10
	slli	a5,a5,3
	sub	s0,s0,a5
	ld	a5,-8(s0)
	andi	a4,a5,0xff
	j	.L129
.L130:
	ori	a5,a5,768
	sd	a5,-8(s0)
.L127:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_darken, .-caml_darken
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"ordered work = %ld words\n"
	.align	3
.LC11:
	.string	"allocated_words = %lu\n"
	.align	3
.LC13:
	.string	"extra_heap_resources = %luu\n"
	.align	3
.LC14:
	.string	"raw work-to-do = %ldu\n"
	.align	3
.LC15:
	.string	"work backlog = %ldu\n"
	.align	3
.LC17:
	.string	"filtered work-to-do = %ldu\n"
	.align	3
.LC20:
	.string	"computed work = %ld words\n"
	.align	3
.LC21:
	.string	"!"
	.align	3
.LC22:
	.string	"%%"
	.align	3
.LC23:
	.string	"$"
	.align	3
.LC24:
	.string	"work-done = %ldu\n"
	.section	.text.caml_major_collection_slice,"ax",@progbits
	.align	1
	.globl	caml_major_collection_slice
	.type	caml_major_collection_slice, @function
caml_major_collection_slice:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	fsd	fs0,8(sp)
	fsd	fs1,0(sp)
	mv	s0,a0
	ld	a5,caml_major_slice_begin_hook
	beq	a5,zero,.L138
	jalr	a5
.L138:
	ld	a5,caml_allocated_words
	fcvt.d.lu	fa5,a5
	fld	fa4,.LC8,a5
	fmul.d	fa5,fa5,fa4
	ld	a4,caml_percent_free
	addi	a5,a4,100
	fcvt.d.lu	fa3,a5
	fmul.d	fa5,fa5,fa3
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa4,a5
	fdiv.d	fa5,fa5,fa4
	fcvt.d.lu	fa2,a4
	fdiv.d	fa5,fa5,fa2
	fld	fa4,.LC9,a5
	fmul.d	fa5,fa5,fa4
	ld	a5,caml_dependent_size
	beq	a5,zero,.L166
	ld	a4,caml_dependent_allocated
	fcvt.d.lu	fa4,a4
	fmul.d	fa4,fa3,fa4
	fcvt.d.lu	fa3,a5
	fdiv.d	fa4,fa4,fa3
	fdiv.d	fa4,fa4,fa2
.L139:
	fgt.d	a5,fa4,fa5
	bne	a5,zero,.L140
	fmv.d	fa4,fa5
.L140:
	fld	fs0,caml_extra_heap_resources,a5
	fgt.d	a5,fs0,fa4
	bne	a5,zero,.L141
	fmv.d	fs0,fa4
.L141:
	lla	a5,p_backlog
	fld	fa5,0(a5)
	fadd.d	fs0,fs0,fa5
	sd	zero,0(a5)
	fld	fa5,.LC7,a5
	fgt.d	a5,fs0,fa5
	beq	a5,zero,.L142
	fsub.d	fs0,fs0,fa5
	fsd	fs0,p_backlog,a5
	fmv.d	fs0,fa5
.L142:
	mv	a2,s0
	lla	a1,.LC10
	li	a0,64
	call	caml_gc_message
	ld	a2,caml_allocated_words
	lla	a1,.LC11
	li	a0,64
	call	caml_gc_message
	fld	fa5,caml_extra_heap_resources,a5
	fld	fs1,.LC12,a5
	fmul.d	fa5,fa5,fs1
	fcvt.lu.d a2,fa5,rtz
	lla	a1,.LC13
	li	a0,64
	call	caml_gc_message
	fmul.d	fa5,fs0,fs1
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC14
	li	a0,64
	call	caml_gc_message
	fld	fa5,p_backlog,a5
	fmul.d	fa5,fa5,fs1
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC15
	li	a0,64
	call	caml_gc_message
	li	a3,0
.L144:
	lw	a5,caml_major_window
	ble	a5,a3,.L174
	fcvt.d.w	fa5,a5
	fdiv.d	fa5,fs0,fa5
	slli	a5,a3,3
	lla	a4,.LANCHOR0
	add	a4,a4,a5
	fld	fa4,0(a4)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,0(a4)
	addiw	a3,a3,1
	j	.L144
.L166:
	fmv.d.x	fa4,zero
	j	.L139
.L174:
	fld	fa4,caml_gc_clock,a4
	fld	fa5,.LC16,a4
	fge.d	a4,fa4,fa5
	beq	a4,zero,.L146
	fsub.d	fa4,fa4,fa5
	fsd	fa4,caml_gc_clock,a4
	lla	a3,caml_major_ring_index
	lw	a4,0(a3)
	addiw	a4,a4,1
	sext.w	a2,a4
	sw	a4,0(a3)
	bgt	a5,a2,.L146
	sw	zero,caml_major_ring_index,a4
.L146:
	li	a4,-1
	beq	s0,a4,.L175
	bne	s0,zero,.L150
	lw	a4,caml_major_ring_index
	addiw	a4,a4,1
	bgt	a5,a4,.L151
	li	a4,0
.L151:
	slli	a4,a4,3
	lla	a5,.LANCHOR0
	add	a4,a5,a4
	fld	fs0,0(a4)
.L152:
	lla	s0,caml_major_work_credit
	fld	fa0,0(s0)
	fld	fa1,.LC16,a5
	fadd.d	fa0,fs0,fa0
	call	fmin
	fsd	fa0,0(s0)
.L149:
	fld	fa5,.LC12,a5
	fmul.d	fa5,fs0,fa5
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC17
	li	a0,64
	call	caml_gc_message
	lw	a5,caml_gc_phase
	li	a4,3
	beq	a5,a4,.L176
	fmv.d.x	fa5,zero
	flt.d	a4,fs0,fa5
	bne	a4,zero,.L168
	sext.w	a5,a5
	li	a4,1
	bleu	a5,a4,.L177
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa5,a5
	fmul.d	fa5,fa5,fs0
	fld	fa4,.LC19,a5
	fmul.d	fa5,fa5,fa4
	fld	fa4,.LC8,a5
	fdiv.d	fa5,fa5,fa4
	fcvt.l.d s0,fa5,rtz
.L157:
	mv	a2,s0
	lla	a1,.LC20
	li	a0,64
	call	caml_gc_message
	lw	a5,caml_gc_phase
	beq	a5,zero,.L178
	li	a4,1
	beq	a5,a4,.L179
	mv	a0,s0
	call	sweep_slice
	lla	a1,.LC23
	li	a0,2
	call	caml_gc_message
.L159:
	lw	a4,caml_gc_phase
	li	a5,3
	beq	a4,a5,.L180
	fmv.d	fs1,fs0
.L155:
	fld	fa5,.LC12,a5
	fmul.d	fa5,fs1,fa5
	fcvt.l.d a2,fa5,rtz
	lla	a1,.LC24
	li	a0,64
	call	caml_gc_message
	fsub.d	fs0,fs0,fs1
	lla	s0,caml_major_work_credit
	fld	fs1,0(s0)
	fmv.d	fa1,fs1
	fmv.d	fa0,fs0
	call	fmin
	fsub.d	fs1,fs1,fa0
	fsd	fs1,0(s0)
	fgt.d	a5,fs0,fa0
	beq	a5,zero,.L161
	fsub.d	fs0,fs0,fa0
	lw	a2,caml_major_window
	fcvt.d.w	fa4,a2
	fdiv.d	fa4,fs0,fa4
	li	a4,0
.L163:
	ble	a2,a4,.L161
	slli	a3,a4,3
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	fld	fa5,0(a5)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,0(a5)
	addiw	a4,a4,1
	j	.L163
.L175:
	lla	s1,caml_major_work_credit
	fld	fs1,0(s1)
	lw	s0,caml_major_ring_index
	slli	a5,s0,3
	lla	s0,.LANCHOR0
	add	s0,s0,a5
	fld	fs0,0(s0)
	fmv.d	fa1,fs0
	fmv.d	fa0,fs1
	call	fmin
	fsub.d	fs1,fs1,fa0
	fsd	fs1,0(s1)
	fsub.d	fs0,fs0,fa0
	sd	zero,0(s0)
	j	.L149
.L150:
	fcvt.d.l	fa5,s0
	fld	fa4,.LC8,a5
	fmul.d	fa5,fa5,fa4
	ld	a4,caml_percent_free
	addi	a5,a4,100
	fcvt.d.lu	fs0,a5
	fmul.d	fs0,fs0,fa5
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa5,a5
	fdiv.d	fs0,fs0,fa5
	fcvt.d.lu	fa5,a4
	fdiv.d	fs0,fs0,fa5
	fld	fa5,.LC9,a5
	fmul.d	fs0,fs0,fa5
	j	.L152
.L176:
	ld	a5,Caml_state
	ld	a4,0(a5)
	ld	a5,56(a5)
	beq	a4,a5,.L181
.L154:
	fmv.d.x	fs1,zero
	j	.L155
.L181:
	call	start_cycle
	j	.L154
.L177:
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa5,a5
	fld	fa4,.LC18,a5
	fmul.d	fa5,fa5,fa4
	ld	a5,caml_percent_free
	addi	a5,a5,100
	fcvt.d.lu	fa4,a5
	fdiv.d	fa4,fa5,fa4
	ld	a5,caml_incremental_roots_count
	fcvt.d.lu	fa5,a5
	fadd.d	fa5,fa5,fa4
	fmul.d	fa5,fa5,fs0
	fcvt.l.d s0,fa5,rtz
	j	.L157
.L178:
	mv	a0,s0
	call	mark_slice
	lla	a1,.LC21
	li	a0,2
	call	caml_gc_message
	j	.L159
.L179:
	mv	a0,s0
	call	clean_slice
	lla	a1,.LC22
	li	a0,2
	call	caml_gc_message
	j	.L159
.L180:
	call	caml_compact_heap_maybe
	fmv.d	fs1,fs0
	j	.L155
.L168:
	fmv.d.x	fs1,zero
	j	.L155
.L161:
	ld	a3,Caml_state
	lla	a4,caml_allocated_words
	ld	a5,0(a4)
	fcvt.d.lu	fa4,a5
	fld	fa5,304(a3)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,304(a3)
	sd	zero,0(a4)
	sd	zero,caml_dependent_allocated,a5
	lla	a5,caml_extra_heap_resources
	sd	zero,0(a5)
	ld	a5,caml_major_slice_end_hook
	beq	a5,zero,.L137
	jalr	a5
.L137:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	fld	fs0,8(sp)
	fld	fs1,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_major_collection_slice, .-caml_major_collection_slice
	.section	.text.caml_finish_major_cycle,"ax",@progbits
	.align	1
	.globl	caml_finish_major_cycle
	.type	caml_finish_major_cycle, @function
caml_finish_major_cycle:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lw	a4,caml_gc_phase
	li	a5,3
	beq	a4,a5,.L191
.L184:
	lw	a5,caml_gc_phase
	bne	a5,zero,.L186
	li	a0,-1
	srli	a0,a0,1
	call	mark_slice
	j	.L184
.L191:
	lla	a5,p_backlog
	sd	zero,0(a5)
	call	start_cycle
	j	.L184
.L186:
	lw	a4,caml_gc_phase
	li	a5,1
	bne	a4,a5,.L188
	li	a0,-1
	srli	a0,a0,1
	call	clean_slice
	j	.L186
.L189:
	li	a0,-1
	srli	a0,a0,1
	call	sweep_slice
.L188:
	lw	a4,caml_gc_phase
	li	a5,2
	beq	a4,a5,.L189
	ld	a3,Caml_state
	lla	a4,caml_allocated_words
	ld	a5,0(a4)
	fcvt.d.lu	fa4,a5
	fld	fa5,304(a3)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,304(a3)
	sd	zero,0(a4)
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_finish_major_cycle, .-caml_finish_major_cycle
	.section	.text.caml_clip_heap_chunk_wsz,"ax",@progbits
	.align	1
	.globl	caml_clip_heap_chunk_wsz
	.type	caml_clip_heap_chunk_wsz, @function
caml_clip_heap_chunk_wsz:
	mv	a5,a0
	ld	a0,caml_major_heap_increment
	li	a4,1000
	bgtu	a0,a4,.L193
	ld	a4,Caml_state
	ld	a4,328(a4)
	li	a3,100
	div	a4,a4,a3
	mul	a0,a0,a4
.L193:
	bgtu	a0,a5,.L194
	mv	a0,a5
.L194:
	li	a5,61440
	bltu	a0,a5,.L197
.L192:
	ret
.L197:
	li	a0,61440
	j	.L192
	.size	caml_clip_heap_chunk_wsz, .-caml_clip_heap_chunk_wsz
	.section	.rodata.str1.8
	.align	3
.LC25:
	.string	"cannot allocate initial major heap"
	.align	3
.LC26:
	.string	"cannot allocate initial page table"
	.align	3
.LC27:
	.string	"not enough memory for the gray cache"
	.section	.text.caml_init_major_heap,"ax",@progbits
	.align	1
	.globl	caml_init_major_heap
	.type	caml_init_major_heap, @function
caml_init_major_heap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	srli	a0,a0,3
	call	caml_clip_heap_chunk_wsz
	ld	a5,Caml_state
	sd	a0,328(a5)
	sd	a0,336(a5)
	slli	a0,a0,3
	call	caml_alloc_for_heap
	sd	a0,caml_heap_start,a5
	beq	a0,zero,.L205
	sd	zero,-8(a0)
	ld	a1,caml_heap_start
	ld	a2,-16(a1)
	srli	a2,a2,3
	ld	a5,Caml_state
	sd	a2,328(a5)
	li	a4,1
	sd	a4,352(a5)
	sd	a2,336(a5)
	slli	a2,a2,3
	add	a2,a1,a2
	li	a0,1
	call	caml_page_table_add
	mv	s0,a0
	bne	a0,zero,.L206
	ld	a5,caml_fl_p_init_merge
	jalr	a5
	li	a3,0
	li	a2,1
	ld	a5,Caml_state
	ld	a1,328(a5)
	ld	a0,caml_heap_start
	ld	a5,caml_fl_p_make_free_blocks
	jalr	a5
	li	a5,3
	sw	a5,caml_gc_phase,a4
	li	a5,4096
	addi	a5,a5,-2048
	sd	a5,gray_vals_size,a4
	li	a0,16384
	call	caml_stat_alloc_noexc
	sd	a0,gray_vals,a5
	beq	a0,zero,.L207
	sd	a0,gray_vals_cur,a5
	ld	a5,gray_vals_size
	slli	a5,a5,3
	add	a0,a0,a5
	sd	a0,gray_vals_end,a5
	li	a5,1
	sw	a5,heap_is_pure,a4
	sd	zero,caml_allocated_words,a5
	lla	a5,caml_extra_heap_resources
	sd	zero,0(a5)
.L202:
	li	a5,49
	bgt	s0,a5,.L208
	slli	a4,s0,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	sd	zero,0(a5)
	addiw	s0,s0,1
	j	.L202
.L205:
	lla	a0,.LC25
	call	caml_fatal_error
.L206:
	lla	a0,.LC26
	call	caml_fatal_error
.L207:
	lla	a0,.LC27
	call	caml_fatal_error
.L208:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_init_major_heap, .-caml_init_major_heap
	.section	.text.caml_set_major_window,"ax",@progbits
	.align	1
	.globl	caml_set_major_window
	.type	caml_set_major_window, @function
caml_set_major_window:
	lw	a1,caml_major_window
	beq	a1,a0,.L209
	li	a4,0
	li	a5,0
.L211:
	ble	a1,a4,.L215
	slli	a2,a4,3
	lla	a3,.LANCHOR0
	add	a3,a3,a2
	fld	fa4,0(a3)
	fcvt.d.lu	fa5,a5
	fadd.d	fa5,fa5,fa4
	fcvt.lu.d a5,fa5,rtz
	addiw	a4,a4,1
	j	.L211
.L215:
	li	a3,0
	j	.L213
.L214:
	divu	a4,a5,a0
	slli	a1,a3,3
	lla	a2,.LANCHOR0
	add	a2,a2,a1
	fcvt.d.lu	fa5,a4
	fsd	fa5,0(a2)
	addiw	a3,a3,1
.L213:
	blt	a3,a0,.L214
	sw	a0,caml_major_window,a5
.L209:
	ret
	.size	caml_set_major_window, .-caml_set_major_window
	.section	.text.caml_finalise_heap,"ax",@progbits
	.align	1
	.globl	caml_finalise_heap
	.type	caml_finalise_heap, @function
caml_finalise_heap:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	ld	a5,caml_fl_p_init_merge
	jalr	a5
	li	a5,2
	sw	a5,caml_gc_phase,a4
	ld	a5,caml_heap_start
	sd	a5,chunk,a4
	sd	a5,caml_gc_sweep_hp,a4
	ld	a4,-16(a5)
	add	a5,a5,a4
	sd	a5,limit,a4
.L217:
	lw	a4,caml_gc_phase
	li	a5,2
	bne	a4,a5,.L220
	li	a0,-1
	srli	a0,a0,1
	call	sweep_slice
	j	.L217
.L220:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_finalise_heap, .-caml_finalise_heap
	.globl	caml_major_gc_hook
	.globl	caml_gc_clock
	.globl	caml_major_work_credit
	.globl	caml_major_ring_index
	.globl	caml_major_ring
	.globl	caml_major_window
	.globl	caml_gc_subphase
	.globl	caml_fl_wsz_at_phase_change
	.globl	caml_extra_heap_resources
	.globl	caml_dependent_allocated
	.globl	caml_dependent_size
	.globl	caml_allocated_words
	.globl	caml_gc_phase
	.globl	caml_gc_sweep_hp
	.globl	caml_heap_start
	.globl	caml_major_heap_increment
	.globl	caml_percent_free
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC7:
	.word	858993459
	.word	1070805811
	.align	3
.LC8:
	.word	0
	.word	1074266112
	.align	3
.LC9:
	.word	0
	.word	1071644672
	.align	3
.LC12:
	.word	0
	.word	1093567616
	.align	3
.LC16:
	.word	0
	.word	1072693248
	.align	3
.LC18:
	.word	0
	.word	1081032704
	.align	3
.LC19:
	.word	0
	.word	1075052544
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_major_ring, @object
	.size	caml_major_ring, 400
caml_major_ring:
	.zero	400
	.section	.sbss,"aw",@nobits
	.align	3
	.type	current_index, @object
	.size	current_index, 8
current_index:
	.zero	8
	.type	current_value, @object
	.size	current_value, 8
current_value:
	.zero	8
	.type	caml_major_gc_hook, @object
	.size	caml_major_gc_hook, 8
caml_major_gc_hook:
	.zero	8
	.type	caml_gc_clock, @object
	.size	caml_gc_clock, 8
caml_gc_clock:
	.zero	8
	.type	caml_major_work_credit, @object
	.size	caml_major_work_credit, 8
caml_major_work_credit:
	.zero	8
	.type	caml_major_ring_index, @object
	.size	caml_major_ring_index, 4
caml_major_ring_index:
	.zero	4
	.zero	4
	.type	ephes_to_check, @object
	.size	ephes_to_check, 8
ephes_to_check:
	.zero	8
	.type	ephes_checked_if_pure, @object
	.size	ephes_checked_if_pure, 8
ephes_checked_if_pure:
	.zero	8
	.type	ephe_list_pure, @object
	.size	ephe_list_pure, 4
ephe_list_pure:
	.zero	4
	.type	caml_gc_subphase, @object
	.size	caml_gc_subphase, 4
caml_gc_subphase:
	.zero	4
	.type	p_backlog, @object
	.size	p_backlog, 8
p_backlog:
	.zero	8
	.type	limit, @object
	.size	limit, 8
limit:
	.zero	8
	.type	chunk, @object
	.size	chunk, 8
chunk:
	.zero	8
	.type	markhp, @object
	.size	markhp, 8
markhp:
	.zero	8
	.type	caml_fl_wsz_at_phase_change, @object
	.size	caml_fl_wsz_at_phase_change, 8
caml_fl_wsz_at_phase_change:
	.zero	8
	.type	caml_extra_heap_resources, @object
	.size	caml_extra_heap_resources, 8
caml_extra_heap_resources:
	.zero	8
	.type	caml_dependent_allocated, @object
	.size	caml_dependent_allocated, 8
caml_dependent_allocated:
	.zero	8
	.type	caml_dependent_size, @object
	.size	caml_dependent_size, 8
caml_dependent_size:
	.zero	8
	.type	caml_allocated_words, @object
	.size	caml_allocated_words, 8
caml_allocated_words:
	.zero	8
	.type	heap_is_pure, @object
	.size	heap_is_pure, 4
heap_is_pure:
	.zero	4
	.zero	4
	.type	gray_vals_size, @object
	.size	gray_vals_size, 8
gray_vals_size:
	.zero	8
	.type	gray_vals_end, @object
	.size	gray_vals_end, 8
gray_vals_end:
	.zero	8
	.type	gray_vals_cur, @object
	.size	gray_vals_cur, 8
gray_vals_cur:
	.zero	8
	.type	gray_vals, @object
	.size	gray_vals, 8
gray_vals:
	.zero	8
	.type	caml_gc_phase, @object
	.size	caml_gc_phase, 4
caml_gc_phase:
	.zero	4
	.zero	4
	.type	caml_gc_sweep_hp, @object
	.size	caml_gc_sweep_hp, 8
caml_gc_sweep_hp:
	.zero	8
	.type	caml_heap_start, @object
	.size	caml_heap_start, 8
caml_heap_start:
	.zero	8
	.type	caml_major_heap_increment, @object
	.size	caml_major_heap_increment, 8
caml_major_heap_increment:
	.zero	8
	.type	caml_percent_free, @object
	.size	caml_percent_free, 8
caml_percent_free:
	.zero	8
	.section	.sdata,"aw"
	.align	2
	.type	caml_major_window, @object
	.size	caml_major_window, 4
caml_major_window:
	.word	1
	.ident	"GCC: (GNU) 9.2.0"
