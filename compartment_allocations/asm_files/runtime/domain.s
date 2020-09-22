	.file	"domain.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"cannot initialize domain state"
	.section	.text.caml_init_domain,"ax",@progbits
	.align	1
	.globl	caml_init_domain
	.type	caml_init_domain, @function
caml_init_domain:
	ld	a5,Caml_state
	beq	a5,zero,.L8
	ret
.L8:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	li	a0,408
	call	caml_stat_alloc_noexc
	sd	a0,Caml_state,a5
	beq	a0,zero,.L9
	sd	zero,8(a0)
	sd	zero,16(a0)
	sd	zero,0(a0)
	lla	s0,Caml_state
	ld	a5,0(s0)
	sd	zero,24(a5)
	sd	zero,32(a5)
	sd	zero,40(a5)
	sd	zero,48(a5)
	sd	zero,64(a5)
	sd	zero,56(a5)
	sd	zero,72(a5)
	sd	zero,80(a5)
	sd	zero,88(a5)
	sd	zero,96(a5)
	call	caml_alloc_minor_tables
	ld	a5,0(s0)
	sd	zero,128(a5)
	sd	zero,136(a5)
	sd	zero,144(a5)
	sd	zero,152(a5)
	sd	zero,160(a5)
	sd	zero,168(a5)
	sd	zero,176(a5)
	li	a4,1
	sd	a4,184(a5)
	sd	zero,192(a5)
	sd	zero,200(a5)
	sd	a4,208(a5)
	sd	zero,216(a5)
	sd	zero,288(a5)
	sd	zero,296(a5)
	sd	zero,304(a5)
	sd	zero,312(a5)
	sd	zero,320(a5)
	sd	zero,328(a5)
	sd	zero,336(a5)
	sd	zero,344(a5)
	sd	zero,352(a5)
	sd	zero,224(a5)
	sd	zero,232(a5)
	sd	zero,240(a5)
	sd	a4,248(a5)
	sd	zero,256(a5)
	sd	zero,280(a5)
	sd	zero,264(a5)
	sd	zero,272(a5)
	sd	zero,384(a5)
	sd	zero,376(a5)
	sw	zero,368(a5)
	sd	zero,360(a5)
	sd	zero,392(a5)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L9:
	lla	a0,.LC0
	call	caml_fatal_error
	.size	caml_init_domain, .-caml_init_domain
	.globl	Caml_state
	.section	.sbss,"aw",@nobits
	.align	3
	.type	Caml_state, @object
	.size	Caml_state, 8
Caml_state:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
