.phony: generate-asm generate-initial-cap-tee add-checkap

#Flags:
# FREESTANDING_CFLAGS=-ffreestanding -nostdinc -isystem /home/sai/.opam/4.11.1+shakti-tee/lib/pkgconfig/../../include/solo5-bindings-hvt/crt -I/home/sai/.opam/4.11.1+shakti-tee/lib/pkgconfig/../../include/solo5-bindings-hvt/solo5 -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/nolibc/include -include _freestanding/overrides.h -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/openlibm/src -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/openlibm/include" 
# cc -O2 -std=c99 -Wall -Wno-parentheses -Werror -ffreestanding -fstack-protector-strong -nostdinc -mstack-protector-guard=global -isystem /home/sai/.opam/4.11.1+shakti-tee/lib/pkgconfig/../../include/solo5-bindings-hvt/crt -I/home/sai/.opam/4.11.1+shakti-tee/lib/pkgconfig/../../include/solo5-bindings-hvt/solo5 -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/nolibc/include -include _freestanding/overrides.h -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/openlibm/src -I/home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-0.6.2/openlibm/include -fno-strict-aliasing   -c -o dtoa.o dtoa.c
# riscv64-unknown-elf-gcc -O2 -std=c99 -Wall -Wno-parentheses -Werror -I/home/sai/.opam/4.07.0/include -mcmodel=medany -Og -isystem /home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-riscv/nolibc/include


ifeq ($(FREESTANDING_CFLAGS),)
    $(error FREESTANDING_CFLAGS not set)
endif
ifeq ($(SYSDEP_OBJS),)
    $(error SYSDEP_OBJS not set)
endif

CC=clang
AR=riscv64-unknown-elf-ar

CFLAGS=-O2 -std=c99 -Wall -Wno-parentheses -Werror # -nostdinc
CFLAGS+=$(FREESTANDING_CFLAGS)
CFLAGS+=--gcc-toolchain=$(RISCV) -march=rv64gc

COMPARTMENT_FLAGS=-mllvm -enable-compartment-pass -mllvm -cap-file-path -mllvm /home/sai/Shakti-TEE-Practical/mirage-shakti/ocaml-freestanding-riscv/compartment_allocations/strategy_1/nolibc
CFLAGS+=$(COMPARTMENT_FLAGS)

ASM_FLAGS=

ASM_DEFINES=

ASM_INCLUDES=

C_DEFINES=

C_INCLUDES=

SRCS=ctype.c \
     dtoa.c \
     memchr.c memcmp.c memcpy.c memmove.c memset.c \
     strcmp.c strlen.c strtol.c strchr.c strchrnul.c strncpy.c stpncpy.c \
     strstr.c \
     stubs.c \
     vfprintf.c vsnprintf.c snprintf.c fprintf.c printf.c \
     strrchr.c strncmp.c strcspn.c \
     assert.c \
     sysdeps_riscv.c \
     craft.c debug.c

ASMS=ctype.s \
     dtoa.s \
     memchr.s memcmp.s memcpy.s memmove.s memset.s \
     strcmp.s strlen.s strtol.s strchr.s strchrnul.s strncpy.s stpncpy.s \
     strstr.s \
     stubs.s \
     vfprintf.s vsnprintf.s snprintf.s fprintf.s printf.s \
     strrchr.s strncmp.s strcspn.s \
     assert.s \
     sysdeps_riscv.s \
     craft.s debug.s

CAPS=ctype.cap \
     dtoa.cap \
     memchr.cap memcmp.cap memcpy.cap memmove.cap memset.cap \
     strcmp.cap strlen.cap strtol.cap strchr.cap strchrnul.cap strncpy.cap stpncpy.cap \
     strstr.cap \
     stubs.cap \
     vfprintf.cap vsnprintf.cap snprintf.cap fprintf.cap printf.cap \
     strrchr.cap strncmp.cap strcspn.cap \
     assert.cap \
     sysdeps_riscv.cap \
     craft.cap debug.cap

OBJS=ctype.o \
     dtoa.o \
     memchr.o memcmp.o memcpy.o memmove.o memset.o \
     strcmp.o strlen.o strtol.o strchr.o strchrnul.o strncpy.o stpncpy.o \
     strstr.o \
     stubs.o \
     vfprintf.o vsnprintf.o snprintf.o fprintf.o printf.o \
     strrchr.o strncmp.o strcspn.o \
     assert.o \
     craft.o debug.o

OBJS+=$(SYSDEP_OBJS)

dtoa.o: CFLAGS+=-fno-strict-aliasing

$(OBJS):%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

generate-asm: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -S

generate-initial-cap-tee: generate-asm $(ASMS)
	initial_cap_file_generator c 254 $(ASMS)

add-checkcap: $(ASMS)
	for f in $^; do postProcessing.py ./$$f; done

libnolibc.a: $(OBJS)
	$(AR) rcs $@ $(OBJS)
