	.file	"bigarray.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_ba_finalize,"ax",@progbits
	.align	1
	.globl	caml_ba_finalize
	.type	caml_ba_finalize, @function
caml_ba_finalize:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,a0,8
	ld	a5,16(s0)
	andi	a5,a5,1536
	li	a4,512
	beq	a5,a4,.L5
.L1:
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
.L5:
	ld	a4,24(s0)
	beq	a4,zero,.L6
	ld	a5,0(a4)
	addi	a5,a5,-1
	sd	a5,0(a4)
	bne	a5,zero,.L1
	ld	a5,24(s0)
	ld	a0,8(a5)
	call	free
	ld	a0,24(s0)
	call	free
	j	.L1
.L6:
	ld	a0,8(a0)
	call	free
	j	.L1
	.size	caml_ba_finalize, .-caml_ba_finalize
	.section	.text.caml_ba_hash,"ax",@progbits
	.align	1
	.globl	caml_ba_hash
	.type	caml_ba_hash, @function
caml_ba_hash:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	addi	a3,a0,8
	li	a4,0
	li	s0,1
.L8:
	ld	a5,8(a3)
	bge	a4,a5,.L56
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,0(a5)
	mul	s0,s0,a5
	addiw	a4,a4,1
	j	.L8
.L56:
	lbu	a5,16(a3)
	li	a4,12
	bgtu	a5,a4,.L45
	slli	a5,a5,2
	lla	a4,.L12
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L12:
	.word	.L20-.L12
	.word	.L19-.L12
	.word	.L11-.L12
	.word	.L11-.L12
	.word	.L18-.L12
	.word	.L18-.L12
	.word	.L17-.L12
	.word	.L16-.L12
	.word	.L15-.L12
	.word	.L15-.L12
	.word	.L14-.L12
	.word	.L13-.L12
	.word	.L11-.L12
	.section	.text.caml_ba_hash
.L11:
	ld	s1,8(a0)
	li	a5,256
	ble	s0,a5,.L21
	li	s0,256
.L21:
	li	a0,0
	li	s2,0
	j	.L22
.L23:
	lbu	a5,0(s1)
	lbu	a1,1(s1)
	slliw	a1,a1,8
	or	a5,a5,a1
	lbu	a1,2(s1)
	slliw	a1,a1,16
	or	a5,a5,a1
	lbu	a1,3(s1)
	slliw	a1,a1,24
	or	a1,a5,a1
	call	caml_hash_mix_uint32
	sext.w	a0,a0
	addi	s1,s1,4
.L22:
	addi	s2,s2,4
	ble	s2,s0,.L23
	andi	s0,s0,3
	li	a5,2
	beq	s0,a5,.L47
	li	a5,3
	beq	s0,a5,.L25
	li	a5,1
	bne	s0,a5,.L10
	li	a1,0
	j	.L26
.L25:
	lbu	a1,2(s1)
	slliw	a1,a1,16
.L24:
	lbu	a5,1(s1)
	slliw	a5,a5,8
	or	a1,a1,a5
	sext.w	a1,a1
.L26:
	lbu	a5,0(s1)
	or	a1,a1,a5
	sext.w	a1,a1
	call	caml_hash_mix_uint32
	sext.w	a0,a0
	j	.L10
.L47:
	li	a1,0
	j	.L24
.L18:
	ld	s1,8(a0)
	li	a5,128
	ble	s0,a5,.L27
	li	s0,128
.L27:
	li	a0,0
	li	s2,0
	j	.L28
.L29:
	lhu	a1,0(s1)
	lhu	a5,2(s1)
	slliw	a5,a5,16
	or	a1,a1,a5
	call	caml_hash_mix_uint32
	sext.w	a0,a0
	addi	s1,s1,4
.L28:
	addi	s2,s2,2
	ble	s2,s0,.L29
	andi	s0,s0,1
	beq	s0,zero,.L10
	lhu	a1,0(s1)
	call	caml_hash_mix_uint32
	sext.w	a0,a0
	j	.L10
.L17:
	ld	s2,8(a0)
	li	a5,64
	ble	s0,a5,.L30
	li	s0,64
.L30:
	li	a0,0
	li	s1,0
	j	.L31
.L32:
	lw	a1,0(s2)
	call	caml_hash_mix_uint32
	sext.w	a0,a0
	addi	s1,s1,1
	addi	s2,s2,4
.L31:
	bgt	s0,s1,.L32
	j	.L10
.L15:
	ld	s2,8(a0)
	li	a5,64
	ble	s0,a5,.L33
	li	s0,64
.L33:
	li	a0,0
	li	s1,0
	j	.L34
.L35:
	ld	a1,0(s2)
	call	caml_hash_mix_intnat
	sext.w	a0,a0
	addi	s1,s1,1
	addi	s2,s2,8
.L34:
	bgt	s0,s1,.L35
	j	.L10
.L16:
	ld	s2,8(a0)
	li	a5,32
	ble	s0,a5,.L36
	li	s0,32
.L36:
	li	a0,0
	li	s1,0
	j	.L37
.L38:
	ld	a1,0(s2)
	call	caml_hash_mix_int64
	sext.w	a0,a0
	addi	s1,s1,1
	addi	s2,s2,8
.L37:
	bgt	s0,s1,.L38
	j	.L10
.L14:
	slli	s0,s0,1
.L20:
	ld	s2,8(a0)
	li	a5,64
	ble	s0,a5,.L39
	li	s0,64
.L39:
	li	a0,0
	li	s1,0
	j	.L40
.L41:
	flw	fa0,0(s2)
	call	caml_hash_mix_float
	sext.w	a0,a0
	addi	s1,s1,1
	addi	s2,s2,4
.L40:
	bgt	s0,s1,.L41
.L10:
	slli	a0,a0,32
	srli	a0,a0,32
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L13:
	slli	s0,s0,1
.L19:
	ld	s2,8(a0)
	li	a5,32
	ble	s0,a5,.L42
	li	s0,32
.L42:
	li	a0,0
	li	s1,0
	j	.L43
.L44:
	fld	fa0,0(s2)
	call	caml_hash_mix_double
	sext.w	a0,a0
	addi	s1,s1,1
	addi	s2,s2,8
.L43:
	bgt	s0,s1,.L44
	j	.L10
.L45:
	li	a0,0
	j	.L10
	.size	caml_ba_hash, .-caml_ba_hash
	.section	.text.caml_ba_serialize_longarray,"ax",@progbits
	.align	1
	.type	caml_ba_serialize_longarray, @function
caml_ba_serialize_longarray:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	s0,a1
	mv	a4,a0
	li	a5,0
	j	.L58
.L69:
	addi	a5,a5,1
	addi	a4,a4,8
.L58:
	bge	a5,s0,.L68
	ld	a6,0(a4)
	blt	a6,a2,.L65
	ble	a6,a3,.L69
	li	a5,1
	j	.L59
.L68:
	li	a5,0
.L59:
	beq	a5,zero,.L61
	li	a0,1
	call	caml_serialize_int_1
	mv	a1,s0
	mv	a0,s1
	call	caml_serialize_block_8
.L57:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L65:
	li	a5,1
	j	.L59
.L61:
	li	a0,0
	call	caml_serialize_int_1
	li	s2,0
	j	.L63
.L64:
	lw	a0,0(s1)
	call	caml_serialize_int_4
	addi	s2,s2,1
	addi	s1,s1,8
.L63:
	blt	s2,s0,.L64
	j	.L57
	.size	caml_ba_serialize_longarray, .-caml_ba_serialize_longarray
	.section	.text.caml_ba_serialize,"ax",@progbits
	.align	1
	.globl	caml_ba_serialize
	.type	caml_ba_serialize, @function
caml_ba_serialize:
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
	mv	s3,a2
	addi	s1,a0,8
	lw	a0,16(a0)
	call	caml_serialize_int_4
	ld	a0,16(s1)
	andi	a0,a0,511
	call	caml_serialize_int_4
	li	s0,0
	j	.L71
.L72:
	li	a0,65536
	addi	a0,a0,-1
	call	caml_serialize_int_2
	mv	a0,s5
	call	caml_serialize_int_8
.L73:
	addiw	s0,s0,1
.L71:
	ld	a3,8(s1)
	bge	s0,a3,.L88
	addi	a5,s0,4
	slli	a5,a5,3
	add	a5,s1,a5
	ld	s5,0(a5)
	li	a5,65536
	addi	a5,a5,-2
	bgt	s5,a5,.L72
	sext.w	a0,s5
	call	caml_serialize_int_2
	j	.L73
.L88:
	li	a4,0
	li	a1,1
	j	.L75
.L76:
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a5,0(a5)
	mul	a1,a1,a5
	addiw	a4,a4,1
.L75:
	bgt	a3,a4,.L76
	lbu	a5,16(s1)
	li	a4,12
	bgtu	a5,a4,.L77
	slli	a5,a5,2
	lla	a4,.L79
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L79:
	.word	.L85-.L79
	.word	.L84-.L79
	.word	.L78-.L79
	.word	.L78-.L79
	.word	.L86-.L79
	.word	.L86-.L79
	.word	.L85-.L79
	.word	.L84-.L79
	.word	.L83-.L79
	.word	.L82-.L79
	.word	.L81-.L79
	.word	.L80-.L79
	.word	.L78-.L79
	.section	.text.caml_ba_serialize
