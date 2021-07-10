	.file	"md5.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.caml_MD5Init,"ax",@progbits
	.align	1
	.globl	caml_MD5Init
	.type	caml_MD5Init, @function
caml_MD5Init:
	li	a5,1732583424
	addi	a5,a5,769
	sw	a5,0(a0)
	li	a5,-271732736
	addi	a5,a5,-1143
	sw	a5,4(a0)
	li	a5,-1732583424
	addi	a5,a5,-770
	sw	a5,8(a0)
	li	a5,271732736
	addi	a5,a5,1142
	sw	a5,12(a0)
	sw	zero,16(a0)
	sw	zero,20(a0)
	ret
	.size	caml_MD5Init, .-caml_MD5Init
	.section	.text.caml_MD5Transform,"ax",@progbits
	.align	1
	.globl	caml_MD5Transform
	.type	caml_MD5Transform, @function
caml_MD5Transform:
	addi	sp,sp,-96
	sd	s0,88(sp)
	sd	s1,80(sp)
	sd	s2,72(sp)
	sd	s3,64(sp)
	sd	s4,56(sp)
	sd	s5,48(sp)
	sd	s6,40(sp)
	sd	s7,32(sp)
	sd	s8,24(sp)
	sd	s9,16(sp)
	sd	s10,8(sp)
	sd	s11,0(sp)
	lw	s9,0(a0)
	lw	s5,4(a0)
	lw	s7,8(a0)
	lw	s8,12(a0)
	xor	a5,s7,s8
	and	a5,a5,s5
	xor	a5,s8,a5
	lw	s2,0(a1)
	addw	a5,a5,s2
	addw	a5,a5,s9
	li	s4,-680878080
	addiw	s4,s4,1144
	addw	a5,a5,s4
	slliw	s4,a5,7
	srliw	a5,a5,25
	or	a5,s4,a5
	addw	s4,s5,a5
	xor	a4,s7,s5
	and	a4,a4,s4
	sext.w	a4,a4
	xor	a4,s7,a4
	lw	t4,4(a1)
	addw	a4,a4,t4
	addw	a4,a4,s8
	li	s3,-389566464
	addiw	s3,s3,1878
	addw	a4,a4,s3
	slliw	s3,a4,12
	srliw	a4,a4,20
	or	a4,s3,a4
	addw	s3,s4,a4
	xor	a5,s5,s4
	sext.w	a5,a5
	and	a5,a5,s3
	sext.w	a5,a5
	xor	a5,s5,a5
	lw	a3,8(a1)
	addw	a5,a5,a3
	addw	a5,a5,s7
	li	s6,606105600
	addiw	s6,s6,219
	addw	a5,a5,s6
	srliw	s6,a5,15
	slliw	a5,a5,17
	or	a5,s6,a5
	addw	s6,s3,a5
	xor	a4,s4,s3
	sext.w	a4,a4
	and	a4,a4,s6
	sext.w	a4,a4
	xor	a4,a4,s4
	lw	t6,12(a1)
	addw	a4,a4,t6
	addw	a4,a4,s5
	li	s10,-1044525056
	addiw	s10,s10,-274
	addw	a4,a4,s10
	srliw	s10,a4,10
	slliw	a4,a4,22
	or	a4,s10,a4
	addw	s10,s6,a4
	xor	a2,s3,s6
	sext.w	a2,a2
	and	a2,a2,s10
	sext.w	a2,a2
	xor	a2,a2,s3
	lw	a6,16(a1)
	addw	a2,a2,a6
	addw	a2,a2,s4
	li	s4,-176418816
	addiw	s4,s4,-81
	addw	a2,a2,s4
	slliw	s4,a2,7
	srliw	a2,a2,25
	or	a2,s4,a2
	addw	s4,s10,a2
	xor	a5,s6,s10
	sext.w	a5,a5
	and	a5,a5,s4
	sext.w	a5,a5
	xor	a5,a5,s6
	lw	t2,20(a1)
	addw	a5,a5,t2
	addw	a5,a5,s3
	li	s3,1200078848
	addiw	s3,s3,1578
	addw	a5,a5,s3
	slliw	s3,a5,12
	srliw	a5,a5,20
	or	a5,s3,a5
	addw	s3,s4,a5
	xor	a4,s10,s4
	sext.w	a4,a4
	and	a4,a4,s3
	sext.w	a4,a4
	xor	a4,a4,s10
	lw	t1,24(a1)
	addw	a4,a4,t1
	addw	a4,a4,s6
	li	s6,-1473232896
	addiw	s6,s6,1555
	addw	a4,a4,s6
	srliw	s6,a4,15
	slliw	a4,a4,17
	or	a4,s6,a4
	addw	s6,s3,a4
	xor	a5,s4,s3
	sext.w	a5,a5
	and	a5,a5,s6
	sext.w	a5,a5
	xor	a5,a5,s4
	lw	s1,28(a1)
	addw	a5,a5,s1
	addw	a5,a5,s10
	li	s10,-45707264
	addiw	s10,s10,1281
	addw	a5,a5,s10
	srliw	s10,a5,10
	slliw	a5,a5,22
	or	a5,s10,a5
	addw	s10,s6,a5
	xor	a4,s3,s6
	sext.w	a4,a4
	and	a4,a4,s10
	sext.w	a4,a4
	xor	a4,a4,s3
	lw	t3,32(a1)
	addw	a4,a4,t3
	addw	a4,a4,s4
	li	s4,1770037248
	addiw	s4,s4,-1832
	addw	a4,a4,s4
	slliw	s4,a4,7
	srliw	a4,a4,25
	or	a4,s4,a4
	addw	s4,s10,a4
	xor	a2,s6,s10
	sext.w	a2,a2
	and	a2,a2,s4
	sext.w	a2,a2
	xor	a2,a2,s6
	lw	a4,36(a1)
	addw	a2,a2,a4
	addw	a2,a2,s3
	li	s3,-1958416384
	addiw	s3,s3,1967
	addw	a2,a2,s3
	slliw	s3,a2,12
	srliw	a2,a2,20
	or	a2,s3,a2
	addw	s3,s4,a2
	xor	a2,s10,s4
	sext.w	a2,a2
	and	a2,a2,s3
	sext.w	a2,a2
	xor	a2,a2,s10
	lw	t5,40(a1)
	addw	a2,a2,t5
	addw	a2,a2,s6
	li	s6,-40960
	addiw	s6,s6,-1103
	addw	a2,a2,s6
	srliw	s6,a2,15
	slliw	a2,a2,17
	or	a2,s6,a2
	addw	s6,s3,a2
	xor	a7,s4,s3
	sext.w	a7,a7
	and	a7,a7,s6
	sext.w	a7,a7
	xor	a7,a7,s4
	lw	a2,44(a1)
	addw	a7,a7,a2
	addw	a7,a7,s10
	li	s10,-1990406144
	addiw	s10,s10,1982
	addw	a7,a7,s10
	srliw	s10,a7,10
	slliw	a7,a7,22
	or	a7,s10,a7
	addw	s10,s6,a7
	xor	a5,s3,s6
	sext.w	a5,a5
	and	a5,a5,s10
	sext.w	a5,a5
	xor	a5,a5,s3
	lw	t0,48(a1)
	addw	a5,a5,t0
	addw	a5,a5,s4
	li	s4,1804603392
	addiw	s4,s4,290
	addw	a5,a5,s4
	slliw	s4,a5,7
	srliw	a5,a5,25
	or	a5,s4,a5
	addw	s4,s10,a5
	xor	a5,s6,s10
	sext.w	a5,a5
	and	a5,a5,s4
	sext.w	a5,a5
	xor	a5,a5,s6
	lw	a7,52(a1)
	addw	a5,a5,a7
	addw	a5,a5,s3
	li	s3,-40341504
	addiw	s3,s3,403
	addw	a5,a5,s3
	slliw	s3,a5,12
	srliw	a5,a5,20
	or	a5,s3,a5
	addw	s3,s4,a5
	xor	a5,s10,s4
	sext.w	a5,a5
	and	a5,a5,s3
	sext.w	a5,a5
	xor	a5,a5,s10
	lw	s0,56(a1)
	addw	a5,a5,s0
	addw	a5,a5,s6
	li	s6,-1502003200
	addiw	s6,s6,910
	addw	a5,a5,s6
	srliw	s6,a5,15
	slliw	a5,a5,17
	or	a5,s6,a5
	addw	s6,s3,a5
	xor	a5,s4,s3
	sext.w	a5,a5
	and	a5,a5,s6
	sext.w	a5,a5
	xor	a5,a5,s4
	lw	a1,60(a1)
	addw	a5,a5,a1
	addw	a5,a5,s10
	li	s10,1236537344
	addiw	s10,s10,-2015
	addw	a5,a5,s10
	srliw	s10,a5,10
	slliw	a5,a5,22
	or	a5,s10,a5
	addw	s10,s6,a5
	xor	s11,s6,s10
	sext.w	s11,s11
	and	s11,s11,s3
	sext.w	s11,s11
	xor	s11,s11,s6
	addw	s11,t4,s11
	addw	s11,s11,s4
	li	s4,-165797888
	addiw	s4,s4,1378
	addw	s11,s11,s4
	slliw	s4,s11,5
	srliw	s11,s11,27
	or	s11,s4,s11
	addw	s4,s10,s11
	xor	s11,s10,s4
	sext.w	s11,s11
	and	s11,s11,s6
	sext.w	s11,s11
	xor	s11,s11,s10
	addw	s11,t1,s11
	addw	s11,s11,s3
	li	s3,-1069502464
	addiw	s3,s3,832
	addw	s11,s11,s3
	slliw	s3,s11,9
	srliw	s11,s11,23
	or	s11,s3,s11
	addw	s3,s4,s11
	xor	s11,s4,s3
	sext.w	s11,s11
	and	s11,s11,s10
	sext.w	s11,s11
	xor	s11,s11,s4
	addw	s11,a2,s11
	addw	s11,s11,s6
	li	s6,643719168
	addiw	s6,s6,-1455
	addw	s11,s11,s6
	slliw	s6,s11,14
	srliw	s11,s11,18
	or	s11,s6,s11
	addw	s6,s3,s11
	xor	s11,s3,s6
	sext.w	s11,s11
	and	s11,s11,s4
	sext.w	s11,s11
	xor	s11,s11,s3
	addw	s11,s2,s11
	addw	s11,s11,s10
	li	s10,-373899264
	addiw	s10,s10,1962
	addw	s11,s11,s10
	srliw	s10,s11,12
	slliw	s11,s11,20
	or	s11,s10,s11
	addw	s10,s6,s11
	xor	a5,s6,s10
	sext.w	a5,a5
	and	a5,a5,s3
	sext.w	a5,a5
	xor	a5,a5,s6
	addw	a5,t2,a5
	addw	a5,a5,s4
	li	s4,-701558784
	addiw	s4,s4,93
	addw	a5,a5,s4
	slliw	s4,a5,5
	srliw	a5,a5,27
	or	a5,s4,a5
	addw	s4,s10,a5
	xor	a5,s10,s4
	sext.w	a5,a5
	and	a5,a5,s6
	sext.w	a5,a5
	xor	a5,a5,s10
	addw	a5,t5,a5
	addw	a5,a5,s3
	li	s3,38014976
	addiw	s3,s3,1107
	addw	a5,a5,s3
	slliw	s3,a5,9
	srliw	a5,a5,23
	or	a5,s3,a5
	addw	s3,s4,a5
	xor	a5,s4,s3
	sext.w	a5,a5
	and	a5,a5,s10
	sext.w	a5,a5
	xor	a5,a5,s4
	addw	a5,a1,a5
	addw	a5,a5,s6
	li	s6,-660480000
	addiw	s6,s6,1665
	addw	a5,a5,s6
	slliw	s6,a5,14
	srliw	a5,a5,18
	or	a5,s6,a5
	addw	s6,s3,a5
	xor	a5,s3,s6
	sext.w	a5,a5
	and	a5,a5,s4
	sext.w	a5,a5
	xor	a5,a5,s3
	addw	a5,a6,a5
	addw	a5,a5,s10
	li	s10,-405536768
	addiw	s10,s10,-1080
	addw	a5,a5,s10
	srliw	s10,a5,12
	slliw	a5,a5,20
	or	a5,s10,a5
	addw	s10,s6,a5
	xor	s11,s6,s10
	sext.w	s11,s11
	and	s11,s11,s3
	sext.w	s11,s11
	xor	s11,s11,s6
	addw	s11,a4,s11
	addw	s11,s11,s4
	li	s4,568446976
	addiw	s4,s4,-538
	addw	s11,s11,s4
	slliw	s4,s11,5
	srliw	s11,s11,27
	or	s11,s4,s11
	addw	s4,s10,s11
	xor	s11,s10,s4
	sext.w	s11,s11
	and	s11,s11,s6
	sext.w	s11,s11
	xor	s11,s11,s10
	addw	s11,s0,s11
	addw	s11,s11,s3
	li	s3,-1019805696
	addiw	s3,s3,2006
	addw	s11,s11,s3
	slliw	s3,s11,9
	srliw	s11,s11,23
	or	s11,s3,s11
	addw	s3,s4,s11
	xor	s11,s4,s3
	sext.w	s11,s11
	and	s11,s11,s10
	sext.w	s11,s11
	xor	s11,s11,s4
	addw	s11,t6,s11
	addw	s11,s11,s6
	li	s6,-187363328
	addiw	s6,s6,-633
	addw	s11,s11,s6
	slliw	s6,s11,14
	srliw	s11,s11,18
	or	s11,s6,s11
	addw	s6,s3,s11
	xor	s11,s3,s6
	sext.w	s11,s11
	and	s11,s11,s4
	sext.w	s11,s11
	xor	s11,s11,s3
	addw	s11,t3,s11
	addw	s11,s11,s10
	li	s10,1163530240
	addiw	s10,s10,1261
	addw	s11,s11,s10
	srliw	s10,s11,12
	slliw	s11,s11,20
	or	s11,s10,s11
	addw	s10,s6,s11
	xor	a5,s6,s10
	sext.w	a5,a5
	and	a5,a5,s3
	sext.w	a5,a5
	xor	a5,a5,s6
	addw	a5,a7,a5
	addw	a5,a5,s4
	li	s4,-1444679680
	addiw	s4,s4,-1787
	addw	a5,a5,s4
	slliw	s4,a5,5
	srliw	a5,a5,27
	or	a5,s4,a5
	addw	s4,s10,a5
	xor	a5,s10,s4
	sext.w	a5,a5
	and	a5,a5,s6
	sext.w	a5,a5
	xor	a5,a5,s10
	addw	a5,a3,a5
	addw	a5,a5,s3
	li	s3,-51404800
	addiw	s3,s3,1016
	addw	a5,a5,s3
	slliw	s3,a5,9
	srliw	a5,a5,23
	or	a5,s3,a5
	addw	s3,s4,a5
	xor	a5,s4,s3
	sext.w	a5,a5
	and	a5,a5,s10
	sext.w	a5,a5
	xor	a5,a5,s4
	addw	a5,s1,a5
	addw	a5,a5,s6
	li	s6,1735327744
	addiw	s6,s6,729
	addw	a5,a5,s6
	slliw	s6,a5,14
	srliw	a5,a5,18
	or	a5,s6,a5
	addw	s6,s3,a5
	xor	a5,s3,s6
	sext.w	a5,a5
	and	a5,a5,s4
	sext.w	a5,a5
	xor	a5,a5,s3
	addw	a5,t0,a5
	addw	a5,a5,s10
	li	s10,-1926606848
	addiw	s10,s10,-886
	addw	a5,a5,s10
	srliw	s10,a5,12
	slliw	a5,a5,20
	or	a5,s10,a5
	addw	a5,s6,a5
	xor	s10,s6,a5
	sext.w	s10,s10
	xor	s10,s10,s3
	addw	s10,t2,s10
	addw	s4,s10,s4
	li	s10,-376832
	addiw	s10,s10,-1726
	addw	s4,s4,s10
	slliw	s10,s4,4
	srliw	s4,s4,28
	or	s4,s10,s4
	addw	s10,a5,s4
	xor	s4,a5,s10
	sext.w	s4,s4
	xor	s4,s4,s6
	addw	s4,t3,s4
	addw	s3,s4,s3
	li	s4,-2022576128
	addiw	s4,s4,1665
	addw	s3,s3,s4
	slliw	s4,s3,11
	srliw	s3,s3,21
	or	s3,s4,s3
	addw	s4,s10,s3
	xor	s3,s10,s4
	sext.w	s3,s3
	xor	s3,s3,a5
	addw	s3,a2,s3
	addw	s6,s3,s6
	li	s3,1839030272
	addiw	s3,s3,290
	addw	s6,s6,s3
	slliw	s3,s6,16
	srliw	s6,s6,16
	or	s6,s3,s6
	addw	s6,s4,s6
	xor	s3,s4,s6
	sext.w	s3,s3
	xor	s3,s3,s10
	addw	s3,s0,s3
	addw	a5,s3,a5
	li	s3,-35307520
	addiw	s3,s3,-2036
	addw	a5,a5,s3
	srliw	s3,a5,9
	slliw	a5,a5,23
	or	a5,s3,a5
	addw	a5,s6,a5
	xor	s3,s6,a5
	sext.w	s3,s3
	xor	s3,s3,s4
	addw	s3,t4,s3
	addw	s10,s3,s10
	li	s3,-1530990592
	addiw	s3,s3,-1468
	addw	s10,s10,s3
	slliw	s3,s10,4
	srliw	s10,s10,28
	or	s10,s3,s10
	addw	s3,a5,s10
	xor	s10,a5,s3
	sext.w	s10,s10
	xor	s10,s10,s6
	addw	s10,a6,s10
	addw	s4,s10,s4
	li	s10,1272893440
	addiw	s10,s10,-87
	addw	s4,s4,s10
	slliw	s10,s4,11
	srliw	s4,s4,21
	or	s4,s10,s4
	addw	s10,s3,s4
	xor	s4,s3,s10
	sext.w	s4,s4
	xor	s4,s4,a5
	addw	s4,s1,s4
	addw	s6,s4,s6
	li	s4,-155496448
	addiw	s4,s4,-1184
	addw	s6,s6,s4
	slliw	s4,s6,16
	srliw	s6,s6,16
	or	s6,s4,s6
	addw	s4,s10,s6
	xor	s6,s10,s4
	sext.w	s6,s6
	xor	s6,s6,s3
	addw	s6,t5,s6
	addw	a5,s6,a5
	li	s6,-1094729728
	addiw	s6,s6,-912
	addw	a5,a5,s6
	srliw	s6,a5,9
	slliw	a5,a5,23
	or	a5,s6,a5
	addw	a5,s4,a5
	xor	s11,s4,a5
	sext.w	s11,s11
	xor	s11,s11,s10
	addw	s11,a7,s11
	addw	s3,s11,s3
	li	s11,681279488
	addiw	s11,s11,-314
	addw	s3,s3,s11
	slliw	s11,s3,4
	srliw	s3,s3,28
	or	s3,s11,s3
	addw	s11,a5,s3
	xor	s3,a5,s11
	sext.w	s3,s3
	xor	s3,s3,s4
	addw	s3,s2,s3
	addw	s10,s3,s10
	li	s3,-358539264
	addiw	s3,s3,2042
	addw	s10,s10,s3
	slliw	s3,s10,11
	srliw	s10,s10,21
	or	s10,s3,s10
	addw	s3,s11,s10
	xor	s6,s11,s3
	sext.w	s6,s6
	xor	s6,s6,a5
	addw	s6,t6,s6
	addw	s4,s6,s4
	li	s6,-722522112
	addiw	s6,s6,133
	addw	s4,s4,s6
	slliw	s6,s4,16
	srliw	s4,s4,16
	or	s4,s6,s4
	addw	s6,s3,s4
	xor	s10,s3,s6
	sext.w	s10,s10
	xor	s10,s10,s11
	addw	s10,t1,s10
	addw	a5,s10,a5
	li	s10,76029952
	addiw	s10,s10,-763
	addw	a5,a5,s10
	srliw	s10,a5,9
	slliw	a5,a5,23
	or	a5,s10,a5
	addw	s10,s6,a5
	xor	s4,s6,s10
	sext.w	s4,s4
	xor	s4,s4,s3
	addw	s4,a4,s4
	addw	s11,s4,s11
	li	s4,-640364544
	addiw	s4,s4,57
	addw	s11,s11,s4
	slliw	s4,s11,4
	srliw	s11,s11,28
	or	s11,s4,s11
	addw	s4,s10,s11
	xor	a5,s10,s4
	sext.w	a5,a5
	xor	a5,a5,s6
	addw	a5,t0,a5
	addw	s3,a5,s3
	li	a5,-421814272
	addiw	a5,a5,-1563
	addw	s3,s3,a5
	slliw	a5,s3,11
	srliw	s3,s3,21
	or	s3,a5,s3
	addw	s3,s4,s3
	xor	a5,s4,s3
	sext.w	a5,a5
	xor	a5,a5,s10
	addw	a5,a1,a5
	addw	s6,a5,s6
	li	a5,530743296
	addiw	a5,a5,-776
	addw	s6,s6,a5
	slliw	a5,s6,16
	srliw	s6,s6,16
	or	s6,a5,s6
	addw	s6,s3,s6
	xor	a5,s3,s6
	sext.w	a5,a5
	xor	a5,a5,s4
	addw	a5,a3,a5
	addw	s10,a5,s10
	li	a5,-995340288
	addiw	a5,a5,1637
	addw	a5,s10,a5
	srliw	s10,a5,9
	slliw	a5,a5,23
	or	a5,s10,a5
	addw	s10,s6,a5
	not	a5,s3
	sext.w	a5,a5
	or	a5,a5,s10
	sext.w	a5,a5
	xor	a5,a5,s6
	addw	s2,s2,a5
	addw	s4,s2,s4
	li	s2,-198631424
	addiw	s2,s2,580
	addw	s2,s4,s2
	slliw	s4,s2,6
	srliw	s2,s2,26
	or	s2,s4,s2
	addw	s4,s10,s2
	not	a5,s6
	sext.w	a5,a5
	or	a5,a5,s4
	sext.w	a5,a5
	xor	a5,a5,s10
	addw	s1,s1,a5
	addw	s3,s1,s3
	li	s1,1126891520
	addiw	s1,s1,-105
	addw	s3,s3,s1
	slliw	s2,s3,10
	srliw	s3,s3,22
	or	s3,s2,s3
	addw	s2,s4,s3
	not	a5,s10
	sext.w	a5,a5
	or	a5,a5,s2
	sext.w	a5,a5
	xor	a5,a5,s4
	addw	s0,s0,a5
	addw	s6,s0,s6
	li	s0,-1416355840
	addiw	s0,s0,935
	addw	s6,s6,s0
	slliw	s1,s6,15
	srliw	s6,s6,17
	or	s6,s1,s6
	addw	s1,s2,s6
	not	a5,s4
	sext.w	a5,a5
	or	a5,a5,s1
	sext.w	a5,a5
	xor	a5,a5,s2
	addw	t2,t2,a5
	addw	s10,t2,s10
	li	t2,-57434112
	addiw	t2,t2,57
	addw	s10,s10,t2
	srliw	s0,s10,11
	slliw	s10,s10,21
	or	s10,s0,s10
	addw	s0,s1,s10
	not	a5,s2
	sext.w	a5,a5
	or	a5,a5,s0
	sext.w	a5,a5
	xor	a5,a5,s1
	addw	a5,t0,a5
	addw	a5,a5,s4
	li	t0,1700487168
	addiw	t0,t0,-1597
	addw	a5,a5,t0
	slliw	t0,a5,6
	srliw	a5,a5,26
	or	a5,t0,a5
	addw	t0,s0,a5
	not	t2,s1
	sext.w	t2,t2
	or	t2,t2,t0
	sext.w	t2,t2
	xor	t2,t2,s0
	addw	t2,t6,t2
	addw	t2,t2,s2
	li	t6,-1894985728
	addiw	t6,t6,-878
	addw	t2,t2,t6
	slliw	t6,t2,10
	srliw	t2,t2,22
	or	t2,t6,t2
	addw	t6,t0,t2
	not	a5,s0
	sext.w	a5,a5
	or	a5,a5,t6
	sext.w	a5,a5
	xor	a5,a5,t0
	addw	a5,t5,a5
	addw	a5,a5,s1
	li	t5,-1052672
	addiw	t5,t5,1149
	addw	a5,a5,t5
	slliw	t5,a5,15
	srliw	a5,a5,17
	or	a5,t5,a5
	addw	t5,t6,a5
	not	a5,t0
	sext.w	a5,a5
	or	a5,a5,t5
	sext.w	a5,a5
	xor	a5,a5,t6
	addw	t4,t4,a5
	addw	t4,t4,s0
	li	a5,-2054922240
	addiw	a5,a5,-559
	addw	t4,t4,a5
	srliw	a5,t4,11
	slliw	t4,t4,21
	or	t4,a5,t4
	addw	a5,t5,t4
	not	t4,t6
	sext.w	t4,t4
	or	t4,t4,a5
	sext.w	t4,t4
	xor	t4,t4,t5
	addw	t3,t3,t4
	addw	t3,t3,t0
	li	t4,1873313792
	addiw	t4,t4,-433
	addw	t3,t3,t4
	slliw	t4,t3,6
	srliw	t3,t3,26
	or	t3,t4,t3
	addw	t3,a5,t3
	not	t4,t5
	sext.w	t4,t4
	or	t4,t4,t3
	sext.w	t4,t4
	xor	t4,t4,a5
	addw	a1,a1,t4
	addw	a1,a1,t6
	li	t4,-30613504
	addiw	t4,t4,1760
	addw	a1,a1,t4
	slliw	t4,a1,10
	srliw	a1,a1,22
	or	a1,t4,a1
	addw	a1,t3,a1
	not	t4,a5
	sext.w	t4,t4
	or	t4,t4,a1
	sext.w	t4,t4
	xor	t4,t4,t3
	addw	t1,t1,t4
	addw	t1,t1,t5
	li	t4,-1560199168
	addiw	t4,t4,788
	addw	t1,t1,t4
	slliw	t4,t1,15
	srliw	t1,t1,17
	or	t1,t4,t1
	addw	t1,a1,t1
	not	t4,t3
	sext.w	t4,t4
	or	t4,t4,t1
	sext.w	t4,t4
	xor	t4,t4,a1
	addw	a7,a7,t4
	addw	a7,a7,a5
	li	a5,1309151232
	addiw	a5,a5,417
	addw	a7,a7,a5
	srliw	a5,a7,11
	slliw	a7,a7,21
	or	a7,a5,a7
	addw	a7,t1,a7
	not	a5,a1
	sext.w	a5,a5
	or	a5,a5,a7
	sext.w	a5,a5
	xor	a5,a5,t1
	addw	a6,a6,a5
	addw	a6,a6,t3
	li	a5,-145522688
	addiw	a5,a5,-382
	addw	a6,a6,a5
	slliw	a5,a6,6
	srliw	a6,a6,26
	or	a6,a5,a6
	addw	a6,a7,a6
	not	a5,t1
	sext.w	a5,a5
	or	a5,a5,a6
	sext.w	a5,a5
	xor	a5,a5,a7
	addw	a2,a2,a5
	addw	a2,a2,a1
	li	a5,-1120210944
	addiw	a5,a5,565
	addw	a2,a2,a5
	slliw	a5,a2,10
	srliw	a2,a2,22
	or	a2,a5,a2
	addw	a2,a6,a2
	not	a5,a7
	sext.w	a5,a5
	or	a5,a5,a2
	sext.w	a5,a5
	xor	a5,a5,a6
	addw	a3,a3,a5
	addw	a3,a3,t1
	li	a5,718786560
	addiw	a5,a5,699
	addw	a3,a3,a5
	slliw	a5,a3,15
	srliw	a3,a3,17
	or	a3,a5,a3
	addw	a3,a2,a3
	not	a5,a6
	sext.w	a5,a5
	or	a5,a5,a3
	sext.w	a5,a5
	xor	a5,a5,a2
	addw	a4,a4,a5
	addw	a4,a4,a7
	li	a5,-343486464
	addiw	a5,a5,913
	addw	a4,a4,a5
	srliw	a5,a4,11
	slliw	a4,a4,21
	or	a4,a5,a4
	addw	a4,a3,a4
	addw	a6,s9,a6
	sw	a6,0(a0)
	addw	s5,s5,a4
	sw	s5,4(a0)
	addw	s7,s7,a3
	sw	s7,8(a0)
	addw	a2,s8,a2
	sw	a2,12(a0)
	ld	s0,88(sp)
	ld	s1,80(sp)
	ld	s2,72(sp)
	ld	s3,64(sp)
	ld	s4,56(sp)
	ld	s5,48(sp)
	ld	s6,40(sp)
	ld	s7,32(sp)
	ld	s8,24(sp)
	ld	s9,16(sp)
	ld	s10,8(sp)
	ld	s11,0(sp)
	addi	sp,sp,96
	jr	ra
	.size	caml_MD5Transform, .-caml_MD5Transform
	.section	.text.caml_MD5Update,"ax",@progbits
	.align	1
	.globl	caml_MD5Update
	.type	caml_MD5Update, @function
