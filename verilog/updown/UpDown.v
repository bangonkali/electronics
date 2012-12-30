`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bangon Kali
// 
// Create Date:    11:19:04 12/19/2012 
// Design Name: 
// Module Name:    UpDown 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UpDown(
    reset,
    enable,
    clk,
    count
    );
	 
	input wire clk;
	input wire reset;
	input wire enable;
	output reg [4:0]count;
	reg count_state; // 1 => Up; 0 => Down
	
	always @(posedge clk) begin
		if (enable == 1 && reset == 0) begin
			if (count_state) begin
				count = count + 1;
				if (count == 15) begin
					count_state = 0;
				end
			end else begin
				count = count - 1;
				if (count == 0) begin
					count_state = 1;
				end
			end
		end else begin
			count = 0;
			count_state = 1;
		end
	end
endmodule