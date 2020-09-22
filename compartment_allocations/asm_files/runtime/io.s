	.file	"io.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.unlink_channel,"ax",@progbits
	.align	1
	.type	unlink_channel, @function
unlink_channel:
	ld	a5,48(a0)
	beq	a5,zero,.L4
	ld	a4,40(a0)
	sd	a4,40(a5)
	beq	a4,zero,.L1
	ld	a5,48(a0)
	sd	a5,48(a4)
.L1:
	ret
.L4:
	lla	a4,caml_all_opened_channels
	ld	a5,0(a4)
	ld	a5,40(a5)
	sd	a5,0(a4)
	beq	a5,zero,.L1
	sd	zero,48(a5)
	ret
	.size	unlink_channel, .-unlink_channel
	.section	.text.compare_channel,"ax",@progbits
	.align	1
	.type	compare_channel, @function
compare_channel:
	ld	a4,8(a0)
	ld	a5,8(a1)
	beq	a4,a5,.L7
	bgeu	a4,a5,.L8
	li	a0,-1
	ret
.L7:
	li	a0,0
	ret
.L8:
	li	a0,1
	ret
	.size	compare_channel, .-compare_channel
	.section	.text.hash_channel,"ax",@progbits
	.align	1
	.type	hash_channel, @function
hash_channel:
	ld	a0,8(a0)
	ret
	.size	hash_channel, .-hash_channel
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"[ocaml] channel opened on file '%s' dies without being closed\n"
	.align	3
.LC1:
	.string	"[ocaml] (moreover, it has unflushed data)\n"
	.section	.text.caml_finalize_channel,"ax",@progbits
	.align	1
	.globl	caml_finalize_channel
	.type	caml_finalize_channel, @function
caml_finalize_channel:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	s0,8(a0)
	lw	a5,68(s0)
	andi	a5,a5,4
	beq	a5,zero,.L10
	lw	a5,64(s0)
	addiw	a5,a5,-1
	sext.w	a4,a5
	sw	a5,64(s0)
	bgt	a4,zero,.L10
	ld	a5,caml_channel_mutex_free
	beq	a5,zero,.L12
	mv	a0,s0
	jalr	a5
.L12:
	lw	a4,0(s0)
	li	a5,-1
	beq	a4,a5,.L13
	li	a5,65536
	add	a5,s0,a5
	ld	a5,72(a5)
	beq	a5,zero,.L13
	call	caml_runtime_warnings_active
	bne	a0,zero,.L16
.L13:
	ld	a5,24(s0)
	beq	a5,zero,.L17
.L14:
	mv	a0,s0
	call	unlink_channel
	li	a5,65536
	add	a5,s0,a5
	ld	a0,72(a5)
	call	caml_stat_free
	mv	a0,s0
	call	caml_stat_free
.L10:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L16:
	li	a5,65536
	add	a5,s0,a5
	ld	a2,72(a5)
	lla	a1,.LC0
	ld	a0,stderr
	call	fprintf
	j	.L13
.L17:
	ld	a4,16(s0)
	addi	a5,s0,72
	beq	a4,a5,.L14
	li	a5,65536
	add	s0,s0,a5
	ld	a5,72(s0)
	beq	a5,zero,.L10
	call	caml_runtime_warnings_active
	beq	a0,zero,.L10
	ld	a3,stderr
	li	a2,42
	li	a1,1
	lla	a0,.LC1
	call	fwrite
	j	.L10
	.size	caml_finalize_channel, .-caml_finalize_channel
	.section	.text.caml_open_descriptor_in,"ax",@progbits
	.align	1
	.globl	caml_open_descriptor_in
	.type	caml_open_descriptor_in, @function
caml_open_descriptor_in:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	li	s1,65536
	addi	a0,s1,80
	call	caml_stat_alloc
	mv	s0,a0
	sw	s2,0(a0)
	call	caml_enter_blocking_section
	li	a2,1
	li	a1,0
	mv	a0,s2
	call	lseek
	sw	a0,4(s0)
	call	caml_leave_blocking_section
	addi	a5,s0,72
	sd	a5,24(s0)
	sd	a5,16(s0)
	addi	a5,s1,72
	add	a5,s0,a5
	sd	a5,8(s0)
	sd	zero,32(s0)
	sw	zero,56(s0)
	sw	zero,60(s0)
	sw	zero,64(s0)
	sw	zero,68(s0)
	ld	a5,caml_all_opened_channels
	sd	a5,40(s0)
	sd	zero,48(s0)
	add	s1,s0,s1
	sd	zero,72(s1)
	beq	a5,zero,.L19
	sd	s0,48(a5)
.L19:
	sd	s0,caml_all_opened_channels,a5
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_open_descriptor_in, .-caml_open_descriptor_in
	.section	.text.caml_open_descriptor_out,"ax",@progbits
	.align	1
	.globl	caml_open_descriptor_out
	.type	caml_open_descriptor_out, @function
caml_open_descriptor_out:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_open_descriptor_in
	sd	zero,24(a0)
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_open_descriptor_out, .-caml_open_descriptor_out
	.section	.text.caml_close_channel,"ax",@progbits
	.align	1
	.globl	caml_close_channel
	.type	caml_close_channel, @function
