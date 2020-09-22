	.file	"custom.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.alloc_custom_gen,"ax",@progbits
	.align	1
	.type	alloc_custom_gen, @function
alloc_custom_gen:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	mv	s1,a0
	mv	s2,a2
	mv	s4,a3
	mv	s0,a4
	mv	s5,a5
	ld	a5,Caml_state
	ld	s3,280(a5)
	li	a4,1
	sd	a4,72(sp)
	sd	s3,8(sp)
	addi	a3,sp,8
	sd	a3,280(a5)
	sd	a4,24(sp)
	sd	a4,16(sp)
	addi	a5,sp,72
	sd	a5,32(sp)
	addi	a1,a1,7
	srli	a1,a1,3
	addi	a0,a1,1
	li	a5,256
	bgtu	a0,a5,.L2
	li	a1,255
	call	caml_alloc_small
	sd	a0,72(sp)
	sd	s1,0(a0)
	ld	a5,8(s1)
	beq	a5,zero,.L12
.L3:
	bgtu	s2,s0,.L13
.L5:
	ld	a5,Caml_state
	ld	s1,120(a5)
	ld	s2,72(sp)
	ld	a4,24(s1)
	ld	a5,32(s1)
	bgeu	a4,a5,.L14
.L6:
	ld	a5,24(s1)
	addi	a4,a5,24
	sd	a4,24(s1)
	sd	s2,0(a5)
	sd	s0,8(a5)
	sd	s4,16(a5)
	beq	s0,zero,.L4
	bne	s5,zero,.L7
	li	s5,1
.L7:
	ld	a5,Caml_state
	fcvt.d.lu	fa5,s0
	fcvt.d.lu	fa4,s5
	fdiv.d	fa5,fa5,fa4
	fld	fa4,96(a5)
	fadd.d	fa5,fa5,fa4
	fsd	fa5,96(a5)
	fld	fa4,.LC0,a5
	fgt.d	s0,fa5,fa4
	beq	s0,zero,.L4
	call	caml_minor_collection
	j	.L4
.L12:
	beq	s2,zero,.L4
	j	.L3
.L13:
	mv	a1,s4
	sub	a0,s2,s0
	call	caml_adjust_gc_speed
	j	.L5
.L14:
	mv	a0,s1
	call	caml_realloc_custom_table
	j	.L6
.L2:
	li	a1,255
	call	caml_alloc_shr
	sd	a0,72(sp)
	sd	s1,0(a0)
	mv	a1,s4
	mv	a0,s2
	call	caml_adjust_gc_speed
	li	a0,1
	call	caml_check_urgent_gc
.L4:
	ld	a5,Caml_state
	sd	s3,280(a5)
	ld	a0,72(sp)
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	ld	s4,96(sp)
	ld	s5,88(sp)
	addi	sp,sp,144
	jr	ra
	.size	alloc_custom_gen, .-alloc_custom_gen
	.section	.text.caml_alloc_custom,"ax",@progbits
	.align	1
	.globl	caml_alloc_custom
	.type	caml_alloc_custom, @function
caml_alloc_custom:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a4,a2
	mv	a5,a3
	call	alloc_custom_gen
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_custom, .-caml_alloc_custom
	.section	.text.caml_alloc_custom_mem,"ax",@progbits
	.align	1
	.globl	caml_alloc_custom_mem
	.type	caml_alloc_custom_mem, @function
caml_alloc_custom_mem:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a4,caml_custom_minor_max_bsz
	bleu	a4,a2,.L18
	mv	a4,a2
.L18:
	ld	a5,Caml_state
	ld	a3,328(a5)
	slli	a3,a3,3
	li	a6,150
	divu	a3,a3,a6
	ld	a5,80(a5)
	slli	a5,a5,3
	li	a6,100
	divu	a5,a5,a6
	ld	a6,caml_custom_minor_ratio
	mul	a5,a5,a6
	ld	a6,caml_custom_major_ratio
	mul	a3,a3,a6
	call	alloc_custom_gen
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_custom_mem, .-caml_alloc_custom_mem
	.section	.text.caml_register_custom_operations,"ax",@progbits
	.align	1
	.globl	caml_register_custom_operations
	.type	caml_register_custom_operations, @function
caml_register_custom_operations:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	li	a0,16
	call	caml_stat_alloc
	sd	s0,0(a0)
	lla	a5,custom_ops_table
	ld	a4,0(a5)
	sd	a4,8(a0)
	sd	a0,0(a5)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_register_custom_operations, .-caml_register_custom_operations
	.section	.text.caml_find_custom_operations,"ax",@progbits
	.align	1
	.globl	caml_find_custom_operations
	.type	caml_find_custom_operations, @function
caml_find_custom_operations:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	ld	s0,custom_ops_table
.L23:
	beq	s0,zero,.L22
	ld	s1,0(s0)
	mv	a1,s2
	ld	a0,0(s1)
	call	strcmp
	beq	a0,zero,.L26
	ld	s0,8(s0)
	j	.L23
.L26:
	mv	s0,s1
.L22:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_find_custom_operations, .-caml_find_custom_operations
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"_final"
	.section	.text.caml_final_custom_operations,"ax",@progbits
	.align	1
	.globl	caml_final_custom_operations
	.type	caml_final_custom_operations, @function
caml_final_custom_operations:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	ld	a5,custom_ops_final_table
.L29:
	beq	a5,zero,.L33
	ld	s0,0(a5)
	ld	a4,8(s0)
	beq	a4,s1,.L28
	ld	a5,8(a5)
	j	.L29
.L33:
	li	a0,64
	call	caml_stat_alloc
	mv	s0,a0
	lla	a5,.LC1
	sd	a5,0(a0)
	sd	s1,8(a0)
	sd	zero,16(a0)
	sd	zero,24(a0)
	sd	zero,32(a0)
	sd	zero,40(a0)
	sd	zero,48(a0)
	sd	zero,56(a0)
	li	a0,16
	call	caml_stat_alloc
	sd	s0,0(a0)
	lla	a5,custom_ops_final_table
	ld	a4,0(a5)
	sd	a4,8(a0)
	sd	a0,0(a5)
.L28:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_final_custom_operations, .-caml_final_custom_operations
	.section	.text.caml_init_custom_operations,"ax",@progbits
	.align	1
	.globl	caml_init_custom_operations
	.type	caml_init_custom_operations, @function
caml_init_custom_operations:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_int32_ops
	call	caml_register_custom_operations
	lla	a0,caml_nativeint_ops
	call	caml_register_custom_operations
	lla	a0,caml_int64_ops
	call	caml_register_custom_operations
	lla	a0,caml_ba_ops
	call	caml_register_custom_operations
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_init_custom_operations, .-caml_init_custom_operations
	.globl	caml_custom_minor_max_bsz
	.globl	caml_custom_minor_ratio
	.globl	caml_custom_major_ratio
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
	.section	.sdata,"aw"
	.align	3
	.type	caml_custom_minor_max_bsz, @object
	.size	caml_custom_minor_max_bsz, 8
caml_custom_minor_max_bsz:
	.dword	8192
	.type	caml_custom_minor_ratio, @object
	.size	caml_custom_minor_ratio, 8
caml_custom_minor_ratio:
	.dword	100
	.type	caml_custom_major_ratio, @object
	.size	caml_custom_major_ratio, 8
caml_custom_major_ratio:
	.dword	44
	.ident	"GCC: (GNU) 9.2.0"
