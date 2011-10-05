One input, one output serial 2's complementer.

Design a one input, one output serial 2's complementer. The circuit accepts a string of bits from the input and generates the 2's complement at the output. The circuit can be reset asynchronously to start and end the operation.

Required:

a.) Show the design process and the final logic circuit.
b.) Simulate your circuit using your preferred simulator. Attach screenshots and/or simulation file.

Usage:

To compile, use iVerilog for Windows. More information from http://goo.gl/kXqTY.

Compilation Command:
iVerilog dff_async_reset.v compliment.v compliment_tb.v -o compliment_tb.vvp

Simulation Command:
vvp compliment_tb.vvp -vcd

Show wave:
GTKWave compliment_tb.dump

For more info: bangonkali@istoryahi.me
Mobile: +639993192420