caml_close_channel:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	lw	a0,0(a0)
	call	close
	lw	a5,64(s0)
	bgt	a5,zero,.L23
	ld	a5,caml_channel_mutex_free
	beq	a5,zero,.L25
	mv	a0,s0
	jalr	a5
.L25:
	mv	a0,s0
	call	unlink_channel
	li	a5,65536
	add	a5,s0,a5
	ld	a0,72(a5)
	call	caml_stat_free
	mv	a0,s0
	call	caml_stat_free
.L23:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_close_channel, .-caml_close_channel
	.section	.text.caml_channel_size,"ax",@progbits
	.align	1
	.globl	caml_channel_size
	.type	caml_channel_size, @function
caml_channel_size:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	lw	s1,0(a0)
	lw	s2,4(a0)
	call	caml_enter_blocking_section
	li	a2,2
	li	a1,0
	mv	a0,s1
	call	lseek
	li	a5,-1
	beq	a0,a5,.L28
	mv	s0,a0
	li	a2,0
	mv	a1,s2
	mv	a0,s1
	call	lseek
	bne	a0,s2,.L28
	call	caml_leave_blocking_section
	mv	a0,s0
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L28:
	call	caml_leave_blocking_section
	li	a0,1
	call	caml_sys_error
	.size	caml_channel_size, .-caml_channel_size
	.section	.text.caml_channel_binary_mode,"ax",@progbits
	.align	1
	.globl	caml_channel_binary_mode
	.type	caml_channel_binary_mode, @function
caml_channel_binary_mode:
	li	a0,1
	ret
	.size	caml_channel_binary_mode, .-caml_channel_binary_mode
	.section	.text.caml_flush_partial,"ax",@progbits
	.align	1
	.globl	caml_flush_partial
	.type	caml_flush_partial, @function
caml_flush_partial:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s0,a0
	ld	s2,16(a0)
	addi	s1,a0,72
	subw	s2,s2,s1
	bgt	s2,zero,.L36
.L33:
	ld	a0,16(s0)
	sub	a0,s1,a0
	seqz	a0,a0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
.L36:
	mv	a3,s2
	mv	a2,s1
	lw	a1,68(a0)
	lw	a0,0(a0)
	call	caml_write_fd
	mv	s3,a0
	lw	a5,4(s0)
	addw	a5,a5,a0
	sw	a5,4(s0)
	bgt	s2,a0,.L37
.L34:
	ld	a0,16(s0)
	sub	s3,a0,s3
	sd	s3,16(s0)
	j	.L33
.L37:
	subw	a2,s2,a0
	add	a1,s1,a0
	mv	a0,s1
	call	memmove
	j	.L34
	.size	caml_flush_partial, .-caml_flush_partial
	.section	.text.caml_flush,"ax",@progbits
	.align	1
	.globl	caml_flush
	.type	caml_flush, @function
caml_flush:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
.L39:
	mv	a0,s0
	call	caml_flush_partial
	beq	a0,zero,.L39
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_flush, .-caml_flush
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"output_binary_int: not a binary channel"
	.section	.text.caml_putword,"ax",@progbits
	.align	1
	.globl	caml_putword
	.type	caml_putword, @function
caml_putword:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	mv	s1,a1
	call	caml_channel_binary_mode
	beq	a0,zero,.L48
	ld	a4,16(s0)
	ld	a5,8(s0)
	bgeu	a4,a5,.L49
.L43:
	srliw	a5,s1,24
	ld	a4,16(s0)
	addi	a3,a4,1
	sd	a3,16(s0)
	sb	a5,0(a4)
	ld	a4,16(s0)
	ld	a5,8(s0)
	bgeu	a4,a5,.L50
.L44:
	srliw	a5,s1,16
	ld	a4,16(s0)
	addi	a3,a4,1
	sd	a3,16(s0)
	sb	a5,0(a4)
	ld	a4,16(s0)
	ld	a5,8(s0)
	bgeu	a4,a5,.L51
.L45:
	srliw	a5,s1,8
	ld	a4,16(s0)
	addi	a3,a4,1
	sd	a3,16(s0)
	sb	a5,0(a4)
	ld	a4,16(s0)
	ld	a5,8(s0)
	bgeu	a4,a5,.L52
.L46:
	ld	a5,16(s0)
	addi	a4,a5,1
	sd	a4,16(s0)
	sb	s1,0(a5)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L48:
	lla	a0,.LC2
	call	caml_failwith
.L49:
	mv	a0,s0
	call	caml_flush_partial
	j	.L43
.L50:
	mv	a0,s0
	call	caml_flush_partial
	j	.L44
.L51:
	mv	a0,s0
	call	caml_flush_partial
	j	.L45
.L52:
	mv	a0,s0
	call	caml_flush_partial
	j	.L46
	.size	caml_putword, .-caml_putword
	.section	.text.caml_putblock,"ax",@progbits
	.align	1
	.globl	caml_putblock
	.type	caml_putblock, @function
caml_putblock:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s1,a0
	li	a5,-2147483648
	xori	a5,a5,-2
	bgt	a2,a5,.L58
	sext.w	s0,a2
.L54:
	ld	s2,8(s1)
	ld	a0,16(s1)
	subw	s2,s2,a0
	bge	s0,s2,.L55
	mv	a2,s0
	call	memmove
	ld	a5,16(s1)
	add	a5,a5,s0
	sd	a5,16(s1)
