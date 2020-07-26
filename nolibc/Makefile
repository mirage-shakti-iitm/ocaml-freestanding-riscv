.phony: generate-asm generate-initial-cap-tee add-checkap

ifeq ($(FREESTANDING_CFLAGS),)
    $(error FREESTANDING_CFLAGS not set)
endif
ifeq ($(SYSDEP_OBJS),)
    $(error SYSDEP_OBJS not set)
endif

CC=riscv64-unknown-elf-gcc
AR=riscv64-unknown-elf-ar

CFLAGS=-O2 -std=c99 -Wall -Wno-parentheses -Werror
CFLAGS+=$(FREESTANDING_CFLAGS)

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
     sysdeps_riscv.c

ASMS=ctype.s \
     dtoa.s \
     memchr.s memcmp.s memcpy.s memmove.s memset.s \
     strcmp.s strlen.s strtol.s strchr.s strchrnul.s strncpy.s stpncpy.s \
     strstr.s \
     stubs.s \
     vfprintf.s vsnprintf.s snprintf.s fprintf.s printf.s \
     strrchr.s strncmp.s strcspn.s \
     sysdeps_riscv.s

CAPS=ctype.cap \
     dtoa.cap \
     memchr.cap memcmp.cap memcpy.cap memmove.cap memset.cap \
     strcmp.cap strlen.cap strtol.cap strchr.cap strchrnul.cap strncpy.cap stpncpy.cap \
     strstr.cap \
     stubs.cap \
     vfprintf.cap vsnprintf.cap snprintf.cap fprintf.cap printf.cap \
     strrchr.cap strncmp.cap strcspn.cap \
     sysdeps_riscv.cap

OBJS=ctype.o \
     dtoa.o \
     memchr.o memcmp.o memcpy.o memmove.o memset.o \
     strcmp.o strlen.o strtol.o strchr.o strchrnul.o strncpy.o stpncpy.o \
     strstr.o \
     stubs.o \
     vfprintf.o vsnprintf.o snprintf.o fprintf.o printf.o \
     strrchr.o strncmp.o strcspn.o
OBJS+=$(SYSDEP_OBJS)

dtoa.o: CFLAGS+=-fno-strict-aliasing

$(OBJS):%.o: %.s
	$(CC) -g $(CFLAGS) -o $@ -c $<

generate-asm: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -S

generate-initial-cap-tee: generate-asm $(ASMS)
	initial_cap_file_generator c 254 $(ASMS)

add-checkcap: $(ASMS)
	for f in $^; do postProcessing.py ./$$f; done

libnolibc.a: generate-asm add-checkcap $(OBJS)
	$(AR) rcs $@ $(OBJS)
