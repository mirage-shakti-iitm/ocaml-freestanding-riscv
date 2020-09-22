	.file	"intern.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.read64u,"ax",@progbits
	.align	1
	.type	read64u, @function
read64u:
	lla	a2,intern_src
	ld	a4,0(a2)
	lbu	a5,0(a4)
	slli	a5,a5,56
	lbu	a3,1(a4)
	slli	a3,a3,48
	add	a5,a5,a3
	lbu	a3,2(a4)
	slli	a3,a3,40
	add	a5,a5,a3
	lbu	a0,3(a4)
	slli	a0,a0,32
	add	a5,a5,a0
	lbu	a0,4(a4)
	slli	a0,a0,24
	add	a5,a5,a0
	lbu	a0,5(a4)
	slli	a0,a0,16
	add	a5,a5,a0
	lbu	a0,6(a4)
	slli	a0,a0,8
	add	a5,a5,a0
	lbu	a0,7(a4)
	addi	a4,a4,8
	sd	a4,0(a2)
	add	a0,a5,a0
	ret
	.size	read64u, .-read64u
	.section	.text.intern_init,"ax",@progbits
	.align	1
	.type	intern_init, @function
intern_init:
	sd	a0,intern_src,a5
	sd	a1,intern_input,a5
	ret
	.size	intern_init, .-intern_init
	.section	.text.intern_free_stack,"ax",@progbits
	.align	1
	.type	intern_free_stack, @function
intern_free_stack:
	ld	a0,intern_stack
	lla	a5,intern_stack_init
	beq	a0,a5,.L6
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_stat_free
	lla	a5,intern_stack_init
	sd	a5,intern_stack,a4
	lla	a5,intern_stack_init+6144
	sd	a5,intern_stack_limit,a4
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L6:
	ret
	.size	intern_free_stack, .-intern_free_stack
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%s: bad object"
	.section	.text.caml_parse_header,"ax",@progbits
	.align	1
	.type	caml_parse_header, @function
caml_parse_header:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	mv	s0,a1
	lla	a1,intern_src
	ld	a2,0(a1)
	lbu	a5,0(a2)
	slliw	a5,a5,24
	lbu	a4,1(a2)
	slliw	a4,a4,16
	addw	a5,a5,a4
	lbu	a4,2(a2)
	slliw	a4,a4,8
	addw	a5,a5,a4
	lbu	a4,3(a2)
	addw	a5,a5,a4
	sext.w	a3,a5
	addi	a4,a2,4
	sd	a4,0(a1)
	sw	a5,0(s0)
	li	a5,-2070568960
	addi	a5,a5,1726
	beq	a3,a5,.L10
	li	a5,-2070568960
	addi	a5,a5,1727
	bne	a3,a5,.L16
	li	a5,32
	sw	a5,4(s0)
	addi	a4,a4,4
	sd	a4,intern_src,a5
	call	read64u
	sd	a0,8(s0)
	call	read64u
	sd	a0,16(s0)
	call	read64u
	sd	a0,24(s0)
	j	.L9
.L10:
	li	a5,20
	sw	a5,4(s0)
	lbu	a5,4(a2)
	slliw	a5,a5,24
	lbu	a3,1(a4)
	slliw	a3,a3,16
	addw	a5,a5,a3
	lbu	a3,2(a4)
	slliw	a3,a3,8
	addw	a5,a5,a3
	lbu	a3,3(a4)
	addw	a5,a5,a3
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,8(s0)
	lbu	a5,4(a4)
	slliw	a5,a5,24
	lbu	a3,5(a4)
	slliw	a3,a3,16
	addw	a5,a5,a3
	lbu	a3,6(a4)
	slliw	a3,a3,8
	addw	a5,a5,a3
	lbu	a3,7(a4)
	addw	a5,a5,a3
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,16(s0)
	lbu	a5,12(a4)
	slliw	a5,a5,24
	lbu	a3,13(a4)
	slliw	a3,a3,16
	addw	a5,a5,a3
	lbu	a3,14(a4)
	slliw	a3,a3,8
	addw	a5,a5,a3
	lbu	a3,15(a4)
	addw	a5,a5,a3
	addi	a4,a4,16
	sd	a4,intern_src,a3
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,24(s0)
.L9:
	ld	ra,120(sp)
	ld	s0,112(sp)
	addi	sp,sp,128
	jr	ra
.L16:
	sb	zero,107(sp)
	mv	a3,a0
	lla	a2,.LC0
	li	a1,99
	addi	a0,sp,8
	call	snprintf
	addi	a0,sp,8
	call	caml_failwith
	.size	caml_parse_header, .-caml_parse_header
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"input_value: unknown code module %02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"
	.section	.text.intern_bad_code_pointer,"ax",@progbits
	.align	1
	.type	intern_bad_code_pointer, @function
intern_bad_code_pointer:
	addi	sp,sp,-368
	sd	ra,360(sp)
	lbu	a5,15(a0)
	sd	a5,80(sp)
	lbu	a5,14(a0)
	sd	a5,72(sp)
	lbu	a5,13(a0)
	sd	a5,64(sp)
	lbu	a5,12(a0)
	sd	a5,56(sp)
	lbu	a5,11(a0)
	sd	a5,48(sp)
	lbu	a5,10(a0)
	sd	a5,40(sp)
	lbu	a5,9(a0)
	sd	a5,32(sp)
	lbu	a5,8(a0)
	sd	a5,24(sp)
	lbu	a5,7(a0)
	sd	a5,16(sp)
	lbu	a5,6(a0)
	sd	a5,8(sp)
	lbu	a5,5(a0)
	sd	a5,0(sp)
	lbu	a7,4(a0)
	lbu	a6,3(a0)
	lbu	a5,2(a0)
	lbu	a4,1(a0)
	lbu	a3,0(a0)
	lla	a2,.LC1
	li	a1,256
	addi	a0,sp,96
	call	snprintf
	addi	a0,sp,96
	call	caml_failwith
	.size	intern_bad_code_pointer, .-intern_bad_code_pointer
	.section	.text.readfloat,"ax",@progbits
	.align	1
	.type	readfloat, @function
readfloat:
	lla	a4,intern_src
	ld	a5,0(a4)
	lbu	t5,0(a5)
	lbu	t4,1(a5)
	lbu	t3,2(a5)
	lbu	t1,3(a5)
	lbu	a7,4(a5)
	lbu	a6,5(a5)
	lbu	a2,6(a5)
	lbu	a3,7(a5)
	sb	t5,0(a0)
	sb	t4,1(a0)
	sb	t3,2(a0)
	sb	t1,3(a0)
	sb	a7,4(a0)
	sb	a6,5(a0)
	sb	a2,6(a0)
	sb	a3,7(a0)
	addi	a5,a5,8
	sd	a5,0(a4)
	li	a5,12
	beq	a1,a5,.L19
	andi	a4,t5,0xff
	andi	a5,t4,0xff
	andi	a3,a3,0xff
	sb	a3,0(a0)
	andi	a3,a2,0xff
	sb	a3,1(a0)
	sb	a4,7(a0)
	sb	a5,6(a0)
	andi	a4,t3,0xff
	andi	a5,t1,0xff
	andi	a3,a6,0xff
	sb	a3,2(a0)
	andi	a3,a7,0xff
	sb	a3,3(a0)
	sb	a4,5(a0)
	sb	a5,4(a0)