.L56:
	mv	a0,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L58:
	li	s0,-2147483648
	xori	s0,s0,-1
	j	.L54
.L55:
	mv	a2,s2
	call	memmove
	ld	s3,8(s1)
	addi	s4,s1,72
	subw	s3,s3,s4
	mv	a3,s3
	mv	a2,s4
	lw	a1,68(s1)
	lw	a0,0(s1)
	call	caml_write_fd
	mv	s0,a0
	bgt	s3,a0,.L60
.L57:
	lw	a5,4(s1)
	addw	a5,a5,s0
	sw	a5,4(s1)
	ld	a0,8(s1)
	sub	s0,a0,s0
	sd	s0,16(s1)
	mv	s0,s2
	j	.L56
.L60:
	subw	a2,s3,a0
	add	a1,s4,a0
	mv	a0,s4
	call	memmove
	j	.L57
	.size	caml_putblock, .-caml_putblock
	.section	.text.caml_really_putblock,"ax",@progbits
	.align	1
	.globl	caml_really_putblock
	.type	caml_really_putblock, @function
caml_really_putblock:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s0,a2
.L62:
	ble	s0,zero,.L65
	mv	a2,s0
	mv	a1,s1
	mv	a0,s2
	call	caml_putblock
	add	s1,s1,a0
	sub	s0,s0,a0
	j	.L62
.L65:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_really_putblock, .-caml_really_putblock
	.section	.text.caml_seek_out,"ax",@progbits
	.align	1
	.globl	caml_seek_out
	.type	caml_seek_out, @function
caml_seek_out:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a0
	mv	s0,a1
	call	caml_flush
	call	caml_enter_blocking_section
	li	a2,0
	mv	a1,s0
	lw	a0,0(s1)
	call	lseek
	bne	a0,s0,.L69
	call	caml_leave_blocking_section
	sw	s0,4(s1)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L69:
	call	caml_leave_blocking_section
	li	a0,1
	call	caml_sys_error
	.size	caml_seek_out, .-caml_seek_out
	.section	.text.caml_pos_out,"ax",@progbits
	.align	1
	.globl	caml_pos_out
	.type	caml_pos_out, @function
caml_pos_out:
	lw	a4,4(a0)
	ld	a5,16(a0)
	addi	a0,a0,72
	subw	a0,a5,a0
	addw	a0,a4,a0
	ret
	.size	caml_pos_out, .-caml_pos_out
	.section	.text.caml_do_read,"ax",@progbits
	.align	1
	.globl	caml_do_read
	.type	caml_do_read, @function
caml_do_read:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a3,a2
	mv	a2,a1
	li	a1,0
	call	caml_read_fd
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_do_read, .-caml_do_read
	.section	.text.caml_refill,"ax",@progbits
	.align	1
	.globl	caml_refill
	.type	caml_refill, @function
caml_refill:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s0,a0
	addi	s1,a0,72
	ld	a3,8(a0)
	subw	a3,a3,s1
	mv	a2,s1
	lw	a1,68(a0)
	lw	a0,0(a0)
	call	caml_read_fd
	beq	a0,zero,.L76
	lw	a5,4(s0)
	addw	a5,a5,a0
	sw	a5,4(s0)
	add	a0,s1,a0
	sd	a0,24(s0)
	addi	a5,s0,73
	sd	a5,16(s0)
	lbu	a0,72(s0)
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L76:
	call	caml_raise_end_of_file
	.size	caml_refill, .-caml_refill
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"input_binary_int: not a binary channel"
	.section	.text.caml_getword,"ax",@progbits
	.align	1
	.globl	caml_getword
	.type	caml_getword, @function
caml_getword:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	call	caml_channel_binary_mode
	beq	a0,zero,.L84
	li	a0,0
	li	s2,0
	j	.L78
.L84:
	lla	a0,.LC3
	call	caml_failwith
.L86:
	mv	a0,s1
	call	caml_refill
	sext.w	a0,a0
.L80:
	addw	a0,s0,a0
	addiw	s2,s2,1
.L78:
	li	a5,3
	bgt	s2,a5,.L85
	slliw	s0,a0,8
	ld	a5,16(s1)
	ld	a4,24(s1)
	bgeu	a5,a4,.L86
	addi	a4,a5,1
	sd	a4,16(s1)
	lbu	a0,0(a5)
	j	.L80
.L85:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_getword, .-caml_getword
	.section	.text.caml_getblock,"ax",@progbits
	.align	1
	.globl	caml_getblock
	.type	caml_getblock, @function
caml_getblock:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s1,a0
	mv	s4,a1
	li	a5,-2147483648
	xori	a5,a5,-2
	bgt	a2,a5,.L93
	sext.w	s2,a2
.L88:
	ld	s0,24(s1)
	ld	a1,16(s1)
	subw	s0,s0,a1
	ble	s2,s0,.L95
	ble	s0,zero,.L91
	mv	a2,s0
	mv	a0,s4
	call	memmove
	ld	a5,16(s1)
	add	a5,a5,s0
	sd	a5,16(s1)
.L90:
	mv	a0,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
.L93:
	li	s2,-2147483648
	xori	s2,s2,-1
	j	.L88