caml_MD5Update:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	sd	s4,0(sp)
	mv	s3,a0
	mv	s2,a1
	mv	s1,a2
	lw	a5,16(a0)
	slliw	a4,a2,3
	addw	a4,a4,a5
	sext.w	a3,a4
	sw	a4,16(a0)
	bgeu	a3,a5,.L5
	lw	a4,20(a0)
	addiw	a4,a4,1
	sw	a4,20(a0)
.L5:
	srli	a4,s1,29
	lw	a3,20(s3)
	addw	a4,a3,a4
	sw	a4,20(s3)
	srliw	a5,a5,3
	andi	a5,a5,63
	beq	a5,zero,.L9
	addi	s4,s3,24
	add	a0,s4,a5
	li	s0,64
	subw	a5,s0,a5
	slli	s0,a5,32
	srli	s0,s0,32
	bgtu	s0,s1,.L12
	mv	a2,s0
	mv	a1,s2
	call	memcpy
	mv	a1,s4
	mv	a0,s3
	call	caml_MD5Transform
	add	s2,s2,s0
	sub	s1,s1,s0
	j	.L9
.L12:
	mv	a2,s1
	mv	a1,s2
	call	memcpy
	j	.L4
.L10:
	addi	s0,s3,24
	li	a2,64
	mv	a1,s2
	mv	a0,s0
	call	memcpy
	mv	a1,s0
	mv	a0,s3
	call	caml_MD5Transform
	addi	s2,s2,64
	addi	s1,s1,-64