.L19:
	ret
	.size	readfloat, .-readfloat
	.section	.text.readfloats,"ax",@progbits
	.align	1
	.type	readfloats, @function
readfloats:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s1,a0
	mv	s0,a1
	mv	s3,a2
	slli	s5,a1,3
	lla	s4,intern_src
	ld	s2,0(s4)
	mv	a2,s5
	mv	a1,s2
	call	memcpy
	add	s2,s2,s5
	sd	s2,0(s4)
	li	a5,14
	beq	s3,a5,.L21
	li	a5,7
	beq	s3,a5,.L21
	li	a4,0
	j	.L23
.L24:
	slli	a5,a4,3
	add	a5,s1,a5
	lbu	a2,0(a5)
	lbu	a3,1(a5)
	lbu	a1,7(a5)
	sb	a1,0(a5)
	lbu	a1,6(a5)
	sb	a1,1(a5)
	sb	a2,7(a5)
	sb	a3,6(a5)
	lbu	a2,2(a5)
	lbu	a3,3(a5)
	lbu	a1,5(a5)
	sb	a1,2(a5)
	lbu	a1,4(a5)
	sb	a1,3(a5)
	sb	a2,5(a5)
	sb	a3,4(a5)
	addi	a4,a4,1
.L23:
	bltu	a4,s0,.L24
.L21:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
	.size	readfloats, .-readfloats
	.section	.text.intern_resolve_code_pointer,"ax",@progbits
	.align	1
	.type	intern_resolve_code_pointer, @function
intern_resolve_code_pointer:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s2,a0
	mv	s3,a1
	lw	s1,caml_code_fragments_table
	addiw	s1,s1,-1
	j	.L28
.L37:
	ld	a1,0(s0)
	ld	a2,8(s0)
	sub	a2,a2,a1
	addi	a0,s0,16
	call	caml_md5_block
	li	a5,1
	sb	a5,32(s0)
.L29:
	li	a2,16
	addi	a1,s0,16
	mv	a0,s2
	call	memcmp
	beq	a0,zero,.L35
	addiw	s1,s1,-1
.L28:
	blt	s1,zero,.L36
	slli	a5,s1,3
	ld	a4,caml_code_fragments_table+8
	add	a5,a4,a5
	ld	s0,0(a5)
	lbu	a5,32(s0)
	bne	a5,zero,.L29
	j	.L37
.L35:
	ld	a0,0(s0)
	add	a0,a0,s3
	ld	a5,8(s0)
	bltu	a0,a5,.L27
	li	a0,0
	j	.L27
.L36:
	li	a0,0
.L27:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	intern_resolve_code_pointer, .-intern_resolve_code_pointer
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Stack overflow in un-marshaling value\n"
	.section	.text.intern_stack_overflow,"ax",@progbits
	.align	1
	.type	intern_stack_overflow, @function
intern_stack_overflow:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC2
	li	a0,4
	call	caml_gc_message
	call	intern_free_stack
	call	caml_raise_out_of_memory
	.size	intern_stack_overflow, .-intern_stack_overflow
	.section	.text.intern_resize_stack,"ax",@progbits
	.align	1
	.type	intern_resize_stack, @function
intern_resize_stack:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	ld	a5,intern_stack
	ld	s0,intern_stack_limit
	sub	s0,s0,a5
	srai	s0,s0,3
	ld	a4,.LC3
	mul	s0,s0,a4
	slli	s0,s0,1
	sub	s2,a0,a5
	li	a4,104857600
	bgeu	s0,a4,.L46
	lla	a4,intern_stack_init
	beq	a5,a4,.L47
	slli	a1,s0,1
	add	a1,a1,s0
	slli	a1,a1,3
	mv	a0,a5
	call	caml_stat_resize_noexc
	mv	s1,a0
	beq	a0,zero,.L48
.L44:
	sd	s1,intern_stack,a5
	slli	a5,s0,1
	add	s0,a5,s0
	slli	s0,s0,3
	add	s0,s1,s0
	sd	s0,intern_stack_limit,a5
	add	a0,s1,s2
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L46:
	call	intern_stack_overflow
.L47:
	slli	a0,s0,1
	add	a0,a0,s0
	slli	a0,a0,3
	call	caml_stat_alloc_noexc
	mv	s1,a0
	beq	a0,zero,.L49
	li	a2,8192
	addi	a2,a2,-2048
	lla	a1,intern_stack_init
	call	memcpy
	j	.L44
.L49:
	call	intern_stack_overflow
.L48:
	call	intern_stack_overflow
	.size	intern_resize_stack, .-intern_resize_stack
	.section	.text.intern_cleanup,"ax",@progbits
	.align	1
	.type	intern_cleanup, @function
intern_cleanup:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,intern_input
	beq	a0,zero,.L51
	call	caml_stat_free
	sd	zero,intern_input,a5
.L51:
	ld	a0,intern_obj_table
	beq	a0,zero,.L52
	call	caml_stat_free
	sd	zero,intern_obj_table,a5
.L52:
	ld	a0,intern_extra_block
	beq	a0,zero,.L53
	call	caml_free_for_heap
	sd	zero,intern_extra_block,a5
.L54:
	call	intern_free_stack
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L53:
	ld	a5,intern_block
	beq	a5,zero,.L54
	ld	a4,intern_header
	sd	a4,-8(a5)
	sd	zero,intern_block,a5
	j	.L54
	.size	intern_cleanup, .-intern_cleanup
	.section	.text.intern_alloc,"ax",@progbits
	.align	1
	.type	intern_alloc, @function
intern_alloc:
	beq	a0,zero,.L69
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a1
	mv	s0,a2
	addi	s1,a0,-1
	bne	a2,zero,.L58
	li	a5,-1
	srli	a5,a5,10
	bleu	s1,a5,.L59
.L58:
	addi	a0,a0,512
	slli	a0,a0,3
	addi	a0,a0,-1
	li	a5,-4096
	and	a0,a0,a5
	call	caml_alloc_for_heap
	sd	a0,intern_extra_block,a5
	beq	a0,zero,.L72
	beq	s0,zero,.L73
	li	a0,768
.L61:
	sd	a0,intern_color,a5
	ld	a5,intern_extra_block
	sd	a5,intern_dest,a4
.L62:
	sd	zero,obj_counter,a5
	bne	s2,zero,.L74
.L56:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L72:
	call	intern_cleanup
	call	caml_raise_out_of_memory
.L73:
	call	caml_allocation_color
	j	.L61
.L59:
	li	a5,256
	bgtu	s1,a5,.L63
	bne	s1,zero,.L64
	ld	a5,caml_atom_table
	addi	a5,a5,2024
	sd	a5,intern_block,a4
