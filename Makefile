.PHONY: all clean clean-configure mrproper install generate-asm generate-initial-cap-tee add-cap-files

include Makeconf

TOP=$(abspath .)
FREESTANDING_CFLAGS+=-isystem $(TOP)/nolibc/include
BUILD=$(abspath $(BUILD_PATH))

# ifeq ($(OCAML_GTE_4_07_0),yes)
FREESTANDING_LIBS=$(BUILD)/runtime/libasmrun.a \
		  $(BUILD)/nolibc/libnolibc.a
# endif

all: $(FREESTANDING_LIBS) ocaml-freestanding-riscv.pc flags/libs flags/cflags

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
OCAML_CFLAGS=-O2 -fno-strict-aliasing -fwrapv -Wall -DSYS_linux -DHAS_UNISTD $(FREESTANDING_CFLAGS) -mcmodel=medany
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

flags/libs.tmp: flags/libs.tmp.in
	opam config subst $@

flags/libs: flags/libs.tmp Makeconf
	env PKG_CONFIG_PATH="$(shell opam config var prefix)/riscv-sysroot/lib/pkgconfig" \
	    pkg-config $(PKG_CONFIG_DEPS) --libs >> $<
	awk -v RS= -- '{ \
	    sub("@@PKG_CONFIG_EXTRA_LIBS@@", "$(PKG_CONFIG_EXTRA_LIBS)", $$0); \
	    print "(", $$0, ")" \
	    }' $< >$@

flags/cflags.tmp: flags/cflags.tmp.in
	opam config subst $@

flags/cflags: flags/cflags.tmp Makeconf
	env PKG_CONFIG_PATH="$(shell opam config var prefix)/riscv-sysroot/lib/pkgconfig" \
	    pkg-config $(PKG_CONFIG_DEPS) --cflags >> $<
	awk -v RS= -- '{ \
	    print "(", $$0, ")" \
	    }' $< >$@


install: all
	./install.sh

uninstall:
	./uninstall.sh

clean-configure:
	rm -rf Makeconf ocaml-freestanding-riscv.pc

clean:
	rm -rf $(BUILD)/nolibc $(BUILD)/runtime

mrproper: clean clean-configure