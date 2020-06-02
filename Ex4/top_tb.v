//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Oscar Powell
// Date: 02/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    //Parameters
	parameter TEST_PERIOD = 160; //sets how long test runs for
	parameter CLK_PERIOD = 10; //clock period

	//Registers and wires
	reg clk;
    reg rst;
	reg button;
	reg err;
	wire [2:0] throw;

	//Clock generation
	initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

	//Logic to initialise variables and check the dice works
	initial begin
		rst = 1'b1; //starts by resetting dice
		button = 1'b1;
		err = 0;
		#10 rst = 1'b0; //sets back to zero
		#50				//after 6 clock iterations, dice should equal 6
		if(throw != 3'b110) begin
			$display("***Test failed. Should equal 6 after this long.***");
			err = 1'b1;
		end
		#50             //waits another 5 iterations, should equal 5
		if(throw != 3'b101) begin
			$display("***Test failed. Should equal 4 after this long.***");
			err = 1'b1;
		end
		button = 1'b0;
		#10 			//wait 1 iteration, check button works, should stay at 5
		if(throw != 3'b101) begin
			$display("***Test failed. Should equal 4 still.***");
			err = 1'b1;
		end
		
	end
		
	//Finish test, check for success
	initial begin
		#TEST_PERIOD
		if (err==0)
        	$display("***TEST PASSED! :) ***");
		$finish;
	end

	//Instantiate Dice module
	electronic_dice top(
		.rst (rst),
		.button (button),
		.clk (clk),
		.throw (throw[2:0])
		);

endmodule
