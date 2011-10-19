`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Kinalibangon Digital
// Engineer: Bangon Kali (bangonkali@istoryahi.me)
// 
// Create Date: 21:16:54 10/19/2011 
// Design Name: simpsons_sensor
// Module Name: simpsons_sensor.v
// Project Name: simpsons
// Target Devices: 
// Tool versions: 
// Description: For more information, visit http://goo.gl/Ig6l4
//
// Dependencies: None
//
// Revision: 0.1.4.3
// Revision 0.01 - File Created
// Additional Comments: =P
//
// Repository  : at github http://goo.gl/0TyRj
//
//////////////////////////////////////////////////////////////////////////////////

module simpsons_sensor(
	input wire [1:0] G,
	input wire CLK,
	input wire RESET,
	output reg [1:0] LEVEL
);
	// VARS
	reg [5:0] STATE = 0;
	
	// STATES
	parameter NONE = 0;
	parameter BART = 1;
	parameter HOMER = 2;
	parameter BOTH = 3;
	
	// MINI-STATES
	parameter P01 = 4;
	parameter P02 = 5;
	parameter P03 = 6;
	parameter P04 = 7;
	parameter P05 = 8;
	parameter P06 = 9;
	parameter P07 = 10;
	parameter P08 = 11;
	parameter P09 = 12;
	parameter P10 = 13;
	parameter P11 = 14;
	parameter P12 = 15;
	parameter P13 = 16;
	parameter P14 = 17;
	parameter P15 = 18;
	parameter P16 = 19;
	
	always @ (posedge CLK or negedge CLK) 
		case (STATE)
			NONE: begin
				case (G)
					0: begin
						STATE <= NONE;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P07;
						LEVEL <= NONE;
					end
					2: begin
						STATE <= P01;
						LEVEL <= NONE;
					end
					3: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
				endcase
			end
			BART: begin
				case (G)
					0: begin
						STATE <= BART;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P16;
						LEVEL <= NONE;
					end
					2: begin
						STATE <= P08;
						LEVEL <= BART;
					end
					3: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
				endcase
			end
			HOMER: begin
				case (G)
					0: begin
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					1: begin
						STATE <= P14;
						LEVEL <= HOMER;
					end
					2: begin
						STATE <= P04;
						LEVEL <= NONE;
					end
					3: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
				endcase
			end
			BOTH: begin
				case (G)
					0: begin
						STATE <= BOTH;
						LEVEL <= BOTH;
					end
					1: begin
						STATE <= P15;
						LEVEL <= HOMER;
					end
					2: begin
						STATE <= P11;
						LEVEL <= BART;
					end
					3: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
				endcase
			end
			P01: begin
				case (G)
					0: begin
						STATE <= P02;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
					2: begin
						STATE <= P01;
						LEVEL <= NONE;
					end
					3: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
				endcase
			end
			P02: begin
				case (G)
					0: begin
						STATE <= P02;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
					2: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
					3: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
				endcase
			end
			P03: begin
				case (G)
					0: begin
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					1: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
					2: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
					3: begin
						STATE <= P03;
						LEVEL <= NONE;
					end
				endcase
			end
			P04: begin
				case (G)
					0: begin
						STATE <= P05;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P06;
						LEVEL <= NONE;
					end
					2: begin 
						STATE <= P04;
						LEVEL <= NONE;
					end
					3: begin
						STATE <= P06;
						LEVEL <= NONE;
					end
				endcase
			end
			P05: begin
				case (G)
					0: begin
						STATE <= P05;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P06;
						LEVEL <= NONE;
					end
					2: begin 
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					3: begin
						STATE <= P06;
						LEVEL <= NONE;
					end
				endcase
			end
			P06: begin
				case (G)
					0: begin
						STATE <= NONE;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P06;
						LEVEL <= NONE;
					end
					2: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					3: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
				endcase
			end
			P07: begin
				case (G)
					0: begin
						STATE <= BART;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P07;
						LEVEL <= NONE;
					end
					2: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
					3: begin // UNDEFINED
						STATE <= NONE;
						LEVEL <= NONE;
					end
				endcase
			end
			P08: begin
				case (G)
					0: begin
						STATE <= P09;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P10;
						LEVEL <= BART;
					end
					2: begin // UNDEFINED
						STATE <= P08;
						LEVEL <= BART;
					end
					3: begin // UNDEFINED
						STATE <= P10;
						LEVEL <= BART;
					end
				endcase
			end
			P09: begin
				case (G)
					0: begin
						STATE <= P09;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P10;
						LEVEL <= BART;
					end
					2: begin // UNDEFINED
						STATE <= BART;
						LEVEL <= BART;
					end
					3: begin // UNDEFINED
						STATE <= BART;
						LEVEL <= BART;
					end
				endcase
			end
			P10: begin
				case (G)
					0: begin
						STATE <= BOTH;
						LEVEL <= BOTH;
					end
					1: begin
						STATE <= P10;
						LEVEL <= BART;
					end
					2: begin // UNDEFINED
						STATE <= BART;
						LEVEL <= BART;
					end
					3: begin
						STATE <= P10;
						LEVEL <= BART;
					end
				endcase
			end
			P11: begin
				case (G)
					0: begin
						STATE <= P12;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P13;
						LEVEL <= BART;
					end
					2: begin 
						STATE <= P11;
						LEVEL <= BART;
					end
					3: begin
						STATE <= P13;
						LEVEL <= BART;
					end
				endcase
			end
			P12: begin
				case (G)
					0: begin
						STATE <= P12;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P13;
						LEVEL <= BART;
					end
					2: begin // UNDEFINED
						STATE <= BOTH;
						LEVEL <= BOTH;
					end
					3: begin
						STATE <= P13;
						LEVEL <= BART;
					end
				endcase
			end
			P13: begin
				case (G)
					0: begin
						STATE <= BART;
						LEVEL <= BART;
					end
					1: begin
						STATE <= P13;
						LEVEL <= BART;
					end
					2: begin // UNDEFINED
						STATE <= BOTH;
						LEVEL <= BOTH;
					end
					3: begin
						STATE <= P13;
						LEVEL <= BART;
					end
				endcase
			end
			P14: begin
				case (G)
					0: begin
						STATE <= BOTH;
						LEVEL <= BOTH;
					end
					1: begin
						STATE <= P14;
						LEVEL <= HOMER;
					end
					2: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					3: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
				endcase
			end
			P15: begin
				case (G)
					0: begin
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					1: begin
						STATE <= P15;
						LEVEL <= HOMER;
					end
					2: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
					3: begin // UNDEFINED
						STATE <= HOMER;
						LEVEL <= HOMER;
					end
				endcase
			end
			P16: begin
				case (G)
					0: begin
						STATE <= NONE;
						LEVEL <= NONE;
					end
					1: begin
						STATE <= P16;
						LEVEL <= NONE;
					end
					2: begin // UNDEFINED
						STATE <= BART;
						LEVEL <= BART;
					end
					3: begin // UNDEFINED
						STATE <= BART;
						LEVEL <= BART;
					end
				endcase
			end
		endcase
endmodule
