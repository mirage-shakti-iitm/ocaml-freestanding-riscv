	.file	"fail_nat.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_raise,"ax",@progbits
	.align	1
	.globl	caml_raise
	.type	caml_raise, @function
caml_raise:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,caml_channel_mutex_unlock_exn
	beq	a5,zero,.L2
	jalr	a5
.L2:
	ld	a0,Caml_state
	ld	a5,16(a0)
	bne	a5,zero,.L3
	mv	a0,s0
	call	caml_fatal_uncaught_exception
.L5:
	ld	a5,0(a5)
	sd	a5,280(a0)
.L3:
	ld	a5,280(a0)
	beq	a5,zero,.L4
	ld	a4,16(a0)
	bltu	a5,a4,.L5
.L4:
	mv	a1,s0
	call	caml_raise_exception
	.size	caml_raise, .-caml_raise
	.section	.text.caml_raise_constant,"ax",@progbits
	.align	1
	.globl	caml_raise_constant
	.type	caml_raise_constant, @function
caml_raise_constant:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_raise
	.size	caml_raise_constant, .-caml_raise_constant
	.section	.text.caml_raise_with_arg,"ax",@progbits
	.align	1
	.globl	caml_raise_with_arg
	.type	caml_raise_with_arg, @function
caml_raise_with_arg:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	a5,280(a4)
	sd	a5,96(sp)
	li	a5,1
	sd	a5,112(sp)
	li	a3,2
	sd	a3,104(sp)
	addi	a3,sp,8
	sd	a3,120(sp)
	sd	sp,128(sp)
	sd	a5,88(sp)
	addi	a3,sp,96
	sd	a3,24(sp)
	addi	a3,sp,24
	sd	a3,280(a4)
	sd	a5,40(sp)
	sd	a5,32(sp)
	addi	a5,sp,88
	sd	a5,48(sp)
	li	a1,0
	li	a0,2
	call	caml_alloc_small
	sd	a0,88(sp)
	ld	a5,8(sp)
	sd	a5,0(a0)
	ld	a4,0(sp)
	ld	a5,88(sp)
	sd	a4,8(a5)
	ld	a0,88(sp)
	call	caml_raise
	.size	caml_raise_with_arg, .-caml_raise_with_arg
	.section	.text.caml_raise_with_args,"ax",@progbits
	.align	1
	.globl	caml_raise_with_args
	.type	caml_raise_with_args, @function
caml_raise_with_args:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	a0,8(sp)
	mv	s0,a1
	mv	s1,a2
	ld	a4,Caml_state
	ld	a5,280(a4)
	sd	a5,80(sp)
	li	a5,1
	sd	a5,96(sp)
	sd	a5,88(sp)
	addi	a3,sp,8
	sd	a3,104(sp)
	addi	a3,sp,80
	sd	a3,16(sp)
	addi	a3,sp,16
	sd	a3,280(a4)
	sd	a1,32(sp)
	sd	a5,24(sp)
	sd	a2,40(sp)
	li	a1,0
	addiw	a0,s0,1
	call	caml_alloc_small
	ld	a5,8(sp)
	sd	a5,0(a0)
	li	a5,0
.L12:
	bge	a5,s0,.L15
	slli	a3,a5,3
	add	a3,s1,a3
	addiw	a5,a5,1
	slli	a4,a5,3
	add	a4,a4,a0
	ld	a3,0(a3)
	sd	a3,0(a4)
	j	.L12
.L15:
	call	caml_raise
	.size	caml_raise_with_args, .-caml_raise_with_args
	.section	.text.caml_raise_with_string,"ax",@progbits
	.align	1
	.globl	caml_raise_with_string
	.type	caml_raise_with_string, @function
caml_raise_with_string:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	a4,280(a5)
	sd	a4,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	mv	a0,a1
	call	caml_copy_string
	mv	a1,a0
	ld	a0,8(sp)
	call	caml_raise_with_arg
	.size	caml_raise_with_string, .-caml_raise_with_string
	.section	.text.caml_failwith,"ax",@progbits
	.align	1
	.globl	caml_failwith
	.type	caml_failwith, @function
caml_failwith:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_exn_Failure
	call	caml_raise_with_string
	.size	caml_failwith, .-caml_failwith
	.section	.text.caml_failwith_value,"ax",@progbits
	.align	1
	.globl	caml_failwith_value
	.type	caml_failwith_value, @function
caml_failwith_value:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_exn_Failure
	call	caml_raise_with_arg
	.size	caml_failwith_value, .-caml_failwith_value
	.section	.text.caml_invalid_argument,"ax",@progbits
	.align	1
	.globl	caml_invalid_argument
	.type	caml_invalid_argument, @function
caml_invalid_argument:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_exn_Invalid_argument
	call	caml_raise_with_string
	.size	caml_invalid_argument, .-caml_invalid_argument
	.section	.text.caml_invalid_argument_value,"ax",@progbits
	.align	1
	.globl	caml_invalid_argument_value
	.type	caml_invalid_argument_value, @function
