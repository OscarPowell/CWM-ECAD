//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Oscar Powell
// Date: 02/06/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module top_tb(
	);
	//Parameters
	parameter TEST_PERIOD = 160; //sets how long test runs for
	parameter CLK_PERIOD = 10; //clock period

	//Registers and wires
	reg clk;
    reg rst;
	reg button;
	reg sel;
	reg err;
	wire [2:0] result;
	
	//Clock generation
	initial begin
        clk = 1'b0;
        forever
        	#(CLK_PERIOD/2) clk=~clk;
    end

	//Logic to initialise variables and check the device works
	initial begin
		err = 0;
		button = 1;
		sel = 0;
		rst = 1;
		#10 rst = 1'b0; //sets back to zero
		
	end	

	//Finish test, check for success
	initial begin
		#TEST_PERIOD
		if (err==0)
        	$display("***TEST PASSED! :) ***");
		$finish;
	end

	//Instantiate device module
	dice_lights_multiplexer top(
		.rst (rst),
		.clk (clk),
		.button (button),
		.sel (sel),
		.result (result[2:0]) );
endmodule