.L65:
	ld	a5,intern_block
	addi	a4,a5,-8
	ld	a5,-8(a5)
	sd	a5,intern_header,a3
	andi	a5,a5,768
	sd	a5,intern_color,a3
	sd	a4,intern_dest,a5
	j	.L62
.L64:
	lla	a3,Caml_state
	ld	a2,0(a3)
	slli	a4,s1,3
	li	a5,-8
	sub	a4,a5,a4
	ld	a5,0(a2)
	add	a5,a5,a4
	sd	a5,0(a2)
	ld	a5,0(a3)
	ld	a4,0(a5)
	ld	a5,8(a5)
	bltu	a4,a5,.L75
.L66:
	slli	s1,s1,10
	lla	a5,Caml_state
	ld	a4,0(a5)
	ld	a4,0(a4)
	addi	s1,s1,252
	sd	s1,0(a4)
	ld	a5,0(a5)
	ld	a5,0(a5)
	addi	a5,a5,8
	sd	a5,intern_block,a4
	j	.L65
.L75:
	li	a3,0
	li	a2,1
	li	a1,0
	mv	a0,s1
	call	caml_alloc_small_dispatch
	j	.L66
.L63:
	li	a1,252
	mv	a0,s1
	call	caml_alloc_shr_no_track_noexc
	sd	a0,intern_block,a5
	bne	a0,zero,.L65
	call	intern_cleanup
	call	caml_raise_out_of_memory
.L74:
	slli	a0,s2,3
	call	caml_stat_alloc_noexc
	sd	a0,intern_obj_table,a5
	bne	a0,zero,.L56
	call	intern_cleanup
	call	caml_raise_out_of_memory
.L69:
	ret
	.size	intern_alloc, .-intern_alloc
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Debugger.function_placeholder"
	.align	3
.LC5:
	.string	"input_value: unknown custom block identifier"
	.align	3
.LC6:
	.string	"input_value: expected a fixed-size custom block"
	.align	3
.LC7:
	.string	"input_value: incorrect length of serialized custom block"
	.align	3
.LC8:
	.string	"input_value: ill-formed message"
	.section	.text.intern_rec,"ax",@progbits
	.align	1
	.type	intern_rec, @function
intern_rec:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	mv	s0,a0
	ld	a0,intern_stack
	addi	s1,a0,24
	ld	a5,intern_stack_limit
	bleu	a5,s1,.L143
.L77:
	sw	zero,16(s1)
	sd	s0,0(s1)
	li	a5,1
	sd	a5,8(s1)
	j	.L82
.L143:
	mv	a0,s1
	call	intern_resize_stack
	mv	s1,a0
	j	.L77
.L79:
	ld	a5,8(s2)
	bge	a5,zero,.L144
.L83:
	addi	s1,s1,-24
.L82:
	ld	a5,intern_stack
	beq	a5,s1,.L145
	ld	s2,0(s1)
	lw	a5,16(s1)
	li	a4,1
	beq	a5,a4,.L79
	li	a4,2
	beq	a5,a4,.L80
	bne	a5,zero,.L82
	addi	a5,s2,8
	sd	a5,0(s1)
	ld	a5,8(s1)
	addi	a5,a5,-1
	sd	a5,8(s1)
	bne	a5,zero,.L85
	addi	s1,s1,-24
.L85:
	lla	a5,intern_src
	ld	a3,0(a5)
	addi	s3,a3,1
	sd	s3,0(a5)
	lbu	a5,0(a3)
	sext.w	s0,a5
	li	a4,63
	bleu	s0,a4,.L86
	li	a4,127
	bleu	s0,a4,.L87
	andi	a5,a5,15
	srliw	s0,s0,4
	andi	s0,s0,7
.L88:
	bne	s0,zero,.L89
	addi	a5,a5,1
	slli	a5,a5,3
	ld	s3,caml_atom_table
	add	s3,s3,a5
	j	.L90
.L144:
	mv	a0,s2
	call	caml_set_oo_id
	j	.L83
.L80:
	ld	a4,8(s1)
	ld	a5,0(s2)
	add	a5,a5,a4
	sd	a5,0(s2)
	addi	s1,s1,-24
	j	.L82
.L89:
	ld	a3,intern_dest
	addi	s4,a3,8
	mv	s3,s4
	ld	a4,intern_obj_table
	beq	a4,zero,.L91
	lla	a1,obj_counter
	ld	a2,0(a1)
	addi	a0,a2,1
	sd	a0,0(a1)
	slli	a2,a2,3
	add	a4,a4,a2
	sd	s4,0(a4)
.L91:
	slli	a4,s0,10
	ld	a2,intern_color
	add	a4,a4,a2
	add	a4,a5,a4
	sd	a4,0(a3)
	addi	a4,s0,1
	slli	a4,a4,3
	add	a3,a3,a4
	sd	a3,intern_dest,a4
	li	a4,248
	beq	a5,a4,.L146
	addi	s1,s1,24
	ld	a5,intern_stack_limit
	bleu	a5,s1,.L147
.L97:
	sw	zero,16(s1)
	sd	s4,0(s1)
	sd	s0,8(s1)
	j	.L90
.L146:
	li	a5,2
	beq	s0,a5,.L93
	addi	s1,s1,24
	ld	a5,intern_stack_limit
	bleu	a5,s1,.L148
.L94:
	sw	zero,16(s1)
	addi	a5,s4,16
	sd	a5,0(s1)
	addi	s0,s0,-2
	sd	s0,8(s1)
.L93:
	addi	a0,s1,24
	ld	a5,intern_stack_limit
	bleu	a5,a0,.L149
.L95:
	li	a5,1
	sw	a5,16(a0)
	sd	s4,0(a0)
	sd	a5,8(a0)
	addi	s1,a0,24
	ld	a5,intern_stack_limit
	bleu	a5,s1,.L150
.L96:
	sw	zero,16(s1)
	sd	s4,0(s1)
	li	a5,2
	sd	a5,8(s1)
	j	.L90
.L148:
	mv	a0,s1
	call	intern_resize_stack
	mv	s1,a0
	j	.L94
.L149:
	call	intern_resize_stack
	j	.L95
.L150:
	mv	a0,s1
	call	intern_resize_stack
	mv	s1,a0
	j	.L96
.L147:
	mv	a0,s1
	call	intern_resize_stack
	mv	s1,a0
	j	.L97
.L87:
	slli	a5,a5,1
	andi	a5,a5,126
	addi	s3,a5,1
	j	.L90
.L86:
	li	a4,31
	bleu	s0,a4,.L98
	andi	s0,a5,31
.L99:
	addi	a5,s0,8
	srli	a4,a5,3
	ld	a3,intern_dest
	addi	a0,a3,8
	mv	s3,a0
	ld	a2,intern_obj_table
	beq	a2,zero,.L100
	lla	a6,obj_counter
	ld	a1,0(a6)
	addi	a7,a1,1
	sd	a7,0(a6)
	slli	a1,a1,3
	add	a2,a2,a1
	sd	a0,0(a2)