.L78:
	ld	a0,8(s2)
	call	caml_serialize_block_1
.L77:
	ld	a5,8(s1)
	addi	a5,a5,4
	slli	a5,a5,2
	sd	a5,0(s4)
	ld	a5,8(s1)
	addi	a5,a5,4
	slli	a5,a5,3
	sd	a5,0(s3)
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
.L86:
	ld	a0,8(s2)
	call	caml_serialize_block_2
	j	.L77
.L85:
	ld	a0,8(s2)
	call	caml_serialize_block_4
	j	.L77
.L81:
	slli	a1,a1,1
	ld	a0,8(s2)
	call	caml_serialize_block_4
	j	.L77
.L84:
	ld	a0,8(s2)
	call	caml_serialize_block_8
	j	.L77
.L80:
	slli	a1,a1,1
	ld	a0,8(s2)
	call	caml_serialize_block_8
	j	.L77
.L83:
	li	a3,1073741824
	addi	a3,a3,-1
	li	a2,-1073741824
	ld	a0,8(s2)
	call	caml_ba_serialize_longarray
	j	.L77
.L82:
	li	a3,-2147483648
	xori	a3,a3,-1
	li	a2,1
	slli	a2,a2,31
	ld	a0,8(s2)
	call	caml_ba_serialize_longarray
	j	.L77
	.size	caml_ba_serialize, .-caml_ba_serialize
	.section	.text.caml_ba_deserialize_longarray,"ax",@progbits
	.align	1
	.type	caml_ba_deserialize_longarray, @function
caml_ba_deserialize_longarray:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s2,a1
	call	caml_deserialize_uint_1
	bne	a0,zero,.L95
	li	s1,0
	j	.L90
.L95:
	mv	a1,s2
	mv	a0,s0
	call	caml_deserialize_block_8
	j	.L89
.L92:
	call	caml_deserialize_sint_4
	sd	a0,0(s0)
	addi	s1,s1,1
	addi	s0,s0,8
.L90:
	blt	s1,s2,.L92
.L89:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ba_deserialize_longarray, .-caml_ba_deserialize_longarray
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"input_value: wrong number of bigarray dimensions"
	.align	3
.LC1:
	.string	"input_value: size overflow for bigarray"
	.align	3
.LC2:
	.string	"input_value: bad bigarray kind"
	.align	3
.LC3:
	.string	"input_value: out of memory for bigarray"
	.section	.text.caml_ba_deserialize,"ax",@progbits
	.align	1
	.globl	caml_ba_deserialize
	.type	caml_ba_deserialize, @function
caml_ba_deserialize:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	call	caml_deserialize_uint_4
	slli	a0,a0,32
	srli	a0,a0,32
	sd	a0,8(s1)
	li	a5,16
	bgtu	a0,a5,.L121
	call	caml_deserialize_uint_4
	sext.w	a5,a0
	ori	a5,a5,512
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,16(s1)
	sd	zero,24(s1)
	li	s0,0
	j	.L98
.L121:
	lla	a0,.LC0
	call	caml_deserialize_error
.L99:
	addi	a5,s0,4
	slli	a5,a5,3
	add	a5,s1,a5
	sd	a0,0(a5)
	addiw	s0,s0,1
.L98:
	ld	a3,8(s1)
	bge	s0,a3,.L122
	call	caml_deserialize_uint_2
	li	a5,65536
	addi	a5,a5,-1
	bne	a0,a5,.L99
	call	caml_deserialize_uint_8
	j	.L99
.L122:
	li	s2,1
	li	a4,0
	j	.L101
.L102:
	mv	s2,a1
	bne	a2,zero,.L123
	addiw	a4,a4,1
.L101:
	ble	a3,a4,.L124
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,s1,a5
	ld	a5,0(a5)
	li	a2,0
	mul	a1,s2,a5
	mulhu	a5,s2,a5
	beq	a5,zero,.L102
	li	a2,1
	j	.L102
.L123:
	lla	a0,.LC1
	call	caml_deserialize_error
.L124:
	lbu	s0,16(s1)
	li	a5,12
	bgt	s0,a5,.L125
	slli	a4,s0,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	a5,0(a5)
	li	a4,0
	mul	a0,s2,a5
	mulhu	a5,s2,a5
	bne	a5,zero,.L126
