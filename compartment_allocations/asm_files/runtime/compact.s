	.file	"compact.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.init_compact_allocate,"ax",@progbits
	.align	1
	.type	init_compact_allocate, @function
init_compact_allocate:
	ld	a5,caml_heap_start
.L2:
	beq	a5,zero,.L4
	sd	zero,-24(a5)
	ld	a5,-8(a5)
	j	.L2
.L4:
	ld	a5,caml_heap_start
	sd	a5,compact_fl,a4
	ret
	.size	init_compact_allocate, .-init_compact_allocate
	.section	.text.compact_allocate,"ax",@progbits
	.align	1
	.type	compact_allocate, @function
compact_allocate:
.L6:
	ld	a5,compact_fl
	ld	a4,-16(a5)
	ld	a3,-24(a5)
	sub	a4,a4,a3
	li	a3,32
	bgtu	a4,a3,.L9
	ld	a3,-8(a5)
	ld	a4,-16(a3)
	ld	a2,-24(a3)
	sub	a4,a4,a2
	li	a2,32
	bgtu	a4,a2,.L9
	sd	a3,compact_fl,a5
	j	.L6
.L10:
	ld	a5,-8(a5)
.L9:
	ld	a4,-16(a5)
	ld	a3,-24(a5)
	sub	a4,a4,a3
	bltu	a4,a0,.L10
	add	a0,a3,a0
	sd	a0,-24(a5)
	add	a0,a5,a3
	ret
	.size	compact_allocate, .-compact_allocate
	.section	.text.invert_pointer_at,"ax",@progbits
	.align	1
	.type	invert_pointer_at, @function
invert_pointer_at:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	ld	s1,0(a0)
	andi	a5,s1,3
	beq	a5,zero,.L21
.L11:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L21:
	mv	s0,a0
	mv	a0,s1
	call	caml_page_table_lookup
	andi	a0,a0,1
	beq	a0,zero,.L11
	ld	a4,-8(s1)
	andi	a5,a4,3
	li	a3,2
	beq	a5,a3,.L13
	bgtu	a5,a3,.L14
	beq	a5,zero,.L15
	li	a3,1
	bne	a5,a3,.L11
	srli	a4,a4,10
	slli	a5,a4,3
	sub	a1,s1,a5
	addi	a3,a1,-8
.L17:
	ld	a5,0(a3)
	andi	a2,a5,3
	bne	a2,zero,.L22
	mv	a3,a5
	j	.L17
.L14:
	li	a3,3
	bne	a5,a3,.L11
.L15:
	sd	a4,0(s0)
	sd	s0,-8(s1)
	j	.L11
.L22:
	srli	a2,a5,2
	andi	a2,a2,255
	li	a0,247
	beq	a2,a0,.L23
	srli	a5,a5,10
	slli	a5,a5,3
	add	a5,a5,a1
	ori	a5,a5,1
	sd	a5,0(s0)
	ori	s0,s0,2
	sd	s0,-8(s1)
	addi	a4,a4,-1
	slli	a5,a4,10
	ori	a5,a5,999
	sd	a5,0(a3)
	j	.L11
.L23:
	sd	a5,0(s0)
	ori	s0,s0,2
	sd	s0,-8(s1)
	addi	a5,a4,-1
	slli	a5,a5,10
	ori	a5,a5,999
	sd	a5,0(a3)
	j	.L11
.L13:
	sd	a4,0(s0)
	ori	s0,s0,2
	sd	s0,-8(s1)
	j	.L11
	.size	invert_pointer_at, .-invert_pointer_at
	.section	.text.caml_invert_root,"ax",@progbits
	.align	1
	.globl	caml_invert_root
	.type	caml_invert_root, @function
caml_invert_root:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a0,a1
	call	invert_pointer_at
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_invert_root, .-caml_invert_root
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Compacting heap...\n"
	.align	3
.LC1:
	.string	"done.\n"
	.section	.text.do_compaction,"ax",@progbits
	.align	1
	.type	do_compaction, @function
