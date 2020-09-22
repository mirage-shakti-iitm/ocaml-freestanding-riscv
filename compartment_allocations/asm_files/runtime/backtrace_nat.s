	.file	"backtrace_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.debuginfo_extract,"ax",@progbits
	.align	1
	.type	debuginfo_extract, @function
debuginfo_extract:
	lhu	a4,8(a0)
	andi	a5,a4,1
	beq	a5,zero,.L7
	lhu	a5,10(a0)
	slli	a5,a5,1
	add	a5,a0,a5
	addi	a0,a5,12
	andi	a4,a4,2
	beq	a4,zero,.L3
	lbu	a5,12(a5)
	addi	a5,a5,1
	add	a0,a0,a5
	addi	a0,a0,3
	andi	a0,a0,-4
	li	a5,-1
	beq	a1,a5,.L4
	slli	a1,a1,2
	add	a0,a0,a1
	lw	a5,0(a0)
	bne	a5,zero,.L5
	li	a0,0
	ret
.L6:
	addi	a0,a0,4
.L4:
	lw	a5,0(a0)
	beq	a5,zero,.L6
	j	.L5
.L3:
	addi	a0,a0,3
	andi	a0,a0,-4
.L5:
	lwu	a5,0(a0)
	add	a0,a0,a5
	ret
.L7:
	li	a0,0
	ret
	.size	debuginfo_extract, .-debuginfo_extract
	.section	.text.caml_next_frame_descriptor,"ax",@progbits
	.align	1
	.globl	caml_next_frame_descriptor
	.type	caml_next_frame_descriptor, @function
caml_next_frame_descriptor:
	mv	a7,a0
.L14:
	ld	a2,0(a7)
	srli	a5,a2,3
	ld	a6,caml_frame_descriptors_mask
	and	a5,a5,a6
.L12:
	slli	a4,a5,3
	ld	a3,caml_frame_descriptors
	add	a4,a3,a4
	ld	a0,0(a4)
	beq	a0,zero,.L9
	ld	a4,0(a0)
	beq	a2,a4,.L11
	addi	a5,a5,1
	and	a5,a6,a5
	j	.L12
.L11:
	lhu	a4,8(a0)
	sext.w	a3,a4
	li	a5,65536
	addi	a5,a5,-1
	bne	a3,a5,.L15
	ld	a5,0(a1)
	ld	a4,16(a5)
	sd	a4,0(a1)
	ld	a5,24(a5)
	sd	a5,0(a7)
	ld	a0,0(a1)
	bne	a0,zero,.L14
.L9:
	ret
.L15:
	andi	a4,a4,-4
	ld	a5,0(a1)
	add	a4,a5,a4
	sd	a4,0(a1)
	ld	a5,-8(a4)
	sd	a5,0(a7)
	ret
	.size	caml_next_frame_descriptor, .-caml_next_frame_descriptor
	.section	.text.caml_alloc_backtrace_buffer,"ax",@progbits
	.align	1
	.globl	caml_alloc_backtrace_buffer
	.type	caml_alloc_backtrace_buffer, @function
caml_alloc_backtrace_buffer:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	lla	s0,Caml_state
	ld	s1,0(s0)
	li	a0,8192
	call	caml_stat_alloc_noexc
	sd	a0,240(s1)
	ld	a5,0(s0)
	ld	a5,240(a5)
	beq	a5,zero,.L18
	li	a0,0
.L17:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L18:
	li	a0,-1
	j	.L17
	.size	caml_alloc_backtrace_buffer, .-caml_alloc_backtrace_buffer
	.section	.text.caml_stash_backtrace,"ax",@progbits
	.align	1
	.globl	caml_stash_backtrace
	.type	caml_stash_backtrace, @function
caml_stash_backtrace:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	a1,8(sp)
	sd	a2,0(sp)
	mv	s0,a3
	ld	a5,Caml_state
	ld	a4,248(a5)
	beq	a4,a0,.L21
	sd	zero,232(a5)
	sd	a0,248(a5)
.L21:
	ld	a5,240(a5)
	beq	a5,zero,.L26
.L24:
	mv	a1,sp
	addi	a0,sp,8
	call	caml_next_frame_descriptor
	beq	a0,zero,.L20
	ld	a4,Caml_state
	ld	a5,232(a4)
	li	a2,1023
	bgt	a5,a2,.L20
	ld	a2,240(a4)
	addi	a1,a5,1
	sd	a1,232(a4)
	slli	a5,a5,3
	add	a5,a2,a5
	sd	a0,0(a5)
	ld	a5,0(sp)
	bleu	a5,s0,.L24
.L20:
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
.L26:
	call	caml_alloc_backtrace_buffer
	li	a5,-1
	bne	a0,a5,.L24
	j	.L20
	.size	caml_stash_backtrace, .-caml_stash_backtrace
	.section	.text.caml_collect_current_callstack,"ax",@progbits
	.align	1
	.globl	caml_collect_current_callstack
	.type	caml_collect_current_callstack, @function
caml_collect_current_callstack:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	s4,32(sp)
	sd	s5,24(sp)
	ld	a5,Caml_state
	ld	a4,208(a5)
	sd	a4,8(sp)
	ld	a5,200(a5)
	sd	a5,0(sp)
	ble	a2,zero,.L35
	mv	s2,a0
	mv	s3,a1
	mv	s4,a2
	mv	s0,a3
	ld	s1,0(a1)
	beq	s1,zero,.L39
