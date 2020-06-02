//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 Modified for Ex #6 to take 3 bits for output and input.
// Student Name: Oscar Powell
// Date: 02/06/2020


`timescale 1ns / 100ps

module mux(
    input [2:0] a,
    input [2:0] b,
    input sel,
    output [2:0] out
    );
    //SOLUTION WITH WIRE/ASSIGN, with delay
    wire [2:0] out;
    assign #(5,5) out = sel?b:a;
    
   
      
endmodule