do_compaction:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	sd	s6,16(sp)
	sd	s7,8(sp)
	mv	s0,a0
	lla	a1,.LC0
	li	a0,16
	call	caml_gc_message
	mv	a0,s0
	call	caml_fl_reset_and_switch_policy
	ld	a6,caml_heap_start
	j	.L27
.L29:
	andi	a2,a5,-1024
	slliw	a5,a5,2
	andi	a5,a5,1020
	or	a5,a2,a5
	ori	a5,a5,3
	sd	a5,0(a3)
.L30:
	addi	a5,a4,1
	slli	a5,a5,3
	add	a3,a3,a5
.L28:
	bgeu	a3,a0,.L91
	ld	a5,0(a3)
	srli	a4,a5,10
	andi	a1,a5,768
	li	a2,512
	bne	a1,a2,.L29
	andi	a5,a5,-1024
	ori	a5,a5,1011
	sd	a5,0(a3)
	j	.L30
.L91:
	ld	a6,-8(a6)
.L27:
	beq	a6,zero,.L92
	ld	a0,-16(a6)
	add	a0,a6,a0
	mv	a3,a6
	j	.L28
.L92:
	li	a1,1
	lla	a0,caml_invert_root
	call	caml_do_roots
	call	caml_final_invert_finalisable_values
	call	caml_memprof_invert_tracked
	ld	s0,caml_heap_start
	j	.L33
.L96:
	srli	s1,a5,10
	addi	s1,s1,1
	srli	a5,a5,2
	andi	a5,a5,0xff
	li	a4,249
	beq	a5,a4,.L93
.L37:
	li	a4,250
	bleu	a5,a4,.L94
.L41:
	slli	s1,s1,3
	add	s3,s3,s1
.L34:
	bgeu	s3,s4,.L95
	ld	a5,0(s3)
.L35:
	andi	a4,a5,3
	bne	a4,zero,.L96
	ld	a5,0(a5)
	j	.L35
.L93:
	slli	a5,s1,3
	add	a5,s3,a5
	ld	a5,0(a5)
	j	.L38
.L39:
	andi	a5,a5,-4
	ld	a5,0(a5)
.L38:
	andi	a4,a5,3
	li	a3,3
	bne	a4,a3,.L39
	srli	s1,a5,10
	addi	s1,s1,1
	srli	a5,a5,2
	andi	a5,a5,0xff
	j	.L37
.L42:
	slli	a0,s2,3
	add	a0,s3,a0
	call	invert_pointer_at
	addi	s2,s2,1
.L40:
	bgtu	s1,s2,.L42
	j	.L41
.L94:
	li	s2,1
	j	.L40
.L95:
	ld	s0,-8(s0)
.L33:
	beq	s0,zero,.L97
	ld	s4,-16(s0)
	add	s4,s0,s4
	mv	s3,s0
	j	.L34
.L97:
	lla	s5,caml_ephe_list_head
	j	.L51
.L47:
	ld	a5,0(a5)
.L46:
	andi	a4,a5,3
	beq	a4,zero,.L47
	srli	s1,a5,10
	li	s2,1
	j	.L48
.L99:
	call	invert_pointer_at
.L49:
	addi	s2,s2,1
.L48:
	bgeu	s2,s1,.L98
	slli	a0,s2,3
	add	a0,a0,s3
	ld	a4,0(a0)
	ld	a5,caml_ephe_none
	beq	a4,a5,.L49
	j	.L99
.L98:
	mv	a0,s5
	call	invert_pointer_at
	mv	s5,s4
.L51:
	ld	s4,0(s5)
	beq	s4,zero,.L45
	mv	s3,s4
	ld	a5,-8(s4)
	j	.L46
.L45:
	call	init_compact_allocate
	ld	s5,caml_heap_start
	j	.L52
.L102:
	srli	s7,a5,10
	addi	s7,s7,1
	srli	a5,a5,2
	andi	s6,a5,0xff
	li	a5,249
	beq	s6,a5,.L100
	mv	s1,s0