.L107:
	bne	a4,zero,.L127
	call	malloc
	sd	a0,0(s1)
	beq	a0,zero,.L128
	li	a5,12
	bgtu	s0,a5,.L111
	slli	s0,s0,2
	lla	a4,.L113
	add	s0,s0,a4
	lw	a5,0(s0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L113:
	.word	.L118-.L113
	.word	.L117-.L113
	.word	.L112-.L113
	.word	.L112-.L113
	.word	.L119-.L113
	.word	.L119-.L113
	.word	.L118-.L113
	.word	.L117-.L113
	.word	.L116-.L113
	.word	.L116-.L113
	.word	.L115-.L113
	.word	.L114-.L113
	.word	.L112-.L113
	.section	.text.caml_ba_deserialize
.L125:
	lla	a0,.LC2
	call	caml_deserialize_error
.L126:
	li	a4,1
	j	.L107
.L127:
	lla	a0,.LC1
	call	caml_deserialize_error
.L128:
	lla	a0,.LC3
	call	caml_deserialize_error
.L112:
	mv	a1,s2
	call	caml_deserialize_block_1
.L111:
	ld	a0,8(s1)
	addi	a0,a0,4
	slli	a0,a0,3
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L119:
	mv	a1,s2
	call	caml_deserialize_block_2
	j	.L111
.L118:
	mv	a1,s2
	call	caml_deserialize_block_4
	j	.L111
.L115:
	slli	a1,s2,1
	call	caml_deserialize_block_4
	j	.L111
.L117:
	mv	a1,s2
	call	caml_deserialize_block_8
	j	.L111
.L114:
	slli	a1,s2,1
	call	caml_deserialize_block_8
	j	.L111
.L116:
	mv	a1,s2
	call	caml_ba_deserialize_longarray
	j	.L111
	.size	caml_ba_deserialize, .-caml_ba_deserialize
	.section	.text.caml_ba_offset,"ax",@progbits
	.align	1
	.type	caml_ba_offset, @function
caml_ba_offset:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a2,a0
	ld	a5,16(a0)
	andi	a0,a5,256
	beq	a0,zero,.L138
	lw	a4,8(a2)
	addiw	a4,a4,-1
	li	a0,0
.L135:
	blt	a4,zero,.L129
	slli	a5,a4,3
	add	a5,a1,a5
	ld	a3,0(a5)
	addi	a6,a3,-1
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,a2,a5
	ld	a5,0(a5)
	bgeu	a6,a5,.L141
	mul	a0,a5,a0
	add	a0,a3,a0
	addi	a0,a0,-1
	addiw	a4,a4,-1
	j	.L135
.L142:
	call	caml_array_bound_error
.L138:
	li	a4,0
.L130:
	ld	a5,8(a2)
	bge	a4,a5,.L129
	slli	a5,a4,3
	add	a5,a1,a5
	ld	a3,0(a5)
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,a2,a5
	ld	a5,0(a5)
	bgeu	a3,a5,.L142
	mul	a0,a5,a0
	add	a0,a3,a0
	addiw	a4,a4,1
	j	.L130
.L141:
	call	caml_array_bound_error
.L129:
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_offset, .-caml_ba_offset
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Bigarray.set: wrong number of indices"
	.section	.text.caml_ba_set_aux,"ax",@progbits
	.align	1
	.type	caml_ba_set_aux, @function
caml_ba_set_aux:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	addi	s0,a0,8
	ld	a5,8(s0)
	bne	a5,a2,.L160
	mv	s1,a0
	mv	s2,a3
	li	a4,0
	j	.L144
.L160:
	lla	a0,.LC4
	call	caml_invalid_argument
.L145:
	slli	a5,a4,3
	add	a2,a1,a5
	ld	a2,0(a2)
	srai	a2,a2,1
	addi	a3,sp,128
	add	a5,a3,a5
	sd	a2,-128(a5)
	addiw	a4,a4,1
.L144:
	ld	a5,8(s0)
	blt	a4,a5,.L145
	mv	a1,sp
	mv	a0,s0
	call	caml_ba_offset
	lbu	a5,16(s0)
	li	a4,12
	bgtu	a5,a4,.L146
	slli	a5,a5,2
	lla	a4,.L148
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L148:
	.word	.L146-.L148
	.word	.L156-.L148
	.word	.L147-.L148
	.word	.L147-.L148
	.word	.L155-.L148
	.word	.L155-.L148
	.word	.L154-.L148
	.word	.L153-.L148
	.word	.L152-.L148
	.word	.L151-.L148
	.word	.L150-.L148
	.word	.L149-.L148
	.word	.L147-.L148
	.section	.text.caml_ba_set_aux
.L146:
	ld	a5,8(s1)
	slli	a0,a0,2
	add	a0,a5,a0
	fld	fa5,0(s2)
	fcvt.s.d	fa5,fa5
	fsw	fa5,0(a0)
.L157:
	li	a0,1
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	addi	sp,sp,160
	jr	ra
.L156:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	fld	fa5,0(s2)
	fsd	fa5,0(a0)
	j	.L157
.L147:
	srai	s2,s2,1
	ld	a5,8(s1)
	add	a0,a5,a0
	sb	s2,0(a0)
	j	.L157
.L155:
	srai	s2,s2,1
	ld	a5,8(s1)
	slli	a0,a0,1
	add	a0,a5,a0
	sh	s2,0(a0)
	j	.L157
.L154:
	ld	a5,8(s1)
	slli	a0,a0,2
	add	a0,a5,a0
	lw	a5,8(s2)
	sw	a5,0(a0)
	j	.L157
.L153:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	ld	a5,8(s2)
	sd	a5,0(a0)
	j	.L157
.L151:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	ld	a5,8(s2)
	sd	a5,0(a0)
	j	.L157
.L152:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	srai	s2,s2,1
	sd	s2,0(a0)
	j	.L157
.L150:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	fld	fa5,0(s2)
	fcvt.s.d	fa5,fa5
	fsw	fa5,0(a0)
	fld	fa5,8(s2)
	fcvt.s.d	fa5,fa5
	fsw	fa5,4(a0)
	j	.L157
.L149:
	ld	a5,8(s1)
	slli	a0,a0,4
	add	a0,a5,a0
	fld	fa5,0(s2)
	fsd	fa5,0(a0)
	fld	fa5,8(s2)
	fsd	fa5,8(a0)
	j	.L157
	.size	caml_ba_set_aux, .-caml_ba_set_aux
	.section	.text.copy_two_doubles,"ax",@progbits
	.align	1
	.type	copy_two_doubles, @function
copy_two_doubles:
	addi	sp,sp,-32
	sd	ra,24(sp)
	fsd	fs0,8(sp)
	fsd	fs1,0(sp)
	fmv.d	fs1,fa0
	fmv.d	fs0,fa1
	li	a1,254
	li	a0,2
	call	caml_alloc_small
	fsd	fs1,0(a0)
	fsd	fs0,8(a0)
	ld	ra,24(sp)
	fld	fs0,8(sp)
	fld	fs1,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	copy_two_doubles, .-copy_two_doubles
	.section	.text.caml_ba_num_elts,"ax",@progbits
	.align	1
	.globl	caml_ba_num_elts
	.type	caml_ba_num_elts, @function
caml_ba_num_elts:
	mv	a3,a0
	li	a4,0
	li	a0,1
.L164:
	ld	a5,8(a3)
	bge	a4,a5,.L166
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,a3,a5
	ld	a5,0(a5)
	mul	a0,a0,a5
	addiw	a4,a4,1
	j	.L164
.L166:
	ret
	.size	caml_ba_num_elts, .-caml_ba_num_elts
	.section	.text.caml_ba_compare,"ax",@progbits
	.align	1
	.globl	caml_ba_compare
	.type	caml_ba_compare, @function
caml_ba_compare:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	addi	a3,a0,8
	addi	a2,a1,8
	ld	s2,16(a3)
	andi	a0,s2,511
	ld	a5,16(a2)
	andi	a5,a5,511
	beq	a0,a5,.L168
	subw	a0,a5,a0
.L169:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L168:
	mv	s0,a1
	ld	a0,8(a3)
	ld	a5,8(a2)
	beq	a0,a5,.L209
	subw	a0,a5,a0
	j	.L169
.L238:
	bge	a6,a1,.L210
	li	a0,-1
	j	.L169
.L210:
	li	a0,1
	j	.L169
.L209:
	li	a4,0
.L170:
	ble	a0,a4,.L237
	addi	a5,a4,4
	slli	a5,a5,3
	add	a1,a3,a5
	ld	a6,0(a1)
	add	a5,a2,a5
	ld	a1,0(a5)
	bne	a6,a1,.L238
	addiw	a4,a4,1
	j	.L170
.L237:
	mv	a0,a3
	call	caml_ba_num_elts
	andi	s2,s2,255
	li	a5,12
	bgtu	s2,a5,.L211
	slli	s2,s2,2
	lla	a4,.L175
	add	s2,s2,a4
	lw	a5,0(s2)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L175:
	.word	.L186-.L175
	.word	.L185-.L175
	.word	.L184-.L175
	.word	.L183-.L175
	.word	.L182-.L175
	.word	.L181-.L175
	.word	.L180-.L175
	.word	.L179-.L175
	.word	.L178-.L175
	.word	.L178-.L175
	.word	.L177-.L175
	.word	.L176-.L175
	.word	.L174-.L175
	.section	.text.caml_ba_compare
.L177:
	slli	a0,a0,1
.L186:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
	j	.L187
.L188:
	addi	a3,a3,1
	mv	a5,a4
	mv	a4,a2
.L187:
	bgeu	a3,a0,.L239
	addi	a2,a4,4
	flw	fa5,0(a4)
	addi	a4,a5,4
	flw	fa4,0(a5)
	flt.s	a5,fa5,fa4
	bne	a5,zero,.L212
	fgt.s	a5,fa5,fa4
	bne	a5,zero,.L213
	feq.s	a5,fa5,fa4
	bne	a5,zero,.L188
	ld	a5,Caml_state
	li	a1,1
	sd	a1,256(a5)
	feq.s	a5,fa5,fa5
	bne	a5,zero,.L214
	feq.s	a5,fa4,fa4
	beq	a5,zero,.L188
	li	a0,-1
	j	.L169
.L239:
	li	a0,0
	j	.L169
.L176:
	slli	a0,a0,1
.L185:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
	j	.L190
.L191:
	addi	a3,a3,1
	mv	a5,a4
	mv	a4,a2
.L190:
	bgeu	a3,a0,.L240
	addi	a2,a4,8
	fld	fa5,0(a4)
	addi	a4,a5,8
	fld	fa4,0(a5)
	flt.d	a5,fa5,fa4
	bne	a5,zero,.L216
	fgt.d	a5,fa5,fa4
	bne	a5,zero,.L217
	feq.d	a5,fa5,fa4
	bne	a5,zero,.L191
	ld	a5,Caml_state
	li	a1,1
	sd	a1,256(a5)
	feq.d	a5,fa5,fa5
	bne	a5,zero,.L218
	feq.d	a5,fa4,fa4
	beq	a5,zero,.L191
	li	a0,-1
	j	.L169
.L240:
	li	a0,0
	j	.L169
.L174:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L193:
	bgeu	a3,a0,.L241
	addi	a2,a4,1
	lbu	a4,0(a4)
	addi	a1,a5,1
	lbu	a5,0(a5)
	bltu	a4,a5,.L220
	bgtu	a4,a5,.L221
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L193
.L241:
	li	a0,0
	j	.L169
.L184:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L195:
	bgeu	a3,a0,.L242
	addi	a2,a4,1
	lb	a4,0(a4)
	addi	a1,a5,1
	lb	a5,0(a5)
	blt	a4,a5,.L222
	bgt	a4,a5,.L223
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L195
.L242:
	li	a0,0
	j	.L169
.L183:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L197:
	bgeu	a3,a0,.L243
	addi	a2,a4,1
	lbu	a4,0(a4)
	addi	a1,a5,1
	lbu	a5,0(a5)
	bltu	a4,a5,.L224
	bgtu	a4,a5,.L225
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L197
.L243:
	li	a0,0
	j	.L169
.L182:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L199:
	bgeu	a3,a0,.L244
	addi	a6,a4,2
	lh	a4,0(a4)
	addi	a7,a5,2
	lh	a5,0(a5)
	sext.w	a1,a4
	sext.w	a2,a5
	blt	a1,a2,.L226
	bgt	a1,a2,.L227
	addi	a3,a3,1
	mv	a5,a7
	mv	a4,a6
	j	.L199
.L244:
	li	a0,0
	j	.L169
.L181:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L201:
	bgeu	a3,a0,.L245
	addi	a6,a4,2
	lhu	a4,0(a4)
	addi	a7,a5,2
	lhu	a5,0(a5)
	sext.w	a1,a4
	sext.w	a2,a5
	bltu	a1,a2,.L228
	bgtu	a1,a2,.L229
	addi	a3,a3,1
	mv	a5,a7
	mv	a4,a6
	j	.L201
.L245:
	li	a0,0
	j	.L169
.L180:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L203:
	bgeu	a3,a0,.L246
	addi	a2,a4,4
	lw	a4,0(a4)
	addi	a1,a5,4
	lw	a5,0(a5)
	blt	a4,a5,.L230
	bgt	a4,a5,.L231
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L203
.L246:
	li	a0,0
	j	.L169
.L179:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L205:
	bgeu	a3,a0,.L247
	addi	a2,a4,8
	ld	a4,0(a4)
	addi	a1,a5,8
	ld	a5,0(a5)
	blt	a4,a5,.L232
	bgt	a4,a5,.L233
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L205
.L247:
	li	a0,0
	j	.L169
.L178:
	ld	a4,8(s1)
	ld	a5,8(s0)
	li	a3,0
.L207:
	bgeu	a3,a0,.L248
	addi	a2,a4,8
	ld	a4,0(a4)
	addi	a1,a5,8
	ld	a5,0(a5)
	blt	a4,a5,.L234
	bgt	a4,a5,.L235
	addi	a3,a3,1
	mv	a5,a1
	mv	a4,a2
	j	.L207
.L248:
	li	a0,0
	j	.L169
.L211:
	li	a0,0
	j	.L169
.L212:
	li	a0,-1
	j	.L169
.L213:
	li	a0,1
	j	.L169
.L214:
	li	a0,1
	j	.L169
.L216:
	li	a0,-1
	j	.L169
.L217:
	li	a0,1
	j	.L169
.L218:
	li	a0,1
	j	.L169
.L220:
	li	a0,-1
	j	.L169
.L221:
	li	a0,1
	j	.L169
.L222:
	li	a0,-1
	j	.L169
.L223:
	li	a0,1
	j	.L169
.L224:
	li	a0,-1
	j	.L169
.L225:
	li	a0,1
	j	.L169
.L226:
	li	a0,-1
	j	.L169
.L227:
	li	a0,1
	j	.L169
.L228:
	li	a0,-1
	j	.L169
.L229:
	li	a0,1
	j	.L169
.L230:
	li	a0,-1
	j	.L169
.L231:
	li	a0,1
	j	.L169
.L232:
	li	a0,-1
	j	.L169
.L233:
	li	a0,1
	j	.L169
.L234:
	li	a0,-1
	j	.L169
.L235:
	li	a0,1
	j	.L169
	.size	caml_ba_compare, .-caml_ba_compare
	.section	.text.caml_ba_byte_size,"ax",@progbits
	.align	1
	.globl	caml_ba_byte_size
	.type	caml_ba_byte_size, @function
caml_ba_byte_size:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	mv	s0,a0
	call	caml_ba_num_elts
	lbu	a5,16(s0)
	slli	a4,a5,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	a5,0(a5)
	mul	a0,a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_byte_size, .-caml_ba_byte_size
	.section	.text.caml_ba_update_proxy,"ax",@progbits
	.align	1
	.type	caml_ba_update_proxy, @function
caml_ba_update_proxy:
	ld	a5,16(a0)
	andi	a5,a5,1536
	beq	a5,zero,.L258
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s0,a0
	mv	s1,a1
	ld	a5,24(a0)
	beq	a5,zero,.L253
	sd	a5,24(a1)
	ld	a4,0(a5)
	addi	a4,a4,1
	sd	a4,0(a5)
.L251:
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L253:
	li	a0,24
	call	malloc
	mv	s2,a0
	beq	a0,zero,.L261
	li	a5,2
	sd	a5,0(a0)
	ld	a5,0(s0)
	sd	a5,8(a0)
	ld	a5,16(s0)
	andi	a5,a5,1024
	bne	a5,zero,.L262
	li	a0,0
.L255:
	sd	a0,16(s2)
	sd	s2,24(s0)
	sd	s2,24(s1)
	j	.L251
.L261:
	call	caml_raise_out_of_memory
.L262:
	mv	a0,s0
	call	caml_ba_byte_size
	j	.L255
.L258:
	ret
	.size	caml_ba_update_proxy, .-caml_ba_update_proxy
	.section	.text.caml_ba_alloc,"ax",@progbits
	.align	1
	.globl	caml_ba_alloc
	.type	caml_ba_alloc, @function
caml_ba_alloc:
	addi	sp,sp,-176
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	mv	s1,a0
	mv	s0,a1
	mv	s2,a2
	li	a4,0
.L264:
	bge	a4,s0,.L280
	slli	a5,a4,3
	add	a1,a3,a5
	ld	a1,0(a1)
	addi	a2,sp,128
	add	a5,a2,a5
	sd	a1,-128(a5)
	addiw	a4,a4,1
	j	.L264
.L280:
	beq	s2,zero,.L278
	li	s3,0
.L267:
	addi	a1,s0,4
	mv	a2,s3
	slli	a1,a1,3
	lla	a0,.LANCHOR0+56
	call	caml_alloc_custom_mem
	addi	a1,a0,8
	sd	s2,8(a0)
	sd	s0,8(a1)
	sd	s1,16(a1)
	sd	zero,24(a1)
	li	a4,0
.L276:
	bge	a4,s0,.L281
	slli	a5,a4,3
	addi	a3,sp,128
	add	a5,a3,a5
	ld	a3,-128(a5)
	addi	a5,a4,4
	slli	a5,a5,3
	add	a5,a1,a5
	sd	a3,0(a5)
	addiw	a4,a4,1
	j	.L276
.L268:
	mv	a5,a1
	bne	a2,zero,.L282
	addiw	a4,a4,1
.L266:
	bge	a4,s0,.L283
	slli	a3,a4,3
	addi	a2,sp,128
	add	a3,a2,a3
	ld	a3,-128(a3)
	li	a2,0
	mul	a1,a5,a3
	mulhu	a5,a5,a3
	beq	a5,zero,.L268
	li	a2,1
	j	.L268
.L282:
	call	caml_raise_out_of_memory
.L278:
	li	a5,1
	li	a4,0
	j	.L266
.L283:
	andi	a4,s1,0xff
	slli	a3,a4,2
	lla	a4,.LANCHOR0
	add	a4,a4,a3
	lw	a4,0(a4)
	li	a3,0
	mul	a0,a5,a4
	mulhu	a5,a5,a4
	bne	a5,zero,.L284
.L272:
	mv	s3,a0
	bne	a3,zero,.L285
	call	malloc
	mv	s2,a0
	beq	a0,zero,.L286
.L275:
	ori	s1,s1,512
	j	.L267
.L284:
	li	a3,1
	j	.L272
.L285:
	call	caml_raise_out_of_memory
.L286:
	beq	s3,zero,.L275
	call	caml_raise_out_of_memory
.L281:
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	ld	s3,136(sp)
	addi	sp,sp,176
	jr	ra
	.size	caml_ba_alloc, .-caml_ba_alloc
	.section	.text.caml_ba_alloc_dims,"ax",@progbits
	.align	1
	.globl	caml_ba_alloc_dims
	.type	caml_ba_alloc_dims, @function
caml_ba_alloc_dims:
	addi	sp,sp,-208
	sd	ra,152(sp)
	sd	a3,168(sp)
	sd	a4,176(sp)
	sd	a5,184(sp)
	sd	a6,192(sp)
	sd	a7,200(sp)
	addi	a5,sp,168
	sd	a5,136(sp)
	li	a5,0
.L288:
	bge	a5,a1,.L291
	ld	a4,136(sp)
	addi	a3,a4,8
	sd	a3,136(sp)
	ld	a3,0(a4)
	slli	a4,a5,3
	addi	a6,sp,144
	add	a4,a6,a4
	sd	a3,-136(a4)
	addiw	a5,a5,1
	j	.L288
.L291:
	addi	a3,sp,8
	call	caml_ba_alloc
	ld	ra,152(sp)
	addi	sp,sp,208
	jr	ra
	.size	caml_ba_alloc_dims, .-caml_ba_alloc_dims
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"Bigarray.create: bad number of dimensions"
	.align	3
.LC6:
	.string	"Bigarray.create: negative dimension"
	.section	.text.caml_ba_create,"ax",@progbits
	.align	1
	.globl	caml_ba_create
	.type	caml_ba_create, @function
caml_ba_create:
	addi	sp,sp,-144
	sd	ra,136(sp)
	ld	a6,-8(a2)
	srli	a6,a6,10
	li	a5,16
	bgtu	a6,a5,.L298
	li	a5,0
.L293:
	bgeu	a5,a6,.L299
	slli	a4,a5,3
	add	a4,a4,a2
	ld	a4,0(a4)
	srai	a4,a4,1
	slli	a3,a5,3
	addi	a7,sp,128
	add	a3,a7,a3
	sd	a4,-128(a3)
	blt	a4,zero,.L300
	addiw	a5,a5,1
	j	.L293
.L298:
	lla	a0,.LC5
	call	caml_invalid_argument
.L300:
	lla	a0,.LC6
	call	caml_invalid_argument
.L299:
	srai	a0,a0,1
	sext.w	a0,a0
	srai	a5,a1,1
	slliw	a5,a5,8
	mv	a3,sp
	li	a2,0
	sext.w	a1,a6
	or	a0,a0,a5
	call	caml_ba_alloc
	ld	ra,136(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_ba_create, .-caml_ba_create
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"Bigarray.get: wrong number of indices"
	.section	.text.caml_ba_get_N,"ax",@progbits
	.align	1
	.globl	caml_ba_get_N
	.type	caml_ba_get_N, @function
caml_ba_get_N:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	addi	s0,a0,8
	ld	a5,8(s0)
	bne	a2,a5,.L321
	mv	s1,a0
	li	a4,0
	j	.L302
.L321:
	lla	a0,.LC7
	call	caml_invalid_argument
.L303:
	slli	a5,a4,3
	add	a3,a1,a5
	ld	a3,0(a3)
	srai	a3,a3,1
	addi	a2,sp,128
	add	a5,a2,a5
	sd	a3,-128(a5)
	addiw	a4,a4,1
.L302:
	ld	a5,8(s0)
	blt	a4,a5,.L303
	mv	a1,sp
	mv	a0,s0
	call	caml_ba_offset
	lbu	a5,16(s0)
	li	a4,12
	bgtu	a5,a4,.L304
	slli	a5,a5,2
	lla	a4,.L306
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L306:
	.word	.L304-.L306
	.word	.L317-.L306
	.word	.L316-.L306
	.word	.L315-.L306
	.word	.L314-.L306
	.word	.L313-.L306
	.word	.L312-.L306
	.word	.L311-.L306
	.word	.L310-.L306
	.word	.L309-.L306
	.word	.L308-.L306
	.word	.L307-.L306
	.word	.L305-.L306
	.section	.text.caml_ba_get_N
.L304:
	ld	a5,8(s1)
	slli	a0,a0,2
	add	a0,a5,a0
	flw	fa0,0(a0)
	fcvt.d.s	fa0,fa0
	call	caml_copy_double
.L301:
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	addi	sp,sp,160
	jr	ra
.L317:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	fld	fa0,0(a0)
	call	caml_copy_double
	j	.L301
.L316:
	ld	a5,8(s1)
	add	a0,a5,a0
	lb	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
.L315:
	ld	a5,8(s1)
	add	a0,a5,a0
	lbu	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
.L314:
	ld	a5,8(s1)
	slli	a0,a0,1
	add	a0,a5,a0
	lh	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
.L313:
	ld	a5,8(s1)
	slli	a0,a0,1
	add	a0,a5,a0
	lhu	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
.L312:
	ld	a5,8(s1)
	slli	a0,a0,2
	add	a0,a5,a0
	lw	a0,0(a0)
	call	caml_copy_int32
	j	.L301
.L311:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	ld	a0,0(a0)
	call	caml_copy_int64
	j	.L301
.L309:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	ld	a0,0(a0)
	call	caml_copy_nativeint
	j	.L301
.L310:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	ld	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
.L308:
	ld	a5,8(s1)
	slli	a0,a0,3
	add	a0,a5,a0
	flw	fa0,0(a0)
	flw	fa1,4(a0)
	fcvt.d.s	fa1,fa1
	fcvt.d.s	fa0,fa0
	call	copy_two_doubles
	j	.L301
.L307:
	ld	a5,8(s1)
	slli	a0,a0,4
	add	a0,a5,a0
	fld	fa1,8(a0)
	fld	fa0,0(a0)
	call	copy_two_doubles
	j	.L301
.L305:
	ld	a5,8(s1)
	add	a0,a5,a0
	lbu	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	j	.L301
	.size	caml_ba_get_N, .-caml_ba_get_N
	.section	.text.caml_ba_get_1,"ax",@progbits
	.align	1
	.globl	caml_ba_get_1
	.type	caml_ba_get_1, @function
caml_ba_get_1:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,8(sp)
	li	a2,1
	addi	a1,sp,8
	call	caml_ba_get_N
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ba_get_1, .-caml_ba_get_1
	.section	.text.caml_ba_get_2,"ax",@progbits
	.align	1
	.globl	caml_ba_get_2
	.type	caml_ba_get_2, @function
caml_ba_get_2:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,0(sp)
	sd	a2,8(sp)
	li	a2,2
	mv	a1,sp
	call	caml_ba_get_N
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ba_get_2, .-caml_ba_get_2
	.section	.text.caml_ba_get_3,"ax",@progbits
	.align	1
	.globl	caml_ba_get_3
	.type	caml_ba_get_3, @function
caml_ba_get_3:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	a1,8(sp)
	sd	a2,16(sp)
	sd	a3,24(sp)
	li	a2,3
	addi	a1,sp,8
	call	caml_ba_get_N
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_ba_get_3, .-caml_ba_get_3
	.section	.text.caml_ba_get_generic,"ax",@progbits
	.align	1
	.globl	caml_ba_get_generic
	.type	caml_ba_get_generic, @function
caml_ba_get_generic:
	addi	sp,sp,-16
	sd	ra,8(sp)
	ld	a2,-8(a1)
	srli	a2,a2,10
	sext.w	a2,a2
	call	caml_ba_get_N
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_get_generic, .-caml_ba_get_generic
	.section	.text.caml_ba_uint8_get16,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_get16
	.type	caml_ba_uint8_get16, @function
caml_ba_uint8_get16:
	blt	a1,zero,.L331
	srai	a5,a1,1
	ld	a4,40(a0)
	addi	a4,a4,-1
	ble	a4,a5,.L331
	ld	a4,8(a0)
	add	a3,a4,a5
	lbu	a3,0(a3)
	addi	a5,a5,1
	add	a5,a4,a5
	lbu	a0,0(a5)
	slli	a0,a0,8
	or	a0,a0,a3
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L331:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_ba_uint8_get16, .-caml_ba_uint8_get16
	.section	.text.caml_ba_uint8_get32,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_get32
	.type	caml_ba_uint8_get32, @function
caml_ba_uint8_get32:
	addi	sp,sp,-16
	sd	ra,8(sp)
	blt	a1,zero,.L336
	srai	a5,a1,1
	ld	a4,40(a0)
	addi	a4,a4,-3
	ble	a4,a5,.L336
	ld	a4,8(a0)
	add	a3,a4,a5
	lbu	a0,0(a3)
	addi	a3,a5,1
	add	a3,a4,a3
	lbu	a3,0(a3)
	addi	a2,a5,2
	add	a2,a4,a2
	lbu	a2,0(a2)
	addi	a5,a5,3
	add	a5,a4,a5
	lbu	a5,0(a5)
	slliw	a5,a5,24
	slli	a4,a2,16
	or	a5,a5,a4
	slli	a4,a3,8
	or	a5,a5,a4
	or	a0,a5,a0
	call	caml_copy_int32
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L336:
	call	caml_array_bound_error
	.size	caml_ba_uint8_get32, .-caml_ba_uint8_get32
	.section	.text.caml_ba_uint8_get64,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_get64
	.type	caml_ba_uint8_get64, @function
caml_ba_uint8_get64:
	addi	sp,sp,-16
	sd	ra,8(sp)
	blt	a1,zero,.L340
	srai	a3,a1,1
	ld	a5,40(a0)
	addi	a5,a5,-7
	ble	a5,a3,.L340
	ld	a2,8(a0)
	add	a5,a2,a3
	lbu	a0,0(a5)
	addi	a5,a3,1
	add	a5,a2,a5
	lbu	a1,0(a5)
	addi	a5,a3,2
	add	a5,a2,a5
	lbu	a6,0(a5)
	addi	a5,a3,3
	add	a5,a2,a5
	lbu	a7,0(a5)
	addi	a5,a3,4
	add	a5,a2,a5
	lbu	t1,0(a5)
	addi	a5,a3,5
	add	a5,a2,a5
	lbu	a5,0(a5)
	addi	a4,a3,6
	add	a4,a2,a4
	lbu	t3,0(a4)
	addi	a3,a3,7
	add	a3,a2,a3
	lbu	a4,0(a3)
	slli	a4,a4,56
	slli	a3,t3,48
	or	a4,a4,a3
	slli	a5,a5,40
	or	a5,a4,a5
	slli	a4,t1,32
	or	a5,a5,a4
	slli	a4,a7,24
	or	a5,a5,a4
	slli	a4,a6,16
	or	a5,a5,a4
	slli	a4,a1,8
	or	a5,a5,a4
	or	a0,a5,a0
	call	caml_copy_int64
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
.L340:
	call	caml_array_bound_error
	.size	caml_ba_uint8_get64, .-caml_ba_uint8_get64
	.section	.text.caml_ba_set_1,"ax",@progbits
	.align	1
	.globl	caml_ba_set_1
	.type	caml_ba_set_1, @function
caml_ba_set_1:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,8(sp)
	mv	a3,a2
	li	a2,1
	addi	a1,sp,8
	call	caml_ba_set_aux
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ba_set_1, .-caml_ba_set_1
	.section	.text.caml_ba_set_2,"ax",@progbits
	.align	1
	.globl	caml_ba_set_2
	.type	caml_ba_set_2, @function
caml_ba_set_2:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a1,0(sp)
	sd	a2,8(sp)
	li	a2,2
	mv	a1,sp
	call	caml_ba_set_aux
	ld	ra,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	caml_ba_set_2, .-caml_ba_set_2
	.section	.text.caml_ba_set_3,"ax",@progbits
	.align	1
	.globl	caml_ba_set_3
	.type	caml_ba_set_3, @function
caml_ba_set_3:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	a1,8(sp)
	sd	a2,16(sp)
	sd	a3,24(sp)
	mv	a3,a4
	li	a2,3
	addi	a1,sp,8
	call	caml_ba_set_aux
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_ba_set_3, .-caml_ba_set_3
	.section	.text.caml_ba_set_N,"ax",@progbits
	.align	1
	.globl	caml_ba_set_N
	.type	caml_ba_set_N, @function
caml_ba_set_N:
	addi	sp,sp,-16
	sd	ra,8(sp)
	slli	a5,a2,3
	addi	a5,a5,-8
	add	a5,a1,a5
	ld	a3,0(a5)
	addiw	a2,a2,-1
	call	caml_ba_set_aux
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_set_N, .-caml_ba_set_N
	.section	.text.caml_ba_set_generic,"ax",@progbits
	.align	1
	.globl	caml_ba_set_generic
	.type	caml_ba_set_generic, @function
caml_ba_set_generic:
	addi	sp,sp,-16
	sd	ra,8(sp)
	mv	a3,a2
	ld	a2,-8(a1)
	srli	a2,a2,10
	call	caml_ba_set_aux
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_set_generic, .-caml_ba_set_generic
	.section	.text.caml_ba_uint8_set16,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_set16
	.type	caml_ba_uint8_set16, @function
caml_ba_uint8_set16:
	blt	a1,zero,.L354
	srai	a5,a1,1
	ld	a4,40(a0)
	addi	a4,a4,-1
	ble	a4,a5,.L354
	srai	a3,a2,1
	srai	a2,a2,9
	ld	a4,8(a0)
	add	a4,a4,a5
	sb	a3,0(a4)
	ld	a4,8(a0)
	addi	a5,a5,1
	add	a5,a4,a5
	sb	a2,0(a5)
	li	a0,1
	ret
.L354:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_ba_uint8_set16, .-caml_ba_uint8_set16
	.section	.text.caml_ba_uint8_set32,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_set32
	.type	caml_ba_uint8_set32, @function
caml_ba_uint8_set32:
	blt	a1,zero,.L359
	srai	a5,a1,1
	ld	a4,40(a0)
	addi	a4,a4,-3
	ble	a4,a5,.L359
	lw	a4,8(a2)
	srliw	a2,a4,24
	srai	a1,a4,16
	srai	a6,a4,8
	ld	a3,8(a0)
	add	a3,a3,a5
	sb	a4,0(a3)
	ld	a4,8(a0)
	addi	a3,a5,1
	add	a4,a4,a3
	sb	a6,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,2
	add	a4,a4,a3
	sb	a1,0(a4)
	ld	a4,8(a0)
	addi	a5,a5,3
	add	a5,a4,a5
	sb	a2,0(a5)
	li	a0,1
	ret
.L359:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_ba_uint8_set32, .-caml_ba_uint8_set32
	.section	.text.caml_ba_uint8_set64,"ax",@progbits
	.align	1
	.globl	caml_ba_uint8_set64
	.type	caml_ba_uint8_set64, @function
caml_ba_uint8_set64:
	blt	a1,zero,.L364
	srai	a5,a1,1
	ld	a4,40(a0)
	addi	a4,a4,-7
	ble	a4,a5,.L364
	ld	a4,8(a2)
	srli	a2,a4,56
	srai	a1,a4,48
	srai	a6,a4,40
	srai	a7,a4,32
	srliw	t1,a4,24
	srai	t3,a4,16
	srai	t4,a4,8
	ld	a3,8(a0)
	add	a3,a3,a5
	sb	a4,0(a3)
	ld	a4,8(a0)
	addi	a3,a5,1
	add	a4,a4,a3
	sb	t4,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,2
	add	a4,a4,a3
	sb	t3,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,3
	add	a4,a4,a3
	sb	t1,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,4
	add	a4,a4,a3
	sb	a7,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,5
	add	a4,a4,a3
	sb	a6,0(a4)
	ld	a4,8(a0)
	addi	a3,a5,6
	add	a4,a4,a3
	sb	a1,0(a4)
	ld	a4,8(a0)
	addi	a5,a5,7
	add	a5,a4,a5
	sb	a2,0(a5)
	li	a0,1
	ret
.L364:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	caml_array_bound_error
	.size	caml_ba_uint8_set64, .-caml_ba_uint8_set64
	.section	.text.caml_ba_num_dims,"ax",@progbits
	.align	1
	.globl	caml_ba_num_dims
	.type	caml_ba_num_dims, @function
caml_ba_num_dims:
	ld	a0,16(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_ba_num_dims, .-caml_ba_num_dims
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"Bigarray.dim"
	.section	.text.caml_ba_dim,"ax",@progbits
	.align	1
	.globl	caml_ba_dim
	.type	caml_ba_dim, @function
caml_ba_dim:
	blt	a1,zero,.L370
	addi	a0,a0,8
	srai	a5,a1,1
	ld	a4,8(a0)
	ble	a4,a5,.L370
	addi	a5,a5,4
	slli	a5,a5,3
	add	a0,a0,a5
	ld	a0,0(a0)
	slli	a0,a0,1
	addi	a0,a0,1
	ret
.L370:
	addi	sp,sp,-16
	sd	ra,8(sp)
	lla	a0,.LC8
	call	caml_invalid_argument
	.size	caml_ba_dim, .-caml_ba_dim
	.section	.text.caml_ba_dim_1,"ax",@progbits
	.align	1
	.globl	caml_ba_dim_1
	.type	caml_ba_dim_1, @function
caml_ba_dim_1:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,1
	call	caml_ba_dim
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_dim_1, .-caml_ba_dim_1
	.section	.text.caml_ba_dim_2,"ax",@progbits
	.align	1
	.globl	caml_ba_dim_2
	.type	caml_ba_dim_2, @function
caml_ba_dim_2:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,3
	call	caml_ba_dim
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_dim_2, .-caml_ba_dim_2
	.section	.text.caml_ba_dim_3,"ax",@progbits
	.align	1
	.globl	caml_ba_dim_3
	.type	caml_ba_dim_3, @function
caml_ba_dim_3:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a1,5
	call	caml_ba_dim
	ld	ra,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	caml_ba_dim_3, .-caml_ba_dim_3
	.section	.text.caml_ba_kind,"ax",@progbits
	.align	1
	.globl	caml_ba_kind
	.type	caml_ba_kind, @function
caml_ba_kind:
	ld	a0,24(a0)
	slli	a0,a0,1
	andi	a0,a0,510
	addi	a0,a0,1
	ret
	.size	caml_ba_kind, .-caml_ba_kind
	.section	.text.caml_ba_layout,"ax",@progbits
	.align	1
	.globl	caml_ba_layout
	.type	caml_ba_layout, @function
caml_ba_layout:
	lw	a0,24(a0)
	sraiw	a0,a0,8
	andi	a0,a0,1
	slli	a0,a0,1
	addi	a0,a0,1
	ret
	.size	caml_ba_layout, .-caml_ba_layout
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"Bigarray.slice: too many indices"
	.section	.text.caml_ba_slice,"ax",@progbits
	.align	1
	.globl	caml_ba_slice
	.type	caml_ba_slice, @function
caml_ba_slice:
	addi	sp,sp,-336
	sd	ra,328(sp)
	sd	s0,320(sp)
	sd	s1,312(sp)
	sd	s2,304(sp)
	sd	s3,296(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s3,280(a4)
	sd	s3,224(sp)
	li	a5,1
	sd	a5,240(sp)
	li	a3,2
	sd	a3,232(sp)
	addi	a3,sp,8
	sd	a3,248(sp)
	sd	sp,256(sp)
	sd	a5,216(sp)
	addi	a3,sp,224
	sd	a3,152(sp)
	addi	a3,sp,152
	sd	a3,280(a4)
	sd	a5,168(sp)
	sd	a5,160(sp)
	addi	a5,sp,216
	sd	a5,176(sp)
	ld	s1,-8(a1)
	srli	s1,s1,10
	sext.w	s1,s1
	addi	s0,a0,8
	ld	a5,8(s0)
	bgt	s1,a5,.L395
	mv	a2,s1
	mv	s2,a0
	ld	a5,16(s0)
	andi	a5,a5,256
	beq	a5,zero,.L393
	li	a4,0
.L385:
	bge	a4,s1,.L396
	slli	a5,a4,3
	add	a5,a5,a1
	ld	a3,0(a5)
	ld	a5,8(s0)
	sub	a5,a5,a2
	add	a5,a4,a5
	srai	a3,a3,1
	slli	a5,a5,3
	addi	a0,sp,288
	add	a5,a0,a5
	sd	a3,-264(a5)
	addiw	a4,a4,1
	j	.L385
.L395:
	lla	a0,.LC9
	call	caml_invalid_argument
.L393:
	li	a5,0
.L384:
	bge	a5,s1,.L387
	slli	a4,a5,3
	add	a3,a4,a1
	ld	a3,0(a3)
	srai	a3,a3,1
	addi	a2,sp,288
	add	a4,a2,a4
	sd	a3,-264(a4)
	addiw	a5,a5,1
	j	.L384
.L388:
	slli	a4,a5,3
	addi	a3,sp,288
	add	a4,a3,a4
	sd	zero,-264(a4)
	addiw	a5,a5,1
.L387:
	ld	a4,8(s0)
	blt	a5,a4,.L388
	addi	a1,sp,24
	mv	a0,s0
	call	caml_ba_offset
	addi	a3,s0,32
	slli	a5,s1,3
	add	a3,a3,a5
.L389:
	ld	a2,8(s2)
	ld	a6,16(s0)
	andi	a5,a6,255
	slli	a4,a5,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	a5,0(a5)
	mul	a5,a5,a0
	ld	a1,8(s0)
	add	a2,a2,a5
	subw	a1,a1,s1
	sext.w	a0,a6
	call	caml_ba_alloc
	sd	a0,216(sp)
	ld	a5,8(sp)
	ld	a5,0(a5)
	sd	a5,0(a0)
	ld	a1,216(sp)
	addi	a1,a1,8
	ld	a0,8(sp)
	addi	a0,a0,8
	call	caml_ba_update_proxy
	ld	a5,Caml_state
	sd	s3,280(a5)
	ld	a0,216(sp)
	ld	ra,328(sp)
	ld	s0,320(sp)
	ld	s1,312(sp)
	ld	s2,304(sp)
	ld	s3,296(sp)
	addi	sp,sp,336
	jr	ra
.L396:
	li	a4,0
	j	.L391
.L392:
	slli	a5,a4,3
	addi	a3,sp,288
	add	a5,a3,a5
	li	a3,1
	sd	a3,-264(a5)
	addiw	a4,a4,1
.L391:
	ld	a5,8(s0)
	sub	a5,a5,a2
	blt	a4,a5,.L392
	addi	a1,sp,24
	mv	a0,s0
	call	caml_ba_offset
	addi	a3,s0,32
	j	.L389
	.size	caml_ba_slice, .-caml_ba_slice
	.section	.text.caml_ba_change_layout,"ax",@progbits
	.align	1
	.globl	caml_ba_change_layout
	.type	caml_ba_change_layout, @function
caml_ba_change_layout:
	addi	sp,sp,-304
	sd	ra,296(sp)
	sd	s0,288(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s0,280(a4)
	sd	s0,224(sp)
	li	a5,1
	sd	a5,240(sp)
	li	a3,2
	sd	a3,232(sp)
	addi	a3,sp,8
	sd	a3,248(sp)
	sd	sp,256(sp)
	sd	a5,216(sp)
	addi	a3,sp,224
	sd	a3,152(sp)
	addi	a3,sp,152
	sd	a3,280(a4)
	sd	a5,168(sp)
	sd	a5,160(sp)
	addi	a5,sp,216
	sd	a5,176(sp)
	srai	a1,a1,1
	slliw	a1,a1,8
	addi	a2,a0,8
	ld	a5,16(a2)
	andi	a3,a5,256
	beq	a1,a3,.L398
	andi	a0,a5,1791
	or	a0,a1,a0
	li	a4,0
.L399:
	slli	a5,a4,32
	srli	a5,a5,32
	ld	a1,8(a2)
	bge	a5,a1,.L403
	sub	a1,a1,a5
	addi	a1,a1,3
	slli	a1,a1,3
	add	a1,a2,a1
	ld	a3,0(a1)
	slli	a5,a4,32
	srli	a5,a5,32
	slli	a5,a5,3
	addi	a1,sp,288
	add	a5,a1,a5
	sd	a3,-264(a5)
	addiw	a4,a4,1
	j	.L399
.L403:
	addi	a3,sp,24
	ld	a2,0(a2)
	sext.w	a1,a1
	call	caml_ba_alloc
	sd	a0,216(sp)
	ld	a5,8(sp)
	ld	a5,0(a5)
	sd	a5,0(a0)
	ld	a1,216(sp)
	addi	a1,a1,8
	ld	a0,8(sp)
	addi	a0,a0,8
	call	caml_ba_update_proxy
	ld	a0,216(sp)
	ld	a5,Caml_state
	sd	s0,280(a5)
.L397:
	ld	ra,296(sp)
	ld	s0,288(sp)
	addi	sp,sp,304
	jr	ra
.L398:
	sd	s0,280(a4)
	j	.L397
	.size	caml_ba_change_layout, .-caml_ba_change_layout
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"Bigarray.sub: bad sub-array"
	.section	.text.caml_ba_sub,"ax",@progbits
	.align	1
	.globl	caml_ba_sub
	.type	caml_ba_sub, @function
caml_ba_sub:
	addi	sp,sp,-208
	sd	ra,200(sp)
	sd	s0,192(sp)
	sd	s1,184(sp)
	sd	s2,176(sp)
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	ld	a4,Caml_state
	ld	s1,280(a4)
	sd	s1,112(sp)
	li	a5,1
	sd	a5,128(sp)
	li	a3,3
	sd	a3,120(sp)
	addi	a3,sp,24
	sd	a3,136(sp)
	addi	a3,sp,16
	sd	a3,144(sp)
	addi	a3,sp,8
	sd	a3,152(sp)
	sd	a5,104(sp)
	addi	a3,sp,112
	sd	a3,40(sp)
	addi	a3,sp,40
	sd	a3,280(a4)
	sd	a5,56(sp)
	sd	a5,48(sp)
	addi	a5,sp,104
	sd	a5,64(sp)
	srai	a1,a1,1
	srai	s0,a2,1
	addi	a4,a0,8
	ld	a7,16(a4)
	andi	a5,a7,256
	beq	a5,zero,.L412
	li	a3,1
	li	a6,0
.L406:
	ld	a5,8(a4)
	addi	a2,a5,-1
	bge	a6,a2,.L414
	addi	a5,a6,4
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	mul	a3,a3,a5
	addiw	a6,a6,1
	j	.L406
.L412:
	li	a3,1
	li	a6,1
.L405:
	ld	a5,8(a4)
	bge	a6,a5,.L415
	addi	a5,a6,4
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	mul	a3,a3,a5
	addiw	a6,a6,1
	j	.L405
.L415:
	li	s2,0
	j	.L408
.L414:
	addiw	s2,a5,-1
	addi	a1,a1,-1
.L408:
	blt	a1,zero,.L410
	blt	s0,zero,.L410
	add	a2,a1,s0
	addi	a5,s2,4
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a6,0(a5)
	bgt	a2,a6,.L410
	ld	a2,8(a0)
	mul	a1,a1,a3
	andi	a5,a7,255
	slli	a3,a5,2
	lla	a5,.LANCHOR0
	add	a5,a5,a3
	lw	a3,0(a5)
	mul	a1,a1,a3
	addi	a3,a4,32
	add	a2,a2,a1
	lw	a1,8(a4)
	sext.w	a0,a7
	call	caml_ba_alloc
	sd	a0,104(sp)
	ld	a5,24(sp)
	ld	a5,0(a5)
	sd	a5,0(a0)
	ld	a1,104(sp)
	addi	a1,a1,8
	addi	a5,s2,4
	slli	a5,a5,3
	add	a5,a1,a5
	sd	s0,0(a5)
	ld	a0,24(sp)
	addi	a0,a0,8
	call	caml_ba_update_proxy
	ld	a5,Caml_state
	sd	s1,280(a5)
	ld	a0,104(sp)
	ld	ra,200(sp)
	ld	s0,192(sp)
	ld	s1,184(sp)
	ld	s2,176(sp)
	addi	sp,sp,208
	jr	ra
.L410:
	lla	a0,.LC10
	call	caml_invalid_argument
	.size	caml_ba_sub, .-caml_ba_sub
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	"Bigarray.blit: dimension mismatch"
	.section	.text.caml_ba_blit,"ax",@progbits
	.align	1
	.globl	caml_ba_blit
	.type	caml_ba_blit, @function
caml_ba_blit:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a5,Caml_state
	ld	s2,280(a5)
	sd	s2,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	addi	s0,a0,8
	addi	s1,a1,8
	ld	s4,8(a0)
	ld	s3,8(a1)
	ld	a2,8(s0)
	ld	a5,8(s1)
	bne	a2,a5,.L417
	li	a4,0
.L418:
	ble	a2,a4,.L426
	addi	a5,a4,4
	slli	a5,a5,3
	add	a3,s0,a5
	ld	a3,0(a3)
	add	a5,s1,a5
	ld	a5,0(a5)
	bne	a3,a5,.L417
	addiw	a4,a4,1
	j	.L418
.L426:
	mv	a0,s0
	call	caml_ba_num_elts
	ld	a3,16(s0)
	andi	a5,a3,255
	slli	a4,a5,2
	lla	a5,.LANCHOR0
	add	a5,a5,a4
	lw	s0,0(a5)
	mul	s0,a0,s0
	li	a5,32768
	bgeu	s0,a5,.L420
	andi	a3,a3,1024
	bne	a3,zero,.L420
	ld	a5,16(s1)
	andi	a5,a5,1024
	beq	a5,zero,.L423
.L420:
	call	caml_enter_blocking_section
	li	s1,1
.L421:
	mv	a2,s0
	mv	a1,s4
	mv	a0,s3
	call	memmove
	bne	s1,zero,.L427
.L422:
	ld	a5,Caml_state
	sd	s2,280(a5)
	li	a0,1
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	ld	s3,88(sp)
	ld	s4,80(sp)
	addi	sp,sp,128
	jr	ra
.L423:
	li	s1,0
	j	.L421
.L427:
	call	caml_leave_blocking_section
	j	.L422
.L417:
	lla	a0,.LC11
	call	caml_invalid_argument
	.size	caml_ba_blit, .-caml_ba_blit
	.section	.text.caml_ba_fill,"ax",@progbits
	.align	1
	.globl	caml_ba_fill
	.type	caml_ba_fill, @function
caml_ba_fill:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	sd	s4,96(sp)
	fsd	fs0,88(sp)
	fsd	fs1,80(sp)
	sd	a0,8(sp)
	mv	s2,a1
	ld	a5,Caml_state
	ld	s3,280(a5)
	sd	s3,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	addi	s4,a0,8
	ld	s1,8(a0)
	mv	a0,s4
	call	caml_ba_num_elts
	mv	s0,a0
	ld	a4,16(s4)
	andi	a5,a4,255
	li	a3,12
	bgtu	a5,a3,.L429
	slli	a5,a5,2
	lla	a3,.L431
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L431:
	.word	.L429-.L431
	.word	.L439-.L431
	.word	.L430-.L431
	.word	.L430-.L431
	.word	.L438-.L431
	.word	.L438-.L431
	.word	.L437-.L431
	.word	.L436-.L431
	.word	.L435-.L431
	.word	.L434-.L431
	.word	.L433-.L431
	.word	.L432-.L431
	.word	.L430-.L431
	.section	.text.caml_ba_fill
.L429:
	fld	fs0,0(s2)
	fcvt.s.d	fs0,fs0
	li	a5,4096
	bge	s0,a5,.L440
	andi	a4,a4,1024
	beq	a4,zero,.L481
.L440:
	call	caml_enter_blocking_section
	li	a5,1
.L442:
	ble	s0,zero,.L492
	fsw	fs0,0(s1)
	addi	s1,s1,4
	addi	s0,s0,-1
	j	.L442
.L481:
	li	a5,0
	j	.L442
.L492:
	bne	a5,zero,.L493
.L444:
	ld	a5,Caml_state
	sd	s3,280(a5)
	li	a0,1
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	ld	s4,96(sp)
	fld	fs0,88(sp)
	fld	fs1,80(sp)
	addi	sp,sp,144
	jr	ra
.L493:
	call	caml_leave_blocking_section
	j	.L444
.L439:
	fld	fs0,0(s2)
	li	a5,4096
	bge	a0,a5,.L445
	andi	a4,a4,1024
	beq	a4,zero,.L482
.L445:
	call	caml_enter_blocking_section
	li	a5,1
.L447:
	ble	s0,zero,.L494
	fsd	fs0,0(s1)
	addi	s1,s1,8
	addi	s0,s0,-1
	j	.L447
.L482:
	li	a5,0
	j	.L447
.L494:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L430:
	srai	s2,s2,1
	li	a5,4096
	bge	a0,a5,.L449
	andi	a4,a4,1024
	beq	a4,zero,.L483
.L449:
	call	caml_enter_blocking_section
	li	a5,1
.L451:
	ble	s0,zero,.L495
	sb	s2,0(s1)
	addi	s1,s1,1
	addi	s0,s0,-1
	j	.L451
.L483:
	li	a5,0
	j	.L451
.L495:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L438:
	srai	s2,s2,1
	li	a5,4096
	bge	a0,a5,.L453
	andi	a4,a4,1024
	beq	a4,zero,.L484
.L453:
	call	caml_enter_blocking_section
	li	a5,1
.L455:
	ble	s0,zero,.L496
	sh	s2,0(s1)
	addi	s1,s1,2
	addi	s0,s0,-1
	j	.L455
.L484:
	li	a5,0
	j	.L455
.L496:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L437:
	lw	s2,8(s2)
	li	a5,4096
	bge	a0,a5,.L457
	andi	a4,a4,1024
	beq	a4,zero,.L485
.L457:
	call	caml_enter_blocking_section
	li	a5,1
.L459:
	ble	s0,zero,.L497
	sw	s2,0(s1)
	addi	s1,s1,4
	addi	s0,s0,-1
	j	.L459
.L485:
	li	a5,0
	j	.L459
.L497:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L436:
	ld	s2,8(s2)
	li	a5,4096
	bge	a0,a5,.L461
	andi	a4,a4,1024
	beq	a4,zero,.L486
.L461:
	call	caml_enter_blocking_section
	li	a5,1
.L463:
	ble	s0,zero,.L498
	sd	s2,0(s1)
	addi	s1,s1,8
	addi	s0,s0,-1
	j	.L463
.L486:
	li	a5,0
	j	.L463
.L498:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L434:
	ld	s2,8(s2)
	li	a5,4096
	bge	a0,a5,.L465
	andi	a4,a4,1024
	beq	a4,zero,.L487
.L465:
	call	caml_enter_blocking_section
	li	a5,1
.L467:
	ble	s0,zero,.L499
	sd	s2,0(s1)
	addi	s1,s1,8
	addi	s0,s0,-1
	j	.L467
.L487:
	li	a5,0
	j	.L467
.L499:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L435:
	srai	s2,s2,1
	li	a5,4096
	bge	a0,a5,.L469
	andi	a4,a4,1024
	beq	a4,zero,.L488
.L469:
	call	caml_enter_blocking_section
	li	a5,1
.L471:
	ble	s0,zero,.L500
	sd	s2,0(s1)
	addi	s1,s1,8
	addi	s0,s0,-1
	j	.L471
.L488:
	li	a5,0
	j	.L471
.L500:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L433:
	fld	fs0,0(s2)
	fcvt.s.d	fs0,fs0
	fld	fs1,8(s2)
	fcvt.s.d	fs1,fs1
	slli	a5,a0,1
	li	a3,4096
	bge	a5,a3,.L473
	andi	a4,a4,1024
	beq	a4,zero,.L489
.L473:
	call	caml_enter_blocking_section
	li	a5,1
.L475:
	ble	s0,zero,.L501
	fsw	fs0,0(s1)
	fsw	fs1,4(s1)
	addi	s0,s0,-1
	addi	s1,s1,8
	j	.L475
.L489:
	li	a5,0
	j	.L475
.L501:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
.L432:
	fld	fs0,0(s2)
	fld	fs1,8(s2)
	slli	a5,a0,1
	li	a3,4096
	bge	a5,a3,.L477
	andi	a4,a4,1024
	beq	a4,zero,.L490
.L477:
	call	caml_enter_blocking_section
	li	a5,1
.L479:
	ble	s0,zero,.L502
	fsd	fs0,0(s1)
	fsd	fs1,8(s1)
	addi	s0,s0,-1
	addi	s1,s1,16
	j	.L479
.L490:
	li	a5,0
	j	.L479
.L502:
	beq	a5,zero,.L444
	call	caml_leave_blocking_section
	j	.L444
	.size	caml_ba_fill, .-caml_ba_fill
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"Bigarray.reshape: bad number of dimensions"
	.align	3
.LC13:
	.string	"Bigarray.reshape: negative dimension"
	.align	3
.LC14:
	.string	"Bigarray.reshape: size mismatch"
	.section	.text.caml_ba_reshape,"ax",@progbits
	.align	1
	.globl	caml_ba_reshape
	.type	caml_ba_reshape, @function
caml_ba_reshape:
	addi	sp,sp,-336
	sd	ra,328(sp)
	sd	s0,320(sp)
	sd	s1,312(sp)
	sd	s2,304(sp)
	sd	s3,296(sp)
	sd	s4,288(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	ld	a4,Caml_state
	ld	s2,280(a4)
	sd	s2,224(sp)
	li	a5,1
	sd	a5,240(sp)
	li	a3,2
	sd	a3,232(sp)
	addi	a3,sp,8
	sd	a3,248(sp)
	sd	sp,256(sp)
	sd	a5,216(sp)
	addi	a3,sp,224
	sd	a3,152(sp)
	addi	a3,sp,152
	sd	a3,280(a4)
	sd	a5,168(sp)
	sd	a5,160(sp)
	addi	a5,sp,216
	sd	a5,176(sp)
	ld	s1,-8(a1)
	srli	s1,s1,10
	li	a5,16
	bgtu	s1,a5,.L510
	li	a4,0
	li	s0,1
.L504:
	bgeu	a4,s1,.L511
	slli	a5,a4,3
	add	a5,a5,a1
	ld	a5,0(a5)
	srai	a5,a5,1
	slli	a3,a4,3
	addi	a2,sp,288
	add	a3,a2,a3
	sd	a5,-264(a3)
	blt	a5,zero,.L512
	mul	s0,s0,a5
	addiw	a4,a4,1
	j	.L504
.L510:
	lla	a0,.LC12
	call	caml_invalid_argument
.L512:
	lla	a0,.LC13
	call	caml_invalid_argument
.L511:
	ld	s4,8(sp)
	addi	s3,s4,8
	mv	a0,s3
	call	caml_ba_num_elts
	bne	a0,s0,.L513
	addi	a3,sp,24
	ld	a2,8(s4)
	sext.w	a1,s1
	lw	a0,16(s3)
	call	caml_ba_alloc
	sd	a0,216(sp)
	ld	a5,8(sp)
	ld	a5,0(a5)
	sd	a5,0(a0)
	ld	a1,216(sp)
	addi	a1,a1,8
	ld	a0,8(sp)
	addi	a0,a0,8
	call	caml_ba_update_proxy
	ld	a5,Caml_state
	sd	s2,280(a5)
	ld	a0,216(sp)
	ld	ra,328(sp)
	ld	s0,320(sp)
	ld	s1,312(sp)
	ld	s2,304(sp)
	ld	s3,296(sp)
	ld	s4,288(sp)
	addi	sp,sp,336
	jr	ra
.L513:
	lla	a0,.LC14
	call	caml_invalid_argument
	.size	caml_ba_reshape, .-caml_ba_reshape
	.globl	caml_ba_ops
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"_bigarr02"
	.globl	caml_ba_element_size
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caml_ba_element_size, @object
	.size	caml_ba_element_size, 52
caml_ba_element_size:
	.word	4
	.word	8
	.word	1
	.word	1
	.word	2
	.word	2
	.word	4
	.word	8
	.word	8
	.word	8
	.word	8
	.word	16
	.word	1
	.zero	4
	.type	caml_ba_ops, @object
	.size	caml_ba_ops, 64
caml_ba_ops:
	.dword	.LC15
	.dword	caml_ba_finalize
	.dword	caml_ba_compare
	.dword	caml_ba_hash
	.dword	caml_ba_serialize
	.dword	caml_ba_deserialize
	.dword	0
	.dword	0
	.ident	"GCC: (GNU) 9.2.0"
