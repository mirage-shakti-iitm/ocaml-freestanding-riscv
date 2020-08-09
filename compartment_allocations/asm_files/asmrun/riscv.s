# 1 "riscv.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "riscv.S"
# 37 "riscv.S"
        .option nopic


        .section .text


        .globl caml_system__code_begin
caml_system__code_begin:

        .align 2
        .globl caml_call_gc
        .type	caml_call_gc, @function
caml_call_gc:

        sd ra, caml_last_return_address, t0

        mv t1, sp
        sd sp, caml_bottom_of_stack, t0
.Lcaml_call_gc:



        addi sp, sp, -0x160
        mv s0, sp
        sd ra, 0x8(sp)
        sd s0, 0x0(sp)


        sd a0, 0x10(sp)
        sd a1, 0x18(sp)
        sd a2, 0x20(sp)
        sd a3, 0x28(sp)
        sd a4, 0x30(sp)
        sd a5, 0x38(sp)
        sd a6, 0x40(sp)
        sd a7, 0x48(sp)
        sd s2, 0x50(sp)
        sd s3, 0x58(sp)
        sd s4, 0x60(sp)
        sd s5, 0x68(sp)
        sd s6, 0x70(sp)
        sd s7, 0x78(sp)
        sd s8, 0x80(sp)
        sd s9, 0x88(sp)
        sd t2, 0x90(sp)
        sd t3, 0x98(sp)
        sd t4, 0xa0(sp)
        sd t5, 0xa8(sp)
        sd t6, 0xb0(sp)


        fsd ft0, 0xb8(sp)
        fsd ft1, 0xc0(sp)
        fsd ft2, 0xc8(sp)
        fsd ft3, 0xd0(sp)
        fsd ft4, 0xd8(sp)
        fsd ft5, 0xe0(sp)
        fsd ft6, 0xe8(sp)
        fsd ft7, 0xf0(sp)
        fsd fa0, 0xf8(sp)
        fsd fa1, 0x100(sp)
        fsd fa2, 0x108(sp)
        fsd fa3, 0x110(sp)
        fsd fa4, 0x118(sp)
        fsd fa5, 0x120(sp)
        fsd fa6, 0x128(sp)
        fsd fa7, 0x130(sp)
        fsd ft8, 0x138(sp)
        fsd ft9, 0x140(sp)
        fsd ft9, 0x148(sp)
        fsd ft10, 0x150(sp)
        fsd ft11, 0x158(sp)

        addi t1, sp, 16
        sd t1, caml_gc_regs, t0

        sd s10, caml_young_ptr, t0

        sd s1, caml_exception_pointer, t0

        call caml_garbage_collection

        ld a0, 0x10(sp)
        ld a1, 0x18(sp)
        ld a2, 0x20(sp)
        ld a3, 0x28(sp)
        ld a4, 0x30(sp)
        ld a5, 0x38(sp)
        ld a6, 0x40(sp)
        ld a7, 0x48(sp)
        ld s2, 0x50(sp)
        ld s3, 0x58(sp)
        ld s4, 0x60(sp)
        ld s5, 0x68(sp)
        ld s6, 0x70(sp)
        ld s7, 0x78(sp)
        ld s8, 0x80(sp)
        ld s9, 0x88(sp)
        ld t2, 0x90(sp)
        ld t3, 0x98(sp)
        ld t4, 0xa0(sp)
        ld t5, 0xa8(sp)
        ld t6, 0xb0(sp)
        fld ft0, 0xb8(sp)
        fld ft1, 0xc0(sp)
        fld ft2, 0xc8(sp)
        fld ft3, 0xd0(sp)
        fld ft4, 0xd8(sp)
        fld ft5, 0xe0(sp)
        fld ft6, 0xe8(sp)
        fld ft7, 0xf0(sp)
        fld fa0, 0xf8(sp)
        fld fa1, 0x100(sp)
        fld fa2, 0x108(sp)
        fld fa3, 0x110(sp)
        fld fa4, 0x118(sp)
        fld fa5, 0x120(sp)
        fld fa6, 0x128(sp)
        fld fa7, 0x130(sp)
        fld ft8, 0x138(sp)
        fld ft9, 0x140(sp)
        fld ft9, 0x148(sp)
        fld ft10, 0x150(sp)
        fld ft11, 0x158(sp)

        ld s10, caml_young_ptr
        ld s11, caml_young_limit

        ld ra, 0x8(sp)
        ld s0, 0x0(sp)
        addi sp, sp, 0x160
        ret
        .size caml_call_gc, .-caml_call_gc




        .align 2
        .globl caml_c_call
        .type	caml_c_call, @function
caml_c_call:

        mv s2, ra

        sd ra, caml_last_return_address, t0
        sd sp, caml_bottom_of_stack, t0

        sd s10, caml_young_ptr, t0
        sd s1, caml_exception_pointer, t0

        jalr t2

        ld s10, caml_young_ptr
        ld s11, caml_young_limit

        jr s2
        .size caml_c_call, .-caml_c_call


        .align 2
        .globl caml_raise_exn
        .type	caml_raise_exn, @function
caml_raise_exn:

        lw t1, caml_backtrace_active
        bnez t1, 2f
1:
        mv sp, s1

        ld t1, 8(sp)
        ld s1, 0(sp)
        addi sp, sp, 16
        jr t1
2:
        mv s2, a0

        mv a1, ra
        mv a2, sp
        mv a3, s1
        call caml_stash_backtrace

        mv a0, s2
        j 1b
        .size caml_raise_exn, .-caml_raise_exn

        .globl caml_reraise_exn
        .type	caml_reraise_exn, @function



        .align 2
        .globl caml_raise_exception
        .type	caml_raise_exception, @function
