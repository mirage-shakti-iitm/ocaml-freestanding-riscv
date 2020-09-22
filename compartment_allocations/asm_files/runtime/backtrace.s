	.file	"backtrace.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Re-raised at"
	.align	3
.LC1:
	.string	"Raised at"
	.align	3
.LC2:
	.string	"Called from"
	.align	3
.LC3:
	.string	"Raised by primitive operation at"
	.align	3
.LC4:
	.string	""
	.align	3
.LC5:
	.string	" (inlined)"
	.align	3
.LC6:
	.string	"%s unknown location%s\n"
	.align	3
.LC7:
	.string	"%s %s in file \"%s\"%s, line %d, characters %d-%d\n"
	.section	.text.print_location,"ax",@progbits
	.align	1
	.type	print_location, @function
print_location:
	lw	a4,0(a0)
	bne	a4,zero,.L2
	lw	a5,4(a0)
	bne	a5,zero,.L12
.L2:
	addi	sp,sp,-32
	sd	ra,24(sp)
	lw	a5,4(a0)
	beq	a5,zero,.L4
	bne	a1,zero,.L8
	lla	a2,.LC1
.L5:
	lw	a5,36(a0)
	beq	a5,zero,.L10
	lla	a5,.LC5
.L6:
	bne	a4,zero,.L7
	mv	a3,a5
	lla	a1,.LC6
	ld	a0,stderr
	call	fprintf
.L1:
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
.L4:
	bne	a1,zero,.L9
	lla	a2,.LC3
	j	.L5
.L8:
	lla	a2,.LC0
	j	.L5
.L9:
	lla	a2,.LC2
	j	.L5
.L10:
	lla	a5,.LC4
	j	.L6
.L7:
	lw	a4,32(a0)
	sd	a4,0(sp)
	lw	a7,28(a0)
	lw	a6,24(a0)
	ld	a4,8(a0)
	ld	a3,16(a0)
	lla	a1,.LC7
	ld	a0,stderr
	call	fprintf
	j	.L1
.L12:
	ret
	.size	print_location, .-print_location
	.section	.text.caml_convert_debuginfo,"ax",@progbits
	.align	1
	.type	caml_convert_debuginfo, @function
caml_convert_debuginfo:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	ld	a4,Caml_state
	ld	s0,280(a4)
	li	a5,1
	sd	a5,120(sp)
	sd	a5,112(sp)
	sd	a5,104(sp)
	sd	s0,40(sp)
	addi	a3,sp,40
	sd	a3,280(a4)
	sd	a5,56(sp)
	li	a5,3
	sd	a5,48(sp)
	addi	a5,sp,120
	sd	a5,64(sp)
	addi	a5,sp,112
	sd	a5,72(sp)
	addi	a5,sp,104
	sd	a5,80(sp)
	mv	a1,sp
	call	caml_debuginfo_location
	lw	a5,0(sp)
	beq	a5,zero,.L15
	ld	a0,8(sp)
	call	caml_copy_string
	sd	a0,112(sp)
	ld	a0,16(sp)
	call	caml_copy_string
	sd	a0,104(sp)
	li	a1,0
	li	a0,7
	call	caml_alloc_small
	sd	a0,120(sp)
	lw	a5,4(sp)
	beq	a5,zero,.L20
	li	a5,3
.L16:
	sd	a5,0(a0)
	ld	a4,112(sp)
	ld	a5,120(sp)
	sd	a4,8(a5)
	lw	a5,24(sp)
	slli	a5,a5,1
	addi	a5,a5,1
	ld	a4,120(sp)
	sd	a5,16(a4)
	lw	a5,28(sp)
	slli	a5,a5,1
	addi	a5,a5,1
	ld	a4,120(sp)
	sd	a5,24(a4)
	lw	a5,32(sp)
	slli	a5,a5,1
	addi	a5,a5,1
	ld	a4,120(sp)
	sd	a5,32(a4)
	lw	a5,36(sp)
	beq	a5,zero,.L21
	li	a4,3
.L17:
	ld	a5,120(sp)
	sd	a4,40(a5)
	ld	a4,104(sp)
	ld	a5,120(sp)
	sd	a4,48(a5)
.L18:
	ld	a5,Caml_state
	sd	s0,280(a5)
	ld	a0,120(sp)
	ld	ra,136(sp)
	ld	s0,128(sp)
	addi	sp,sp,144
	jr	ra
.L20:
	li	a5,1
	j	.L16
.L21:
	li	a4,1
	j	.L17
.L15:
	li	a1,1
	li	a0,1
	call	caml_alloc_small
	sd	a0,120(sp)
	lw	a5,4(sp)
	beq	a5,zero,.L22
	li	a5,3
