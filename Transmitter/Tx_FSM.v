`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:20 02/05/2020 
// Design Name: 
// Module Name:    Tx_FSM 
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
module Tx_FSM(Tx_start, clk, rst, shift, load, sel);
input Tx_start, clk, rst;
output reg shift, load;
output reg [1:0] sel;
reg [2:0] state;
reg [2:0] next_state;
reg [3:0] count = 4'b0000;
parameter idle = 3'b000, start = 3'b001, data = 3'b010, parity = 3'b011, stop = 3'b100;
always @(Tx_start or state or count) begin
	case(state)
		idle: begin
			if(Tx_start == 1'b1 && count == 4'b0001) begin
				next_state <= start;
				shift <= 1'b0;
				load <= 1'b1;
				sel <= 2'b00;
			end
			else begin
				next_state <= idle;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b11;
			end
		end
		start: begin
			if(count == 4'b0010) begin
				shift <= 1'b1;
				load <= 1'b0;
				sel <= 2'b01;
				next_state <= data;
			end
			else begin
				next_state <= start;
				shift <= 1'b0;
				load <= 1'b1;
				sel <= 2'b00;
			end
		end
		data: begin
			if(count == 4'b1010) begin
				next_state <= parity;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b10;
			end
			else begin
				next_state <= data;
				shift <= 1'b1;
				load <= 1'b0;
				sel <= 2'b01;
			end
		end
		parity: begin
			if(count == 4'b1011) begin
				next_state <= stop;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b11;
			end
			else begin
				next_state <= parity;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b10;
			end
		end
		stop: begin
			if(count == 4'b1100) begin
				next_state <= idle;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b11;
			end
			else begin
				next_state <= stop;
				shift <= 1'b0;
				load <= 1'b0;
				sel <= 2'b11;
			end
		end
		default: begin
			next_state <= idle;
			shift <= 1'b0;
			load <= 1'b0;
			sel <= 2'b11;
		end
	endcase
end
always @(posedge clk, negedge rst) begin
	if(rst == 1'b0) begin
		state <= idle;
		count <= 4'b0001;
	end
	else if(count == 4'b1100) begin
		count <= 4'b0001;
		state <= idle;
	end
	else begin
		state <= next_state;
		count <= count + 1;
	end
end
endmodule