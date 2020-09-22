	.file	"extern.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.close_extern_output,"ax",@progbits
	.align	1
	.type	close_extern_output, @function
close_extern_output:
	ld	a5,extern_userprovided_output
	beq	a5,zero,.L3
.L1:
	ret
.L3:
	ld	a5,extern_output_block
	ld	a4,extern_ptr
	sd	a4,8(a5)
	j	.L1
	.size	close_extern_output, .-close_extern_output
	.section	.text.extern_output_length,"ax",@progbits
	.align	1
	.type	extern_output_length, @function
extern_output_length:
	ld	a5,extern_userprovided_output
	beq	a5,zero,.L5
	ld	a0,extern_ptr
	sub	a0,a0,a5
	ret
.L5:
	ld	a5,extern_output_first
	li	a0,0
.L7:
	beq	a5,zero,.L9
	ld	a4,8(a5)
	addi	a3,a5,16
	sub	a4,a4,a3
	add	a0,a0,a4
	ld	a5,0(a5)
	j	.L7
.L9:
	ret
	.size	extern_output_length, .-extern_output_length
	.section	.text.extern_free_stack,"ax",@progbits
	.align	1
	.type	extern_free_stack, @function
extern_free_stack:
	ld	a0,extern_stack
	lla	a5,extern_stack_init
	beq	a0,a5,.L13
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_stat_free
	lla	a5,extern_stack_init
	sd	a5,extern_stack,a4
	lla	a5,extern_stack_init+4096
	sd	a5,extern_stack_limit,a4
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L13:
	ret
	.size	extern_free_stack, .-extern_free_stack
	.section	.text.extern_free_position_table,"ax",@progbits
	.align	1
	.type	extern_free_position_table, @function
