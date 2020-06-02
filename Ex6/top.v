//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Oscar Powell
// Date: 02/06/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
module dice_lights_multiplexer(
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0] result
	);
	
	//Registers/wires
	reg [2:0] result;

	//Logic
	always@(posedge clk) begin
		//case(
	end

	//Instance of traffic lights
	traffic_lights lights(.clk (clk) );

	//Instance of dice
	electronic_dice dice(.button (button), .clk (clk), .rst (rst));
endmodule	

