`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:03:01 02/06/2020 
// Design Name: 
// Module Name:    Rx_FSM 
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
module Rx_FSM(start_detected, parity_error, rst, clk, shift, parity_load, stop_enable);
input start_detected, parity_error, rst, clk;
output reg shift, parity_load, stop_enable;
reg [1:0] state;
reg [1:0] next_state;
reg [3:0] count = 4'b0000;
parameter idle = 2'b00, data = 2'b01, parity = 2'b10, stop = 2'b11;
always @(start_detected or state or count or parity_error) begin
	case(state)
		idle: begin
			if(start_detected == 1'b1 && count == 4'b0001) begin
				next_state <= data;
				shift <= 1'b1;
				parity_load <= 1'b0;
				stop_enable <= 1'b0;
			end
			else begin
				next_state <= idle;
				shift <= 1'b0;
				parity_load <= 1'b0;
				stop_enable <= 1'b0;
			end
		end
		data: begin
			if(count == 4'b1001) begin
				next_state <= parity;
				shift <= 1'b0;
				parity_load <= 1'b1;
				stop_enable <= 1'b0;
			end
			else begin
				next_state <= data;
				shift <= 1'b1;
				parity_load <= 1'b0;
				stop_enable <= 1'b0;
			end
		end
		parity: begin
			if(count == 4'b1010) begin
				if(parity_error == 1'b1) begin
					next_state <= idle;
					shift <= 1'b0;
					parity_load <= 1'b0;
					stop_enable <= 1'b0;
				end
				else begin
					next_state <= stop;
					shift <= 1'b0;
					parity_load <= 1'b0;
					stop_enable <= 1'b1;
				end
			end
			else begin
				next_state <= parity;
				shift <= 1'b0;
				parity_load <= 1'b1;
				stop_enable <= 1'b0;
			end
		end
		stop: begin
			if(count == 4'b1011) begin
				next_state <= idle;
				shift <= 1'b0;
				parity_load <= 1'b0;
				stop_enable <= 1'b0;
			end
			else begin
				next_state <= stop;
				shift <= 1'b0;
				parity_load <= 1'b0;
				stop_enable <= 1'b1;
			end
		end
		default: begin
			next_state <= idle;
			shift <= 1'b0;
			parity_load <= 1'b0;
			stop_enable <= 1'b0;
		end
	endcase
end
always @(posedge clk, negedge rst) begin
	if(rst == 1'b0) begin
		state <= idle;
		count <= 4'b0001;
	end
	else if(parity_error == 1'b1) begin
		state <= idle;
		count <= 4'b0001;
	end
	else if(count == 4'b1011) begin
		state <= idle;
		count <= 4'b0001;
	end
	else begin
		state <= next_state;
		count <= count + 1;
	end
end
endmodule