extern_free_position_table:
	ld	a0,.LANCHOR0+32
	lla	a5,.LANCHOR0+48
	beq	a0,a5,.L19
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	call	caml_stat_free
	lla	s0,.LANCHOR0
	ld	a0,40(s0)
	call	caml_stat_free
	lla	a5,.LANCHOR0+48
	sd	a5,32(s0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L19:
	ret
	.size	extern_free_position_table, .-extern_free_position_table
	.section	.text.free_extern_output,"ax",@progbits
	.align	1
	.type	free_extern_output, @function
free_extern_output:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a5,extern_userprovided_output
	beq	a5,zero,.L27
.L23:
	call	extern_free_stack
	call	extern_free_position_table
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L27:
	ld	a0,extern_output_first
.L24:
	beq	a0,zero,.L28
	ld	s0,0(a0)
	call	caml_stat_free
	mv	a0,s0
	j	.L24
.L28:
	sd	zero,extern_output_first,a5
	j	.L23
	.size	free_extern_output, .-free_extern_output
	.section	.text.extern_failwith,"ax",@progbits
	.align	1
	.type	extern_failwith, @function
extern_failwith:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	free_extern_output
	mv	a0,s0
	call	caml_failwith
	.size	extern_failwith, .-extern_failwith
	.section	.text.init_extern_output,"ax",@progbits
	.align	1
	.type	init_extern_output, @function
init_extern_output:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	zero,extern_userprovided_output,a5
	li	a0,8192
	addi	a0,a0,-72
	call	caml_stat_alloc_noexc
	sd	a0,extern_output_first,a5
	beq	a0,zero,.L34
	sd	a0,extern_output_block,a5
	sd	zero,0(a0)
	addi	a5,a0,16
	sd	a5,extern_ptr,a4
	li	a5,8192
	addi	a5,a5,-76
	add	a0,a0,a5
	sd	a0,extern_limit,a5
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L34:
	call	caml_raise_out_of_memory
	.size	init_extern_output, .-init_extern_output
	.section	.text.extern_out_of_memory,"ax",@progbits
	.align	1
	.type	extern_out_of_memory, @function
extern_out_of_memory:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	free_extern_output
	call	caml_raise_out_of_memory
	.size	extern_out_of_memory, .-extern_out_of_memory
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Marshal.to_buffer: buffer overflow"
	.section	.text.grow_extern_output,"ax",@progbits
	.align	1
	.type	grow_extern_output, @function
grow_extern_output:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a5,extern_userprovided_output
	bne	a5,zero,.L42
	mv	s0,a0
	ld	a5,extern_output_block
	ld	a4,extern_ptr
	sd	a4,8(a5)
	li	a5,4096
	addi	a5,a5,-46
	bgt	a0,a5,.L39
	li	s0,0
.L39:
	li	a0,8192
	addi	a0,a0,-72
	add	a0,s0,a0
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L43
	lla	a5,extern_output_block
	ld	a4,0(a5)
	sd	a0,0(a4)
	sd	a0,0(a5)
	sd	zero,0(a0)
	addi	a5,a0,16
	sd	a5,extern_ptr,a4
	li	a0,8192
	addi	a0,a0,-92
	add	a0,s0,a0
	add	a0,a5,a0
	sd	a0,extern_limit,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L42:
	lla	a0,.LC0
	call	extern_failwith
.L43:
	call	extern_out_of_memory
	.size	grow_extern_output, .-grow_extern_output
	.section	.text.writecode16,"ax",@progbits
	.align	1
	.type	writecode16, @function
writecode16:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	ld	a5,extern_ptr
	addi	a5,a5,3
	ld	a4,extern_limit
	bgtu	a5,a4,.L47
.L45:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sb	s1,0(a5)
	sraiw	a3,s0,8
	sb	a3,1(a5)
	sb	s0,2(a5)
	addi	a5,a5,3
	sd	a5,0(a4)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L47:
	li	a0,3
	call	grow_extern_output
	j	.L45
	.size	writecode16, .-writecode16
	.section	.text.writecode8,"ax",@progbits
	.align	1
	.type	writecode8, @function
writecode8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	ld	a5,extern_ptr
	addi	a5,a5,2
	ld	a4,extern_limit
	bgtu	a5,a4,.L51
.L49:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sb	s1,0(a5)
	sb	s0,1(a5)
	addi	a5,a5,2
	sd	a5,0(a4)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L51:
	li	a0,2
	call	grow_extern_output
	j	.L49
	.size	writecode8, .-writecode8
	.section	.text.writecode64,"ax",@progbits
	.align	1
	.type	writecode64, @function
writecode64:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	ld	a5,extern_ptr
	addi	a5,a5,9
	ld	a4,extern_limit
	bgtu	a5,a4,.L55
.L53:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sb	s1,0(a5)
	srai	a3,s0,56
	sb	a3,1(a5)
	srai	a3,s0,48
	sb	a3,2(a5)
	srai	a3,s0,40
	sb	a3,3(a5)
	srai	a3,s0,32
	sb	a3,4(a5)
	srai	a3,s0,24
	sb	a3,5(a5)
	srai	a3,s0,16
	sb	a3,6(a5)
	srai	a3,s0,8
	sb	a3,7(a5)
	sb	s0,8(a5)
	addi	a5,a5,9
	sd	a5,0(a4)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L55:
	li	a0,9
	call	grow_extern_output
	j	.L53
	.size	writecode64, .-writecode64
	.section	.text.writecode32,"ax",@progbits
	.align	1
	.type	writecode32, @function
writecode32:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	ld	a5,extern_ptr
	addi	a5,a5,5
	ld	a4,extern_limit
	bgtu	a5,a4,.L59
.L57:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sb	s1,0(a5)
	srai	a3,s0,24
	sb	a3,1(a5)
	srai	a3,s0,16
	sb	a3,2(a5)
	srai	a3,s0,8
	sb	a3,3(a5)
	sb	s0,4(a5)
	addi	a5,a5,5
	sd	a5,0(a4)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L59:
	li	a0,5
	call	grow_extern_output
	j	.L57
	.size	writecode32, .-writecode32
	.section	.text.extern_init_position_table,"ax",@progbits
	.align	1
	.type	extern_init_position_table, @function
extern_init_position_table:
	lw	a5,extern_flags
	andi	a5,a5,1
	beq	a5,zero,.L62
.L60:
	ret
.L62:
	lla	a5,.LANCHOR0
	li	a4,256
	sd	a4,8(a5)
	li	a4,56
	sw	a4,0(a5)
	li	a4,255
	sd	a4,16(a5)
	li	a4,170
	sd	a4,24(a5)
	lla	a4,.LANCHOR0+48
	sd	a4,32(a5)
	lla	a3,pos_table_entries_init
	sd	a3,40(a5)
	sd	zero,0(a4)
	sd	zero,8(a4)
	sd	zero,16(a4)
	sd	zero,24(a4)
	j	.L60
	.size	extern_init_position_table, .-extern_init_position_table
	.section	.text.extern_resize_position_table,"ax",@progbits
	.align	1
	.type	extern_resize_position_table, @function
extern_resize_position_table:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	lla	a5,.LANCHOR0
	ld	a1,0(a5)
	ld	s3,8(a5)
	ld	a2,16(a5)
	ld	a3,24(a5)
	ld	a4,32(a5)
	ld	a5,40(a5)
	sd	a1,0(sp)
	sd	s3,8(sp)
	sd	a2,16(sp)
	sd	a3,24(sp)
	sd	a4,32(sp)
	sd	a5,40(sp)
	mv	s0,s3
	li	a5,999424
	addi	a5,a5,575
	bgtu	s3,a5,.L64
	slli	s3,s3,3
	lw	s2,0(sp)
	addiw	s2,s2,-3
.L65:
	beq	s3,zero,.L66
	li	a5,0
	slli	a0,s3,4
	srli	a4,s3,60
	bne	a4,zero,.L79
.L67:
	bne	a5,zero,.L66
	call	caml_stat_alloc_noexc
	mv	s1,a0
	beq	a0,zero,.L80
	addi	a0,s3,63
	li	a1,8
	srli	a0,a0,6
	call	caml_stat_calloc_noexc
	beq	a0,zero,.L81
	lla	a5,.LANCHOR0
	sd	s3,8(a5)
	sw	s2,0(a5)
	addi	a7,s3,-1
	sd	a7,16(a5)
	slli	s3,s3,1
	li	a4,3
	divu	s3,s3,a4
	sd	s3,24(a5)
	sd	a0,32(a5)
	sd	s1,40(a5)
	li	a6,0
	j	.L72
.L64:
	slli	s3,s3,1
	lw	s2,0(sp)
	addiw	s2,s2,-1
	j	.L65
.L79:
	li	a5,1
	j	.L67
.L66:
	call	extern_out_of_memory
.L80:
	call	extern_out_of_memory
.L81:
	mv	a0,s1
	call	caml_stat_free
	call	extern_out_of_memory
.L83:
	or	a3,a2,a3
	sd	a3,0(a4)
	slli	a5,a5,4
	add	a5,s1,a5
	ld	a4,0(t1)
	sd	a4,0(a5)
	ld	a4,8(t1)
	sd	a4,8(a5)
.L73:
	addi	a6,a6,1
.L72:
	bleu	s0,a6,.L82
	srli	a5,a6,6
	slli	a4,a5,3
	ld	a5,32(sp)
	add	a5,a5,a4
	ld	a5,0(a5)
	li	a4,1
	sll	a4,a4,a6
	and	a5,a5,a4
	beq	a5,zero,.L73
	slli	t1,a6,4
	ld	a5,40(sp)
	add	t1,a5,t1
	ld	a5,0(t1)
	ld	a4,.LC1
	mul	a5,a5,a4
	srl	a5,a5,s2
.L74:
	srli	a4,a5,6
	slli	a4,a4,3
	add	a4,a0,a4
	ld	a2,0(a4)
	li	a3,1
	sll	a3,a3,a5
	and	a1,a2,a3
	beq	a1,zero,.L83
	addi	a5,a5,1
	and	a5,a7,a5
	j	.L74
.L82:
	ld	a0,32(sp)
	lla	a5,.LANCHOR0+48
	beq	a0,a5,.L63
	call	caml_stat_free
	ld	a0,40(sp)
	call	caml_stat_free
.L63:
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	addi	sp,sp,96
	jr	ra
	.size	extern_resize_position_table, .-extern_resize_position_table
	.section	.text.extern_record_location,"ax",@progbits
	.align	1
	.type	extern_record_location, @function
extern_record_location:
	lw	a5,extern_flags
	andi	a5,a5,1
	bne	a5,zero,.L87
	lla	a4,.LANCHOR0
	ld	a5,32(a4)
	srli	a3,a1,6
	slli	a3,a3,3
	add	a5,a5,a3
	li	a3,1
	sll	a2,a3,a1
	ld	a3,0(a5)
	or	a3,a3,a2
	sd	a3,0(a5)
	ld	a5,40(a4)
	slli	a1,a1,4
	add	a1,a5,a1
	sd	a0,0(a1)
	lla	a3,obj_counter
	ld	a5,0(a3)
	sd	a5,8(a1)
	addi	a5,a5,1
	sd	a5,0(a3)
	ld	a4,24(a4)
	bgeu	a5,a4,.L90
.L87:
	ret
.L90:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	extern_resize_position_table
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	extern_record_location, .-extern_record_location
	.section	.text.writeblock,"ax",@progbits
	.align	1
	.type	writeblock, @function
writeblock:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s2,a0
	mv	s0,a1
	ld	a5,extern_ptr
	add	a5,a5,a1
	ld	a4,extern_limit
	bgtu	a5,a4,.L94
.L92:
	lla	s3,extern_ptr
	ld	s1,0(s3)
	mv	a2,s0
	mv	a1,s2
	mv	a0,s1
	call	memcpy
	add	s0,s1,s0
	sd	s0,0(s3)
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L94:
	mv	a0,a1
	call	grow_extern_output
	j	.L92
	.size	writeblock, .-writeblock
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Stack overflow in marshaling value\n"
	.section	.text.extern_stack_overflow,"ax",@progbits
	.align	1
	.type	extern_stack_overflow, @function
extern_stack_overflow:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a1,.LC2
	li	a0,4
	call	caml_gc_message
	call	free_extern_output
	call	caml_raise_out_of_memory
	.size	extern_stack_overflow, .-extern_stack_overflow
	.section	.text.extern_resize_stack,"ax",@progbits
	.align	1
	.type	extern_resize_stack, @function
extern_resize_stack:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	ld	a5,extern_stack
	ld	s0,extern_stack_limit
	sub	s0,s0,a5
	srai	s0,s0,4
	slli	s0,s0,1
	sub	s2,a0,a5
	li	a4,104857600
	bgeu	s0,a4,.L103
	lla	a4,extern_stack_init
	beq	a5,a4,.L104
	slli	a1,s0,4
	mv	a0,a5
	call	caml_stat_resize_noexc
	mv	s1,a0
	beq	a0,zero,.L105
.L101:
	sd	s1,extern_stack,a5
	slli	s0,s0,4
	add	s0,s1,s0
	sd	s0,extern_stack_limit,a5
	add	a0,s1,s2
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L103:
	call	extern_stack_overflow
.L104:
	slli	a0,s0,4
	call	caml_stat_alloc_noexc
	mv	s1,a0
	beq	a0,zero,.L106
	li	a2,4096
	lla	a1,extern_stack_init
	call	memcpy
	j	.L101
.L106:
	call	extern_stack_overflow
.L105:
	call	extern_stack_overflow
	.size	extern_resize_stack, .-extern_resize_stack
	.section	.text.extern_invalid_argument,"ax",@progbits
	.align	1
	.type	extern_invalid_argument, @function
extern_invalid_argument:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	free_extern_output
	mv	a0,s0
	call	caml_invalid_argument
	.size	extern_invalid_argument, .-extern_invalid_argument
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"output_value: integer cannot be read back on 32-bit platform"
	.align	3
.LC4:
	.string	"output_value: string cannot be read back on 32-bit platform"
	.align	3
.LC5:
	.string	"output_value: float array cannot be read back on 32-bit platform"
	.align	3
.LC6:
	.string	"output_value: abstract value (Abstract)"
	.align	3
.LC7:
	.string	"output_value: abstract value (Custom)"
	.align	3
.LC8:
	.string	"output_value: incorrect fixed sizes specified by %s"
	.align	3
.LC9:
	.string	"output_value: array cannot be read back on 32-bit platform"
	.align	3
.LC10:
	.string	"output_value: functional value"
	.align	3
.LC11:
	.string	"output_value: abstract value (outside heap)"
	.section	.text.extern_rec,"ax",@progbits
	.align	1
	.type	extern_rec, @function
extern_rec:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	sd	s5,88(sp)
	sd	s6,80(sp)
	sd	s7,72(sp)
	sd	s8,64(sp)
	sd	s9,56(sp)
	sd	s10,48(sp)
	sd	s11,40(sp)
	mv	s0,a0
	call	extern_init_position_table
	ld	s1,extern_stack
	li	s6,0
	li	s5,0
	j	.L110
.L179:
	addiw	s0,a1,64
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L177
.L113:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	sb	s0,0(a5)
.L119:
	ld	a5,extern_stack
	beq	a5,s1,.L178
	ld	a5,0(s1)
	addi	a4,a5,8
	sd	a4,0(s1)
	ld	s0,0(a5)
	ld	a5,8(s1)
	addi	a5,a5,-1
	sd	a5,8(s1)
	bne	a5,zero,.L110
	addi	s1,s1,-16
.L110:
	andi	a5,s0,1
	beq	a5,zero,.L111
	srai	a1,s0,1
	li	a5,63
	bleu	a1,a5,.L179
	addi	a5,a1,128
	li	a4,255
	bleu	a5,a4,.L180
	li	a5,32768
	add	a5,a1,a5
	li	a4,65536
	bltu	a5,a4,.L181
	li	a4,1073741824
	add	a4,a1,a4
	li	a5,-2147483648
	xori	a5,a5,-1
	bleu	a4,a5,.L117
	lw	a5,extern_flags
	andi	a5,a5,4
	bne	a5,zero,.L182
	li	a0,3
	call	writecode64
	j	.L119
.L177:
	li	a0,1
	call	grow_extern_output
	j	.L113
.L180:
	li	a0,0
	call	writecode8
	j	.L119
.L181:
	li	a0,1
	call	writecode16
	j	.L119
.L182:
	lla	a0,.LC3
	call	extern_failwith
.L117:
	li	a0,2
	call	writecode32
	j	.L119
.L111:
	mv	s7,s0
	mv	a0,s0
	call	caml_page_table_lookup
	andi	a0,a0,7
	bne	a0,zero,.L120
	lw	a5,caml_extern_allow_out_of_heap
	beq	a5,zero,.L121
.L120:
	mv	s9,s0
	addi	s10,s0,-8
	ld	s2,-8(s0)
	sext.w	s8,s2
	andi	s3,s2,0xff
	srli	s4,s2,10
	li	a5,250
	beq	s3,a5,.L183
.L122:
	beq	s4,zero,.L184
	lw	a2,extern_flags
	andi	a2,a2,1
	beq	a2,zero,.L185
.L129:
	addiw	a5,s3,-249
	sext.w	a3,a5
	li	a4,6
	bgtu	a3,a4,.L137
	slli	a5,a5,32
	srli	a5,a5,32
	slli	a5,a5,2
	lla	a4,.L139
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L139:
	.word	.L144-.L139
	.word	.L137-.L139
	.word	.L143-.L139
	.word	.L142-.L139
	.word	.L141-.L139
	.word	.L140-.L139
	.word	.L138-.L139
	.section	.text.extern_rec
.L183:
	ld	s11,0(s7)
	andi	a5,s11,1
	bne	a5,zero,.L123
	mv	a0,s11
	call	caml_page_table_lookup
	andi	a0,a0,7
	beq	a0,zero,.L122
	lbu	a5,-8(s11)
	li	a4,250
	beq	a5,a4,.L122
	li	a4,246
	beq	a5,a4,.L122
	li	a4,253
	beq	a5,a4,.L122
.L123:
	mv	s0,s11
	j	.L110
.L184:
	andi	s8,s8,240
	bne	s8,zero,.L126
	addi	s3,s3,128
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L186
.L127:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	sb	s3,0(a5)
	j	.L119
.L186:
	li	a0,1
	call	grow_extern_output
	j	.L127
.L126:
	mv	a1,s2
	li	a0,8
	call	writecode32
	j	.L119
.L185:
	ld	a5,.LC1
	mul	a5,s0,a5
	lw	a4,.LANCHOR0
	srl	a5,a5,a4
.L132:
	srli	a4,a5,6
	slli	a3,a4,3
	ld	a4,.LANCHOR0+32
	add	a4,a4,a3
	ld	a4,0(a4)
	li	a3,1
	sll	a3,a3,a5
	and	a4,a4,a3
	beq	a4,zero,.L174
	slli	a4,a5,4
	ld	a3,.LANCHOR0+40
	add	a4,a3,a4
	ld	a3,0(a4)
	beq	s0,a3,.L187
	addi	a5,a5,1
	ld	a4,.LANCHOR0+16
	and	a5,a5,a4
	j	.L132
.L187:
	ld	s6,8(a4)
	li	a2,1
	j	.L130
.L174:
	mv	s5,a5
.L130:
	beq	a2,zero,.L129
	ld	a1,obj_counter
	sub	a1,a1,s6
	li	a5,255
	bleu	a1,a5,.L188
	li	a5,65536
	bltu	a1,a5,.L189
	li	a5,-1
	srli	a5,a5,32
	bleu	a1,a5,.L136
	li	a0,20
	call	writecode64
	j	.L119
.L188:
	li	a0,4
	call	writecode8
	j	.L119
.L189:
	li	a0,5
	call	writecode16
	j	.L119
.L136:
	li	a0,6
	call	writecode32
	j	.L119
.L142:
	mv	a0,s0
	call	caml_string_length
	mv	s2,a0
	li	a5,31
	bleu	a0,a5,.L190
	li	a5,255
	bleu	a0,a5,.L191
	li	a5,16777216
	addi	a5,a5,-5
	bleu	a0,a5,.L149
	lw	a5,extern_flags
	andi	a5,a5,4
	bne	a5,zero,.L192
.L149:
	li	a5,-1
	srli	a5,a5,32
	bgtu	s2,a5,.L150
	mv	a1,s2
	li	a0,10
	call	writecode32
	j	.L147
.L190:
	addiw	s3,a0,32
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L193
.L146:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	sb	s3,0(a5)
.L147:
	mv	a1,s2
	mv	a0,s7
	call	writeblock
	addi	a5,s2,4
	srli	a5,a5,2
	lla	a4,size_32
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	addi	a5,s2,8
	srli	a5,a5,3
	lla	a4,size_64
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	mv	a1,s5
	mv	a0,s0
	call	extern_record_location
	j	.L119
.L193:
	li	a0,1
	call	grow_extern_output
	j	.L146
.L191:
	mv	a1,a0
	li	a0,9
	call	writecode8
	j	.L147
.L192:
	lla	a0,.LC4
	call	extern_failwith
.L150:
	mv	a1,s2
	li	a0,21
	call	writecode64
	j	.L147
.L141:
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L194
.L151:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	li	a4,12
	sb	a4,0(a5)
	li	a1,8
	mv	a0,s7
	call	writeblock
	lla	a4,size_32
	ld	a5,0(a4)
	addi	a5,a5,3
	sd	a5,0(a4)
	lla	a4,size_64
	ld	a5,0(a4)
	addi	a5,a5,2
	sd	a5,0(a4)
	mv	a1,s5
	mv	a0,s0
	call	extern_record_location
	j	.L119
.L194:
	li	a0,1
	call	grow_extern_output
	j	.L151
.L140:
	ld	s2,0(s10)
	srli	s2,s2,10
	li	a5,255
	bleu	s2,a5,.L195
	li	a5,2097152
	bltu	s2,a5,.L154
	lw	a5,extern_flags
	andi	a5,a5,4
	bne	a5,zero,.L196
.L154:
	li	a5,-1
	srli	a5,a5,32
	bgtu	s2,a5,.L155
	mv	a1,s2
	li	a0,7
	call	writecode32
.L153:
	slli	a1,s2,3
	mv	a0,s7
	call	writeblock
	slli	a5,s2,1
	lla	a4,size_32
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,1
	sd	a5,0(a4)
	lla	a5,size_64
	ld	a4,0(a5)
	add	s2,s2,a4
	addi	s2,s2,1
	sd	s2,0(a5)
	mv	a1,s5
	mv	a0,s0
	call	extern_record_location
	j	.L119
.L195:
	mv	a1,s2
	li	a0,14
	call	writecode8
	j	.L153
.L196:
	lla	a0,.LC5
	call	extern_failwith
.L155:
	mv	a1,s2
	li	a0,23
	call	writecode64
	j	.L153
.L143:
	lla	a0,.LC6
	call	extern_invalid_argument
.L144:
	slli	s0,s4,3
	mv	a1,s0
	li	a0,17
	call	writecode32
	sub	s0,s9,s0
	j	.L110
.L138:
	ld	a5,0(s7)
	ld	s3,0(a5)
	ld	s4,32(a5)
	ld	s2,56(a5)
	beq	s4,zero,.L197
	beq	s2,zero,.L198
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L199
.L161:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	li	a4,25
	sb	a4,0(a5)
	mv	a0,s3
	call	strlen
	addi	a1,a0,1
	mv	a0,s3
	call	writeblock
	addi	a2,sp,16
	addi	a1,sp,8
	mv	a0,s0
	jalr	s4
	ld	a4,0(s2)
	ld	a5,8(sp)
	bne	a4,a5,.L162
	ld	a4,8(s2)
	ld	a5,16(sp)
	bne	a4,a5,.L162
.L160:
	ld	a5,8(sp)
	addi	a5,a5,3
	srli	a5,a5,2
	lla	a4,size_32
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,2
	sd	a5,0(a4)
	ld	a5,16(sp)
	addi	a5,a5,7
	srli	a5,a5,3
	lla	a4,size_64
	ld	a3,0(a4)
	add	a5,a5,a3
	addi	a5,a5,2
	sd	a5,0(a4)
	mv	a1,s5
	mv	a0,s0
	call	extern_record_location
	j	.L119
.L197:
	lla	a0,.LC7
	call	extern_invalid_argument
.L198:
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L200
.L158:
	lla	s2,extern_ptr
	ld	a5,0(s2)
	addi	a4,a5,1
	sd	a4,0(s2)
	li	a4,24
	sb	a4,0(a5)
	mv	a0,s3
	call	strlen
	addi	a1,a0,1
	mv	a0,s3
	call	writeblock
	ld	a5,0(s2)
	addi	a5,a5,12
	ld	a4,extern_limit
	bgeu	a5,a4,.L201
.L159:
	lla	a5,extern_ptr
	ld	s2,0(a5)
	addi	a4,s2,12
	sd	a4,0(a5)
	addi	a2,sp,16
	addi	a1,sp,8
	mv	a0,s0
	jalr	s4
	ld	a5,8(sp)
	srai	a4,a5,24
	sb	a4,0(s2)
	srai	a4,a5,16
	sb	a4,1(s2)
	srai	a4,a5,8
	sb	a4,2(s2)
	sb	a5,3(s2)
	ld	a5,16(sp)
	srai	a4,a5,56
	sb	a4,4(s2)
	srai	a4,a5,48
	sb	a4,5(s2)
	srai	a4,a5,40
	sb	a4,6(s2)
	srai	a4,a5,32
	sb	a4,7(s2)
	srai	a4,a5,24
	sb	a4,8(s2)
	srai	a4,a5,16
	sb	a4,9(s2)
	srai	a4,a5,8
	sb	a4,10(s2)
	sb	a5,11(s2)
	j	.L160
.L200:
	li	a0,1
	call	grow_extern_output
	j	.L158
.L201:
	li	a0,12
	call	grow_extern_output
	j	.L159
.L199:
	li	a0,1
	call	grow_extern_output
	j	.L161
.L162:
	mv	a1,s3
	lla	a0,.LC8
	call	caml_fatal_error
.L137:
	andi	s8,s8,240
	bne	s8,zero,.L163
	li	a5,7
	bleu	s4,a5,.L202
.L163:
	li	a5,4194304
	bltu	s4,a5,.L166
	lw	a5,extern_flags
	andi	a5,a5,4
	bne	a5,zero,.L203
.L166:
	li	a5,-1
	srli	a5,a5,32
	bgtu	s2,a5,.L167
	andi	a1,s2,-769
	li	a0,8
	call	writecode32
.L165:
	lla	a4,size_32
	ld	a5,0(a4)
	add	a5,s4,a5
	addi	a5,a5,1
	sd	a5,0(a4)
	lla	a4,size_64
	ld	a5,0(a4)
	add	a5,s4,a5
	addi	a5,a5,1
	sd	a5,0(a4)
	ld	s2,0(s7)
	mv	a1,s5
	mv	a0,s0
	call	extern_record_location
	li	a5,1
	bleu	s4,a5,.L168
	addi	s1,s1,16
	ld	a5,extern_stack_limit
	bleu	a5,s1,.L204
.L169:
	addi	s9,s9,8
	sd	s9,0(s1)
	addi	s4,s4,-1
	sd	s4,8(s1)
.L168:
	mv	s0,s2
	j	.L110
.L202:
	slliw	s2,s4,4
	addw	s2,s2,s3
	addiw	s2,s2,128
	ld	a4,extern_ptr
	ld	a5,extern_limit
	bgeu	a4,a5,.L205
.L164:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	addi	a3,a5,1
	sd	a3,0(a4)
	sb	s2,0(a5)
	j	.L165
.L205:
	li	a0,1
	call	grow_extern_output
	j	.L164
.L203:
	lla	a0,.LC9
	call	extern_failwith
.L167:
	andi	a1,s2,-769
	li	a0,19
	call	writecode64
	j	.L165
.L204:
	mv	a0,s1
	call	extern_resize_stack
	mv	s1,a0
	j	.L169
.L121:
	addi	a2,sp,24
	li	a1,0
	mv	a0,s0
	call	caml_find_code_fragment
	beq	a0,zero,.L170
	lw	a5,extern_flags
	andi	a5,a5,2
	beq	a5,zero,.L206
	ld	a0,24(sp)
	lbu	a5,32(a0)
	beq	a5,zero,.L207
.L172:
	ld	a5,24(sp)
	ld	a1,0(a5)
	sub	a1,s7,a1
	li	a0,16
	call	writecode32
	li	a1,16
	ld	a0,24(sp)
	addi	a0,a0,16
	call	writeblock
	j	.L119
.L206:
	lla	a0,.LC10
	call	extern_invalid_argument
.L207:
	ld	a1,0(a0)
	ld	a2,8(a0)
	sub	a2,a2,a1
	addi	a0,a0,16
	call	caml_md5_block
	ld	a5,24(sp)
	li	a4,1
	sb	a4,32(a5)
	j	.L172
.L170:
	lla	a0,.LC11
	call	extern_invalid_argument
.L178:
	call	extern_free_stack
	call	extern_free_position_table
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	ld	s4,96(sp)
	ld	s5,88(sp)
	ld	s6,80(sp)
	ld	s7,72(sp)
	ld	s8,64(sp)
	ld	s9,56(sp)
	ld	s10,48(sp)
	ld	s11,40(sp)
	addi	sp,sp,144
	jr	ra
	.size	extern_rec, .-extern_rec
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"output_value: object too big to be read back on 32-bit platform"
	.section	.text.extern_value,"ax",@progbits
	.align	1
	.type	extern_value, @function
extern_value:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	a0,a1
	mv	s0,a2
	mv	s2,a3
	lla	a1,.LANCHOR1
	call	caml_convert_flag_list
	sw	a0,extern_flags,a5
	sd	zero,obj_counter,a5
	sd	zero,size_32,a5
	sd	zero,size_64,a5
	mv	a0,s1
	call	extern_rec
	call	close_extern_output
	call	extern_output_length
	li	a5,-1
	srli	a5,a5,32
	bgt	a0,a5,.L209
	ld	a4,size_32
	li	a5,-1
	srli	a5,a5,32
	bgtu	a4,a5,.L209
	ld	a5,size_64
	li	a3,-1
	srli	a3,a3,32
	bleu	a5,a3,.L210
.L209:
	lw	a5,extern_flags
	andi	a5,a5,4
	bne	a5,zero,.L214
	li	a5,-124
	sb	a5,0(s0)
	li	a5,-107
	sb	a5,1(s0)
	li	a5,-90
	sb	a5,2(s0)
	li	a5,-65
	sb	a5,3(s0)
	sb	zero,4(s0)
	sb	zero,5(s0)
	sb	zero,6(s0)
	sb	zero,7(s0)
	srai	a5,a0,56
	sb	a5,8(s0)
	srai	a5,a0,48
	sb	a5,9(s0)
	srai	a5,a0,40
	sb	a5,10(s0)
	srai	a5,a0,32
	sb	a5,11(s0)
	srai	a5,a0,24
	sb	a5,12(s0)
	srai	a5,a0,16
	sb	a5,13(s0)
	srai	a5,a0,8
	sb	a5,14(s0)
	sb	a0,15(s0)
	ld	a5,obj_counter
	srai	a4,a5,56
	sb	a4,16(s0)
	srai	a4,a5,48
	sb	a4,17(s0)
	srai	a4,a5,40
	sb	a4,18(s0)
	srai	a4,a5,32
	sb	a4,19(s0)
	srai	a4,a5,24
	sb	a4,20(s0)
	srai	a4,a5,16
	sb	a4,21(s0)
	srai	a4,a5,8
	sb	a4,22(s0)
	sb	a5,23(s0)
	ld	a5,size_64
	srai	a4,a5,56
	sb	a4,24(s0)
	srai	a4,a5,48
	sb	a4,25(s0)
	srai	a4,a5,40
	sb	a4,26(s0)
	srai	a4,a5,32
	sb	a4,27(s0)
	srai	a4,a5,24
	sb	a4,28(s0)
	srai	a4,a5,16
	sb	a4,29(s0)
	srai	a4,a5,8
	sb	a4,30(s0)
	sb	a5,31(s0)
	li	a5,32
	sw	a5,0(s2)
.L208:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L214:
	call	free_extern_output
	lla	a0,.LC12
	call	caml_failwith
.L210:
	li	a3,-124
	sb	a3,0(s0)
	li	a3,-107
	sb	a3,1(s0)
	li	a3,-90
	sb	a3,2(s0)
	li	a3,-66
	sb	a3,3(s0)
	srai	a3,a0,24
	sb	a3,4(s0)
	srai	a3,a0,16
	sb	a3,5(s0)
	srai	a3,a0,8
	sb	a3,6(s0)
	sb	a0,7(s0)
	ld	a3,obj_counter
	srai	a2,a3,24
	sb	a2,8(s0)
	srai	a2,a3,16
	sb	a2,9(s0)
	srai	a2,a3,8
	sb	a2,10(s0)
	sb	a3,11(s0)
	srai	a3,a4,24
	sb	a3,12(s0)
	srai	a3,a4,16
	sb	a3,13(s0)
	srai	a3,a4,8
	sb	a3,14(s0)
	sb	a4,15(s0)
	srai	a4,a5,24
	sb	a4,16(s0)
	srai	a4,a5,16
	sb	a4,17(s0)
	srai	a4,a5,8
	sb	a4,18(s0)
	sb	a5,19(s0)
	li	a5,20
	sw	a5,0(s2)
	j	.L208
	.size	extern_value, .-extern_value
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"output_value: not a binary channel"
	.section	.text.caml_output_val,"ax",@progbits
	.align	1
	.globl	caml_output_val
	.type	caml_output_val, @function
caml_output_val:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	mv	s2,a0
	mv	s0,a1
	mv	s1,a2
	call	caml_channel_binary_mode
	beq	a0,zero,.L220
	call	init_extern_output
	addi	a3,sp,12
	addi	a2,sp,16
	mv	a1,s1
	mv	a0,s0
	call	extern_value
	ld	s0,extern_output_first
	lw	a2,12(sp)
	addi	a1,sp,16
	mv	a0,s2
	call	caml_really_putblock
	j	.L217
.L220:
	lla	a0,.LC13
	call	caml_failwith
.L218:
	addi	a1,s0,16
	ld	a2,8(s0)
	sub	a2,a2,a1
	mv	a0,s2
	call	caml_really_putblock
	ld	s1,0(s0)
	mv	a0,s0
	call	caml_stat_free
	mv	s0,s1
.L217:
	bne	s0,zero,.L218
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	addi	sp,sp,80
	jr	ra
	.size	caml_output_val, .-caml_output_val
	.section	.text.caml_output_value,"ax",@progbits
	.align	1
	.globl	caml_output_value
	.type	caml_output_value, @function
caml_output_value:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,3
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L222
	mv	a0,s0
	jalr	a5
.L222:
	ld	a2,8(sp)
	ld	a1,16(sp)
	mv	a0,s0
	call	caml_output_val
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L223
	mv	a0,s0
	jalr	a5
.L223:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	addi	sp,sp,128
	jr	ra
	.size	caml_output_value, .-caml_output_value
	.section	.text.caml_output_value_to_bytes,"ax",@progbits
	.align	1
	.globl	caml_output_value_to_bytes
	.type	caml_output_value_to_bytes, @function
caml_output_value_to_bytes:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	sd	s4,48(sp)
	mv	s0,a0
	mv	s1,a1
	call	init_extern_output
	addi	a3,sp,12
	addi	a2,sp,16
	mv	a1,s1
	mv	a0,s0
	call	extern_value
	ld	s0,extern_output_first
	lw	a5,12(sp)
	add	a0,a5,a0
	call	caml_alloc_string
	mv	s4,a0
	mv	s3,a0
	lw	a2,12(sp)
	addi	a1,sp,16
	call	memcpy
	lw	s2,12(sp)
.L226:
	beq	s0,zero,.L229
	ld	s1,8(s0)
	addi	a1,s0,16
	sub	s1,s1,a1
	mv	a2,s1
	add	a0,s2,s3
	call	memcpy
	add	s2,s2,s1
	ld	s1,0(s0)
	mv	a0,s0
	call	caml_stat_free
	mv	s0,s1
	j	.L226
.L229:
	mv	a0,s4
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	ld	s4,48(sp)
	addi	sp,sp,96
	jr	ra
	.size	caml_output_value_to_bytes, .-caml_output_value_to_bytes
	.section	.text.caml_output_value_to_string,"ax",@progbits
	.align	1
	.globl	caml_output_value_to_string
	.type	caml_output_value_to_string, @function
caml_output_value_to_string:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_output_value_to_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_output_value_to_string, .-caml_output_value_to_string
	.section	.text.caml_output_value_to_block,"ax",@progbits
	.align	1
	.globl	caml_output_value_to_block
	.type	caml_output_value_to_block, @function
caml_output_value_to_block:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	mv	s0,a2
	mv	s2,a3
	addi	s3,a2,20
	sd	s3,extern_userprovided_output,a5
	sd	s3,extern_ptr,a5
	add	a5,a2,a3
	sd	a5,extern_limit,a4
	addi	a3,sp,12
	addi	a2,sp,16
	call	extern_value
	mv	s1,a0
	lw	a0,12(sp)
	li	a5,20
	beq	a0,a5,.L233
	add	a5,a0,s1
	bgt	a5,s2,.L236
	mv	a2,s1
	mv	a1,s3
	add	a0,s0,a0
	call	memmove
.L233:
	lw	a2,12(sp)
	addi	a1,sp,16
	mv	a0,s0
	call	memcpy
	lw	a0,12(sp)
	add	a0,a0,s1
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	addi	sp,sp,96
	jr	ra
.L236:
	lla	a0,.LC0
	call	caml_failwith
	.size	caml_output_value_to_block, .-caml_output_value_to_block
	.section	.text.caml_output_value_to_buffer,"ax",@progbits
	.align	1
	.globl	caml_output_value_to_buffer
	.type	caml_output_value_to_buffer, @function
caml_output_value_to_buffer:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a6,a0
	mv	a0,a3
	srai	a5,a1,1
	srai	a3,a2,1
	add	a2,a5,a6
	mv	a1,a4
	call	caml_output_value_to_block
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_output_value_to_buffer, .-caml_output_value_to_buffer
	.section	.text.caml_output_value_to_malloc,"ax",@progbits
	.align	1
	.globl	caml_output_value_to_malloc
	.type	caml_output_value_to_malloc, @function
caml_output_value_to_malloc:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	mv	s0,a0
	mv	s2,a1
	mv	s3,a2
	mv	s1,a3
	call	init_extern_output
	addi	a3,sp,12
	addi	a2,sp,16
	mv	a1,s2
	mv	a0,s0
	call	extern_value
	mv	s0,a0
	lw	a0,12(sp)
	add	a0,a0,s0
	call	caml_stat_alloc_noexc
	beq	a0,zero,.L244
	mv	s2,a0
	sd	a0,0(s3)
	lw	a2,12(sp)
	add	s0,a2,s0
	sd	s0,0(s1)
	addi	a1,sp,16
	call	memcpy
	lw	a0,12(sp)
	add	s2,s2,a0
	ld	s0,extern_output_first
	j	.L241
.L244:
	call	extern_out_of_memory
.L242:
	ld	s1,8(s0)
	addi	a1,s0,16
	sub	s1,s1,a1
	mv	a2,s1
	mv	a0,s2
	call	memcpy
	add	s2,s2,s1
	ld	s1,0(s0)
	mv	a0,s0
	call	caml_stat_free
	mv	s0,s1
.L241:
	bne	s0,zero,.L242
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	ld	s2,64(sp)
	ld	s3,56(sp)
	addi	sp,sp,96
	jr	ra
	.size	caml_output_value_to_malloc, .-caml_output_value_to_malloc
	.section	.text.caml_serialize_int_1,"ax",@progbits
	.align	1
	.globl	caml_serialize_int_1
	.type	caml_serialize_int_1, @function
caml_serialize_int_1:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,extern_ptr
	addi	a5,a5,1
	ld	a4,extern_limit
	bgtu	a5,a4,.L248
.L246:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sb	s0,0(a5)
	addi	a5,a5,1
	sd	a5,0(a4)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L248:
	li	a0,1
	call	grow_extern_output
	j	.L246
	.size	caml_serialize_int_1, .-caml_serialize_int_1
	.section	.text.caml_serialize_int_2,"ax",@progbits
	.align	1
	.globl	caml_serialize_int_2
	.type	caml_serialize_int_2, @function
caml_serialize_int_2:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,extern_ptr
	addi	a5,a5,2
	ld	a4,extern_limit
	bgtu	a5,a4,.L252
.L250:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	sraiw	a3,s0,8
	sb	a3,0(a5)
	sb	s0,1(a5)
	addi	a5,a5,2
	sd	a5,0(a4)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L252:
	li	a0,2
	call	grow_extern_output
	j	.L250
	.size	caml_serialize_int_2, .-caml_serialize_int_2
	.section	.text.caml_serialize_int_4,"ax",@progbits
	.align	1
	.globl	caml_serialize_int_4
	.type	caml_serialize_int_4, @function
caml_serialize_int_4:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,extern_ptr
	addi	a5,a5,4
	ld	a4,extern_limit
	bgtu	a5,a4,.L256
.L254:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	srai	a3,s0,24
	sb	a3,0(a5)
	srai	a3,s0,16
	sb	a3,1(a5)
	srai	a3,s0,8
	sb	a3,2(a5)
	sb	s0,3(a5)
	addi	a5,a5,4
	sd	a5,0(a4)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L256:
	li	a0,4
	call	grow_extern_output
	j	.L254
	.size	caml_serialize_int_4, .-caml_serialize_int_4
	.section	.text.caml_serialize_int_8,"ax",@progbits
	.align	1
	.globl	caml_serialize_int_8
	.type	caml_serialize_int_8, @function
caml_serialize_int_8:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	ld	a5,extern_ptr
	addi	a5,a5,8
	ld	a4,extern_limit
	bgtu	a5,a4,.L260
.L258:
	lla	a4,extern_ptr
	ld	a5,0(a4)
	srai	a3,s0,56
	sb	a3,0(a5)
	srai	a3,s0,48
	sb	a3,1(a5)
	srai	a3,s0,40
	sb	a3,2(a5)
	srai	a3,s0,32
	sb	a3,3(a5)
	srai	a3,s0,24
	sb	a3,4(a5)
	srai	a3,s0,16
	sb	a3,5(a5)
	srai	a3,s0,8
	sb	a3,6(a5)
	sb	s0,7(a5)
	addi	a5,a5,8
	sd	a5,0(a4)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L260:
	li	a0,8
	call	grow_extern_output
	j	.L258
	.size	caml_serialize_int_8, .-caml_serialize_int_8
	.section	.text.caml_serialize_block_1,"ax",@progbits
	.align	1
	.globl	caml_serialize_block_1
	.type	caml_serialize_block_1, @function
caml_serialize_block_1:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s2,a0
	mv	s0,a1
	ld	a5,extern_ptr
	add	a5,a5,a1
	ld	a4,extern_limit
	bgtu	a5,a4,.L264
.L262:
	lla	s3,extern_ptr
	ld	s1,0(s3)
	mv	a2,s0
	mv	a1,s2
	mv	a0,s1
	call	memcpy
	add	s0,s1,s0
	sd	s0,0(s3)
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L264:
	mv	a0,a1
	call	grow_extern_output
	j	.L262
	.size	caml_serialize_block_1, .-caml_serialize_block_1
	.section	.text.caml_serialize_block_2,"ax",@progbits
	.align	1
	.globl	caml_serialize_block_2
	.type	caml_serialize_block_2, @function
caml_serialize_block_2:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	slli	a0,a1,1
	ld	a5,extern_ptr
	add	a5,a5,a0
	ld	a4,extern_limit
	bgtu	a5,a4,.L270
.L266:
	ld	a5,extern_ptr
.L267:
	ble	s1,zero,.L271
	lbu	a4,0(s0)
	lbu	a3,1(s0)
	sb	a3,0(a5)
	sb	a4,1(a5)
	addi	s1,s1,-1
	addi	s0,s0,2
	addi	a5,a5,2
	j	.L267
.L270:
	call	grow_extern_output
	j	.L266
.L271:
	sd	a5,extern_ptr,a4
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_serialize_block_2, .-caml_serialize_block_2
	.section	.text.caml_serialize_block_4,"ax",@progbits
	.align	1
	.globl	caml_serialize_block_4
	.type	caml_serialize_block_4, @function
caml_serialize_block_4:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	slli	a0,a1,2
	ld	a5,extern_ptr
	add	a5,a5,a0
	ld	a4,extern_limit
	bgtu	a5,a4,.L277
.L273:
	ld	a5,extern_ptr
.L274:
	ble	s1,zero,.L278
	lbu	a3,0(s0)
	lbu	a4,1(s0)
	lbu	a2,3(s0)
	sb	a2,0(a5)
	lbu	a2,2(s0)
	sb	a2,1(a5)
	sb	a3,3(a5)
	sb	a4,2(a5)
	addi	s1,s1,-1
	addi	s0,s0,4
	addi	a5,a5,4
	j	.L274
.L277:
	call	grow_extern_output
	j	.L273
.L278:
	sd	a5,extern_ptr,a4
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_serialize_block_4, .-caml_serialize_block_4
	.section	.text.caml_serialize_float_4,"ax",@progbits
	.align	1
	.globl	caml_serialize_float_4
	.type	caml_serialize_float_4, @function
caml_serialize_float_4:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsw	fa0,12(sp)
	li	a1,1
	addi	a0,sp,12
	call	caml_serialize_block_4
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_serialize_float_4, .-caml_serialize_float_4
	.section	.text.caml_serialize_block_8,"ax",@progbits
	.align	1
	.globl	caml_serialize_block_8
	.type	caml_serialize_block_8, @function
caml_serialize_block_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	slli	a0,a1,3
	ld	a5,extern_ptr
	add	a5,a5,a0
	ld	a4,extern_limit
	bgtu	a5,a4,.L286
.L282:
	ld	a5,extern_ptr
.L283:
	ble	s1,zero,.L287
	lbu	a3,0(s0)
	lbu	a4,1(s0)
	lbu	a2,7(s0)
	sb	a2,0(a5)
	lbu	a2,6(s0)
	sb	a2,1(a5)
	sb	a3,7(a5)
	sb	a4,6(a5)
	lbu	a3,2(s0)
	lbu	a4,3(s0)
	lbu	a2,5(s0)
	sb	a2,2(a5)
	lbu	a2,4(s0)
	sb	a2,3(a5)
	sb	a3,5(a5)
	sb	a4,4(a5)
	addi	s1,s1,-1
	addi	s0,s0,8
	addi	a5,a5,8
	j	.L283
.L286:
	call	grow_extern_output
	j	.L282
.L287:
	sd	a5,extern_ptr,a4
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_serialize_block_8, .-caml_serialize_block_8
	.section	.text.caml_serialize_block_float_8,"ax",@progbits
	.align	1
	.globl	caml_serialize_block_float_8
	.type	caml_serialize_block_float_8, @function
caml_serialize_block_float_8:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s2,a0
	slli	s0,a1,3
	ld	a5,extern_ptr
	add	a5,a5,s0
	ld	a4,extern_limit
	bgtu	a5,a4,.L291
.L289:
	lla	s3,extern_ptr
	ld	s1,0(s3)
	mv	a2,s0
	mv	a1,s2
	mv	a0,s1
	call	memcpy
	add	s0,s1,s0
	sd	s0,0(s3)
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L291:
	mv	a0,s0
	call	grow_extern_output
	j	.L289
	.size	caml_serialize_block_float_8, .-caml_serialize_block_float_8
	.section	.text.caml_serialize_float_8,"ax",@progbits
	.align	1
	.globl	caml_serialize_float_8
	.type	caml_serialize_float_8, @function
caml_serialize_float_8:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fa0,8(sp)
	li	a1,1
	addi	a0,sp,8
	call	caml_serialize_block_float_8
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_serialize_float_8, .-caml_serialize_float_8
	.globl	caml_extern_allow_out_of_heap
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	-7046029254386353130
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	extern_flag_values, @object
	.size	extern_flag_values, 12
extern_flag_values:
	.word	1
	.word	2
	.word	4
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	pos_table, @object
	.size	pos_table, 48
pos_table:
	.zero	48
	.type	pos_table_present_init, @object
	.size	pos_table_present_init, 32
pos_table_present_init:
	.zero	32
	.type	pos_table_entries_init, @object
	.size	pos_table_entries_init, 4096
pos_table_entries_init:
	.zero	4096
	.type	extern_stack_init, @object
	.size	extern_stack_init, 4096
extern_stack_init:
	.zero	4096
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_extern_allow_out_of_heap, @object
	.size	caml_extern_allow_out_of_heap, 4
caml_extern_allow_out_of_heap:
	.zero	4
	.zero	4
	.type	extern_output_block, @object
	.size	extern_output_block, 8
extern_output_block:
	.zero	8
	.type	extern_output_first, @object
	.size	extern_output_first, 8
extern_output_first:
	.zero	8
	.type	extern_limit, @object
	.size	extern_limit, 8
extern_limit:
	.zero	8
	.type	extern_ptr, @object
	.size	extern_ptr, 8
extern_ptr:
	.zero	8
	.type	extern_userprovided_output, @object
	.size	extern_userprovided_output, 8
extern_userprovided_output:
	.zero	8
	.type	extern_flags, @object
	.size	extern_flags, 4
extern_flags:
	.zero	4
	.zero	4
	.type	size_64, @object
	.size	size_64, 8
size_64:
	.zero	8
	.type	size_32, @object
	.size	size_32, 8
size_32:
	.zero	8
	.type	obj_counter, @object
	.size	obj_counter, 8
obj_counter:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	extern_stack_limit, @object
	.size	extern_stack_limit, 8
extern_stack_limit:
	.dword	extern_stack_init+4096
	.type	extern_stack, @object
	.size	extern_stack, 8
extern_stack:
	.dword	extern_stack_init
	.ident	"GCC: (GNU) 9.2.0"
