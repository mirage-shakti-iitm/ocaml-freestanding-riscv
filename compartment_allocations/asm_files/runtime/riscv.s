# 1 "riscv.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "riscv.S"
# 46 "riscv.S"
        .set domain_curr_field, 0



# 1 "../runtime/caml/domain_state.tbl" 1
# 17 "../runtime/caml/domain_state.tbl"
.equ domain_field_caml_young_ptr, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_limit, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_exception_pointer, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_young_base, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_start, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_end, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_alloc_start, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_alloc_end, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_alloc_mid, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_young_trigger, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_minor_heap_wsz, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_in_minor_collection, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_extra_heap_resources_minor, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_ref_table, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_ephe_ref_table, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_custom_table, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_stack_low, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stack_high, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stack_threshold, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_extern_sp, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_trapsp, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_trap_barrier, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_external_raise, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_exn_bucket, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_top_of_stack, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_bottom_of_stack, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_last_return_address, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_gc_regs, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_backtrace_active, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_backtrace_pos, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_backtrace_buffer, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_backtrace_last_exn, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_compare_unordered, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_requested_major_slice, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_requested_minor_gc, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_local_roots, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1

.equ domain_field_caml_stat_minor_words, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_promoted_words, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_major_words, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_minor_collections, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_major_collections, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_heap_wsz, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_top_heap_wsz, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_compactions, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_stat_heap_chunks, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1


.equ domain_field_caml_eventlog_startup_timestamp, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_eventlog_startup_pid, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_eventlog_paused, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_eventlog_enabled, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
.equ domain_field_caml_eventlog_out, domain_curr_field ; .set domain_curr_field, domain_curr_field + 1
# 51 "riscv.S" 2
# 60 "riscv.S"
        .option nopic



        .section .text


        .section .text.caml.caml_hot__code_begin,"ax",@progbits
        .globl caml_hot__code_begin
caml_hot__code_begin:

        .section .text.caml.caml_hot__code_end,"ax",@progbits
        .globl caml_hot__code_end
caml_hot__code_end:




        .globl caml_system__code_begin
caml_system__code_begin:

.section .text.caml.caml_call_gc,"ax",@progbits; .align 2; .globl caml_call_gc; .type caml_call_gc, @function; caml_call_gc:
.Lcaml_call_gc:

        sd ra, (8*domain_field_caml_last_return_address)(s0)

        sd sp, (8*domain_field_caml_bottom_of_stack)(s0)




        addi sp, sp, -0x160
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

        addi t1, sp, 0x10
        sd t1, (8*domain_field_caml_gc_regs)(s0)

        sd s10, (8*domain_field_caml_young_ptr)(s0)

        sd s1, (8*domain_field_caml_exception_pointer)(s0)

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

        ld s10, (8*domain_field_caml_young_ptr)(s0)
        ld s11, (8*domain_field_caml_young_limit)(s0)

        ld ra, 0x8(sp)
        ld s0, 0x0(sp)
        addi sp, sp, 0x160
        ret
        .size caml_call_gc, .-caml_call_gc




.section .text.caml.caml_c_call,"ax",@progbits; .align 2; .globl caml_c_call; .type caml_c_call, @function; caml_c_call:

        mv s2, ra

        sd ra, (8*domain_field_caml_last_return_address)(s0)
        sd sp, (8*domain_field_caml_bottom_of_stack)(s0)

        sd s10, (8*domain_field_caml_young_ptr)(s0)
        sd s1, (8*domain_field_caml_exception_pointer)(s0)

        jalr t2

        ld s10, (8*domain_field_caml_young_ptr)(s0)
        ld s11, (8*domain_field_caml_young_limit)(s0)

        jr s2
        .size caml_c_call, .-caml_c_call


.section .text.caml.caml_raise_exn,"ax",@progbits; .align 2; .globl caml_raise_exn; .type caml_raise_exn, @function; caml_raise_exn:

        ld t1, (8*domain_field_caml_backtrace_active)(s0)
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
        .type caml_reraise_exn, @function



.section .text.caml.caml_raise_exception,"ax",@progbits; .align 2; .globl caml_raise_exception; .type caml_raise_exception, @function; caml_raise_exception:
        mv s0, a0
        mv a0, a1
        ld s1, (8*domain_field_caml_exception_pointer)(s0)
        ld s10, (8*domain_field_caml_young_ptr)(s0)
        ld s11, (8*domain_field_caml_young_limit)(s0)
        ld t1, (8*domain_field_caml_backtrace_active)(s0)
        bnez t1, 2f