.L95:
	mv	a2,s2
	mv	a0,s4
	call	memmove
	ld	a5,16(s1)
	add	a5,a5,s2
	sd	a5,16(s1)
	mv	s0,s2
	j	.L90
.L91:
	addi	s3,s1,72
	ld	a3,8(s1)
	subw	a3,a3,s3
	mv	a2,s3
	lw	a1,68(s1)
	lw	a0,0(s1)
	call	caml_read_fd
	mv	s0,a0
	lw	a5,4(s1)
	addw	a5,a5,a0
	sw	a5,4(s1)
	add	a5,s3,a0
	sd	a5,24(s1)
	bgt	s2,a0,.L92
	mv	s0,s2
.L92:
	mv	a2,s0
	mv	a1,s3
	mv	a0,s4
	call	memmove
	add	s3,s3,s0
	sd	s3,16(s1)
	j	.L90
	.size	caml_getblock, .-caml_getblock
	.section	.text.caml_really_getblock,"ax",@progbits
	.align	1
	.globl	caml_really_getblock
	.type	caml_really_getblock, @function
caml_really_getblock:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s3,a2
	mv	s0,a2
.L97:
	ble	s0,zero,.L98
	mv	a2,s0
	mv	a1,s1
	mv	a0,s2
	call	caml_getblock
	beq	a0,zero,.L98
	add	s1,s1,a0
	sub	s0,s0,a0
	j	.L97
.L98:
	sub	a0,s3,s0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_really_getblock, .-caml_really_getblock
	.section	.text.caml_seek_in,"ax",@progbits
	.align	1
	.globl	caml_seek_in
	.type	caml_seek_in, @function
caml_seek_in:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s1,a1
	lw	a1,4(a0)
	ld	a4,24(a0)
	addi	s2,a0,72
	sub	a5,a4,s2
	sub	a5,a1,a5
	blt	s1,a5,.L102
	blt	a1,s1,.L102
	subw	a1,a1,s1
	sub	a1,a4,a1
	sd	a1,16(a0)
	j	.L101
.L102:
	call	caml_enter_blocking_section
	li	a2,0
	mv	a1,s1
	lw	a0,0(s0)
	call	lseek
	bne	a0,s1,.L106
	call	caml_leave_blocking_section
	sw	s1,4(s0)
	sd	s2,24(s0)
	sd	s2,16(s0)
.L101:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L106:
	call	caml_leave_blocking_section
	li	a0,1
	call	caml_sys_error
	.size	caml_seek_in, .-caml_seek_in
	.section	.text.caml_pos_in,"ax",@progbits
	.align	1
	.globl	caml_pos_in
	.type	caml_pos_in, @function
caml_pos_in:
	lw	a4,4(a0)
	ld	a5,24(a0)
	ld	a0,16(a0)
	subw	a0,a5,a0
	subw	a0,a4,a0
	ret
	.size	caml_pos_in, .-caml_pos_in
	.section	.text.caml_input_scan_line,"ax",@progbits
	.align	1
	.globl	caml_input_scan_line
	.type	caml_input_scan_line, @function
caml_input_scan_line:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s0,a0
	ld	s1,16(a0)
	j	.L114
.L118:
	sub	a2,s2,s4
	mv	a1,s4
	mv	a0,s3
	call	memmove
	subw	s3,s4,s3
	sub	s4,s4,s3
	sd	s4,16(s0)
	sub	s2,s2,s3
	sd	s2,24(s0)
	sub	s1,s1,s3
	j	.L110
.L119:
	ld	a0,16(s0)
	sub	a0,a0,a2
	j	.L108
.L120:
	ld	s1,24(s0)
	ld	a0,16(s0)
	sub	a0,a0,s1
	j	.L108
.L115:
	mv	a5,s1
.L109:
	addi	s1,a5,1
	lbu	a4,0(a5)
	li	a5,10
	beq	a4,a5,.L117
.L114:
	ld	s2,24(s0)
	bgtu	s2,s1,.L115
	ld	s4,16(s0)
	addi	s3,s0,72
	bgtu	s4,s3,.L118
.L110:
	ld	a2,24(s0)
	ld	a3,8(s0)
	bgeu	a2,a3,.L119
	subw	a3,a3,a2
	lw	a1,68(s0)
	lw	a0,0(s0)
	call	caml_read_fd
	beq	a0,zero,.L120
	lw	a5,4(s0)
	addw	a5,a5,a0
	sw	a5,4(s0)
	ld	a5,24(s0)
	add	a0,a5,a0
	sd	a0,24(s0)
	mv	a5,s1
	j	.L109
.L117:
	ld	a0,16(s0)
	sub	a0,s1,a0
.L108:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_input_scan_line, .-caml_input_scan_line
	.section	.text.caml_alloc_channel,"ax",@progbits
	.align	1
	.globl	caml_alloc_channel
	.type	caml_alloc_channel, @function
caml_alloc_channel:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	lw	a5,64(a0)
	addiw	a5,a5,1
	sw	a5,64(a0)
	li	a2,65536
	addi	a2,a2,80
	li	a1,8
	lla	a0,.LANCHOR0
	call	caml_alloc_custom_mem
	sd	s0,8(a0)
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_alloc_channel, .-caml_alloc_channel
	.section	.text.caml_ml_open_descriptor_in,"ax",@progbits
	.align	1
	.globl	caml_ml_open_descriptor_in
	.type	caml_ml_open_descriptor_in, @function