.L19:
	sd	a5,0(a0)
	j	.L18
.L22:
	li	a5,1
	j	.L19
	.size	caml_convert_debuginfo, .-caml_convert_debuginfo
	.section	.text.caml_init_backtrace,"ax",@progbits
	.align	1
	.globl	caml_init_backtrace
	.type	caml_init_backtrace, @function
caml_init_backtrace:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,Caml_state
	addi	a0,a0,248
	call	caml_register_global_root
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_init_backtrace, .-caml_init_backtrace
	.section	.text.caml_record_backtrace,"ax",@progbits
	.align	1
	.globl	caml_record_backtrace
	.type	caml_record_backtrace, @function
caml_record_backtrace:
	srai	a0,a0,1
	sext.w	a0,a0
	ld	a5,Caml_state
	ld	a4,224(a5)
	beq	a0,a4,.L27
	sd	a0,224(a5)
	sd	zero,232(a5)
	li	a4,1
	sd	a4,248(a5)
.L27:
	li	a0,1
	ret
	.size	caml_record_backtrace, .-caml_record_backtrace
	.section	.text.caml_backtrace_status,"ax",@progbits
	.align	1
	.globl	caml_backtrace_status
	.type	caml_backtrace_status, @function
caml_backtrace_status:
	ld	a5,Caml_state
	ld	a5,224(a5)
	bne	a5,zero,.L31
	li	a0,1
	ret
.L31:
	li	a0,3
	ret
	.size	caml_backtrace_status, .-caml_backtrace_status
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"(Cannot print stack backtrace: no debug information available)\n"
	.section	.text.caml_print_exception_backtrace,"ax",@progbits
	.align	1
	.globl	caml_print_exception_backtrace
	.type	caml_print_exception_backtrace, @function
caml_print_exception_backtrace:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	call	caml_debug_info_available
	beq	a0,zero,.L40
	li	s1,0
	j	.L33
.L40:
	ld	a3,stderr
	li	a2,63
	li	a1,1
	lla	a0,.LC8
	call	fwrite
.L32:
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	addi	sp,sp,80
	jr	ra
.L36:
	addi	a1,sp,8
	mv	a0,s0
	call	caml_debuginfo_location
	mv	a1,s1
	addi	a0,sp,8
	call	print_location
	mv	a0,s0
	call	caml_debuginfo_next
	mv	s0,a0
.L35:
	bne	s0,zero,.L36
	addiw	s1,s1,1
.L33:
	ld	a5,Caml_state
	ld	a4,232(a5)
	bge	s1,a4,.L32
	ld	a5,240(a5)
	slli	a4,s1,3
	add	a5,a5,a4
	ld	a0,0(a5)
	call	caml_debuginfo_extract
	mv	s0,a0
	j	.L35
	.size	caml_print_exception_backtrace, .-caml_print_exception_backtrace
	.section	.text.caml_get_exception_raw_backtrace,"ax",@progbits
	.align	1
	.globl	caml_get_exception_raw_backtrace
	.type	caml_get_exception_raw_backtrace, @function
caml_get_exception_raw_backtrace:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	ld	a5,Caml_state
	ld	s0,280(a5)
	li	a4,1
	sd	a4,72(sp)
	sd	s0,8(sp)
	addi	a3,sp,8
	sd	a3,280(a5)
	sd	a4,24(sp)
	sd	a4,16(sp)
	addi	a4,sp,72
	sd	a4,32(sp)
	ld	a4,224(a5)
	beq	a4,zero,.L42
	ld	a4,240(a5)
	beq	a4,zero,.L42
	ld	s1,232(a5)
	bne	s1,zero,.L43
.L42:
	li	a1,0
	li	a0,0
	call	caml_alloc
	sd	a0,72(sp)
.L44:
	ld	a5,Caml_state
	sd	s0,280(a5)
	ld	a0,72(sp)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
.L43:
	li	a1,0
	mv	a0,s1
	call	caml_alloc
	sd	a0,72(sp)
	li	a4,0
	j	.L45
.L46:
	ld	a5,Caml_state
	ld	a3,240(a5)
	slli	a5,a4,3
	add	a3,a3,a5
	ld	a3,0(a3)
	ld	a2,72(sp)
	add	a5,a5,a2
	ori	a3,a3,1
	sd	a3,0(a5)
	addi	a4,a4,1
.L45:
	bgt	s1,a4,.L46
	j	.L44
	.size	caml_get_exception_raw_backtrace, .-caml_get_exception_raw_backtrace
	.section	.text.caml_restore_raw_backtrace,"ax",@progbits
	.align	1
	.globl	caml_restore_raw_backtrace
	.type	caml_restore_raw_backtrace, @function
