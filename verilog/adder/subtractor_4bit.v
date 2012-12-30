// Performs the operation A-B
module subtractor_4bit
(
 input  [3:0] A,
 input  [3:0] B,
 output [3:0] diff,
 output c_out
 );
 
wire [3:0]		B2Comp;
wire 			COUT;
 
adder_4bit twocomp
(
 ~B,
 4'b1,
 0,
 B2Comp,
 COUT
 );
 
adder_4bit subtract
(
 A,
 B2Comp,
 0,
 diff,
 c_out
 );
 
endmodule