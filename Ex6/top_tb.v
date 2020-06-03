//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
<<<<<<< HEAD
// Student Name: Oscar Powell
// Date: 02/06/2020
=======
// Student Name:
// Date: 
>>>>>>> upstream/master
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
<<<<<<< HEAD
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
		#30
		if(result != 3'b100) begin //by 4 iterations, should equal 4 on the dice
			err = 1;
			$display("***TEST FAILED, should equal 4 on the counter after 4 iterations ***");
		end
		sel = 1;	//switches to lights
		#20
		if(result != 3'b110) begin //waits 2 more iterations, should equal 110 on the lights
			err = 1;
			$display("***TEST FAILED, should be red and amber (110) in the lights after switching ***");
		end
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
=======

>>>>>>> upstream/master
