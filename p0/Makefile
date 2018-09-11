SRCS =  top.v 

TESTBENCH = top_tb.v

SHELL:=/bin/bash

module_test:
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "Please first run:"; fi '
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "    $$ module load Xilinx_Vivado"; fi '
	@ /bin/bash -c 'if [ ! -x "$$(command -v xelab)" ]; then echo "Then restart the build process"; fi '
	@ command -v xvlog

sim: module_test axsim.sh 
	./axsim.sh | tee output.txt
	grep 'Passed' output.txt

axsim.sh: module_test $(SRCS) $(TESTBENCH) 
	xvlog -sv $(SRCS) $(TESTBENCH)
	xelab testbench -debug typical -a

simv: module_test $(SRCS) $(TESTBENCH) 
	xvlog -sv $(SRCS) $(TESTBENCH)
	xelab testbench -debug typical -s $(TESTBENCH).snap
	xsim $(TESTBENCH).snap -gui

clean:
	rm -f *.jou *.log *.wdb *.pb *.str
	rm -rf xsim.dir .Xil axsim.sh
	rm -f output.txt