caml_restore_raw_backtrace:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	ld	a5,Caml_state
	sd	a0,248(a5)
	mv	s0,a1
	ld	s1,-8(a1)
	srli	s1,s1,10
	li	a4,1024
	bgtu	s1,a4,.L54
	bne	s1,zero,.L49
	sd	zero,232(a5)
.L50:
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L54:
	li	s1,1024
.L49:
	ld	a5,240(a5)
	beq	a5,zero,.L56
.L51:
	ld	a5,Caml_state
	sd	s1,232(a5)
	li	a5,0
.L52:
	ld	a2,Caml_state
	ld	a4,232(a2)
	ble	a4,a5,.L50
	slli	a1,a5,3
	add	a4,s0,a1
	ld	a3,0(a4)
	andi	a3,a3,-2
	ld	a4,240(a2)
	add	a4,a4,a1
	sd	a3,0(a4)
	addi	a5,a5,1
	j	.L52
.L56:
	call	caml_alloc_backtrace_buffer
	li	a5,-1
	bne	a0,a5,.L51
	j	.L50
	.size	caml_restore_raw_backtrace, .-caml_restore_raw_backtrace
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"No debug information available"
	.section	.text.caml_convert_raw_backtrace_slot,"ax",@progbits
	.align	1
	.globl	caml_convert_raw_backtrace_slot
	.type	caml_convert_raw_backtrace_slot, @function
caml_convert_raw_backtrace_slot:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_debug_info_available
	beq	a0,zero,.L60
	andi	a0,s0,-2
	call	caml_convert_debuginfo
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L60:
	lla	a0,.LC9
	call	caml_failwith
	.size	caml_convert_raw_backtrace_slot, .-caml_convert_raw_backtrace_slot
	.section	.text.caml_convert_raw_backtrace,"ax",@progbits
	.align	1
	.globl	caml_convert_raw_backtrace
	.type	caml_convert_raw_backtrace, @function