.L9:
	li	a5,63
	bgtu	s1,a5,.L10
	mv	a2,s1
	mv	a1,s2
	addi	a0,s3,24
	call	memcpy
.L4:
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	ld	s4,0(sp)
	addi	sp,sp,48
	jr	ra
	.size	caml_MD5Update, .-caml_MD5Update
	.section	.text.caml_MD5Final,"ax",@progbits
	.align	1
	.globl	caml_MD5Final
	.type	caml_MD5Final, @function
caml_MD5Final:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	mv	s1,a0
	mv	s0,a1
	lw	a5,16(a1)
	srliw	a5,a5,3
	andi	a4,a5,63
	addi	s2,a1,24
	add	a5,s2,a4
	addi	a0,a5,1
	li	a3,-128
	sb	a3,0(a5)
	li	a2,63
	subw	a2,a2,a4
	sext.w	a3,a2
	li	a5,7
	bgtu	a3,a5,.L14
	slli	a2,a2,32
	srli	a2,a2,32
	li	a1,0
	call	memset
	mv	a1,s2
	mv	a0,s0
	call	caml_MD5Transform
	li	a2,56
	li	a1,0
	mv	a0,s2
	call	memset
.L15:
	lw	a5,16(s0)
	sw	a5,80(s0)
	lw	a5,20(s0)
	sw	a5,84(s0)
	mv	a1,s2
	mv	a0,s0
	call	caml_MD5Transform
	li	a2,16
	mv	a1,s0
	mv	a0,s1
	call	memcpy
	li	a2,88
	li	a1,0
	mv	a0,s0
	call	memset
	ld	ra,24(sp)
	ld	s0,16(sp)
	ld	s1,8(sp)
	ld	s2,0(sp)
	addi	sp,sp,32
	jr	ra
