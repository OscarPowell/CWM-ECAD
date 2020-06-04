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

	reg [4:0] address;
	wire [5:0] ab;
	
	assign ab = {a,b};
	always@(posedge clk) begin
		case(ab)
			6'b001001: address = 3'd1;
			6'b010001: address = 3'd2;
			6'b011001: address = 3'd3;
			6'b100001: address = 3'd4;
			6'b101001: address = 3'd5;
			6'b110001: address = 3'd6;
			6'b111001: address = 3'd7;
			6'b010010: address = 3'd4;
			6'b011010: address = 3'd6;
			6'b100010: address = 3'd8;
			6'b101010: address = 3'd10; //(below: addresses-pink, actual numbers-blue
			6'b110010: address = 3'd11; //12
			6'b111010: address = 3'd12; //14
			6'b011011: address = 3'd9;
			6'b100011: address = 3'd11; //12
			6'b101011: address = 3'd13; //15
			6'b110011: address = 3'd15; //18
			6'b111011: address = 3'd17; //21
			6'b110011: address = 3'd14; //16
			6'b111011: address = 3'd16; //20
			6'b110011: address = 3'd18; //24
			6'b111011: address = 3'd20; //28
			6'b110011: address = 3'd19; //25
			6'b110011: address = 3'd21; //30
			6'b111011: address = 3'd22; //35
			6'b110011: address = 3'd23; //36
			6'b111011: address = 3'd24; //42
			6'b110011: address = 3'd25; //49
		endcase
	end

	mybram bram (
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra(address),  // input wire [4 : 0] addra
  .dina(6'b000000),    // input wire [5 : 0] dina
  .douta(result[5:0])  // output wire [5 : 0] douta
);
endmodule