caml_ml_open_descriptor_in:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	sext.w	a0,a0
	call	caml_open_descriptor_in
	lw	a4,68(a0)
	ori	a4,a4,4
	sw	a4,68(a0)
	call	caml_alloc_channel
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_open_descriptor_in, .-caml_ml_open_descriptor_in
	.section	.text.caml_ml_open_descriptor_out,"ax",@progbits
	.align	1
	.globl	caml_ml_open_descriptor_out
	.type	caml_ml_open_descriptor_out, @function
caml_ml_open_descriptor_out:
	addi	sp,sp,-16
	sd	ra,8(sp)
	srai	a0,a0,1
	sext.w	a0,a0
	call	caml_open_descriptor_out
	lw	a4,68(a0)
	ori	a4,a4,4
	sw	a4,68(a0)
	call	caml_alloc_channel
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_open_descriptor_out, .-caml_ml_open_descriptor_out
	.section	.text.caml_ml_set_channel_name,"ax",@progbits
	.align	1
	.globl	caml_ml_set_channel_name
	.type	caml_ml_set_channel_name, @function
caml_ml_set_channel_name:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	mv	s1,a1
	ld	s0,8(a0)
	li	a5,65536
	add	a5,s0,a5
	ld	a0,72(a5)
	call	caml_stat_free
	mv	a0,s1
	call	caml_string_length
	bne	a0,zero,.L131
	li	a5,65536
	add	s0,s0,a5
	sd	zero,72(s0)
.L129:
	li	a0,1
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	addi	sp,sp,32
	jr	ra
.L131:
	mv	a0,s1
	call	caml_stat_strdup
	li	a5,65536
	add	s0,s0,a5
	sd	a0,72(s0)
	j	.L129
	.size	caml_ml_set_channel_name, .-caml_ml_set_channel_name
	.section	.text.caml_ml_out_channels_list,"ax",@progbits
	.align	1
	.globl	caml_ml_out_channels_list
	.type	caml_ml_out_channels_list, @function
caml_ml_out_channels_list:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	li	a5,1
	sd	a5,88(sp)
	sd	a5,80(sp)
	sd	a5,72(sp)
	sd	s1,8(sp)
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
	ld	s0,caml_all_opened_channels
	j	.L133
.L134:
	ld	s0,40(s0)
.L133:
	beq	s0,zero,.L137
	ld	a5,24(s0)
	bne	a5,zero,.L134
	mv	a0,s0
	call	caml_alloc_channel
	sd	a0,72(sp)
	ld	a5,88(sp)
	sd	a5,80(sp)
	li	a1,0
	li	a0,2
	call	caml_alloc_small
	sd	a0,88(sp)
	ld	a5,72(sp)
	sd	a5,0(a0)
	ld	a4,80(sp)
	ld	a5,88(sp)
	sd	a4,8(a5)
	j	.L134
.L137:
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,88(sp)
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	addi	sp,sp,128
	jr	ra
	.size	caml_ml_out_channels_list, .-caml_ml_out_channels_list
	.section	.text.caml_channel_descriptor,"ax",@progbits
	.align	1
	.globl	caml_channel_descriptor
	.type	caml_channel_descriptor, @function
caml_channel_descriptor:
	ld	a5,8(a0)
	lw	a0,0(a5)
	li	a5,-1
	beq	a0,a5,.L143
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L143:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a5,1
	sw	a5,errno,a4
	li	a0,1
	call	caml_sys_error
	.size	caml_channel_descriptor, .-caml_channel_descriptor
	.section	.text.caml_ml_close_channel,"ax",@progbits
	.align	1
	.globl	caml_ml_close_channel
	.type	caml_ml_close_channel, @function
caml_ml_close_channel:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	ld	a5,8(a0)
	lw	a4,0(a5)
	li	a3,-1
	beq	a4,a3,.L147
	sw	a3,0(a5)
	mv	s0,a4
	li	a3,1
.L145:
	ld	a4,8(a5)
	sd	a4,24(a5)
	sd	a4,16(a5)
	bne	a3,zero,.L149
.L146:
	li	a0,1
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L147:
	li	s0,0
	li	a3,0
	j	.L145
.L149:
	call	caml_enter_blocking_section
	mv	a0,s0
	call	close
	mv	s0,a0
	call	caml_leave_blocking_section
	li	a5,-1
	bne	s0,a5,.L146
	li	a0,1
	call	caml_sys_error
	.size	caml_ml_close_channel, .-caml_ml_close_channel
	.section	.text.caml_ml_channel_size,"ax",@progbits
	.align	1
	.globl	caml_ml_channel_size
	.type	caml_ml_channel_size, @function
caml_ml_channel_size:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_channel_size
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_channel_size, .-caml_ml_channel_size
	.section	.text.caml_ml_channel_size_64,"ax",@progbits
	.align	1
	.globl	caml_ml_channel_size_64
	.type	caml_ml_channel_size_64, @function
caml_ml_channel_size_64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_channel_size
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_channel_size_64, .-caml_ml_channel_size_64
	.section	.text.caml_ml_set_binary_mode,"ax",@progbits
	.align	1
	.globl	caml_ml_set_binary_mode
	.type	caml_ml_set_binary_mode, @function
