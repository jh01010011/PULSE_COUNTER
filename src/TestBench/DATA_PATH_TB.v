timeunit 1ns;
timeprecision 1ps;

module DATA_PATH_tb;


//Internal signals declarations:
logic SCLR;
logic INC;
logic LOAD;
logic SYS_CLK;
logic [4:0]OUT_REG;



// Unit Under Test port map
	DATA_PATH UUT (
		.SCLR(SCLR),
		.INC(INC),
		.LOAD(LOAD),
		.SYS_CLK(SYS_CLK),
		.OUT_REG(OUT_REG));

time CLOCK_PERIOD=100ns;
time RUN_TIME=3600ns;

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
	begin: CONTROL
	SCLR=1'b1;
	LOAD=1'b0;
	INC=1'b0;
	#100ns;
	SCLR=1'b0;
	INC='b1;
	#3000ns;
	LOAD='b1;
	INC='b0;
	
	end: CONTROL	 
	
initial 
	begin: SYSTEM_RUN_TIME
	#RUN_TIME;
	$finish;
	end: SYSTEM_RUN_TIME

endmodule