.L100:
	slli	a2,a4,10
	ld	a1,intern_color
	add	a2,a2,a1
	addi	a2,a2,252
	sd	a2,0(a3)
	addi	a4,a4,1
	slli	a4,a4,3
	add	a4,a3,a4
	sd	a4,intern_dest,a3
	andi	a5,a5,-8
	add	a4,a5,a0
	sd	zero,-8(a4)
	addi	a5,a5,-1
	add	a4,a0,a5
	subw	a5,a5,s0
	sb	a5,0(a4)
	lla	s5,intern_src
	ld	s4,0(s5)
	mv	a2,s0
	mv	a1,s4
	call	memcpy
	add	a5,s4,s0
	sd	a5,0(s5)
.L90:
	sd	s3,0(s2)
	j	.L82
.L98:
	li	a4,25
	bgtu	a5,a4,.L101
	slli	a5,a5,2
	lla	a4,.L103
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L103:
	.word	.L122-.L103
	.word	.L121-.L103
	.word	.L120-.L103
	.word	.L119-.L103
	.word	.L118-.L103
	.word	.L117-.L103
	.word	.L116-.L103
	.word	.L110-.L103
	.word	.L115-.L103
	.word	.L114-.L103
	.word	.L113-.L103
	.word	.L112-.L103
	.word	.L112-.L103
	.word	.L111-.L103
	.word	.L111-.L103
	.word	.L110-.L103
	.word	.L109-.L103
	.word	.L108-.L103
	.word	.L102-.L103
	.word	.L107-.L103
	.word	.L106-.L103
	.word	.L105-.L103
	.word	.L104-.L103
	.word	.L104-.L103
	.word	.L102-.L103
	.word	.L102-.L103
	.section	.text.intern_rec
.L122:
	addi	s3,s3,1
	sd	s3,intern_src,a5
	lb	a5,1(a3)
	slli	a5,a5,1
	addi	s3,a5,1
	j	.L90
.L121:
	lbu	a5,1(a3)
	slliw	a5,a5,8
	slliw	a5,a5,16
	sraiw	a5,a5,16
	lbu	a4,1(s3)
	addw	a5,a5,a4
	slliw	a5,a5,16
	sraiw	a5,a5,16
	addi	s3,s3,2
	sd	s3,intern_src,a4
	slli	a5,a5,1
	addi	s3,a5,1
	j	.L90
.L120:
	lbu	a5,1(a3)
	slliw	a5,a5,24
	lbu	a4,1(s3)
	slliw	a4,a4,16
	addw	a5,a5,a4
	lbu	a4,2(s3)
	slliw	a4,a4,8
	addw	a5,a5,a4
	lbu	a4,3(s3)
	addw	a5,a5,a4
	addi	s3,s3,4
	sd	s3,intern_src,a4
	slli	a5,a5,1
	addi	s3,a5,1
	j	.L90
.L119:
	call	read64u
	slli	a5,a0,1
	addi	s3,a5,1
	j	.L90
.L118:
	addi	s3,s3,1
	sd	s3,intern_src,a5
	lbu	a0,1(a3)
.L123:
	ld	a5,obj_counter
	sub	a5,a5,a0
	slli	a5,a5,3
	ld	a4,intern_obj_table
	add	a5,a4,a5
	ld	s3,0(a5)
	j	.L90
.L117:
	lbu	a0,1(a3)
	slliw	a0,a0,8
	lbu	a5,1(s3)
	addw	a0,a0,a5
	addi	s3,s3,2
	sd	s3,intern_src,a5
	slli	a0,a0,48
	srli	a0,a0,48
	j	.L123
.L116:
	lbu	a0,1(a3)
	slliw	a0,a0,24
	lbu	a5,1(s3)
	slliw	a5,a5,16
	addw	a0,a0,a5
	lbu	a5,2(s3)
	slliw	a5,a5,8
	addw	a0,a0,a5
	lbu	a5,3(s3)
	addw	a0,a0,a5
	addi	s3,s3,4
	sd	s3,intern_src,a5
	slli	a0,a0,32
	srli	a0,a0,32
	j	.L123
.L106:
	call	read64u
	j	.L123
.L115:
	lbu	s0,1(a3)
	slliw	s0,s0,24
	lbu	a5,1(s3)
	slliw	a5,a5,16
	addw	s0,s0,a5
	lbu	a5,2(s3)
	slliw	a5,a5,8
	addw	s0,s0,a5
	lbu	a5,3(s3)
	addw	s0,s0,a5
	addi	s3,s3,4
	sd	s3,intern_src,a4
	andi	a5,a5,0xff
	srliw	s0,s0,10
	j	.L88
.L107:
	call	read64u
	andi	a5,a0,0xff
	srli	s0,a0,10
	j	.L88
.L114:
	addi	s3,s3,1
	sd	s3,intern_src,a5
	lbu	s0,1(a3)
	j	.L99
.L113:
	lbu	a5,1(a3)
	slliw	a5,a5,24
	lbu	a4,1(s3)
	slliw	a4,a4,16
	addw	a5,a5,a4
	lbu	a4,2(s3)
	slliw	a4,a4,8
	addw	a5,a5,a4
	lbu	s0,3(s3)
	addw	a5,a5,s0
	addi	s3,s3,4
	sd	s3,intern_src,a4
	slli	s0,a5,32
	srli	s0,s0,32
	j	.L99
.L105:
	call	read64u
	mv	s0,a0
	j	.L99
.L112:
	ld	a5,intern_dest
	addi	a0,a5,8
	mv	s3,a0
	ld	a4,intern_obj_table
	beq	a4,zero,.L124
	lla	a2,obj_counter
	ld	a3,0(a2)
	addi	a1,a3,1
	sd	a1,0(a2)
	slli	a3,a3,3
	add	a4,a4,a3
	sd	a0,0(a4)
.L124:
	ld	a4,intern_color
	addi	a4,a4,1277
	sd	a4,0(a5)
	addi	a5,a5,16
	sd	a5,intern_dest,a4
	mv	a1,s0
	call	readfloat
	j	.L90
.L111:
	addi	s3,s3,1
	sd	s3,intern_src,a5
	lbu	a1,1(a3)
.L125:
	ld	a5,intern_dest
	addi	a0,a5,8
	mv	s3,a0
	ld	a4,intern_obj_table
	beq	a4,zero,.L126
	lla	a2,obj_counter
	ld	a3,0(a2)
	addi	a6,a3,1
	sd	a6,0(a2)
	slli	a3,a3,3
	add	a4,a4,a3
	sd	a0,0(a4)
.L126:
	slli	a4,a1,10
	ld	a3,intern_color
	add	a4,a4,a3
	addi	a4,a4,254
	sd	a4,0(a5)
	addi	a4,a1,1
	slli	a4,a4,3
	add	a5,a5,a4
	sd	a5,intern_dest,a4
	mv	a2,s0
	call	readfloats
	j	.L90
.L110:
	lbu	a1,1(a3)
	slliw	a1,a1,24
	lbu	a5,1(s3)
	slliw	a5,a5,16
	addw	a1,a1,a5
	lbu	a5,2(s3)
	slliw	a5,a5,8
	addw	a1,a1,a5
	lbu	a5,3(s3)
	addw	a1,a1,a5
	addi	s3,s3,4
	sd	s3,intern_src,a5
	slli	a1,a1,32
	srli	a1,a1,32
	j	.L125