.L58:
	slli	s4,s7,3
	mv	a0,s4
	call	compact_allocate
	ld	a5,0(s2)
	j	.L61
.L100:
	slli	a4,s7,3
	add	s1,s2,a4
	ld	a5,0(s1)
	j	.L59
.L60:
	andi	a5,a5,-4
	ld	a5,0(a5)
.L59:
	andi	a4,a5,3
	li	a3,3
	bne	a4,a3,.L60
	srli	s7,a5,10
	addi	s7,s7,1
	srli	a5,a5,2
	andi	s6,a5,0xff
	j	.L58
.L62:
	mv	a4,a5
	ld	a5,0(a5)
	addi	a3,a0,8
	sd	a3,0(a4)
.L61:
	andi	a4,a5,3
	beq	a4,zero,.L62
	addi	s7,s7,-1
	slli	s7,s7,10
	add	s6,s6,s7
	sd	s6,0(s2)
	bne	s1,zero,.L63
.L64:
	add	s2,s2,s4
	j	.L53
.L66:
	andi	a3,a4,-4
	ld	a4,0(a3)
	sub	a5,s1,s2
	addi	a5,a5,8
	add	a5,a0,a5
	sd	a5,0(a3)
.L65:
	andi	a5,a4,3
	li	a3,2
	beq	a5,a3,.L66
	sub	a5,s1,s2
	srai	a5,a5,3
	slli	a5,a5,10
	addi	a5,a5,249
	sd	a5,0(s1)
	mv	s1,a4
.L63:
	andi	a5,s1,3
	li	a4,3
	beq	a5,a4,.L64
	andi	s1,s1,-4
	ld	a4,0(s1)
	j	.L65
.L89:
	srli	a3,a5,10
	andi	a5,a5,-1024
	or	a5,a4,a5
	addi	a5,a5,512
	sd	a5,0(s2)
	addi	a5,a3,1
	slli	a5,a5,3
	add	s2,s2,a5
.L53:
	bgeu	s2,s3,.L101
	ld	a5,0(s2)
	andi	a4,a5,3
	beq	a4,zero,.L56
	srli	a4,a5,2
	andi	a4,a4,255
	li	a3,249
	bne	a4,a3,.L89
.L56:
	andi	a4,a5,3
	bne	a4,zero,.L102
	ld	a5,0(a5)
	j	.L56
.L101:
	ld	s5,-8(s5)
.L52:
	beq	s5,zero,.L103
	ld	s3,-16(s5)
	add	s3,s5,s3
	mv	s2,s5
	j	.L53
.L103:
	call	init_compact_allocate
	ld	s3,caml_heap_start
	j	.L71
.L105:
	srli	s0,a5,10
	addi	s0,s0,1
	slli	s0,s0,3
	mv	a0,s0
	call	compact_allocate
	mv	a2,s0
	mv	a1,s1
	call	memmove
	add	s1,s1,s0
.L72:
	bgeu	s1,s2,.L104
	ld	a5,0(s1)
	andi	a4,a5,768
	beq	a4,zero,.L105
	srli	a5,a5,10
	addi	a5,a5,1
	slli	a5,a5,3
	add	s1,s1,a5
	j	.L72
.L104:
	ld	s3,-8(s3)
.L71:
	beq	s3,zero,.L106
	ld	s2,-16(s3)
	add	s2,s3,s2
	mv	s1,s3
	j	.L72
.L106:
	ld	a0,caml_heap_start
	mv	a5,a0
	li	s1,0
	li	a2,0
	j	.L77
.L78:
	ld	a5,-8(a5)
.L77:
	beq	a5,zero,.L107
	ld	a4,-24(a5)
	beq	a4,zero,.L78
	srli	a3,a4,3
	add	a2,a2,a3
	ld	a3,-16(a5)
	sub	a4,a3,a4
	srli	a4,a4,3
	add	s1,s1,a4
	j	.L78
.L107:
	li	s0,100
	divu	s0,a2,s0
	addi	s0,s0,1
	ld	a5,caml_percent_free
	mul	s0,s0,a5
	j	.L80
