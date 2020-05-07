`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:54 02/06/2020 
// Design Name: 
// Module Name:    stop_mod 
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
module stop_mod(parity_checker_output, stop_enable, out);
input [7:0] parity_checker_output;
input stop_enable;
output [7:0] out;
bufif1(out, parity_checker_output, stop_enable);
endmodule