.L104:
	call	read64u
	mv	a1,a0
	j	.L125
.L109:
	lbu	s0,1(a3)
	slliw	s0,s0,24
	lbu	a5,1(s3)
	slliw	a5,a5,16
	addw	s0,s0,a5
	lbu	a5,2(s3)
	slliw	a5,a5,8
	addw	s0,s0,a5
	lbu	a5,3(s3)
	addw	s0,s0,a5
	slli	s0,s0,32
	srli	s0,s0,32
	li	a2,16
	addi	a1,s3,4
	mv	a0,sp
	call	memcpy
	addi	s3,s3,20
	sd	s3,intern_src,a5
	mv	a1,s0
	mv	a0,sp
	call	intern_resolve_code_pointer
	beq	a0,zero,.L127
	mv	s3,a0
	j	.L90
.L127:
	lla	a0,.LC4
	call	caml_named_value
	beq	a0,zero,.L128
	ld	s3,0(a0)
	j	.L90
.L128:
	call	intern_cleanup
	mv	a0,sp
	call	intern_bad_code_pointer
.L108:
	lbu	s0,1(a3)
	slliw	s0,s0,24
	lbu	a5,1(s3)
	slliw	a5,a5,16
	addw	s0,s0,a5
	lbu	a5,2(s3)
	slliw	a5,a5,8
	addw	s0,s0,a5
	lbu	a5,3(s3)
	addw	s0,s0,a5
	addi	s3,s3,4
	sd	s3,intern_src,a5
	addi	a0,s1,24
	ld	a5,intern_stack_limit
	bleu	a5,a0,.L151
.L129:
	sd	s2,0(a0)
	li	a5,2
	sw	a5,16(a0)
	slli	s0,s0,32
	srli	s0,s0,32
	sd	s0,8(a0)
	addi	s1,a0,24
	ld	a5,intern_stack_limit
	bleu	a5,s1,.L152
.L130:
	sw	zero,16(s1)
	sd	s2,0(s1)
	li	a5,1
	sd	a5,8(s1)
	j	.L82
.L151:
	call	intern_resize_stack
	j	.L129
.L152:
	mv	a0,s1
	call	intern_resize_stack
	mv	s1,a0
	j	.L130
.L102:
	mv	a0,s3
	call	caml_find_custom_operations
	mv	s4,a0
	beq	a0,zero,.L153
	li	a5,25
	beq	s0,a5,.L154
.L133:
	lla	a4,intern_src
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	lbu	a5,0(a5)
	bne	a5,zero,.L133
	li	a5,18
	beq	s0,a5,.L155
	li	a5,25
	bne	s0,a5,.L136
	ld	a5,56(s4)
	ld	s0,8(a5)
.L137:
	ld	a5,40(s4)
	ld	a0,intern_dest
	addi	a0,a0,16
	jalr	a5
	bne	s0,a0,.L156
.L135:
	addi	a0,a0,7
	srli	s0,a0,3
	addi	a5,s0,1
	ld	a4,intern_dest
	addi	s5,a4,8
	mv	s3,s5
	ld	a3,intern_obj_table
	beq	a3,zero,.L138
	lla	a1,obj_counter
	ld	a2,0(a1)
	addi	a0,a2,1
	sd	a0,0(a1)
	slli	a2,a2,3
	add	a3,a3,a2
	sd	s5,0(a3)
.L138:
	slli	a5,a5,10
	ld	a3,intern_color
	add	a5,a5,a3
	addi	a5,a5,255
	sd	a5,0(a4)
	sd	s4,8(a4)
	ld	a5,8(s4)
	beq	a5,zero,.L139
	ld	a5,Caml_state
	ld	a4,40(a5)
	bgeu	s5,a4,.L139
	ld	a4,32(a5)
	bleu	s5,a4,.L139
	ld	s4,120(a5)
	ld	a4,24(s4)
	ld	a5,32(s4)
	bgeu	a4,a5,.L157
.L140:
	ld	a5,24(s4)
	addi	a4,a5,24
	sd	a4,24(s4)
	sd	s5,0(a5)
	sd	zero,8(a5)
	li	a4,1
	sd	a4,16(a5)
.L139:
	addi	a5,s0,2
	lla	a3,intern_dest
	slli	a5,a5,3
	ld	a4,0(a3)
	add	a5,a4,a5
	sd	a5,0(a3)
	j	.L90
.L153:
	call	intern_cleanup
	lla	a0,.LC5
	call	caml_failwith
.L154:
	ld	a5,56(a0)
	bne	a5,zero,.L133
	call	intern_cleanup
	lla	a0,.LC6
	call	caml_failwith
.L155:
	ld	a5,40(s4)
	ld	a0,intern_dest
	addi	a0,a0,16
	jalr	a5
	j	.L135
.L136:
	addi	a3,a3,4
	sd	a3,intern_src,a5
	call	read64u
	mv	s0,a0
	j	.L137
.L156:
	call	intern_cleanup
	lla	a0,.LC7
	call	caml_failwith
.L157:
	mv	a0,s4
	call	caml_realloc_custom_table
	j	.L140
.L101:
	call	intern_cleanup
	lla	a0,.LC8
	call	caml_failwith
.L145:
	call	intern_free_stack
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	addi	sp,sp,80
	jr	ra
	.size	intern_rec, .-intern_rec
	.section	.text.intern_add_to_heap,"ax",@progbits
	.align	1
	.type	intern_add_to_heap, @function
intern_add_to_heap:
	ld	a0,intern_extra_block
	beq	a0,zero,.L159
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a1,-16(a0)
	andi	a1,a1,-8
	add	a1,a0,a1
	ld	a0,intern_dest
	bgeu	a0,a1,.L160
	sub	a1,a1,a0
	li	a3,0
	li	a2,0
	srai	a1,a1,3
	ld	a5,caml_fl_p_make_free_blocks
	jalr	a5
.L160:
	ld	a0,intern_extra_block
	ld	a5,intern_dest
	sub	a5,a5,a0
	srli	a5,a5,3
	lla	a3,caml_allocated_words
	ld	a4,0(a3)
	add	a5,a4,a5
	sd	a5,0(a3)
	call	caml_add_to_heap
	bne	a0,zero,.L167
	lla	a5,intern_extra_block
	ld	a0,0(a5)
	sd	zero,0(a5)
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L167:
	call	intern_cleanup
	call	caml_raise_out_of_memory
.L159:
	ld	a5,intern_block
	beq	a5,zero,.L164
	addi	a0,a5,-8
	sd	zero,intern_block,a5
	ret
.L164:
	ret
	.size	intern_add_to_heap, .-intern_add_to_heap
	.section	.text.intern_end,"ax",@progbits
	.align	1
	.type	intern_end, @function
intern_end:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	mv	a0,a1
	call	intern_add_to_heap
	mv	s0,a0
	ld	s2,intern_dest
	call	intern_cleanup
	beq	s0,zero,.L169
	mv	a1,s2
	mv	a0,s0
	call	caml_memprof_track_interned
