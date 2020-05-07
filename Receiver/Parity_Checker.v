`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:35 02/05/2020 
// Design Name: 
// Module Name:    Parity_Checker 
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
module Parity_Checker(in, parity_load, parity_bit, parity_out, out);
input [7:0] in;
input parity_bit, parity_load;
output parity_out;
output [7:0] out;
wire temp;
assign temp = ^in; // assign ke saath no reg ??
assign parity_out = (temp == parity_bit) ? ((parity_load == 1'b1) ? 1'b0 : parity_out) : parity_out;
assign out = in;
endmodule
