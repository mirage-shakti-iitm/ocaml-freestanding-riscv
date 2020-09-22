	.file	"minor_gc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.clear_table,"ax",@progbits
	.align	1
	.type	clear_table, @function
clear_table:
	ld	a5,0(a0)
	sd	a5,24(a0)
	ld	a5,16(a0)
	sd	a5,32(a0)
	ret
	.size	clear_table, .-clear_table
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"not enough memory"
	.section	.text.alloc_generic_table,"ax",@progbits
	.align	1
	.type	alloc_generic_table, @function
alloc_generic_table:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s2,a3
	sd	a1,40(a0)
	sd	a2,48(a0)
	add	a1,a1,a2
	mul	a0,a1,a3
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L6
	mv	s1,a0
	ld	a0,0(s0)
	beq	a0,zero,.L4
	call	caml_stat_free
.L4:
	sd	s1,0(s0)
	sd	s1,24(s0)
	ld	a5,40(s0)
	mul	a4,a5,s2
	add	a4,s1,a4
	sd	a4,16(s0)
	sd	a4,32(s0)
	ld	a3,48(s0)
	add	a5,a5,a3
	mul	a5,a5,s2
	add	s1,s1,a5
	sd	s1,8(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L6:
	lla	a0,.LC0
	call	caml_fatal_error
	.size	alloc_generic_table, .-alloc_generic_table
	.section	.text.reset_table,"ax",@progbits
	.align	1
	.type	reset_table, @function
reset_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	sd	zero,40(a0)
	sd	zero,48(a0)
	ld	a0,0(a0)
	beq	a0,zero,.L8
	call	caml_stat_free
.L8:
	sd	zero,8(s0)
	sd	zero,32(s0)
	sd	zero,16(s0)
	sd	zero,24(s0)
	sd	zero,0(s0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	reset_table, .-reset_table
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"%s"
	.section	.text.realloc_generic_table,"ax",@progbits
	.align	1
	.type	realloc_generic_table, @function
realloc_generic_table:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s0,a0
	mv	s2,a1
	mv	s4,a5
	ld	a5,0(a0)
	beq	a5,zero,.L16
	mv	a1,a4
	ld	a4,32(a0)
	ld	a2,16(a0)
	beq	a4,a2,.L17
	ld	a0,24(a0)
	sub	s3,a0,a5
	ld	s1,40(s0)
	slli	s1,s1,1
	sd	s1,40(s0)
	ld	a5,48(s0)
	add	s1,s1,a5
	mul	s1,s1,s2
	srai	a2,s1,63
	andi	a2,a2,1023
	add	a2,a2,s1
	srai	a2,a2,10
	li	a0,8
	call	caml_gc_message
	mv	a1,s1
	ld	a0,0(s0)
	call	caml_stat_resize_noexc
	sd	a0,0(s0)
	beq	a0,zero,.L18
	ld	a1,40(s0)
	ld	a5,48(s0)
	add	a5,a1,a5
	mul	a5,a5,s2
	add	a5,a0,a5
	sd	a5,8(s0)
	mul	a1,a1,s2
	add	a1,a0,a1
	sd	a1,16(s0)
	add	a0,a0,s3
	sd	a0,24(s0)
	sd	a5,32(s0)
.L10:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L16:
	ld	a5,Caml_state
	ld	a1,80(a5)
	mv	a3,s2
	li	a2,256
	srli	a1,a1,3
	call	alloc_generic_table
	j	.L10
.L17:
	li	a2,0
	mv	a1,a3
	li	a0,8
	call	caml_gc_message
	ld	a5,8(s0)
	sd	a5,32(s0)
	call	caml_request_minor_gc
	j	.L10
.L18:
	mv	a1,s4
	lla	a0,.LC1
	call	caml_fatal_error
	.size	realloc_generic_table, .-realloc_generic_table
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"cannot initialize minor heap"
	.section	.text.caml_alloc_minor_tables,"ax",@progbits
	.align	1
	.globl	caml_alloc_minor_tables
	.type	caml_alloc_minor_tables, @function
caml_alloc_minor_tables:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	lla	s0,Caml_state
	ld	s1,0(s0)
	li	a0,56
	call	caml_stat_alloc_noexc
	sd	a0,104(s1)
	ld	a5,0(s0)
	ld	a0,104(a5)
	beq	a0,zero,.L24
	li	a2,56
	li	a1,0
	call	memset
	lla	s0,Caml_state
	ld	s1,0(s0)
	li	a0,56
	call	caml_stat_alloc_noexc
	sd	a0,112(s1)
	ld	a5,0(s0)
	ld	a0,112(a5)
	beq	a0,zero,.L25
	li	a2,56
	li	a1,0
	call	memset
	lla	s0,Caml_state
	ld	s1,0(s0)
	li	a0,56
	call	caml_stat_alloc_noexc
	sd	a0,120(s1)
	ld	a5,0(s0)
	ld	a0,120(a5)
	beq	a0,zero,.L26
	li	a2,56
	li	a1,0
	call	memset
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L24:
	lla	a0,.LC2
	call	caml_fatal_error
.L25:
	lla	a0,.LC2
	call	caml_fatal_error
.L26:
	lla	a0,.LC2
	call	caml_fatal_error
	.size	caml_alloc_minor_tables, .-caml_alloc_minor_tables
	.section	.text.caml_alloc_table,"ax",@progbits
	.align	1
	.globl	caml_alloc_table
	.type	caml_alloc_table, @function
caml_alloc_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a3,8
	call	alloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_table, .-caml_alloc_table
	.section	.text.caml_alloc_ephe_table,"ax",@progbits
	.align	1
	.globl	caml_alloc_ephe_table
	.type	caml_alloc_ephe_table, @function
caml_alloc_ephe_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a3,16
	call	alloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_ephe_table, .-caml_alloc_ephe_table
	.section	.text.caml_alloc_custom_table,"ax",@progbits
	.align	1
	.globl	caml_alloc_custom_table
	.type	caml_alloc_custom_table, @function
caml_alloc_custom_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a3,24
	call	alloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_custom_table, .-caml_alloc_custom_table
	.section	.text.caml_oldify_one,"ax",@progbits
	.align	1
	.globl	caml_oldify_one
	.type	caml_oldify_one, @function
caml_oldify_one:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s0,a0
	mv	s3,a1
	j	.L34
.L55:
	ld	a5,0(s0)
	sd	a5,0(s3)
	j	.L33
.L56:
	srli	s5,s1,10
	mv	a2,s1
	mv	a0,s5
	call	caml_alloc_shr_for_minor_gc
	sd	a0,0(s3)
	ld	a5,0(s0)
	sd	zero,0(s4)
	sd	a0,0(s0)
	li	a4,1
	bgtu	s5,a4,.L54
	mv	s3,a0
	mv	s0,a5
	j	.L34
.L54:
	sd	a5,0(a0)
	lla	a5,oldify_todo_list
	ld	a4,0(a5)
	sd	a4,8(a0)
	sd	s0,0(a5)
	j	.L33
.L57:
	srli	s0,s1,10
	mv	a2,s1
	mv	a0,s0
	call	caml_alloc_shr_for_minor_gc
	li	a4,0
	j	.L42
.L43:
	slli	a5,a4,3
	add	a3,a0,a5
	add	a5,s5,a5
	ld	a5,0(a5)
	sd	a5,0(a3)
	addi	a4,a4,1
.L42:
	bltu	a4,s0,.L43
	sd	zero,0(s4)
	sd	a0,0(s2)
	sd	a0,0(s3)
	j	.L33
.L58:
	srli	s0,s1,10
	slli	s0,s0,3
	mv	a1,s3
	sub	a0,s2,s0
	call	caml_oldify_one
	ld	a5,0(s3)
	add	s0,a5,s0
	sd	s0,0(s3)
	j	.L33
.L47:
	addi	a5,s0,-8
	ld	a4,-8(s0)
	bne	a4,zero,.L50
	ld	a5,0(s0)
	addi	a5,a5,-8
.L50:
	lbu	a5,0(a5)
	j	.L45
.L48:
	lbu	a5,-8(s0)
	j	.L49
.L52:
	li	a5,0
.L45:
	li	a4,250
	beq	a5,a4,.L51
	li	a4,246
	beq	a5,a4,.L51
	li	a4,253
	bne	a5,a4,.L34
.L51:
	mv	a2,s1
	li	a1,250
	li	a0,1
	call	caml_alloc_shr_for_minor_gc
	sd	a0,0(s3)
	sd	zero,0(s4)
	sd	a0,0(s2)
	mv	s3,a0
.L35:
.L34:
	andi	a5,s0,1
	bne	a5,zero,.L36
	ld	a5,Caml_state
	ld	a4,40(a5)
	mv	s2,s0
	bleu	a4,s0,.L36
	ld	a5,32(a5)
	bleu	s0,a5,.L36
	mv	s5,s0
	addi	s4,s0,-8
	ld	s1,-8(s0)
	beq	s1,zero,.L55
	andi	a1,s1,0xff
	li	a3,248
	bleu	a1,a3,.L56
	li	a3,250
	bgtu	a1,a3,.L57
	li	a3,249
	beq	a1,a3,.L58
	ld	s0,0(s0)
	andi	a3,s0,1
	bne	a3,zero,.L52
	mv	a0,s0
	bleu	a4,s0,.L46
	bltu	a5,s0,.L47
.L46:
	call	caml_page_table_lookup
	andi	a0,a0,7
	bne	a0,zero,.L48
	li	a5,0
.L49:
	bne	a0,zero,.L45
	j	.L51
.L36:
	sd	s0,0(s3)
.L33:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_oldify_one, .-caml_oldify_one
	.section	.text.caml_oldify_mopup,"ax",@progbits
	.align	1
	.globl	caml_oldify_mopup
	.type	caml_oldify_mopup, @function
caml_oldify_mopup:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
.L60:
	ld	s2,oldify_todo_list
	beq	s2,zero,.L78
	ld	s1,0(s2)
	ld	a5,8(s1)
	sd	a5,oldify_todo_list,a4
	ld	a0,0(s1)
	andi	a5,a0,1
	bne	a5,zero,.L61
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L61
	ld	a5,32(a5)
	bgtu	a0,a5,.L79
.L61:
	li	s0,1
	j	.L62
.L79:
	mv	a1,s1
	call	caml_oldify_one
	j	.L61
.L63:
	add	a1,s1,a1
	sd	a0,0(a1)
.L64:
	addi	s0,s0,1
.L62:
	ld	a5,-8(s1)
	srli	a5,a5,10
	bleu	a5,s0,.L60
	slli	a1,s0,3
	add	a5,s2,a1
	ld	a0,0(a5)
	andi	a5,a0,1
	bne	a5,zero,.L63
	ld	a5,Caml_state
	ld	a4,40(a5)
	bleu	a4,a0,.L63
	ld	a5,32(a5)
	bleu	a0,a5,.L63
	add	a1,s1,a1
	call	caml_oldify_one
	j	.L64
.L78:
	ld	a5,Caml_state
	ld	a5,112(a5)
	ld	s0,0(a5)
	li	a2,0
	j	.L67
.L70:
	addi	a4,a4,1
.L69:
	ld	a3,0(s0)
	ld	a5,-8(a3)
	srli	a5,a5,10
	bgeu	a4,a5,.L80
	slli	a5,a4,3
	add	a5,a5,a3
	ld	a5,0(a5)
	ld	a3,caml_ephe_none
	beq	a5,a3,.L70
	andi	a3,a5,1
	bne	a3,zero,.L70
	ld	a3,Caml_state
	ld	a6,40(a3)
	bleu	a6,a5,.L70
	ld	a3,32(a3)
	bleu	a5,a3,.L70
	ld	a5,-8(a5)
	beq	a5,zero,.L70
	li	s1,0
	j	.L71
.L75:
	li	a4,2
	j	.L69
.L80:
	li	s1,1
.L71:
	bne	s1,zero,.L81
.L68:
	addi	s0,s0,16
.L67:
	ld	a5,Caml_state
	ld	a4,112(a5)
	ld	a4,24(a4)
	bleu	a4,s0,.L82
	ld	a3,8(s0)
	li	a4,1
	bne	a3,a4,.L68
	ld	a4,0(s0)
	addi	a1,a4,8
	ld	a0,8(a4)
	ld	a3,caml_ephe_none
	beq	a0,a3,.L68
	andi	a3,a0,1
	bne	a3,zero,.L68
	ld	a3,40(a5)
	bgeu	a0,a3,.L68
	ld	a5,32(a5)
	bleu	a0,a5,.L68
	ld	a5,-8(a0)
	bne	a5,zero,.L75
	ld	a5,0(a0)
	sd	a5,8(a4)
	j	.L68
.L81:
	call	caml_oldify_one
	mv	a2,s1
	j	.L68
.L82:
	bne	a2,zero,.L83
.L59:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L83:
	call	caml_oldify_mopup
	j	.L59
	.size	caml_oldify_mopup, .-caml_oldify_mopup
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"<"
	.align	3
.LC4:
	.string	">"
	.section	.text.caml_empty_minor_heap,"ax",@progbits
	.align	1
	.globl	caml_empty_minor_heap
	.type	caml_empty_minor_heap, @function
caml_empty_minor_heap:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	ld	a5,Caml_state
	ld	a4,0(a5)
	ld	a5,56(a5)
	beq	a4,a5,.L85
	ld	a5,caml_minor_gc_begin_hook
	beq	a5,zero,.L86
	jalr	a5
.L86:
	ld	s1,caml_allocated_words
	lla	s0,Caml_state
	ld	a5,0(s0)
	li	a4,1
	sd	a4,88(a5)
	lla	a1,.LC3
	li	a0,2
	call	caml_gc_message
	call	caml_oldify_local_roots
	ld	a5,0(s0)
	ld	a5,104(a5)
	ld	s0,0(a5)
.L87:
	ld	a5,Caml_state
	ld	a5,104(a5)
	ld	a5,24(a5)
	bleu	a5,s0,.L99
	ld	a1,0(s0)
	ld	a0,0(a1)
	call	caml_oldify_one
	addi	s0,s0,8
	j	.L87
.L99:
	call	caml_oldify_mopup
	ld	a5,Caml_state
	ld	a5,112(a5)
	ld	a5,0(a5)
	j	.L89
.L91:
	sd	a2,0(a4)
	ld	a4,0(a5)
	sd	a2,8(a4)
.L90:
	addi	a5,a5,16
.L89:
	ld	a1,Caml_state
	ld	a4,112(a1)
	ld	a4,24(a4)
	bleu	a4,a5,.L100
	ld	a4,8(a5)
	ld	a2,0(a5)
	ld	a3,-8(a2)
	srli	a3,a3,10
	bgeu	a4,a3,.L90
	slli	a4,a4,3
	add	a4,a4,a2
	ld	a3,0(a4)
	ld	a2,caml_ephe_none
	beq	a3,a2,.L90
	andi	a0,a3,1
	bne	a0,zero,.L90
	ld	a0,40(a1)
	bgeu	a3,a0,.L90
	ld	a1,32(a1)
	bleu	a3,a1,.L90
	ld	a1,-8(a3)
	bne	a1,zero,.L91
	ld	a3,0(a3)
	sd	a3,0(a4)
	j	.L90
.L100:
	call	caml_final_update_minor_roots
	call	caml_memprof_minor_update
	ld	a5,Caml_state
	ld	a5,120(a5)
	ld	s0,0(a5)
	j	.L93
.L102:
	ld	a1,16(s0)
	ld	a0,8(s0)
	call	caml_adjust_gc_speed
.L95:
	addi	s0,s0,24
.L93:
	ld	a5,Caml_state
	ld	a4,120(a5)
	ld	a4,24(a4)
	bleu	a4,s0,.L101
	ld	a0,0(s0)
	ld	a5,-8(a0)
	beq	a5,zero,.L102
	ld	a5,0(a0)
	ld	a5,8(a5)
	beq	a5,zero,.L95
	jalr	a5
	j	.L95
.L101:
	ld	a3,56(a5)
	ld	a4,0(a5)
	sub	a4,a3,a4
	srai	a4,a4,3
	fcvt.d.l	fa5,a4
	fld	fa4,288(a5)
	fadd.d	fa4,fa4,fa5
	fsd	fa4,288(a5)
	ld	a4,80(a5)
	fcvt.d.lu	fa4,a4
	fdiv.d	fa5,fa5,fa4
	lla	a4,caml_gc_clock
	fld	fa4,0(a4)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,0(a4)
	sd	a3,0(a5)
	lla	s0,Caml_state
	ld	a5,0(s0)
	ld	a0,104(a5)
	call	clear_table
	ld	a5,0(s0)
	ld	a0,112(a5)
	call	clear_table
	ld	a5,0(s0)
	ld	a0,120(a5)
	call	clear_table
	ld	a5,0(s0)
	sd	zero,96(a5)
	lla	a1,.LC4
	li	a0,2
	call	caml_gc_message
	ld	a5,0(s0)
	sd	zero,88(a5)
	call	caml_final_empty_young
	ld	a4,0(s0)
	ld	a5,caml_allocated_words
	sub	s1,a5,s1
	fcvt.d.lu	fa5,s1
	fld	fa4,296(a4)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,296(a4)
	ld	a5,312(a4)
	addi	a5,a5,1
	sd	a5,312(a4)
	call	caml_memprof_renew_minor_sample
	ld	a5,caml_minor_gc_end_hook
	beq	a5,zero,.L84
	jalr	a5
.L84:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L85:
	call	caml_final_empty_young
	j	.L84
	.size	caml_empty_minor_heap, .-caml_empty_minor_heap
	.section	.text.caml_set_minor_heap_size,"ax",@progbits
	.align	1
	.globl	caml_set_minor_heap_size
	.type	caml_set_minor_heap_size, @function
caml_set_minor_heap_size:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	mv	s2,a0
	ld	a5,Caml_state
	ld	a3,0(a5)
	ld	a4,56(a5)
	beq	a3,a4,.L104
	sd	zero,272(a5)
	ld	a4,64(a5)
	sd	a4,72(a5)
	call	caml_update_young_limit
	call	caml_empty_minor_heap
.L104:
	addi	a2,sp,8
	li	a1,0
	mv	a0,s2
	call	caml_stat_alloc_aligned_noexc
	mv	s0,a0
	beq	a0,zero,.L109
	add	s1,a0,s2
	mv	a2,s1
	mv	a1,a0
	li	a0,2
	call	caml_page_table_add
	bne	a0,zero,.L110
	ld	a5,Caml_state
	ld	a1,32(a5)
	beq	a1,zero,.L107
	ld	a2,40(a5)
	li	a0,2
	call	caml_page_table_remove
	ld	a5,Caml_state
	ld	a0,24(a5)
	call	caml_stat_free
.L107:
	lla	s3,Caml_state
	ld	a5,0(s3)
	ld	a4,8(sp)
	sd	a4,24(a5)
	sd	s0,32(a5)
	sd	s1,40(a5)
	sd	s0,48(a5)
	srli	a4,s2,4
	slli	a4,a4,3
	add	a4,s0,a4
	sd	a4,64(a5)
	sd	s1,56(a5)
	sd	s0,72(a5)
	call	caml_update_young_limit
	ld	a5,0(s3)
	ld	a4,56(a5)
	sd	a4,0(a5)
	ld	a5,0(s3)
	srli	a0,s2,3
	sd	a0,80(a5)
	call	caml_memprof_renew_minor_sample
	ld	a5,0(s3)
	ld	a0,104(a5)
	call	reset_table
	ld	a5,0(s3)
	ld	a0,112(a5)
	call	reset_table
	ld	a5,0(s3)
	ld	a0,120(a5)
	call	reset_table
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	addi	sp,sp,64
	jr	ra
.L109:
	call	caml_raise_out_of_memory
.L110:
	call	caml_raise_out_of_memory
	.size	caml_set_minor_heap_size, .-caml_set_minor_heap_size
	.section	.text.caml_gc_dispatch,"ax",@progbits
	.align	1
	.globl	caml_gc_dispatch
	.type	caml_gc_dispatch, @function
caml_gc_dispatch:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a5,Caml_state
	ld	s0,72(a5)
	ld	a4,48(a5)
	beq	a4,s0,.L112
	ld	a4,272(a5)
	beq	a4,zero,.L113
.L112:
	sd	zero,272(a5)
	ld	a4,64(a5)
	sd	a4,72(a5)
	call	caml_update_young_limit
	call	caml_empty_minor_heap
	lw	a4,caml_gc_phase
	li	a5,3
	beq	a4,a5,.L117
.L113:
	ld	a5,Caml_state
	ld	a4,48(a5)
	beq	a4,s0,.L118
.L114:
	sd	zero,264(a5)
	sd	a4,72(a5)
	call	caml_update_young_limit
	li	a0,-1
	call	caml_major_collection_slice
.L111:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L117:
	li	a0,-1
	call	caml_major_collection_slice
	j	.L113
.L118:
	ld	a3,264(a5)
	beq	a3,zero,.L111
	j	.L114
	.size	caml_gc_dispatch, .-caml_gc_dispatch
	.section	.text.caml_minor_collection,"ax",@progbits
	.align	1
	.globl	caml_minor_collection
	.type	caml_minor_collection, @function
caml_minor_collection:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,Caml_state
	li	a4,1
	sd	a4,272(a5)
	call	caml_gc_dispatch
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_minor_collection, .-caml_minor_collection
	.section	.text.caml_check_urgent_gc,"ax",@progbits
	.align	1
	.globl	caml_check_urgent_gc
	.type	caml_check_urgent_gc, @function
caml_check_urgent_gc:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	a4,264(a5)
	bne	a4,zero,.L122
	ld	a4,272(a5)
	beq	a4,zero,.L123
.L122:
	ld	s0,280(a5)
	sd	s0,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	call	caml_gc_dispatch
	ld	a5,Caml_state
	sd	s0,280(a5)
.L123:
	ld	a0,8(sp)
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	caml_check_urgent_gc, .-caml_check_urgent_gc
	.section	.text.caml_alloc_small_dispatch,"ax",@progbits
	.align	1
	.globl	caml_alloc_small_dispatch
	.type	caml_alloc_small_dispatch, @function
caml_alloc_small_dispatch:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s3,a0
	mv	s0,a1
	mv	s4,a2
	mv	s5,a3
	addi	s1,a0,1
	ld	a4,Caml_state
	slli	s1,s1,3
	ld	a5,0(a4)
	add	a5,a5,s1
	sd	a5,0(a4)
	j	.L129
.L133:
	call	caml_do_pending_actions_exn
	call	caml_raise_if_exception
.L127:
	ld	a4,Caml_state
	ld	a5,0(a4)
	sub	a5,a5,s1
	ld	a6,72(a4)
	bgeu	a5,a6,.L128
	call	caml_gc_dispatch
.L129:
	andi	a5,s0,2
	sext.w	s2,a5
	bne	a5,zero,.L133
	li	a0,1
	call	caml_check_urgent_gc
	li	a5,1
	sw	a5,caml_something_to_do,a4
	j	.L127
.L128:
	sd	a5,0(a4)
	ld	a5,Caml_state
	ld	a4,0(a5)
	ld	a5,caml_memprof_young_trigger
	bgeu	a4,a5,.L125
	andi	s0,s0,1
	beq	s0,zero,.L131
	mv	a3,s5
	mv	a2,s4
	mv	a1,s2
	mv	a0,s3
	call	caml_memprof_track_young
.L125:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
.L131:
	call	caml_memprof_renew_minor_sample
	j	.L125
	.size	caml_alloc_small_dispatch, .-caml_alloc_small_dispatch
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"ref_table overflow"
	.align	3
.LC6:
	.string	"Growing ref_table to %ldk bytes\n"
	.align	3
.LC7:
	.string	"ref_table threshold crossed\n"
	.section	.text.caml_realloc_ref_table,"ax",@progbits
	.align	1
	.globl	caml_realloc_ref_table
	.type	caml_realloc_ref_table, @function
caml_realloc_ref_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a5,.LC5
	lla	a4,.LC6
	lla	a3,.LC7
	li	a2,15
	li	a1,8
	call	realloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_realloc_ref_table, .-caml_realloc_ref_table
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"ephe_ref_table overflow"
	.align	3
.LC9:
	.string	"Growing ephe_ref_table to %ldk bytes\n"
	.align	3
.LC10:
	.string	"ephe_ref_table threshold crossed\n"
	.section	.text.caml_realloc_ephe_ref_table,"ax",@progbits
	.align	1
	.globl	caml_realloc_ephe_ref_table
	.type	caml_realloc_ephe_ref_table, @function
caml_realloc_ephe_ref_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a5,.LC8
	lla	a4,.LC9
	lla	a3,.LC10
	li	a2,16
	li	a1,16
	call	realloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_realloc_ephe_ref_table, .-caml_realloc_ephe_ref_table
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	"custom_table overflow"
	.align	3
.LC12:
	.string	"Growing custom_table to %ldk bytes\n"
	.align	3
.LC13:
	.string	"custom_table threshold crossed\n"
	.section	.text.caml_realloc_custom_table,"ax",@progbits
	.align	1
	.globl	caml_realloc_custom_table
	.type	caml_realloc_custom_table, @function
caml_realloc_custom_table:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a5,.LC11
	lla	a4,.LC12
	lla	a3,.LC13
	li	a2,17
	li	a1,24
	call	realloc_generic_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_realloc_custom_table, .-caml_realloc_custom_table
	.section	.sbss,"aw",@nobits
	.align	3
	.type	oldify_todo_list, @object
	.size	oldify_todo_list, 8
oldify_todo_list:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