caml_invalid_argument_value:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_exn_Invalid_argument
	call	caml_raise_with_arg
	.size	caml_invalid_argument_value, .-caml_invalid_argument_value
	.section	.text.caml_raise_out_of_memory,"ax",@progbits
	.align	1
	.globl	caml_raise_out_of_memory
	.type	caml_raise_out_of_memory, @function
caml_raise_out_of_memory:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_Out_of_memory
	call	caml_raise_constant
	.size	caml_raise_out_of_memory, .-caml_raise_out_of_memory
	.section	.text.caml_raise_stack_overflow,"ax",@progbits
	.align	1
	.globl	caml_raise_stack_overflow
	.type	caml_raise_stack_overflow, @function
caml_raise_stack_overflow:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_Stack_overflow
	call	caml_raise_constant
	.size	caml_raise_stack_overflow, .-caml_raise_stack_overflow
	.section	.text.caml_raise_sys_error,"ax",@progbits
	.align	1
	.globl	caml_raise_sys_error
	.type	caml_raise_sys_error, @function
caml_raise_sys_error:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a1,a0
	lla	a0,caml_exn_Sys_error
	call	caml_raise_with_arg
	.size	caml_raise_sys_error, .-caml_raise_sys_error
	.section	.text.caml_raise_end_of_file,"ax",@progbits
	.align	1
	.globl	caml_raise_end_of_file
	.type	caml_raise_end_of_file, @function
caml_raise_end_of_file:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_End_of_file
	call	caml_raise_constant
	.size	caml_raise_end_of_file, .-caml_raise_end_of_file
	.section	.text.caml_raise_zero_divide,"ax",@progbits
	.align	1
	.globl	caml_raise_zero_divide
	.type	caml_raise_zero_divide, @function
caml_raise_zero_divide:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_Division_by_zero
	call	caml_raise_constant
	.size	caml_raise_zero_divide, .-caml_raise_zero_divide
	.section	.text.caml_raise_not_found,"ax",@progbits
	.align	1
	.globl	caml_raise_not_found
	.type	caml_raise_not_found, @function
caml_raise_not_found:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_Not_found
	call	caml_raise_constant
	.size	caml_raise_not_found, .-caml_raise_not_found
	.section	.text.caml_raise_sys_blocked_io,"ax",@progbits
	.align	1
	.globl	caml_raise_sys_blocked_io
	.type	caml_raise_sys_blocked_io, @function
caml_raise_sys_blocked_io:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,caml_exn_Sys_blocked_io
	call	caml_raise_constant
	.size	caml_raise_sys_blocked_io, .-caml_raise_sys_blocked_io
	.section	.text.caml_raise_if_exception,"ax",@progbits
	.align	1
	.globl	caml_raise_if_exception
	.type	caml_raise_if_exception, @function
caml_raise_if_exception:
	andi	a4,a0,3
	li	a5,2
	beq	a4,a5,.L45
	ret
.L45:
	addi	sp,sp,-16
	sd	ra,8(sp)
	andi	a0,a0,-4
	call	caml_raise
	.size	caml_raise_if_exception, .-caml_raise_if_exception
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Pervasives.array_bound_error"
	.align	3
.LC1:
	.string	"Fatal error: exception Invalid_argument(\"index out of bounds\")\n"
	.section	.text.caml_array_bound_error,"ax",@progbits
	.align	1
	.globl	caml_array_bound_error
	.type	caml_array_bound_error, @function
caml_array_bound_error:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,caml_array_bound_error_exn
	beq	a5,zero,.L49
.L47:
	ld	a5,caml_array_bound_error_exn
	ld	a0,0(a5)
	call	caml_raise
.L49:
	lla	a0,.LC0
	call	caml_named_value
	sd	a0,caml_array_bound_error_exn,a5
	bne	a0,zero,.L47
	ld	a3,stderr
	li	a2,63
	li	a1,1
	lla	a0,.LC1
	call	fwrite
	li	a0,2
	call	exit
	.size	caml_array_bound_error, .-caml_array_bound_error
	.section	.text.caml_is_special_exception,"ax",@progbits
	.align	1
	.globl	caml_is_special_exception
	.type	caml_is_special_exception, @function
caml_is_special_exception:
	lla	a5,caml_exn_Match_failure
	beq	a5,a0,.L52
	lla	a5,caml_exn_Assert_failure
	beq	a5,a0,.L53
	lla	a5,caml_exn_Undefined_recursive_module
	beq	a5,a0,.L55
	li	a0,0
	ret
.L55:
	li	a0,1
	ret
.L52:
	li	a0,1
	ret
.L53:
	li	a0,1
	ret
	.size	caml_is_special_exception, .-caml_is_special_exception
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_array_bound_error_exn, @object
	.size	caml_array_bound_error_exn, 8
caml_array_bound_error_exn:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