.L82:
	call	caml_shrink_heap
.L81:
	mv	a0,s2
.L80:
	beq	a0,zero,.L108
	ld	s2,-8(a0)
	ld	a5,-24(a0)
	bne	a5,zero,.L81
	bgeu	s1,s0,.L82
	ld	a5,-16(a0)
	srli	a5,a5,3
	add	s1,s1,a5
	j	.L81
.L108:
	ld	s0,caml_heap_start
	ld	a5,caml_fl_p_init_merge
	jalr	a5
	j	.L84
.L85:
	ld	s0,-8(s0)
.L84:
	beq	s0,zero,.L109
	ld	a5,-16(s0)
	ld	a0,-24(s0)
	bleu	a5,a0,.L85
	sub	a5,a5,a0
	li	a3,0
	li	a2,1
	srli	a1,a5,3
	add	a0,s0,a0
	ld	a5,caml_fl_p_make_free_blocks
	jalr	a5
	j	.L85
.L109:
	ld	a4,Caml_state
	ld	a5,344(a4)
	addi	a5,a5,1
	sd	a5,344(a4)
	lla	a1,.LC1
	li	a0,16
	call	caml_gc_message
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	ld	s6,16(sp)
	ld	s7,8(sp)
	addi	sp,sp,80
	jr	ra
	.size	do_compaction, .-do_compaction
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Recompacting heap (target=%luk words)\n"
	.section	.text.caml_compact_heap,"ax",@progbits
	.align	1
	.globl	caml_compact_heap
	.type	caml_compact_heap, @function
caml_compact_heap:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	call	do_compaction
	lla	s1,Caml_state
	ld	a5,0(s1)
	ld	a0,328(a5)
	ld	a5,caml_fl_cur_wsz
	sub	a5,a0,a5
	li	a0,100
	divu	a0,a5,a0
	addi	a0,a0,1
	ld	a4,caml_percent_free
	mul	a0,a0,a4
	add	a0,a0,a5
	addi	a0,a0,512
	call	caml_clip_heap_chunk_wsz
	ld	a5,0(s1)
	ld	a4,328(a5)
	srli	a5,a4,63
	add	a5,a5,a4
	srai	a5,a5,1
	bgtu	a5,a0,.L115
.L110:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L115:
	mv	s0,a0
	srli	a2,a0,10
	lla	a1,.LC2
	li	a0,16
	call	caml_gc_message
	slli	a0,s0,3
	call	caml_alloc_for_heap
	mv	s0,a0
	beq	a0,zero,.L110
	ld	a1,-16(a0)
	li	a3,512
	li	a2,0
	srli	a1,a1,3
	ld	a5,caml_fl_p_make_free_blocks
	jalr	a5
	ld	a2,-16(s0)
	add	a2,s0,a2
	mv	a1,s0
	li	a0,1
	call	caml_page_table_add
	bne	a0,zero,.L116
	lla	a5,caml_heap_start
	ld	a4,0(a5)
	sd	a4,-8(s0)
	sd	s0,0(a5)
	ld	a4,Caml_state
	ld	a5,352(a4)
	addi	a5,a5,1
	sd	a5,352(a4)
	ld	a5,-16(s0)
	srli	a5,a5,3
	ld	a3,328(a4)
	add	a5,a5,a3
	sd	a5,328(a4)
	ld	a3,336(a4)
	ble	a5,a3,.L113
	sd	a5,336(a4)
.L113:
	li	a0,-1
	call	do_compaction
	j	.L110
.L116:
	mv	a0,s0
	call	caml_free_for_heap
	j	.L110
	.size	caml_compact_heap, .-caml_compact_heap
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"FL size at phase change = %lu words\n"
	.align	3
.LC7:
	.string	"FL current size = %lu words\n"
	.align	3
.LC8:
	.string	"Estimated overhead = %lu%%\n"
	.align	3
.LC9:
	.string	"Automatic compaction triggered.\n"
	.align	3
.LC10:
	.string	"Measured overhead: %lu%%\n"
	.align	3
