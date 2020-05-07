`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:20 01/19/2020 
// Design Name: 
// Module Name:    Parity_Gen 
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
module Parity_Gen(in, out);
input [7:0] in;
output out;
assign out = ^in;
endmodule
