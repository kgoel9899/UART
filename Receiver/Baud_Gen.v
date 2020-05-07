`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:35 01/19/2020 
// Design Name: 
// Module Name:    Baud_Gen 
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
module Baud_Gen(rst, inp_clk, out_clk);
input inp_clk, rst;
output reg out_clk;
reg [15:0] count = 16'd1;
initial begin
	out_clk <= 1'b0;
end
always @(posedge inp_clk, negedge rst) begin
	if(!rst) begin
		out_clk <= 1'b0;
		count <= 16'd1;
	end
	else if(count == 16'd325) begin
		out_clk <= ~out_clk;
		count <= 16'd1;
	end
	else begin
		count <= count + 1;
		out_clk <= out_clk;
	end
end

endmodule