1:
        mv sp, s1
        ld t1, 8(sp)
        ld s1, 0(sp)
        addi sp, sp, 16
        jr t1
2:
        mv s2, a0
        ld a1, (8*domain_field_caml_last_return_address)(s0)
        ld a2, (8*domain_field_caml_bottom_of_stack)(s0)
        mv a3, s1
        call caml_stash_backtrace
        mv a0, s2
        j 1b
        .size caml_raise_exception, .-caml_raise_exception



.section .text.caml.caml_start_program,"ax",@progbits; .align 2; .globl caml_start_program; .type caml_start_program, @function; caml_start_program:
        mv t0, a0
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

        mv s0, t0

        ld t1, (8*domain_field_caml_bottom_of_stack)(s0)
        sd t1, 0(sp)
        ld t1, (8*domain_field_caml_last_return_address)(s0)
        sd t1, 8(sp)
        ld t1, (8*domain_field_caml_gc_regs)(s0)
        sd t1, 16(sp)

        addi sp, sp, -16
        ld t1, (8*domain_field_caml_exception_pointer)(s0)
        sd t1, 0(sp)
        lla t1, .Ltrap_handler
        sd t1, 8(sp)
        mv s1, sp
        ld s10, (8*domain_field_caml_young_ptr)(s0)
        ld s11, (8*domain_field_caml_young_limit)(s0)
        sd x0, (8*domain_field_caml_last_return_address)(s0)
        jalr t2
.Lcaml_retaddr:
        ld t1, 0(sp)
        sd t1, (8*domain_field_caml_exception_pointer)(s0)
        addi sp, sp, 16
.Lreturn_result:
        ld t1, 0(sp)
        sd t1, (8*domain_field_caml_bottom_of_stack)(s0)
        ld t1, 8(sp)
        sd t1, (8*domain_field_caml_last_return_address)(s0)
        ld t1, 16(sp)
        sd t1, (8*domain_field_caml_gc_regs)(s0)
        addi sp, sp, 32

        sd s10, (8*domain_field_caml_young_ptr)(s0)

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
        .type .Lcaml_retaddr, @function
        .size .Lcaml_retaddr, .-.Lcaml_retaddr
        .size caml_start_program, .-caml_start_program

        .align 2
.Ltrap_handler:
        sd s1, (8*domain_field_caml_exception_pointer)(s0)
        ori a0, a0, 2
        j .Lreturn_result
        .type .Ltrap_handler, @function
        .size .Ltrap_handler, .-.Ltrap_handler



.section .text.caml.caml_callback_asm,"ax",@progbits; .align 2; .globl caml_callback_asm; .type caml_callback_asm, @function; caml_callback_asm:


        mv t0, a0
        ld a0, 0(a2)

        ld t2, 0(a1)
        j .Ljump_to_caml
        .size caml_callback_asm, .-caml_callback_asm

.section .text.caml.caml_callback2_asm,"ax",@progbits; .align 2; .globl caml_callback2_asm; .type caml_callback2_asm, @function; caml_callback2_asm:


        mv t0, a0
        mv t1, a1
        ld a0, 0(a2)
        ld a1, 8(a2)
        mv a2, t1
        la t2, caml_apply2
        j .Ljump_to_caml
        .size caml_callback2_asm, .-caml_callback2_asm

.section .text.caml.caml_callback3_asm,"ax",@progbits; .align 2; .globl caml_callback3_asm; .type caml_callback3_asm, @function; caml_callback3_asm:


        mv t0, a0
        mv a3, a1
        ld a0, 0(a2)
        ld a1, 8(a2)
        ld a2, 16(a2)
        la t2, caml_apply3
        j .Ljump_to_caml
        .size caml_callback3_asm, .-caml_callback3_asm

.section .text.caml.caml_ml_array_bound_error,"ax",@progbits; .align 2; .globl caml_ml_array_bound_error; .type caml_ml_array_bound_error, @function; caml_ml_array_bound_error:

        la t2, caml_array_bound_error

        tail caml_c_call
        .size caml_ml_array_bound_error, .-caml_ml_array_bound_error

        .globl caml_system__code_end
caml_system__code_end:



        .section .data
        .align 3
        .globl caml_system__frametable
        .type caml_system__frametable, @object
caml_system__frametable:
        .quad 1
        .quad .Lcaml_retaddr
        .short -1
        .short 0
        .align 3
        .size caml_system__frametable, .-caml_system__frametable