caml_ml_set_binary_mode:
	li	a0,1
	ret
	.size	caml_ml_set_binary_mode, .-caml_ml_set_binary_mode
	.section	.text.caml_ml_flush_partial,"ax",@progbits
	.align	1
	.globl	caml_ml_flush_partial
	.type	caml_ml_flush_partial, @function
caml_ml_flush_partial:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a4,1
	sd	a4,32(sp)
	sd	a4,24(sp)
	addi	a4,sp,8
	sd	a4,40(sp)
	ld	s0,8(a0)
	lw	a3,0(s0)
	li	a4,-1
	beq	a3,a4,.L163
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L158
	mv	a0,s0
	jalr	a5
.L158:
	mv	a0,s0
	call	caml_flush_partial
	mv	s1,a0
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L159
	mv	a0,s0
	jalr	a5
.L159:
	beq	s1,zero,.L161
	li	a0,3
.L160:
	ld	a5,Caml_state
	sd	s2,280(a5)
.L155:
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L163:
	sd	s2,280(a5)
	li	a0,3
	j	.L155
.L161:
	li	a0,1
	j	.L160
	.size	caml_ml_flush_partial, .-caml_ml_flush_partial
	.section	.text.caml_ml_flush,"ax",@progbits
	.align	1
	.globl	caml_ml_flush
	.type	caml_ml_flush, @function
caml_ml_flush:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a4,1
	sd	a4,32(sp)
	sd	a4,24(sp)
	addi	a4,sp,8
	sd	a4,40(sp)
	ld	s0,8(a0)
	lw	a3,0(s0)
	li	a4,-1
	beq	a3,a4,.L170
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L167
	mv	a0,s0
	jalr	a5
.L167:
	mv	a0,s0
	call	caml_flush
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L168
	mv	a0,s0
	jalr	a5
.L168:
	ld	a5,Caml_state
	sd	s1,280(a5)
.L166:
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
.L170:
	sd	s1,280(a5)
	j	.L166
	.size	caml_ml_flush, .-caml_ml_flush
	.section	.text.caml_ml_output_char,"ax",@progbits
	.align	1
	.globl	caml_ml_output_char
	.type	caml_ml_output_char, @function
caml_ml_output_char:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L172
	mv	a0,s0
	jalr	a5
.L172:
	ld	a4,16(s0)
	ld	a5,8(s0)
	bgeu	a4,a5,.L176
.L173:
	ld	a5,0(sp)
	srai	a5,a5,1
	ld	a4,16(s0)
	addi	a3,a4,1
	sd	a3,16(s0)
	sb	a5,0(a4)
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L174
	mv	a0,s0
	jalr	a5
.L174:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
.L176:
	mv	a0,s0
	call	caml_flush_partial
	j	.L173
	.size	caml_ml_output_char, .-caml_ml_output_char
	.section	.text.caml_ml_output_int,"ax",@progbits
	.align	1
	.globl	caml_ml_output_int
	.type	caml_ml_output_int, @function
caml_ml_output_int:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L178
	mv	a0,s0
	jalr	a5
.L178:
	ld	a1,0(sp)
	srai	a1,a1,1
	sext.w	a1,a1
	mv	a0,s0
	call	caml_putword
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L179
	mv	a0,s0
	jalr	a5
.L179:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_output_int, .-caml_ml_output_int
	.section	.text.caml_ml_output_partial,"ax",@progbits
	.align	1
	.globl	caml_ml_output_partial
	.type	caml_ml_output_partial, @function