.L169:
	call	caml_process_pending_actions
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,8(sp)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	intern_end, .-intern_end
	.section	.text.input_val_from_block,"ax",@progbits
	.align	1
	.type	input_val_from_block, @function
input_val_from_block:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	mv	s0,a0
	li	a2,0
	ld	a1,16(a0)
	ld	a0,24(a0)
	call	intern_alloc
	addi	a0,sp,8
	call	intern_rec
	ld	a1,24(s0)
	ld	a0,8(sp)
	call	intern_end
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	input_val_from_block, .-input_val_from_block
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"input_value: not a binary channel"
	.align	3
.LC10:
	.string	"input_value: truncated object"
	.align	3
.LC11:
	.string	"input_value"
	.section	.text.caml_input_val_core,"ax",@progbits
	.align	1
	.type	caml_input_val_core, @function
caml_input_val_core:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	mv	s1,a0
	mv	s2,a1
	call	caml_channel_binary_mode
	beq	a0,zero,.L182
	li	a2,20
	addi	a1,sp,48
	mv	a0,s1
	call	caml_really_getblock
	beq	a0,zero,.L183
	li	a5,19
	ble	a0,a5,.L184
	lbu	a5,48(sp)
	slliw	a5,a5,24
	lbu	a4,49(sp)
	slliw	a4,a4,16
	addw	a5,a5,a4
	lbu	a4,50(sp)
	slliw	a4,a4,8
	addw	a5,a5,a4
	lbu	a4,51(sp)
	addw	a5,a5,a4
	addi	a4,sp,52
	sd	a4,intern_src,a3
	li	a4,-2070568960
	addi	a4,a4,1727
	beq	a5,a4,.L185
.L177:
	addi	a5,sp,48
	sd	a5,intern_src,a4
	addi	a1,sp,16
	lla	a0,.LC11
	call	caml_parse_header
	ld	a0,24(sp)
	call	caml_stat_alloc
	mv	s0,a0
	ld	a2,24(sp)
	mv	a1,a0
	mv	a0,s1
	call	caml_really_getblock
	ld	a5,24(sp)
	bltu	a0,a5,.L186
	mv	a1,s0
	mv	a0,s0
	call	intern_init
	mv	a2,s2
	ld	a1,32(sp)
	ld	a0,40(sp)
	call	intern_alloc
	addi	a0,sp,8
	call	intern_rec
	bne	s2,zero,.L179
	ld	a1,40(sp)
	ld	a0,8(sp)
	call	intern_end
.L173:
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L182:
	lla	a0,.LC9
	call	caml_failwith
.L183:
	call	caml_raise_end_of_file
.L184:
	lla	a0,.LC10
	call	caml_failwith
.L185:
	li	a2,12
	addi	a1,sp,68
	mv	a0,s1
	call	caml_really_getblock
	li	a5,11
	bgt	a0,a5,.L177
	lla	a0,.LC10
	call	caml_failwith
.L186:
	mv	a0,s0
	call	caml_stat_free
	lla	a0,.LC10
	call	caml_failwith
.L179:
	lla	s0,intern_extra_block
	ld	a0,0(s0)
	call	caml_disown_for_heap
	sd	zero,0(s0)
	sd	zero,intern_block,a5
	call	intern_cleanup
	ld	a0,8(sp)
	call	caml_check_urgent_gc
	j	.L173
	.size	caml_input_val_core, .-caml_input_val_core
	.section	.text.caml_input_val,"ax",@progbits
	.align	1
	.globl	caml_input_val
	.type	caml_input_val, @function
caml_input_val:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,0
	call	caml_input_val_core
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_input_val, .-caml_input_val
	.section	.text.caml_input_value,"ax",@progbits
	.align	1
	.globl	caml_input_value
	.type	caml_input_value, @function
caml_input_value:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
	addi	a5,sp,96
	sd	a5,280(a4)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	ld	s0,8(a0)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L190
	mv	a0,s0
	jalr	a5
.L190:
	mv	a0,s0
	call	caml_input_val
	sd	a0,88(sp)
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L191
	mv	a0,s0
	jalr	a5
.L191:
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
	.size	caml_input_value, .-caml_input_value
	.section	.text.caml_input_value_to_outside_heap,"ax",@progbits
	.align	1
	.globl	caml_input_value_to_outside_heap
	.type	caml_input_value_to_outside_heap, @function
caml_input_value_to_outside_heap:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
	addi	a5,sp,96
	sd	a5,280(a4)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	ld	s0,8(a0)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L194
	mv	a0,s0
	jalr	a5
.L194:
	li	a1,1
	mv	a0,s0
	call	caml_input_val_core
	sd	a0,88(sp)
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L195
	mv	a0,s0
	jalr	a5
.L195:
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
	.size	caml_input_value_to_outside_heap, .-caml_input_value_to_outside_heap
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"input_val_from_string"
	.align	3
.LC13:
	.string	"input_val_from_string: bad length"
	.section	.text.caml_input_val_from_bytes,"ax",@progbits
	.align	1
	.globl	caml_input_val_from_bytes
	.type	caml_input_val_from_bytes, @function
caml_input_val_from_bytes:
	addi	sp,sp,-224
	sd	ra,216(sp)
	sd	s0,208(sp)
	sd	s1,200(sp)
	sd	s2,192(sp)
	sd	a0,8(sp)
	mv	s1,a1
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,128(sp)
	li	a5,1
	sd	a5,144(sp)
	sd	a5,136(sp)
	addi	a3,sp,8
	sd	a3,152(sp)
	sd	a5,120(sp)
	addi	a3,sp,128
	sd	a3,56(sp)
	addi	a3,sp,56
	sd	a3,280(a4)
	sd	a5,72(sp)
	sd	a5,64(sp)
	addi	a5,sp,120
	sd	a5,80(sp)
	li	a1,0
	add	a0,s1,a0
	call	intern_init
	addi	a1,sp,24
	lla	a0,.LC12
	call	caml_parse_header
	lw	s0,28(sp)
	add	s0,s0,s1
	ld	a5,32(sp)
	add	s0,s0,a5
	ld	a0,8(sp)
	call	caml_string_length
	bgtu	s0,a0,.L200
	li	a2,0
	ld	a1,40(sp)
	ld	a0,48(sp)
	call	intern_alloc
	lw	a1,28(sp)
	add	s1,a1,s1
	ld	a1,8(sp)
	add	s1,s1,a1
	sd	s1,intern_src,a5
	addi	a0,sp,120
	call	intern_rec
	ld	a1,48(sp)
	ld	a0,120(sp)
	call	intern_end
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	ra,216(sp)
	ld	s0,208(sp)
	ld	s1,200(sp)
	ld	s2,192(sp)
	addi	sp,sp,224
	jr	ra
.L200:
	lla	a0,.LC13
	call	caml_failwith
	.size	caml_input_val_from_bytes, .-caml_input_val_from_bytes
	.section	.text.caml_input_value_from_string,"ax",@progbits
	.align	1
	.globl	caml_input_value_from_string
	.type	caml_input_value_from_string, @function
