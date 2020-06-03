//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
<<<<<<< HEAD
// Student Name: Oscar Powell
// Date: 02/06/2020
=======
// Student Name:
// Date: 
>>>>>>> upstream/master
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
<<<<<<< HEAD
module dice_lights_multiplexer(
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0] result
	);
	
	//Registers/wires
	wire [2:0] result;
	wire red;
	wire amber;
	wire green;
	wire [2:0] throw;


	//Instance of traffic lights
	traffic_lights lights(
		.clk (clk),
		.red (red),
		.amber (amber),
		.green (green) );

	//Instance of dice
	electronic_dice dice(
		.button (button), 
		.clk (clk), 	
		.rst (rst),
		.throw (throw[2:0]) );
	
	//Instance of multiplexer
	mux multiplexer(
    	.a (throw [2:0]),
    	.b ({red,amber,green}),
    	.sel (sel),
     	.out (result [2:0])
     	);

	
endmodule	
=======
>>>>>>> upstream/master

