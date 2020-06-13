.PHONY: all clean clean-configure mrproper install generate-asm generate-initial-cap-tee

include Makeconf

TOP=$(abspath .)
FREESTANDING_CFLAGS+=-isystem $(TOP)/nolibc/include
BUILD=$(abspath $(BUILD_PATH))

ifeq ($(OCAML_GTE_4_07_0),yes)
FREESTANDING_LIBS=$(BUILD)/asmrun/libasmrun.a \
		  $(BUILD)/nolibc/libnolibc.a
endif

all: $(FREESTANDING_LIBS) ocaml-freestanding-riscv.pc libs cflags

nolibc: $(BUILD)/nolibc/libnolibc.a

asmrun: $(BUILD)/asmrun/libasmrun.a

$(BUILD)/asmrun/Makefile:
	mkdir -p build
	cp -r byterun/ $(BUILD)/asmrun
	cp -r asmrun/* $(BUILD)/asmrun


OCAML_CFLAGS=-O2 -fno-strict-aliasing -fwrapv -Wall -USYS_linux -DHAS_UNISTD $(FREESTANDING_CFLAGS) -mcmodel=medany
$(BUILD)/asmrun/libasmrun.a: $(BUILD)/asmrun/Makefile $(OCAML_EXTRA_DEPS)
ifeq ($(OCAML_GTE_4_07_0),yes)
	$(MAKE) -C $(BUILD)/asmrun UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" libasmrun.a
endif


$(BUILD)/nolibc/Makefile:
	mkdir -p $(BUILD)
	cp -r nolibc $(BUILD)
ifeq ($(OCAML_GTE_4_07_0),yes)
	echo '/* automatically added by configure.sh */' >> $(BUILD)/nolibc/stubs.c
	echo 'STUB_ABORT(caml_ba_map_file);' >> $(BUILD)/nolibc/stubs.c
endif

NOLIBC_CFLAGS=$(FREESTANDING_CFLAGS)
$(BUILD)/nolibc/libnolibc.a: $(BUILD)/nolibc/Makefile 
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" libnolibc.a

generate-asm: $(BUILD)/nolibc/Makefile $(BUILD)/asmrun/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" generate-asm
	$(MAKE) -C $(BUILD)/asmrun UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" generate-asm

generate-initial-cap-tee: $(BUILD)/nolibc/Makefile $(BUILD)/asmrun/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)" generate-initial-cap-tee
	$(MAKE) -C $(BUILD)/asmrun UNIX_OR_WIN32=unix OCAML_CFLAGS="$(OCAML_CFLAGS)" generate-initial-cap-tee

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
	rm -rf config Makeconf ocaml-freestanding-riscv.pc

clean:
	rm -rf $(BUILD)/nolibc $(BUILD)/asmrun

mrproper: clean clean-configure