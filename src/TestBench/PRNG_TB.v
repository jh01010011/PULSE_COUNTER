timeunit 1ns;
timeprecision 1ps;

module PRNG_tb;

reg SCLR;
reg LOAD;
reg EN;
reg [3:0]SEED;
reg SYS_CLK;
wire [3:0]PRN;



// Unit Under Test port map
	PRNG UUT (
		.SCLR(SCLR),
		.LOAD(LOAD),
		.EN(EN),
		.SEED(SEED),
		.SYS_CLK(SYS_CLK),
		.PRN(PRN));

time CLOCK_PERIOD=100ns;
time RUN_TIME=10000ns;

initial
	begin: CLOCK_GENERATOR 
	SYS_CLK='b0;
	forever
	begin  
	
	#(CLOCK_PERIOD/2);
	SYS_CLK=~SYS_CLK;
	
	end
	end	:CLOCK_GENERATOR 
	
initial 
	begin: INPUT_GENERATOR
	SEED=4'b0101;
	
	fork 
	forever
	begin
	#5000ns;
	SEED=SEED+3;
	end	 
	join
	end: INPUT_GENERATOR

initial
	begin: CONTROL
	SCLR=1'b1;
	LOAD=1'b0;
	EN=1'b0;
	#100ns;
	SCLR=1'b0;
	LOAD='b1;
	EN=1'b0;
	#100ns;
	LOAD='b0;
	EN='b1;
	#4400ns;
	SCLR='b1;
	#4600ns;
	SCLR='b0;
	EN='b1;
	
	end: CONTROL	 
	
initial 
	begin: SYSTEM_RUN_TIME
	#RUN_TIME;
	$finish;
	end: SYSTEM_RUN_TIME

endmodule
