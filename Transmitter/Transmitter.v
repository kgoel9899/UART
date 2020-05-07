`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:09 01/19/2020 
// Design Name: 
// Module Name:    Transmitter 
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
module Transmitter(Tx_start, clk, rst, in, Tx_out);
input Tx_start, clk, rst;
input [7:0] in;
output Tx_out;
wire shift, load, piso_out, parity_out, baud_clk;
wire [1:0] sel;
parameter start_bit = 1'b0, stop_bit = 1'b1;
Baud_Gen b1(rst, clk, baud_clk);
PISO p1(in, baud_clk, rst, load, shift, piso_out);
Parity_Gen p2(in, parity_out);
Tx_FSM t1(Tx_start, baud_clk, rst, shift, load, sel);
MUX m1(start_bit, piso_out, parity_out, stop_bit, sel, Tx_out);
endmodule
