module decade_tb;

	reg clk = 0;
	reg reset = 0;
	reg enable = 0;
	wire Q0;
	wire Q1;
	wire Q2;
	wire Q3;
	wire Q4;
	wire Q5;
	wire Q6;
	wire Q7;
	wire Q8;
	wire Q9;
	
initial begin
	$dumpfile("decade_tb.dump");
	$dumpvars;
	
	#500 $finish;
end

	always #10 clk=!clk;

	decade_counter uut( 
		clk,
		enable,
		reset,
		Q0, 
		Q1,
		Q2,
		Q3,
		Q4,
		Q5,
		Q6,
		Q7,
		Q8,
		Q9
	);


endmodule