caml_ml_output_partial:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	sd	a3,0(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,4
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	sd	sp,80(sp)
	ld	s1,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L182
	mv	a0,s1
	jalr	a5
.L182:
	ld	a5,8(sp)
	srai	a5,a5,1
	ld	a2,0(sp)
	srai	a2,a2,1
	ld	a1,16(sp)
	add	a1,a5,a1
	mv	a0,s1
	call	caml_putblock
	mv	s0,a0
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L183
	mv	a0,s1
	jalr	a5
.L183:
	slli	a0,s0,1
	ld	a5,Caml_state
	sd	s2,280(a5)
	addi	a0,a0,1
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	addi	sp,sp,128
	jr	ra
	.size	caml_ml_output_partial, .-caml_ml_output_partial
	.section	.text.caml_ml_output_bytes,"ax",@progbits
	.align	1
	.globl	caml_ml_output_bytes
	.type	caml_ml_output_bytes, @function
caml_ml_output_bytes:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	sd	a3,0(sp)
	ld	a5,Caml_state
	ld	s3,280(a5)
	sd	s3,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,4
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	sd	sp,80(sp)
	ld	s2,8(a0)
	srai	s1,a2,1
	srai	s0,a3,1
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L187
	mv	a0,s2
	jalr	a5
.L187:
	ble	s0,zero,.L191
	mv	a2,s0
	ld	a1,16(sp)
	add	a1,s1,a1
	mv	a0,s2
	call	caml_putblock
	add	s1,s1,a0
	sub	s0,s0,a0
	j	.L187
.L191:
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L189
	mv	a0,s2
	jalr	a5
.L189:
	ld	a5,Caml_state
	sd	s3,280(a5)
	li	a0,1
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_ml_output_bytes, .-caml_ml_output_bytes
	.section	.text.caml_ml_output,"ax",@progbits
	.align	1
	.globl	caml_ml_output
	.type	caml_ml_output, @function
caml_ml_output:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_ml_output_bytes
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_output, .-caml_ml_output
	.section	.text.caml_ml_seek_out,"ax",@progbits
	.align	1
	.globl	caml_ml_seek_out
	.type	caml_ml_seek_out, @function
caml_ml_seek_out:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L195
	mv	a0,s0
	jalr	a5
.L195:
	ld	a1,0(sp)
	srai	a1,a1,1
	sext.w	a1,a1
	mv	a0,s0
	call	caml_seek_out
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L196
	mv	a0,s0
	jalr	a5
.L196:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_seek_out, .-caml_ml_seek_out
	.section	.text.caml_ml_seek_out_64,"ax",@progbits
	.align	1
	.globl	caml_ml_seek_out_64
	.type	caml_ml_seek_out_64, @function
caml_ml_seek_out_64:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L199
	mv	a0,s0
	jalr	a5
.L199:
	ld	a5,0(sp)
	lw	a1,8(a5)
	mv	a0,s0
	call	caml_seek_out
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L200
	mv	a0,s0
	jalr	a5
.L200:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_seek_out_64, .-caml_ml_seek_out_64
	.section	.text.caml_ml_pos_out,"ax",@progbits
	.align	1
	.globl	caml_ml_pos_out
	.type	caml_ml_pos_out, @function
caml_ml_pos_out:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_pos_out
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_pos_out, .-caml_ml_pos_out
	.section	.text.caml_ml_pos_out_64,"ax",@progbits
	.align	1
	.globl	caml_ml_pos_out_64
	.type	caml_ml_pos_out_64, @function
caml_ml_pos_out_64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_pos_out
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_pos_out_64, .-caml_ml_pos_out_64
	.section	.text.caml_ml_input_char,"ax",@progbits
	.align	1
	.globl	caml_ml_input_char
	.type	caml_ml_input_char, @function
caml_ml_input_char:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L207
	mv	a0,s0
	jalr	a5
.L207:
	ld	a5,16(s0)
	ld	a4,24(s0)
	bgeu	a5,a4,.L212
	addi	a4,a5,1
	sd	a4,16(s0)
	lbu	s1,0(a5)
.L209:
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L210
	mv	a0,s0
	jalr	a5
.L210:
	slli	a0,s1,1
	ld	a5,Caml_state
	sd	s2,280(a5)
	addi	a0,a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
.L212:
	mv	a0,s0
	call	caml_refill
	mv	s1,a0
	j	.L209
	.size	caml_ml_input_char, .-caml_ml_input_char
	.section	.text.caml_ml_input_int,"ax",@progbits
	.align	1
	.globl	caml_ml_input_int
	.type	caml_ml_input_int, @function
caml_ml_input_int:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	ld	s1,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L214
	mv	a0,s1
	jalr	a5
.L214:
	mv	a0,s1
	call	caml_getword
	slli	s0,a0,32
	srli	s0,s0,32
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L215
	mv	a0,s1
	jalr	a5
.L215:
	sext.w	a0,s0
	slli	a0,a0,1
	ld	a5,Caml_state
	sd	s2,280(a5)
	addi	a0,a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_input_int, .-caml_ml_input_int
	.section	.text.caml_ml_input,"ax",@progbits
	.align	1
	.globl	caml_ml_input
	.type	caml_ml_input, @function
caml_ml_input:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	sd	a3,0(sp)
	ld	a5,Caml_state
	ld	s3,280(a5)
	sd	s3,32(sp)
	addi	a4,sp,32
	sd	a4,280(a5)
	li	a5,1
	sd	a5,48(sp)
	li	a5,4
	sd	a5,40(sp)
	addi	a5,sp,24
	sd	a5,56(sp)
	addi	a5,sp,16
	sd	a5,64(sp)
	addi	a5,sp,8
	sd	a5,72(sp)
	sd	sp,80(sp)
	ld	s2,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L218
	mv	a0,s2
	jalr	a5
.L218:
	ld	a0,8(sp)
	srai	s5,a0,1
	ld	s1,0(sp)
	srai	s1,s1,1
	li	a5,-2147483648
	xori	a5,a5,-2
	bgt	s1,a5,.L225
	sext.w	s1,s1
.L219:
	ld	s0,24(s2)
	ld	a1,16(s2)
	subw	s0,s0,a1
	ble	s1,s0,.L227
	ble	s0,zero,.L222
	mv	a2,s0
	ld	a0,16(sp)
	add	a0,s5,a0
	call	memmove
	ld	a5,16(s2)
	add	a5,a5,s0
	sd	a5,16(s2)
.L221:
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L224
	mv	a0,s2
	jalr	a5
.L224:
	slli	a0,s0,1
	ld	a5,Caml_state
	sd	s3,280(a5)
	addi	a0,a0,1
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	ld	s3,120(sp)
	ld	s4,112(sp)
	ld	s5,104(sp)
	addi	sp,sp,160
	jr	ra
.L225:
	li	s1,-2147483648
	xori	s1,s1,-1
	j	.L219
.L227:
	mv	a2,s1
	ld	a0,16(sp)
	add	a0,s5,a0
	call	memmove
	ld	a5,16(s2)
	add	a5,a5,s1
	sd	a5,16(s2)
	mv	s0,s1
	j	.L221
.L222:
	addi	s4,s2,72
	ld	a3,8(s2)
	subw	a3,a3,s4
	mv	a2,s4
	lw	a1,68(s2)
	lw	a0,0(s2)
	call	caml_read_fd
	mv	s0,a0
	lw	a5,4(s2)
	addw	a5,a5,a0
	sw	a5,4(s2)
	add	a5,s4,a0
	sd	a5,24(s2)
	bgt	s1,a0,.L223
	mv	s0,s1
.L223:
	mv	a2,s0
	mv	a1,s4
	ld	a0,16(sp)
	add	a0,s5,a0
	call	memmove
	add	s4,s4,s0
	sd	s4,16(s2)
	j	.L221
	.size	caml_ml_input, .-caml_ml_input
	.section	.text.caml_ml_seek_in,"ax",@progbits
	.align	1
	.globl	caml_ml_seek_in
	.type	caml_ml_seek_in, @function
caml_ml_seek_in:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L229
	mv	a0,s0
	jalr	a5
.L229:
	ld	a1,0(sp)
	srai	a1,a1,1
	sext.w	a1,a1
	mv	a0,s0
	call	caml_seek_in
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L230
	mv	a0,s0
	jalr	a5
.L230:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_seek_in, .-caml_ml_seek_in
	.section	.text.caml_ml_seek_in_64,"ax",@progbits
	.align	1
	.globl	caml_ml_seek_in_64
	.type	caml_ml_seek_in_64, @function
caml_ml_seek_in_64:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s1,280(a5)
	sd	s1,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	ld	s0,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L233
	mv	a0,s0
	jalr	a5
.L233:
	ld	a5,0(sp)
	lw	a1,8(a5)
	mv	a0,s0
	call	caml_seek_in
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L234
	mv	a0,s0
	jalr	a5
.L234:
	ld	a5,Caml_state
	sd	s1,280(a5)
	li	a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_seek_in_64, .-caml_ml_seek_in_64
	.section	.text.caml_ml_pos_in,"ax",@progbits
	.align	1
	.globl	caml_ml_pos_in
	.type	caml_ml_pos_in, @function
caml_ml_pos_in:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_pos_in
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_pos_in, .-caml_ml_pos_in
	.section	.text.caml_ml_pos_in_64,"ax",@progbits
	.align	1
	.globl	caml_ml_pos_in_64
	.type	caml_ml_pos_in_64, @function
caml_ml_pos_in_64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a0,8(a0)
	call	caml_pos_in
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ml_pos_in_64, .-caml_ml_pos_in_64
	.section	.text.caml_ml_input_scan_line,"ax",@progbits
	.align	1
	.globl	caml_ml_input_scan_line
	.type	caml_ml_input_scan_line, @function
caml_ml_input_scan_line:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	a0,8(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	ld	s1,8(a0)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L241
	mv	a0,s1
	jalr	a5
.L241:
	mv	a0,s1
	call	caml_input_scan_line
	mv	s0,a0
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L242
	mv	a0,s1
	jalr	a5
.L242:
	slli	a0,s0,1
	ld	a5,Caml_state
	sd	s2,280(a5)
	addi	a0,a0,1
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	ld	s2,80(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_ml_input_scan_line, .-caml_ml_input_scan_line
	.section	.text.caml_terminfo_rows,"ax",@progbits
	.align	1
	.globl	caml_terminfo_rows
	.type	caml_terminfo_rows, @function
caml_terminfo_rows:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a5,8(a0)
	lw	a0,0(a5)
	call	caml_num_rows_fd
	slli	a0,a0,1
	addi	a0,a0,1
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_terminfo_rows, .-caml_terminfo_rows
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"_chan"
	.globl	caml_all_opened_channels
	.globl	caml_channel_mutex_unlock_exn
	.globl	caml_channel_mutex_unlock
	.globl	caml_channel_mutex_lock
	.globl	caml_channel_mutex_free
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	channel_operations, @object
	.size	channel_operations, 64
channel_operations:
	.dword	.LC4
	.dword	caml_finalize_channel
	.dword	compare_channel
	.dword	hash_channel
	.dword	0
	.dword	0
	.dword	0
	.dword	0
	.section	.sbss,"aw",@nobits
	.align	3
	.type	caml_all_opened_channels, @object
	.size	caml_all_opened_channels, 8
caml_all_opened_channels:
	.zero	8
	.type	caml_channel_mutex_unlock_exn, @object
	.size	caml_channel_mutex_unlock_exn, 8
caml_channel_mutex_unlock_exn:
	.zero	8
	.type	caml_channel_mutex_unlock, @object
	.size	caml_channel_mutex_unlock, 8
caml_channel_mutex_unlock:
	.zero	8
	.type	caml_channel_mutex_lock, @object
	.size	caml_channel_mutex_lock, 8
caml_channel_mutex_lock:
	.zero	8
	.type	caml_channel_mutex_free, @object
	.size	caml_channel_mutex_free, 8
caml_channel_mutex_free:
	.zero	8
	.ident	"GCC: (GNU) 9.2.0"
