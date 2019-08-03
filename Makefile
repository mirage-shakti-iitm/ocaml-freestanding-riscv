.PHONY: all clean clean-configure mrproper install

include Makeconf

TOP=$(abspath .)
FREESTANDING_CFLAGS+=-isystem $(TOP)/nolibc/include
BUILD=$(abspath $(BUILD_PATH))

ifeq ($(OCAML_GTE_4_07_0),yes)
FREESTANDING_LIBS=$(BUILD)/ocaml/asmrun/libasmrun.a \
		  $(BUILD)/nolibc/libnolibc.a
else
FREESTANDING_LIBS=$(BUILD)/ocaml/asmrun/libasmrun.a \
		  $(BUILD)/ocaml/otherlibs/libotherlibs.a \
		  $(BUILD)/nolibc/libnolibc.a
endif

all: $(FREESTANDING_LIBS) ocaml-freestanding-riscv.pc files/libs files/cflags

nolibc: $(BUILD)/nolibc/libnolibc.a

asmrun: $(BUILD)/ocaml/asmrun/libasmrun.a

$(BUILD)/ocaml/Makefile:
	mkdir -p build
	cp -r $(OCAML_SRC_DIR) $(BUILD)/ocaml

$(BUILD)/ocaml/config/Makefile: $(BUILD)/ocaml/Makefile
ifeq ($(OCAML_GTE_4_06_0),yes)
	cp config/s.h $(BUILD)/ocaml/byterun/caml/s.h
	cp config/m.$(BUILD_ARCH).h $(BUILD)/ocaml/byterun/caml/m.h
else
	cp config/s.h $(BUILD)/ocaml/config/s.h
	cp config/m.$(BUILD_ARCH).h $(BUILD)/ocaml/config/m.h
endif
	cp config/Makefile.$(BUILD_OS).$(BUILD_ARCH) $(BUILD)/ocaml/config/Makefile

# Needed for OCaml >= 4.03.0, triggered by OCAML_EXTRA_DEPS via Makeconf
$(BUILD)/ocaml/byterun/caml/version.h: $(BUILD)/ocaml/config/Makefile
	$(BUILD)/ocaml/tools/make-version-header.sh > $@

OCAML_CFLAGS=-O2 -fno-strict-aliasing -fwrapv -Wall -USYS_linux -DHAS_UNISTD $(FREESTANDING_CFLAGS) -mcmodel=medany
$(BUILD)/ocaml/asmrun/libasmrun.a: $(BUILD)/ocaml/config/Makefile $(OCAML_EXTRA_DEPS)
ifeq ($(OCAML_GTE_4_06_0),yes)
	$(MAKE) -C $(BUILD)/ocaml/asmrun \
	    UNIX_OR_WIN32=unix \
	    CFLAGS="$(OCAML_CFLAGS)" \
	    libasmrun.a
else
	$(MAKE) -C $(BUILD)/ocaml/asmrun \
	    UNIX_OR_WIN32=unix \
	    NATIVECCCOMPOPTS="$(OCAML_CFLAGS)" \
	    NATIVECCPROFOPTS="$(OCAML_CFLAGS)" \
	    libasmrun.a
endif

$(BUILD)/ocaml/otherlibs/libotherlibs.a: $(BUILD)/ocaml/config/Makefile
ifeq ($(OCAML_GTE_4_06_0),yes)
	$(MAKE) -C $(BUILD)/ocaml/otherlibs/bigarray \
	    OUTPUTOBJ=-o \
	    CFLAGS="$(FREESTANDING_CFLAGS) -DIN_OCAML_BIGARRAY -I../../byterun" \
	    bigarray_stubs.o mmap_ba.o mmap.o
	$(AR) rcs $@ \
	    $(BUILD)/ocaml/otherlibs/bigarray/bigarray_stubs.o \
	    $(BUILD)/ocaml/otherlibs/bigarray/mmap_ba.o \
	    $(BUILD)/ocaml/otherlibs/bigarray/mmap.o
else
	$(MAKE) -C $(BUILD)/ocaml/otherlibs/bigarray \
	    CFLAGS="$(FREESTANDING_CFLAGS) -I../../byterun" \
	    bigarray_stubs.o mmap_unix.o
	$(AR) rcs $@ \
	    $(BUILD)/ocaml/otherlibs/bigarray/bigarray_stubs.o \
	    $(BUILD)/ocaml/otherlibs/bigarray/mmap_unix.o
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
	$(MAKE) -C $(BUILD)/nolibc \
	    "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" \
	    "SYSDEP_OBJS=$(NOLIBC_SYSDEP_OBJS)"

ocaml-freestanding-riscv.pc: ocaml-freestanding-riscv.pc.in 
	sed -e 's!@@PKG_CONFIG_DEPS@@!$(PKG_CONFIG_DEPS)!' \
	    -e 's!@@PKG_CONFIG_EXTRA_LIBS@@!$(PKG_CONFIG_EXTRA_LIBS)!' \
	    ocaml-freestanding-riscv.pc.in > $@

files/libs: libs.tmp Makeconf
	sed -e 's!@@PKG_CONFIG_EXTRA_LIBS@@!$(PKG_CONFIG_EXTRA_LIBS)!' \
	    libs.tmp > libs.tmp2
	for PKG in $(PKG_CONFIG_DEPS); do \
		echo " " >> libs.tmp2;\
		env PKG_CONFIG_PATH=$(shell opam config var prefix)/share/pkgconfig pkg-config $$PKG --libs >> libs.tmp2;\
	done
	echo "("`cat libs.tmp2`")" > files/libs

files/cflags: cflags.tmp Makeconf
	for PKG in $(PKG_CONFIG_DEPS); do \
		echo " " >> cflags.tmp;\
		env PKG_CONFIG_PATH=$(shell opam config var prefix)/share/pkgconfig pkg-config $$PKG --cflags >> cflags.tmp;\
	done
	echo "("`cat cflags.tmp`")" > files/cflags

install: all
	./install.sh

uninstall:
	./uninstall.sh

clean-configure:
	rm -rf config Makeconf ocaml-freestanding-riscv.pc

clean:
	rm -rf $(BUILD)/nolibc $(BUILD)/ocaml/

mrproper: clean clean-configure