caml_input_value_from_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_input_val_from_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_input_value_from_string, .-caml_input_value_from_string
	.section	.text.caml_input_value_from_bytes,"ax",@progbits
	.align	1
	.globl	caml_input_value_from_bytes
	.type	caml_input_value_from_bytes, @function
caml_input_value_from_bytes:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	call	caml_input_val_from_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_input_value_from_bytes, .-caml_input_value_from_bytes
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"input_value_from_malloc"
	.section	.text.caml_input_value_from_malloc,"ax",@progbits
	.align	1
	.globl	caml_input_value_from_malloc
	.type	caml_input_value_from_malloc, @function
caml_input_value_from_malloc:
	addi	sp,sp,-48
	sd	ra,40(sp)
	mv	a5,a1
	mv	a1,a0
	add	a0,a0,a5
	call	intern_init
	mv	a1,sp
	lla	a0,.LC14
	call	caml_parse_header
	mv	a0,sp
	call	input_val_from_block
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_input_value_from_malloc, .-caml_input_value_from_malloc
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"input_value_from_block"
	.align	3
.LC16:
	.string	"input_val_from_block: bad length"
	.section	.text.caml_input_value_from_block,"ax",@progbits
	.align	1
	.globl	caml_input_value_from_block
	.type	caml_input_value_from_block, @function
caml_input_value_from_block:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	mv	s0,a1
	li	a1,0
	call	intern_init
	mv	a1,sp
	lla	a0,.LC15
	call	caml_parse_header
	lw	a5,4(sp)
	ld	a4,8(sp)
	add	a5,a5,a4
	bgtu	a5,s0,.L210
	mv	a0,sp
	call	input_val_from_block
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
.L210:
	lla	a0,.LC16
	call	caml_failwith
	.size	caml_input_value_from_block, .-caml_input_value_from_block
	.section	.rodata.str1.8
	.align	3
.LC17:
	.string	"Marshal.data_size: bad object"
	.section	.text.caml_marshal_data_size,"ax",@progbits
	.align	1
	.globl	caml_marshal_data_size
	.type	caml_marshal_data_size, @function
caml_marshal_data_size:
	srai	a1,a1,1
	add	a0,a1,a0
	lbu	a5,0(a0)
	slliw	a5,a5,24
	lbu	a4,1(a0)
	slliw	a4,a4,16
	addw	a5,a5,a4
	lbu	a4,2(a0)
	slliw	a4,a4,8
	addw	a5,a5,a4
	lbu	a4,3(a0)
	addw	a5,a5,a4
	addi	a4,a0,4
	sd	a4,intern_src,a3
	li	a3,-2070568960
	addi	a3,a3,1726
	beq	a5,a3,.L212
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a3,-2070568960
	addi	a3,a3,1727
	bne	a5,a3,.L221
	addi	a4,a4,4
	sd	a4,intern_src,a5
	call	read64u
	mv	a5,a0
	li	a0,32
	addiw	a0,a0,-20
	add	a0,a0,a5
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L212:
	lbu	a0,4(a0)
	slliw	a0,a0,24
	lbu	a5,1(a4)
	slliw	a5,a5,16
	addw	a0,a0,a5
	lbu	a5,2(a4)
	slliw	a5,a5,8
	addw	a0,a0,a5
	lbu	a5,3(a4)
	addw	a0,a0,a5
	addi	a4,a4,4
	sd	a4,intern_src,a5
	slli	a5,a0,32
	srli	a5,a5,32
	li	a0,20
	addiw	a0,a0,-20
	add	a0,a0,a5
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L221:
	lla	a0,.LC17
	call	caml_failwith
	.size	caml_marshal_data_size, .-caml_marshal_data_size
	.section	.text.caml_deserialize_uint_1,"ax",@progbits
	.align	1
	.globl	caml_deserialize_uint_1
	.type	caml_deserialize_uint_1, @function
caml_deserialize_uint_1:
	lla	a4,intern_src
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	lbu	a0,0(a5)
	ret
	.size	caml_deserialize_uint_1, .-caml_deserialize_uint_1
	.section	.text.caml_deserialize_sint_1,"ax",@progbits
	.align	1
	.globl	caml_deserialize_sint_1
	.type	caml_deserialize_sint_1, @function
caml_deserialize_sint_1:
	lla	a4,intern_src
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	lb	a0,0(a5)
	ret
	.size	caml_deserialize_sint_1, .-caml_deserialize_sint_1
	.section	.text.caml_deserialize_uint_2,"ax",@progbits
	.align	1
	.globl	caml_deserialize_uint_2
	.type	caml_deserialize_uint_2, @function
caml_deserialize_uint_2:
	lla	a4,intern_src
	ld	a5,0(a4)
	lbu	a0,0(a5)
	slliw	a0,a0,8
	lbu	a3,1(a5)
	addw	a0,a0,a3
	addi	a5,a5,2
	sd	a5,0(a4)
	slli	a0,a0,48
	srli	a0,a0,48
	ret
	.size	caml_deserialize_uint_2, .-caml_deserialize_uint_2
	.section	.text.caml_deserialize_sint_2,"ax",@progbits
	.align	1
	.globl	caml_deserialize_sint_2
	.type	caml_deserialize_sint_2, @function
caml_deserialize_sint_2:
	lla	a4,intern_src
	ld	a5,0(a4)
	lbu	a0,0(a5)
	slliw	a0,a0,8
	slliw	a0,a0,16
	sraiw	a0,a0,16
	lbu	a3,1(a5)
	addw	a0,a0,a3
	addi	a5,a5,2
	sd	a5,0(a4)
	slliw	a0,a0,16
	sraiw	a0,a0,16
	ret
	.size	caml_deserialize_sint_2, .-caml_deserialize_sint_2
	.section	.text.caml_deserialize_uint_4,"ax",@progbits
	.align	1
	.globl	caml_deserialize_uint_4
	.type	caml_deserialize_uint_4, @function
caml_deserialize_uint_4:
	lla	a3,intern_src
	ld	a4,0(a3)
	lbu	a5,0(a4)
	slliw	a5,a5,24
	lbu	a0,1(a4)
	slliw	a0,a0,16
	addw	a5,a5,a0
	lbu	a0,2(a4)
	slliw	a0,a0,8
	addw	a5,a5,a0
	lbu	a0,3(a4)
	addi	a4,a4,4
	sd	a4,0(a3)
	addw	a0,a5,a0
	ret
	.size	caml_deserialize_uint_4, .-caml_deserialize_uint_4
	.section	.text.caml_deserialize_sint_4,"ax",@progbits
	.align	1
	.globl	caml_deserialize_sint_4
	.type	caml_deserialize_sint_4, @function
