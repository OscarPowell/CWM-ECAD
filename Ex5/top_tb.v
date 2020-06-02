//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Oscar Powell
// Date: 02/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module top_tb(
		);
	//Parameters
    parameter CLK_PERIOD = 10; //clock period
	parameter TEST_PERIOD = 160; //sets how long test runs for

    //Registers and wires
    reg clk;
    reg err;
	wire red;
    wire amber;
    wire green;
    
	//Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
	
	//Stimulus logic
    initial begin
		err = 0;
		#CLK_PERIOD
		if({red,amber,green} != 3'b100) begin
			$display("***TEST FAILED! should be 100 1st in the cycle***");
			err = 1;
		end
		#CLK_PERIOD
		if({red,amber,green} != 3'b110) begin
			$display("***TEST FAILED! should be 110 2nd in the cycle***");
			err = 1;
		end
		#CLK_PERIOD
		if({red,amber,green} != 3'b001) begin
			$display("***TEST FAILED! should be 001 3rd in the cycle***");
			err = 1;
		end
		#CLK_PERIOD
		if({red,amber,green} != 3'b010) begin
			$display("***TEST FAILED! should be 010 4th in the cycle***");
			err = 1;
		end
		#CLK_PERIOD
		if({red,amber,green} != 3'b100) begin
			$display("***TEST FAILED! should go back to 100 in the cycle***");
			err = 1;
		end
	end

	//Finish simulation and check for success
    initial begin
    	#TEST_PERIOD 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
    end

	//Calling traffic lights module
	traffic_lights top(
		.clk (clk),
    	.red (red),
		.amber (amber),
		.green (green)
		);

endmodule
