.PHONY: all clean clean-configure mrproper install generate-asm generate-initial-cap-tee add-cap-files

include Makeconf

TOP=$(abspath .)
BUILD=$(abspath $(BUILD_PATH))

FREESTANDING_LIBS=$(BUILD)/nolibc/libnolibc.a

all: add-cap-files $(FREESTANDING_LIBS)

add-cap-files:
	./choose_compartment_strategy.sh $(COMPARTMENT_STRATEGY_CHOICE)

nolibc: $(BUILD)/nolibc/libnolibc.a

$(BUILD)/nolibc/Makefile:
	mkdir -p $(BUILD)
	cp -r nolibc $(BUILD)

NOLIBC_CFLAGS=$(FREESTANDING_CFLAGS)
$(BUILD)/nolibc/libnolibc.a: $(BUILD)/nolibc/Makefile 
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" libnolibc.a

generate-asm: $(BUILD)/nolibc/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" generate-asm

generate-initial-cap-tee: $(BUILD)/nolibc/Makefile $(BUILD)/runtime/Makefile
	$(MAKE) -C $(BUILD)/nolibc "FREESTANDING_CFLAGS=$(NOLIBC_CFLAGS)" generate-initial-cap-tee

install: all
	./install.sh

clean-configure:
	rm -rf Makeconf

clean:
	rm -rf $(BUILD)
	rm -rf nolibc/*.cap
	rm -rf nolibc/*.s

mrproper: clean clean-configure