.L29:
	bge	s0,zero,.L40
	li	s1,0
	j	.L32
.L39:
	li	a0,256
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L27
	sd	a0,0(s2)
	li	a5,32
	sd	a5,0(s3)
	j	.L29
.L40:
	mv	a1,sp
	addi	a0,sp,8
	call	caml_next_frame_descriptor
	mv	s1,a0
	beq	a0,zero,.L37
	mv	a1,s0
	call	debuginfo_extract
	beq	a0,zero,.L31
	addi	a0,a0,2
	ld	a5,0(s2)
	ori	a0,a0,1
	sd	a0,0(a5)
	li	s1,1
	j	.L32
.L31:
	ld	a5,0(s2)
	ori	s1,s1,1
	sd	s1,0(a5)
	li	s1,1
	j	.L32
.L33:
	ld	a5,0(s2)
	slli	a4,s1,3
	add	a5,a5,a4
	ori	s0,s0,1
	sd	s0,0(a5)
	addi	s1,s1,1
.L32:
	bge	s1,s4,.L27
	mv	a1,sp
	addi	a0,sp,8
	call	caml_next_frame_descriptor
	mv	s0,a0
	beq	a0,zero,.L27
	ld	a1,0(s3)
	bne	a1,s1,.L33
	slli	s5,a1,1
	slli	a1,a1,4
	ld	a0,0(s2)
	call	caml_stat_resize_noexc
	beq	a0,zero,.L27
	sd	a0,0(s2)
	sd	s5,0(s3)
	j	.L33
.L35:
	li	s1,0
.L27:
	mv	a0,s1
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	ld	s4,32(sp)
	ld	s5,24(sp)
	addi	sp,sp,80
	jr	ra
.L37:
	li	s1,0
	j	.L27
	.size	caml_collect_current_callstack, .-caml_collect_current_callstack
	.section	.text.caml_debuginfo_extract,"ax",@progbits
	.align	1
	.globl	caml_debuginfo_extract
	.type	caml_debuginfo_extract, @function
caml_debuginfo_extract:
	andi	a5,a0,2
	beq	a5,zero,.L42
	addi	a0,a0,-2
	ret
.L42:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,-1
	call	debuginfo_extract
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_debuginfo_extract, .-caml_debuginfo_extract
	.section	.text.caml_debuginfo_next,"ax",@progbits
	.align	1
	.globl	caml_debuginfo_next
	.type	caml_debuginfo_next, @function
caml_debuginfo_next:
	beq	a0,zero,.L47
	lw	a5,0(a0)
	andi	a5,a5,1
	beq	a5,zero,.L50
	addi	a0,a0,8
	ret
.L50:
	li	a0,0
.L47:
	ret
	.size	caml_debuginfo_next, .-caml_debuginfo_next
	.section	.text.caml_debuginfo_location,"ax",@progbits
	.align	1
	.globl	caml_debuginfo_location
	.type	caml_debuginfo_location, @function
caml_debuginfo_location:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s1,a1
	beq	a0,zero,.L55
	lw	s3,0(a0)
	lw	s2,4(a0)
	li	s0,67108864
	addi	s0,s0,-4
	and	s0,s3,s0
	slli	s0,s0,32
	srli	s0,s0,32
	add	s0,a0,s0
	li	a5,1
	sw	a5,0(a1)
	andi	a5,s3,2
	snez	a5,a5
	sw	a5,4(a1)
	call	caml_debuginfo_next
	snez	a0,a0
	sw	a0,36(s1)
	addi	a5,s0,4
	sd	a5,16(s1)
	lw	a5,0(s0)
	add	s0,s0,a5
	sd	s0,8(s1)
	srliw	a5,s2,12
	sw	a5,24(s1)
	srliw	a5,s2,4
	andi	a5,a5,0xff
	sw	a5,28(s1)
	slliw	s2,s2,6
	andi	s2,s2,960
	srliw	s3,s3,26
	or	s2,s2,s3
	sw	s2,32(s1)
.L51:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L55:
	sw	zero,0(a1)
	li	a5,1
	sw	a5,4(a1)
	sw	zero,36(a1)
	j	.L51
	.size	caml_debuginfo_location, .-caml_debuginfo_location
	.section	.text.caml_add_debug_info,"ax",@progbits
	.align	1
	.globl	caml_add_debug_info
	.type	caml_add_debug_info, @function
caml_add_debug_info:
	li	a0,1
	ret
	.size	caml_add_debug_info, .-caml_add_debug_info
	.section	.text.caml_remove_debug_info,"ax",@progbits
	.align	1
	.globl	caml_remove_debug_info
	.type	caml_remove_debug_info, @function
caml_remove_debug_info:
	li	a0,1
	ret
	.size	caml_remove_debug_info, .-caml_remove_debug_info
	.section	.text.caml_debug_info_available,"ax",@progbits
	.align	1
	.globl	caml_debug_info_available
	.type	caml_debug_info_available, @function
caml_debug_info_available:
	li	a0,1
	ret
	.size	caml_debug_info_available, .-caml_debug_info_available
	.ident	"GCC: (GNU) 9.2.0"
