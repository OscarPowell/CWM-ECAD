//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    input a,
    input b,
    input sel,
    output out
    );
    //SOLUTION WITH WIRE/ASSIGN, with delay
    //wire out;
    //assign #(5,5) out = sel?b:a;
    
    //SOLUTION WITH REG/IF STATEMENT, doesn't work with delay yet.
    reg out;
    always@(*)
    begin 
    if(sel)
	out = b;
    else
	out = a;
    end
              
      
endmodule
