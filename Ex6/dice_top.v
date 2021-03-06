//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Oscar Powell
// Date: 02/06/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module electronic_dice(
    //ports 
    input rst,
    input button,
    input clk,
	output reg [2:0] throw );

	//logic
	always@(posedge clk) begin
		if(throw == 3'b000 || throw == 3'b111 || throw == 3'b110|| rst) begin
			throw = 3'b001;
		end
		else begin
			if(button) begin
				throw = throw + 1;
			end		
		end
	end
endmodule			

