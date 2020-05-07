`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:29 01/19/2020 
// Design Name: 
// Module Name:    SIPO 
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
module SIPO(clk, rst, shift, in, out);
input in, clk, rst, shift;
output reg [7:0] out;
always @(posedge clk or negedge rst) begin
	if(rst == 1'b0)
		out <= 8'b0000_0000;
	else if(shift == 1'b1) begin
		out <= out >> 1'b1;
		out[7] <= in;
	end
	else
		out <= out;
end
endmodule
