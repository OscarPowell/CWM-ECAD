//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Oscar Powell
// Date: 02/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
module traffic_lights(
	//Ports
	input clk,
	output red,
	output amber,
	output green);

	//Registers state doesn't matter initially.
	reg red;
	reg amber;
	reg green;

	//Logic -> to simplify, green can only be alone and can't have all lights off. If in these states, it starts at red.
	//Starts cycling once within cycle
	always@(posedge clk) begin
		
		case({red,amber,green})//could add function to check all of these, then remove other case.
			3'b100: begin //Red light
				amber = 1;
			end
			3'b110: begin //Red and amber light
				red = 0;
				amber = 0;
				green = 1;
			end
			3'b001: begin //Green light
				amber = 1;
				green = 0;
			end
			3'b010: begin //Amber light
				red = 1;
				amber = 0;
			end
			default: begin //Any other state, sets to red light
				red = 1;
				amber = 0;
				green = 0;
			end
		endcase
	end

endmodule		
