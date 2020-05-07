`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:24 02/08/2020 
// Design Name: 
// Module Name:    Detect_start 
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
module Detect_Start(in, clk, start_detected);
input in;
input clk;
output reg start_detected = 1'bX;
reg [15:0] tot_count = 16'd0;
reg [15:0] curr_count = 16'd0;
reg temp_start;
always @(posedge clk) begin
	if(tot_count == 16'd325) begin
		if(temp_start == 1)
			start_detected <= temp_start;
		tot_count <= 16'd0;
		curr_count <= 16'd0;
	end
	else begin
		if(curr_count == 16'd40) begin
			if(in == 0) begin
				if(temp_start == 1'b0)
					temp_start <= 0;
				else
					temp_start <= 1;
			end
			else
				temp_start <= 0;
			curr_count <= 16'd0;
		end
		else
			curr_count <= curr_count + 1;
		tot_count <= tot_count + 1;
	end
end	
endmodule