	.file	"callback.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.hash_value_name,"ax",@progbits
	.align	1
	.type	hash_value_name, @function
hash_value_name:
	li	a5,0
.L2:
	lbu	a3,0(a0)
	beq	a3,zero,.L4
	slliw	a4,a5,2
	addw	a4,a4,a5
	slliw	a4,a4,2
	subw	a5,a4,a5
	addw	a5,a5,a3
	addi	a0,a0,1
	j	.L2
.L4:
	li	a0,13
	remuw	a0,a5,a0
	ret
	.size	hash_value_name, .-hash_value_name
	.section	.text.caml_callback_exn,"ax",@progbits
	.align	1
	.globl	caml_callback_exn
	.type	caml_callback_exn, @function
caml_callback_exn:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,8(sp)
	addi	a2,sp,8
	mv	a1,a0
	ld	a0,Caml_state
	call	caml_callback_asm
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_callback_exn, .-caml_callback_exn
	.section	.text.caml_callback2_exn,"ax",@progbits
	.align	1
	.globl	caml_callback2_exn
	.type	caml_callback2_exn, @function
caml_callback2_exn:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,0(sp)
	sd	a2,8(sp)
	mv	a2,sp
	mv	a1,a0
	ld	a0,Caml_state
	call	caml_callback2_asm
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_callback2_exn, .-caml_callback2_exn
	.section	.text.caml_callback3_exn,"ax",@progbits
	.align	1
	.globl	caml_callback3_exn
	.type	caml_callback3_exn, @function
caml_callback3_exn:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	a1,8(sp)
	sd	a2,16(sp)
	sd	a3,24(sp)
	addi	a2,sp,8
	mv	a1,a0
	ld	a0,Caml_state
	call	caml_callback3_asm
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_callback3_exn, .-caml_callback3_exn
	.section	.text.caml_callbackN_exn,"ax",@progbits
	.align	1
	.globl	caml_callbackN_exn
	.type	caml_callbackN_exn, @function
