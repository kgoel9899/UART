`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:51 01/19/2020 
// Design Name: 
// Module Name:    MUX 
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
module MUX(a, b, c, d, sel, out);
input a, b, c, d;
input [1:0] sel;
output out;
assign out = ((sel == 2'b00) ? a : ((sel == 2'b01) ? b : ((sel == 2'b10) ? c : ((sel == 2'b11) ? d : 1'b1))));
endmodule