.L14:
	li	a2,55
	subw	a2,a2,a4
	slli	a2,a2,32
	srli	a2,a2,32
	li	a1,0
	call	memset
	j	.L15
	.size	caml_MD5Final, .-caml_MD5Final
	.section	.text.caml_md5_string,"ax",@progbits
	.align	1
	.globl	caml_md5_string
	.type	caml_md5_string, @function
caml_md5_string:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	mv	s1,a0
	mv	s0,a1
	mv	s2,a2
	addi	a0,sp,8
	call	caml_MD5Init
	srai	a1,s0,1
	srai	a2,s2,1
	add	a1,a1,s1
	addi	a0,sp,8
	call	caml_MD5Update
	li	a0,16
	call	caml_alloc_string
	mv	s0,a0
	addi	a1,sp,8
	call	caml_MD5Final
	mv	a0,s0
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	addi	sp,sp,128
	jr	ra
	.size	caml_md5_string, .-caml_md5_string
	.section	.text.caml_md5_channel,"ax",@progbits
	.align	1
	.globl	caml_md5_channel
	.type	caml_md5_channel, @function
caml_md5_channel:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	sd	s1,120(sp)
	sd	s2,112(sp)
	sd	s3,104(sp)
	li	t1,-4096
	add	sp,sp,t1
	mv	s2,a0
	mv	s1,a1
	ld	a5,Caml_state
	ld	s3,280(a5)
	ld	a5,caml_channel_mutex_lock
	beq	a5,zero,.L20
	jalr	a5