caml_callbackN_exn:
	addi	sp,sp,-272
	sd	ra,264(sp)
	sd	s0,256(sp)
	sd	s1,248(sp)
	sd	s2,240(sp)
	sd	s3,232(sp)
	sd	a0,8(sp)
	mv	s1,a1
	mv	s2,a2
	ld	a4,Caml_state
	ld	s3,280(a4)
	sd	s3,160(sp)
	li	a5,1
	sd	a5,176(sp)
	sd	a5,168(sp)
	addi	a3,sp,8
	sd	a3,184(sp)
	addi	a3,sp,160
	sd	a3,96(sp)
	sd	a1,112(sp)
	sd	a5,104(sp)
	sd	a2,120(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	sd	a0,88(sp)
	li	s0,0
	j	.L12
.L13:
	slli	a5,s0,3
	add	a5,s2,a5
	ld	a1,0(a5)
	ld	a0,88(sp)
	call	caml_callback_exn
	sd	a0,88(sp)
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L24
	addiw	s0,s0,1
.L12:
	bge	s0,s1,.L25
	subw	a5,s1,s0
	li	a4,1
	beq	a5,a4,.L13
	li	a4,2
	beq	a5,a4,.L14
	slli	a1,s0,3
	add	a1,s2,a1
	addi	a5,s0,1
	slli	a5,a5,3
	add	a5,s2,a5
	addi	a4,s0,2
	slli	a4,a4,3
	add	a4,s2,a4
	ld	a3,0(a4)
	ld	a2,0(a5)
	ld	a1,0(a1)
	ld	a0,88(sp)
	call	caml_callback3_exn
	sd	a0,88(sp)
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L26
	addiw	s0,s0,3
	j	.L12
.L24:
	ld	a5,Caml_state
	sd	s3,280(a5)
	j	.L11
.L14:
	slli	a4,s0,3
	add	a4,s2,a4
	addi	a5,s0,1
	slli	a5,a5,3
	add	a5,s2,a5
	ld	a2,0(a5)
	ld	a1,0(a4)
	ld	a0,88(sp)
	call	caml_callback2_exn
	sd	a0,88(sp)
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L27
	addiw	s0,s0,2
	j	.L12
.L27:
	ld	a5,Caml_state
	sd	s3,280(a5)
	j	.L11
.L26:
	ld	a5,Caml_state
	sd	s3,280(a5)
	j	.L11
.L25:
	ld	a0,88(sp)
	ld	a5,Caml_state
	sd	s3,280(a5)
.L11:
	ld	ra,264(sp)
	ld	s0,256(sp)
	ld	s1,248(sp)
	ld	s2,240(sp)
	ld	s3,232(sp)
	addi	sp,sp,272
	jr	ra
	.size	caml_callbackN_exn, .-caml_callbackN_exn
	.section	.text.caml_callback,"ax",@progbits
	.align	1
	.globl	caml_callback
	.type	caml_callback, @function
caml_callback:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_callback_exn
	call	caml_raise_if_exception
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_callback, .-caml_callback
	.section	.text.caml_callback2,"ax",@progbits
	.align	1
	.globl	caml_callback2
	.type	caml_callback2, @function
caml_callback2:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_callback2_exn
	call	caml_raise_if_exception
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_callback2, .-caml_callback2
	.section	.text.caml_callback3,"ax",@progbits
	.align	1
	.globl	caml_callback3
	.type	caml_callback3, @function
caml_callback3:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_callback3_exn
	call	caml_raise_if_exception
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_callback3, .-caml_callback3
	.section	.text.caml_callbackN,"ax",@progbits
	.align	1
	.globl	caml_callbackN
	.type	caml_callbackN, @function
caml_callbackN:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_callbackN_exn
	call	caml_raise_if_exception
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_callbackN, .-caml_callbackN
	.section	.text.caml_register_named_value,"ax",@progbits
	.align	1
	.globl	caml_register_named_value
	.type	caml_register_named_value, @function
caml_register_named_value:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s2,a0
	mv	s4,a1
	mv	s1,a0
	call	strlen
	mv	s3,a0
	mv	a0,s2
	call	hash_value_name
	sext.w	s5,a0
	slli	a5,a0,32
	srli	a5,a5,32
	slli	a5,a5,3
	lla	a0,.LANCHOR0
	add	a5,a0,a5
	ld	s0,0(a5)
.L37:
	beq	s0,zero,.L42
	addi	a1,s0,16
	mv	a0,s1
	call	strcmp
	beq	a0,zero,.L43
	ld	s0,8(s0)
	j	.L37
.L43:
	mv	a1,s4
	mv	a0,s0
	call	caml_modify_generational_global_root
	j	.L39
.L42:
	addi	a0,s3,24
	call	caml_stat_alloc
	mv	s0,a0
	addi	a2,s3,1
	mv	a1,s2
	addi	a0,a0,16
	call	memcpy
	sd	s4,0(s0)
	slli	s5,s5,32
	srli	s5,s5,32
	slli	s5,s5,3
	lla	a5,.LANCHOR0
	add	s5,a5,s5
	ld	a5,0(s5)
	sd	a5,8(s0)
	sd	s0,0(s5)
	mv	a0,s0
	call	caml_register_generational_global_root
.L39:
	li	a0,1
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
	.size	caml_register_named_value, .-caml_register_named_value
	.section	.text.caml_named_value,"ax",@progbits
	.align	1
	.globl	caml_named_value
	.type	caml_named_value, @function
caml_named_value:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	call	hash_value_name
	slli	a0,a0,32
	srli	a0,a0,32
	slli	a0,a0,3
	lla	a5,.LANCHOR0
	add	a0,a5,a0
	ld	s0,0(a0)
.L45:
	beq	s0,zero,.L44
	addi	a1,s0,16
	mv	a0,s1
	call	strcmp
	beq	a0,zero,.L44
	ld	s0,8(s0)
	j	.L45
.L44:
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_named_value, .-caml_named_value
	.section	.text.caml_iterate_named_values,"ax",@progbits
	.align	1
	.globl	caml_iterate_named_values
	.type	caml_iterate_named_values, @function
caml_iterate_named_values:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	li	s2,0
	j	.L51
.L57:
	addiw	s2,s2,1
.L51:
	li	a5,12
	bgt	s2,a5,.L56
	slli	a4,s2,3
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	ld	s0,0(a5)
.L52:
	beq	s0,zero,.L57
	addi	a1,s0,16
	mv	a0,s0
	jalr	s1
	ld	s0,8(s0)
	j	.L52
.L56:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_iterate_named_values, .-caml_iterate_named_values
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	named_value_table, @object
	.size	named_value_table, 104
named_value_table:
	.zero	104
	.ident	"GCC: (GNU) 9.2.0"
