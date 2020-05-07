`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:18 01/19/2020 
// Design Name: 
// Module Name:    Receiver 
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
module Receiver(in, clk, out);
input in;
input clk;
output [7:0] out;
wire start_detected, parity_out, rst, shift, data_inp, parity_load, stop_enable, out1, baud_clk;
Baud_Gen b1(rst, clk, baud_clk);
Detect_Start d1(in, clk, start_detected);
SIPO s1(baud_clk, rst, shift, in, data_inp);
Rx_FSM r1(start_detected, parity_out, rst, baud_clk, shift, parity_load, stop_enable);
Parity_Checker p1(data_inp, parity_load, in, parity_out, out1);
stop_mod sm1(out1, stop_enable, out);
endmodule
