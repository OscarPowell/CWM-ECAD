//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Oscar Powell
// Date: 03/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////
module times_table(
	input clk,
	input [2:0] a,
	input [2:0] b,
	input enable,
	output [5:0] result );
	
	reg [5:0] address;	
	
	always @(a or b) begin
		address = {a,b};
	end

	blk_mem_gen_0 myBram (
  .clka(clk),   		 // input wire clka
  .ena(enable),     	 // input wire ena
  .wea(1),      		 // input wire [0 : 0] wea
  .addra(address[5:0]),  // input wire [5 : 0] addra
  .dina(6'b000000),      // input wire [5 : 0] dina
  .douta(result[5:0])    // output wire [5 : 0] douta
);
endmodule
