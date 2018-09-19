SRCS =  top.v decoder.v

TESTBENCH_MODS=decoder_tb top_tb
TESTBENCH=$(foreach M, $(TESTBENCH_MODS), $(M).v)

SHELL:=/bin/bash

PHONY: all $(TESTBENCH_MODS)

all: $(TESTBENCH_MODS)

module_test:
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "Please first run:"; fi '
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "    $$ module load Xilinx_Vivado"; fi '
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "Then restart the build process"; fi '
	@ command -v xvlog

$(TESTBENCH_MODS): module_test $(TESTBENCH)
	xvlog -sv $(SRCS) $(TESTBENCH)
	xelab --run $@ -debug typical -a

simv: module_test $(SRCS) $(TESTBENCH) 
	xvlog -sv $(SRCS) $(TESTBENCH)
	xelab testbench -debug typical -s $(TESTBENCH).snap
	xsim $(TESTBENCH).snap -gui

clean:
	rm -f *.jou *.log *.wdb *.pb *.str
	rm -rf xsim.dir .Xil axsim.sh
	rm -f output.txt