caml_deserialize_sint_4:
	lla	a3,intern_src
	ld	a4,0(a3)
	lbu	a5,0(a4)
	slliw	a5,a5,24
	lbu	a0,1(a4)
	slliw	a0,a0,16
	addw	a5,a5,a0
	lbu	a0,2(a4)
	slliw	a0,a0,8
	addw	a5,a5,a0
	lbu	a0,3(a4)
	addi	a4,a4,4
	sd	a4,0(a3)
	addw	a0,a5,a0
	ret
	.size	caml_deserialize_sint_4, .-caml_deserialize_sint_4
	.section	.text.caml_deserialize_block_1,"ax",@progbits
	.align	1
	.globl	caml_deserialize_block_1
	.type	caml_deserialize_block_1, @function
caml_deserialize_block_1:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a1
	lla	s2,intern_src
	ld	s0,0(s2)
	mv	a2,a1
	mv	a1,s0
	call	memcpy
	add	s0,s0,s1
	sd	s0,0(s2)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_block_1, .-caml_deserialize_block_1
	.section	.text.caml_deserialize_block_2,"ax",@progbits
	.align	1
	.globl	caml_deserialize_block_2
	.type	caml_deserialize_block_2, @function
caml_deserialize_block_2:
	ld	a5,intern_src
.L231:
	ble	a1,zero,.L233
	lbu	a4,0(a5)
	lbu	a3,1(a5)
	sb	a3,0(a0)
	sb	a4,1(a0)
	addi	a1,a1,-1
	addi	a5,a5,2
	addi	a0,a0,2
	j	.L231
.L233:
	sd	a5,intern_src,a4
	ret
	.size	caml_deserialize_block_2, .-caml_deserialize_block_2
	.section	.text.caml_deserialize_block_4,"ax",@progbits
	.align	1
	.globl	caml_deserialize_block_4
	.type	caml_deserialize_block_4, @function
caml_deserialize_block_4:
	ld	a5,intern_src
.L235:
	ble	a1,zero,.L237
	lbu	a3,0(a5)
	lbu	a4,1(a5)
	lbu	a2,3(a5)
	sb	a2,0(a0)
	lbu	a2,2(a5)
	sb	a2,1(a0)
	sb	a3,3(a0)
	sb	a4,2(a0)
	addi	a1,a1,-1
	addi	a5,a5,4
	addi	a0,a0,4
	j	.L235
.L237:
	sd	a5,intern_src,a4
	ret
	.size	caml_deserialize_block_4, .-caml_deserialize_block_4
	.section	.text.caml_deserialize_float_4,"ax",@progbits
	.align	1
	.globl	caml_deserialize_float_4
	.type	caml_deserialize_float_4, @function
caml_deserialize_float_4:
	addi	sp,sp,-32
	sd	ra,24(sp)
	li	a1,1
	addi	a0,sp,12
	call	caml_deserialize_block_4
	flw	fa0,12(sp)
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_float_4, .-caml_deserialize_float_4
	.section	.text.caml_deserialize_block_8,"ax",@progbits
	.align	1
	.globl	caml_deserialize_block_8
	.type	caml_deserialize_block_8, @function
caml_deserialize_block_8:
	ld	a5,intern_src
.L241:
	ble	a1,zero,.L243
	lbu	a3,0(a5)
	lbu	a4,1(a5)
	lbu	a2,7(a5)
	sb	a2,0(a0)
	lbu	a2,6(a5)
	sb	a2,1(a0)
	sb	a3,7(a0)
	sb	a4,6(a0)
	lbu	a3,2(a5)
	lbu	a4,3(a5)
	lbu	a2,5(a5)
	sb	a2,2(a0)
	lbu	a2,4(a5)
	sb	a2,3(a0)
	sb	a3,5(a0)
	sb	a4,4(a0)
	addi	a1,a1,-1
	addi	a5,a5,8
	addi	a0,a0,8
	j	.L241
.L243:
	sd	a5,intern_src,a4
	ret
	.size	caml_deserialize_block_8, .-caml_deserialize_block_8
	.section	.text.caml_deserialize_uint_8,"ax",@progbits
	.align	1
	.globl	caml_deserialize_uint_8
	.type	caml_deserialize_uint_8, @function
caml_deserialize_uint_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	li	a1,1
	addi	a0,sp,8
	call	caml_deserialize_block_8
	ld	a0,8(sp)
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_uint_8, .-caml_deserialize_uint_8
	.section	.text.caml_deserialize_sint_8,"ax",@progbits
	.align	1
	.globl	caml_deserialize_sint_8
	.type	caml_deserialize_sint_8, @function
caml_deserialize_sint_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	li	a1,1
	addi	a0,sp,8
	call	caml_deserialize_block_8
	ld	a0,8(sp)
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_sint_8, .-caml_deserialize_sint_8
	.section	.text.caml_deserialize_block_float_8,"ax",@progbits
	.align	1
	.globl	caml_deserialize_block_float_8
	.type	caml_deserialize_block_float_8, @function
caml_deserialize_block_float_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	lla	s2,intern_src
	ld	s0,0(s2)
	slli	s1,a1,3
	mv	a2,s1
	mv	a1,s0
	call	memcpy
	add	s0,s0,s1
	sd	s0,0(s2)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_block_float_8, .-caml_deserialize_block_float_8
	.section	.text.caml_deserialize_float_8,"ax",@progbits
	.align	1
	.globl	caml_deserialize_float_8
	.type	caml_deserialize_float_8, @function
caml_deserialize_float_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	li	a1,1
	addi	a0,sp,8
	call	caml_deserialize_block_float_8
	fld	fa0,8(sp)
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_deserialize_float_8, .-caml_deserialize_float_8
	.section	.text.caml_deserialize_error,"ax",@progbits
	.align	1
	.globl	caml_deserialize_error
	.type	caml_deserialize_error, @function
caml_deserialize_error:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	intern_cleanup
	mv	a0,s0
	call	caml_failwith
	.size	caml_deserialize_error, .-caml_deserialize_error
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC3:
	.dword	-6148914691236517205
	.bss
	.align	3
	.type	intern_stack_init, @object
	.size	intern_stack_init, 6144
intern_stack_init:
	.zero	6144
	.section	.sbss,"aw",@nobits
	.align	3
	.type	intern_block, @object
	.size	intern_block, 8
intern_block:
	.zero	8
	.type	intern_header, @object
	.size	intern_header, 8
intern_header:
	.zero	8
	.type	intern_color, @object
	.size	intern_color, 8
intern_color:
	.zero	8
	.type	intern_obj_table, @object
	.size	intern_obj_table, 8
intern_obj_table:
	.zero	8
	.type	obj_counter, @object
	.size	obj_counter, 8
obj_counter:
	.zero	8
	.type	intern_extra_block, @object
	.size	intern_extra_block, 8
intern_extra_block:
	.zero	8
	.type	intern_dest, @object
	.size	intern_dest, 8
intern_dest:
	.zero	8
	.type	intern_input, @object
	.size	intern_input, 8
intern_input:
	.zero	8
	.type	intern_src, @object
	.size	intern_src, 8
intern_src:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	intern_stack_limit, @object
	.size	intern_stack_limit, 8
intern_stack_limit:
	.dword	intern_stack_init+6144
	.type	intern_stack, @object
	.size	intern_stack, 8
intern_stack:
	.dword	intern_stack_init
	.ident	"GCC: (GNU) 9.2.0"