.L20:
	li	a5,4096
	addi	a5,a5,8
	add	a0,sp,a5
	call	caml_MD5Init
	bge	s1,zero,.L21
.L23:
	li	a2,4096
	li	a1,-4096
	addi	a1,a1,-88
	li	s0,4096
	addi	a5,s0,96
	add	a5,a5,sp
	add	a1,a5,a1
	mv	a0,s2
	call	caml_getblock
	mv	a2,a0
	beq	a0,zero,.L22
	li	a1,-4096
	addi	a1,a1,-88
	addi	a5,s0,96
	add	a5,a5,sp
	add	a1,a5,a1
	addi	a5,s0,8
	add	a0,sp,a5
	call	caml_MD5Update
	j	.L23
.L24:
	li	a1,-4096
	addi	a1,a1,-88
	li	a5,4096
	addi	a5,a5,96
	add	a5,a5,sp
	add	a1,a5,a1
	mv	a0,s2
	call	caml_getblock
	mv	s0,a0
	beq	a0,zero,.L29
	mv	a2,a0
	li	a1,-4096
	addi	a1,a1,-88
	li	a4,4096
	addi	a5,a4,96
	add	a5,a5,sp
	add	a1,a5,a1
	addi	a5,a4,8
	add	a0,sp,a5
	call	caml_MD5Update
	sub	s1,s1,s0