caml_raise_exception:
        ld s1, caml_exception_pointer
        ld s10, caml_young_ptr
        ld s11, caml_young_limit
        lw t1, caml_backtrace_active
        bnez t1, 2f
1:
        mv sp, s1
        ld t1, 8(sp)
        ld s1, 0(sp)
        addi sp, sp, 16
        jr t1
2:
        mv s2, a0
        ld a1, caml_last_return_address
        ld a2, caml_bottom_of_stack
        mv a3, s1
        call caml_stash_backtrace
        mv a0, s2
        j 1b
        .size caml_raise_exception, .-caml_raise_exception



        .align 2
        .globl caml_start_program
        .type	caml_start_program, @function
caml_start_program:

        la t2, caml_program



.Ljump_to_caml:

        addi sp, sp, -0xd0
        sd ra, 0xc0(sp)
        sd s0, 0x0(sp)
        sd s1, 0x8(sp)
        sd s2, 0x10(sp)
        sd s3, 0x18(sp)
        sd s4, 0x20(sp)
        sd s5, 0x28(sp)
        sd s6, 0x30(sp)
        sd s7, 0x38(sp)
        sd s8, 0x40(sp)
        sd s9, 0x48(sp)
        sd s10, 0x50(sp)
        sd s11, 0x58(sp)
        fsd fs0, 0x60(sp)
        fsd fs1, 0x68(sp)
        fsd fs2, 0x70(sp)
        fsd fs3, 0x78(sp)
        fsd fs4, 0x80(sp)
        fsd fs5, 0x88(sp)
        fsd fs6, 0x90(sp)
        fsd fs7, 0x98(sp)
        fsd fs8, 0xa0(sp)
        fsd fs9, 0xa8(sp)
        fsd fs10, 0xb0(sp)
        fsd fs11, 0xb8(sp)
        addi sp, sp, -32

        ld t1, caml_bottom_of_stack
        sd t1, 0(sp)
        ld t1, caml_last_return_address
        sd t1, 8(sp)
        ld t1, caml_gc_regs
        sd t1, 16(sp)

        addi sp, sp, -16
        ld t1, caml_exception_pointer
        sd t1, 0(sp)
        lla t0, .Ltrap_handler
        sd t0, 8(sp)
        mv s1, sp
        ld s10, caml_young_ptr
        ld s11, caml_young_limit
        sd x0, caml_last_return_address, t0
        jalr t2
.Lcaml_retaddr:
        ld t1, 0(sp)
        sd t1, caml_exception_pointer, t0
        addi sp, sp, 16
.Lreturn_result:
        ld t1, 0(sp)
        sd t1, caml_bottom_of_stack, t0
        ld t1, 8(sp)
        sd t1, caml_last_return_address, t0
        ld t1, 16(sp)
        sd t1, caml_gc_regs, t0
        addi sp, sp, 32

        sd s10, caml_young_ptr, t0

        ld ra, 0xc0(sp)
        ld s0, 0x0(sp)
        ld s1, 0x8(sp)
        ld s2, 0x10(sp)
        ld s3, 0x18(sp)
        ld s4, 0x20(sp)
        ld s5, 0x28(sp)
        ld s6, 0x30(sp)
        ld s7, 0x38(sp)
        ld s8, 0x40(sp)
        ld s9, 0x48(sp)
        ld s10, 0x50(sp)
        ld s11, 0x58(sp)
        fld fs0, 0x60(sp)
        fld fs1, 0x68(sp)
        fld fs2, 0x70(sp)
        fld fs3, 0x78(sp)
        fld fs4, 0x80(sp)
        fld fs5, 0x88(sp)
        fld fs6, 0x90(sp)
        fld fs7, 0x98(sp)
        fld fs8, 0xa0(sp)
        fld fs9, 0xa8(sp)
        fld fs10, 0xb0(sp)
        fld fs11, 0xb8(sp)
        addi sp, sp, 0xd0
        ret
.Ltrap_handler:
        sd s1, caml_exception_pointer, t0
        ori a0, a0, 2
        j .Lreturn_result
        .size caml_start_program, .-caml_start_program



        .align 2
        .globl caml_callback_exn
        .type	caml_callback_exn, @function
caml_callback_exn:

        mv t1, a0
        mv a0, a1
        mv a1, t1
        ld t2, 0(t1)
        j .Ljump_to_caml
        .size caml_callback_exn, .-caml_callback_exn

        .align 2
        .globl caml_callback2_exn
        .type	caml_callback2_exn, @function
caml_callback2_exn:

        mv t1, a0
        mv a0, a1
        mv a1, a2
        mv a2, t1
        la t2, caml_apply2
        j .Ljump_to_caml
        .size caml_callback2_exn, .-caml_callback2_exn

        .align 2
        .globl caml_callback3_exn
        .type	caml_callback3_exn, @function
caml_callback3_exn:


        mv t1, a0
        mv a0, a1
        mv a1, a2
        mv a2, a3
        mv a3, t1
        la t2, caml_apply3
        j .Ljump_to_caml
        .size caml_callback3_exn, .-caml_callback3_exn

        .align 2
        .globl caml_ml_array_bound_error
        .type	caml_ml_array_bound_error, @function
caml_ml_array_bound_error:

        la t2, caml_array_bound_error

        j caml_c_call

        .globl caml_system__code_end
caml_system__code_end:



        .section .data
        .align 3
        .globl caml_system__frametable
        .type	caml_system__frametable, @object
caml_system__frametable:
        .quad 1
        .quad .Lcaml_retaddr
        .short -1
        .short 0
        .align 3
        .size caml_system__frametable, .-caml_system__frametable
