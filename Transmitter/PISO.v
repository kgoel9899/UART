`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:42 01/19/2020 
// Design Name: 
// Module Name:    PISO 
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
module PISO(in, clk, rst, load, shift, y);
input clk, rst, shift, load;
input [7:0] in;
reg [7:0] temp;
output reg y;
always @(posedge clk or negedge rst) begin
	if(rst == 1'b0) begin
		y <= 1'b0;
		temp <= 8'b0000_0000;
	end
	else if(shift == 1'b1) begin
		y <= temp[0];
		temp <= temp >> 1;
	end
	else if(load == 1'b1) begin
		temp <= in;
		y <= 1'bX;
	end
	else begin
		y <= y;
		temp <= temp;
	end
end
endmodule
