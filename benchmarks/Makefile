# Set the compiler to use gcc-9 and g++-9
CC := gcc-9
CXX := g++-9

include tools/scripts/env.makefile
ifeq ($(BENCHMARKS_ROOT),)
$(error "Error: The BENCHMARKS_ROOT environment variable is not set.")
endif
ifeq ($(SNIPER_ROOT),)
$(error "Error: The SNIPER_ROOT environment variable is not set.")
endif

.PHONY: all clean dependencies cpu2006_pinballs local_benchmarks

all: dependencies sniper
	make -C tools/hooks
	make -C splash2
#	make -C cpu2006_pinballs

local_benchmarks:
	# Paste the rules for building your local benchmarks here

cpu2006_pinballs:
	make -C cpu2006_pinballs

clean:
	make -C tools/hooks clean
	make -C splash2 clean
#	make -C cpu2006_pinballs clean

dependencies:
	$(BENCHMARKS_ROOT)/tools/scripts/checkdependencies.py

sniper:
	$(MAKE) -C $(SNIPER_ROOT)

