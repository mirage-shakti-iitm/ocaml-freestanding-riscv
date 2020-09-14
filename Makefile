.PHONY: all clean clean-configure mrproper install generate-asm generate-initial-cap-tee add-cap-files

include Makeconf

TOP=$(abspath .)
FREESTANDING_CFLAGS+=-isystem $(TOP)/nolibc/include
BUILD=$(abspath $(BUILD_PATH))

# ifeq ($(OCAML_GTE_4_07_0),yes)
FREESTANDING_LIBS=$(BUILD)/runtime/libasmrun.a \
		  $(BUILD)/nolibc/libnolibc.a
# endif

all: $(FREESTANDING_LIBS) ocaml-freestanding-riscv.pc libs cflags

add-cap-files:
	./choose_compartment_strategy.sh $(COMPARTMENT_STRATEGY_CHOICE)

nolibc: $(BUILD)/nolibc/libnolibc.a

asmrun: $(BUILD)/runtime/libasmrun.a

$(BUILD)/runtime/Makefile:
	mkdir -p $(BUILD)
	cp -r runtime $(BUILD)
	echo '#define HAS_GETTIMEOFDAY' >> $(BUILD)/runtime/caml/s.h
	echo '#define HAS_SECURE_GETENV' >> $(BUILD)/runtime/caml/s.h
	echo '#define HAS_TIMES' >> $(BUILD)/runtime/caml/s.h
	echo '#undef OCAML_OS_TYPE' >> $(BUILD)/runtime/caml/s.h
	echo '#define OCAML_OS_TYPE "None"' >> $(BUILD)/runtime/caml/s.h

# OCAML_CFLAGS=-O2 -fno-strict-aliasing -fwrapv -Wall -USYS_linux -DHAS_UNISTD $(FREESTANDING_CFLAGS) -mcmodel=medany
OCAML_CFLAGS=-O2 -fno-strict-aliasing -fwrapv -Wall -DHAS_UNISTD $(FREESTANDING_CFLAGS) -mcmodel=medany
$(BUILD)/runtime/libasmrun.a: $(BUILD)/runtime/Makefile $(OCAML_EXTRA_DEPS)
	$(MAKE) -C $(BUILD)/runtime UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" libasmrun.a


$(BUILD)/nolibc/Makefile:
	mkdir -p $(BUILD)
	cp -r nolibc $(BUILD)

NOLIBC_CFLAGS=$(FREESTANDING_CFLAGS)
$(BUILD)/nolibc/libnolibc.a: $(BUILD)/nolibc/Makefile 
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" libnolibc.a

generate-asm: $(BUILD)/nolibc/Makefile $(BUILD)/runtime/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" generate-asm
	$(MAKE) -C $(BUILD)/runtime UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" generate-asm

generate-initial-cap-tee: $(BUILD)/nolibc/Makefile $(BUILD)/runtime/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" generate-initial-cap-tee
	$(MAKE) -C $(BUILD)/runtime UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" generate-initial-cap-tee

ocaml-freestanding-riscv.pc: ocaml-freestanding-riscv.pc.in 
	sed -e 's!@@PKG_CONFIG_DEPS@@!$(PKG_CONFIG_DEPS)!' \
	    -e 's!@@PKG_CONFIG_EXTRA_LIBS@@!$(PKG_CONFIG_EXTRA_LIBS)!' \
	    ocaml-freestanding-riscv.pc.in > $@

libs: libs.tmp Makeconf
	sed -e 's!@@PKG_CONFIG_EXTRA_LIBS@@!$(PKG_CONFIG_EXTRA_LIBS)!' \
	    libs.tmp > libs.tmp2
	for PKG in $(PKG_CONFIG_DEPS); do \
		echo " " >> libs.tmp2;\
		env PKG_CONFIG_PATH=$(shell opam config var prefix)/share/pkgconfig pkg-config $$PKG --libs >> libs.tmp2;\
	done
	echo "("`cat libs.tmp2`")" > libs

cflags: cflags.tmp Makeconf
	for PKG in $(PKG_CONFIG_DEPS); do \
		echo " " >> cflags.tmp;\
		env PKG_CONFIG_PATH=$(shell opam config var prefix)/share/pkgconfig pkg-config $$PKG --cflags >> cflags.tmp;\
	done
	echo "("`cat cflags.tmp`")" > cflags

install: all
	./install.sh

uninstall:
	./uninstall.sh

clean-configure:
	rm -rf Makeconf ocaml-freestanding-riscv.pc

clean:
	rm -rf $(BUILD)/nolibc $(BUILD)/runtime

mrproper: clean clean-configure