caml_convert_raw_backtrace:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	s3,168(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,96(sp)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	call	caml_debug_info_available
	beq	a0,zero,.L72
	li	s0,0
	li	s1,0
	j	.L62
.L72:
	lla	a0,.LC9
	call	caml_failwith
.L74:
	addi	s1,s1,1
.L62:
	ld	a4,8(sp)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bleu	a5,s1,.L73
	slli	a5,s1,3
	add	a5,a5,a4
	ld	a0,0(a5)
	andi	a0,a0,-2
	call	caml_debuginfo_extract
.L63:
	beq	a0,zero,.L74
	addi	s0,s0,1
	call	caml_debuginfo_next
	j	.L63
.L73:
	li	a1,0
	mv	a0,s0
	call	caml_alloc
	sd	a0,88(sp)
	li	s1,0
	li	s3,0
	j	.L66
.L68:
	mv	a0,s0
	call	caml_convert_debuginfo
	mv	a1,a0
	slli	a4,s1,3
	ld	a0,88(sp)
	add	a0,a4,a0
	call	caml_modify
	addi	s1,s1,1
	mv	a0,s0
	call	caml_debuginfo_next
	mv	s0,a0
.L67:
	bne	s0,zero,.L68
	addi	s3,s3,1
.L66:
	ld	a4,8(sp)
	ld	a5,-8(a4)
	srli	a5,a5,10
	bleu	a5,s3,.L75
	slli	a5,s3,3
	add	a5,a5,a4
	ld	a0,0(a5)
	andi	a0,a0,-2
	call	caml_debuginfo_extract
	mv	s0,a0
	j	.L67
.L75:
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,88(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	ld	s3,168(sp)
	addi	sp,sp,208
	jr	ra
	.size	caml_convert_raw_backtrace, .-caml_convert_raw_backtrace
	.section	.text.caml_raw_backtrace_length,"ax",@progbits
	.align	1
	.globl	caml_raw_backtrace_length
	.type	caml_raw_backtrace_length, @function
caml_raw_backtrace_length:
	ld	a0,-8(a0)
	srli	a0,a0,10
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_raw_backtrace_length, .-caml_raw_backtrace_length
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"Printexc.get_raw_backtrace_slot: index out of bounds"
	.section	.text.caml_raw_backtrace_slot,"ax",@progbits
	.align	1
	.globl	caml_raw_backtrace_slot
	.type	caml_raw_backtrace_slot, @function
caml_raw_backtrace_slot:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a1,a1,1
	ld	a5,-8(a0)
	srli	a5,a5,10
	bleu	a5,a1,.L80
	slli	a1,a1,3
	add	a0,a1,a0
	ld	a0,0(a0)
	andi	a0,a0,-2
	call	caml_debuginfo_extract
	ori	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L80:
	lla	a0,.LC10
	call	caml_invalid_argument
	.size	caml_raw_backtrace_slot, .-caml_raw_backtrace_slot
	.section	.text.caml_raw_backtrace_next_slot,"ax",@progbits
	.align	1
	.globl	caml_raw_backtrace_next_slot
	.type	caml_raw_backtrace_next_slot, @function
caml_raw_backtrace_next_slot:
	addi	sp,sp,-192
	sd	ra,184(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	a0,8(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,96(sp)
	li	a5,1
	sd	a5,112(sp)
	sd	a5,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	andi	a0,a0,-2
	call	caml_debuginfo_next
	beq	a0,zero,.L85
	mv	s0,a0
	li	a1,0
	li	a0,1
	call	caml_alloc
	sd	a0,88(sp)
	ori	s0,s0,1
	sd	s0,0(a0)
.L83:
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,184(sp)
	ld	s0,176(sp)
	ld	s1,168(sp)
	addi	sp,sp,192
	jr	ra
.L85:
	li	a5,1
	sd	a5,88(sp)
	j	.L83
	.size	caml_raw_backtrace_next_slot, .-caml_raw_backtrace_next_slot
	.section	.text.caml_get_exception_backtrace,"ax",@progbits
	.align	1
	.globl	caml_get_exception_backtrace
	.type	caml_get_exception_backtrace, @function
caml_get_exception_backtrace:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	li	a5,1
	sd	a5,88(sp)
	sd	a5,80(sp)
	sd	a5,72(sp)
	sd	s2,8(sp)
	addi	a3,sp,8
	sd	a3,280(a4)
	sd	a5,24(sp)
	li	a5,3
	sd	a5,16(sp)
	addi	a5,sp,88
	sd	a5,32(sp)
	addi	a5,sp,80
	sd	a5,40(sp)
	addi	a5,sp,72
	sd	a5,48(sp)
	call	caml_debug_info_available
	bne	a0,zero,.L87
	li	a5,1
	sd	a5,80(sp)
.L88:
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,80(sp)
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	addi	sp,sp,128
	jr	ra
.L87:
	li	a0,1
	call	caml_get_exception_raw_backtrace
	sd	a0,72(sp)
	ld	a0,-8(a0)
	li	a1,0
	srli	a0,a0,10
	call	caml_alloc
	sd	a0,88(sp)
	li	s0,0
.L89:
	ld	a5,72(sp)
	ld	a4,-8(a5)
	srli	a4,a4,10
	bleu	a4,s0,.L92
	slli	s1,s0,3
	add	a5,s1,a5
	ld	a0,0(a5)
	andi	a0,a0,-2
	call	caml_debuginfo_extract
	call	caml_convert_debuginfo
	mv	a1,a0
	ld	a0,88(sp)
	add	a0,s1,a0
	call	caml_modify
	addi	s0,s0,1
	j	.L89
.L92:
	li	a1,0
	li	a0,1
	call	caml_alloc_small
	sd	a0,80(sp)
	ld	a5,88(sp)
	sd	a5,0(a0)
	j	.L88
	.size	caml_get_exception_backtrace, .-caml_get_exception_backtrace
	.section	.text.caml_get_current_callstack,"ax",@progbits
	.align	1
	.globl	caml_get_current_callstack
	.type	caml_get_current_callstack, @function
caml_get_current_callstack:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	a0,8(sp)
	lla	s2,Caml_state
	ld	a4,0(s2)
	ld	s1,280(a4)
	sd	s1,112(sp)
	li	a5,1
	sd	a5,128(sp)
	sd	a5,120(sp)
	addi	a3,sp,8
	sd	a3,136(sp)
	sd	a5,104(sp)
	addi	a3,sp,112
	sd	a3,40(sp)
	addi	a3,sp,40
	sd	a3,280(a4)
	sd	a5,56(sp)
	sd	a5,48(sp)
	addi	a5,sp,104
	sd	a5,64(sp)
	sd	zero,32(sp)
	sd	zero,24(sp)
	li	a3,-1
	srai	a2,a0,1
	addi	a1,sp,24
	addi	a0,sp,32
	call	caml_collect_current_callstack
	mv	s0,a0
	li	a1,0
	call	caml_alloc
	sd	a0,104(sp)
	slli	a2,s0,3
	ld	a1,32(sp)
	call	memcpy
	ld	a0,32(sp)
	call	caml_stat_free
	ld	a5,0(s2)
	sd	s1,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	addi	sp,sp,208
	jr	ra
	.size	caml_get_current_callstack, .-caml_get_current_callstack
	.ident	"GCC: (GNU) 9.2.0"
