Johannah Mae D. Abestano 
EE 177 Activities


activity 1 fulladder
unit: fulladder.v
testbench: fulladder_tb.v
dependencies: none // depende sa circuit
wave dump: adder_tb.dump // naa sa fulladder.tb
compiled: adder_tb.vvp // ikaw buot

activity 2 adder_4bit/subtractor_4bit
unit: addsub_4bit.v
testbench: addsub_4bit_tb.v
dependencies: fulladder.v
wave dump: addsub_4bit_tb.dump
compiled: addsub_4bit_tb.vvp

activity 3 multiplier
unit: mult.v
testbench: mult_tb.v
dependencies: none
wave dump: mult_tb.dump
compiled: mult_tb.vvp

steps in simulation
1. compile. command:
iverilog UNIT [TESTBENCH] [DEPENDENCIES...] -o [TESTBENCH].VVP

2. simulate and save wave dump
vvp TESTBENCH.VVP -vcd
-vcd means, create dump files.

3. show wave
gtkwave TESTBENCH.DUMP

check accompanying video for example.

-gm