.L21:
	ble	s1,zero,.L22
	mv	a2,s1
	li	a5,4096
	bleu	s1,a5,.L24
	li	a2,4096
	j	.L24
.L29:
	call	caml_raise_end_of_file
.L22:
	li	a0,16
	call	caml_alloc_string
	mv	s0,a0
	li	a5,4096
	addi	a5,a5,8
	add	a1,sp,a5
	call	caml_MD5Final
	ld	a5,caml_channel_mutex_unlock
	beq	a5,zero,.L27
	mv	a0,s2
	jalr	a5
.L27:
	ld	a5,Caml_state
	sd	s3,280(a5)
	mv	a0,s0
	li	t1,4096
	add	sp,sp,t1
	ld	ra,136(sp)
	ld	s0,128(sp)
	ld	s1,120(sp)
	ld	s2,112(sp)
	ld	s3,104(sp)
	addi	sp,sp,144
	jr	ra
	.size	caml_md5_channel, .-caml_md5_channel
	.section	.text.caml_md5_chan,"ax",@progbits
	.align	1
	.globl	caml_md5_chan
	.type	caml_md5_chan, @function
caml_md5_chan:
	addi	sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	a0,8(sp)
	sd	a1,0(sp)
	lla	s1,Caml_state
	ld	a5,0(s1)
	ld	s0,280(a5)
	sd	s0,16(sp)
	addi	a4,sp,16
	sd	a4,280(a5)
	li	a5,1
	sd	a5,32(sp)
	li	a5,2
	sd	a5,24(sp)
	addi	a5,sp,8
	sd	a5,40(sp)
	sd	sp,48(sp)
	srai	a1,a1,1
	ld	a0,8(a0)
	call	caml_md5_channel
	ld	a5,0(s1)
	sd	s0,280(a5)
	ld	ra,104(sp)
	ld	s0,96(sp)
	ld	s1,88(sp)
	addi	sp,sp,112
	jr	ra
	.size	caml_md5_chan, .-caml_md5_chan
	.section	.text.caml_md5_block,"ax",@progbits
	.align	1
	.globl	caml_md5_block
	.type	caml_md5_block, @function
caml_md5_block:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	mv	s0,a0
	mv	s1,a1
	mv	s2,a2
	addi	a0,sp,8
	call	caml_MD5Init
	mv	a2,s2
	mv	a1,s1
	addi	a0,sp,8
	call	caml_MD5Update
	addi	a1,sp,8
	mv	a0,s0
	call	caml_MD5Final
	ld	ra,120(sp)
	ld	s0,112(sp)
	ld	s1,104(sp)
	ld	s2,96(sp)
	addi	sp,sp,128
	jr	ra
	.size	caml_md5_block, .-caml_md5_block
	.ident	"GCC: (GNU) 9.2.0"