.LC11:
	.string	"Automatic compaction aborted.\n"
	.section	.text.caml_compact_heap_maybe,"ax",@progbits
	.align	1
	.globl	caml_compact_heap_maybe
	.type	caml_compact_heap_maybe, @function
caml_compact_heap_maybe:
	ld	a4,caml_percent_max
	li	a5,999424
	addi	a5,a5,575
	bgtu	a4,a5,.L130
	ld	a5,Caml_state
	ld	a3,320(a5)
	li	a4,2
	bgt	a3,a4,.L133
.L130:
	ret
.L133:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	fsd	fs0,8(sp)
	ld	s0,328(a5)
	li	a0,0
	call	caml_clip_heap_chunk_wsz
	slli	a0,a0,1
	bleu	s0,a0,.L117
	ld	a5,caml_fl_cur_wsz
	fcvt.d.lu	fa5,a5
	fld	fa4,.LC4,a5
	fmul.d	fa4,fa5,fa4
	ld	a2,caml_fl_wsz_at_phase_change
	fcvt.d.lu	fa3,a2
	fadd.d	fa3,fa3,fa3
	fsub.d	fa4,fa4,fa3
	fmv.d.x	fa3,zero
	flt.d	a5,fa4,fa3
	bne	a5,zero,.L119
	fmv.d	fa5,fa4
.L119:
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa4,a5
	fle.d	a5,fa4,fa5
	bne	a5,zero,.L124
	fld	fs0,.LC5,a5
	fmul.d	fs0,fa5,fs0
	fsub.d	fa5,fa4,fa5
	fdiv.d	fs0,fs0,fa5
	fld	fa5,.LC3,a5
	fgt.d	a5,fs0,fa5
	beq	a5,zero,.L120
	fld	fs0,.LC3,a5
	j	.L120
.L124:
	fld	fs0,.LC3,a5
.L120:
	lla	a1,.LC6
	li	a0,512
	call	caml_gc_message
	ld	a2,caml_fl_cur_wsz
	lla	a1,.LC7
	li	a0,512
	call	caml_gc_message
	fcvt.lu.d a2,fs0,rtz
	lla	a1,.LC8
	li	a0,512
	call	caml_gc_message
	ld	a5,caml_percent_max
	fcvt.d.lu	fa5,a5
	fle.d	a5,fa5,fs0
	bne	a5,zero,.L134
.L117:
	ld	ra,24(sp)
	ld	s0,16(sp)
	fld	fs0,8(sp)
	addi	sp,sp,32
	jr	ra
.L134:
	lla	a1,.LC9
	li	a0,512
	call	caml_gc_message
	call	caml_empty_minor_heap
	call	caml_finish_major_cycle
	ld	a5,caml_fl_cur_wsz
	fcvt.d.lu	fa4,a5
	fld	fs0,.LC5,a5
	fmul.d	fs0,fa4,fs0
	ld	a5,Caml_state
	ld	a5,328(a5)
	fcvt.d.l	fa5,a5
	fsub.d	fa5,fa5,fa4
	fdiv.d	fs0,fs0,fa5
	fcvt.lu.d a2,fs0,rtz
	lla	a1,.LC10
	li	a0,512
	call	caml_gc_message
	ld	a5,caml_percent_max
	fcvt.d.lu	fa5,a5
	fle.d	a5,fa5,fs0
	beq	a5,zero,.L128
	li	a0,-1
	call	caml_compact_heap
	j	.L117
.L128:
	lla	a1,.LC11
	li	a0,512
	call	caml_gc_message
	j	.L117
	.size	caml_compact_heap_maybe, .-caml_compact_heap_maybe
	.globl	caml_percent_max
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC3:
	.word	0
	.word	1093567616
	.align	3
.LC4:
	.word	0
	.word	1074266112
	.align	3
.LC5:
	.word	0
	.word	1079574528
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_percent_max, @object
	.size	caml_percent_max, 8
caml_percent_max:
	.zero	8
	.type	compact_fl, @object
	.size	compact_fl, 8
compact_fl:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
