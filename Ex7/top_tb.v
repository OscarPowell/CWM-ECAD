//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
module top_tb(  );

	//Parameters
	parameter TEST_PERIOD = 160; //sets how long test runs for
	parameter CLK_PERIOD = 10; //clock period

	//Registers and wires
	reg clk;
    reg [2:0] a;
	reg [2:0] b;
	reg err;
	reg enable;
	wire [5:0] result;

	//Clock generation
	initial begin
        clk = 1'b0;
        forever
        	#(CLK_PERIOD/2) clk=~clk;
    end

	//Logic to initialise variables and check the device works
	initial begin
		err <= 0;
		enable <= 1;
		a = 3'b001;
		b = 3'b001;
		#5
		if(result != 2'd49) begin
			$display("***TEST FAILED! Answer was %b, should be 49 ***",result);
			err = 1;
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
	times_table top(
		.clk (clk),
		.a (a[2:0]),
		.b (b[2:0]),
		.enable (enable),
		.result (result[5:0]) );

endmodule
