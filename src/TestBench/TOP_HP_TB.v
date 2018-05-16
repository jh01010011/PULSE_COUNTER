timeunit 1ns;
timeprecision 1ps;

module TOP_HP_tb;


//Internal signals declarations:
logic PULSE;
logic SYS_CLK;
logic A_RESET;
logic [4:0]OUT_REG;



// Unit Under Test port map
	TOP_HP UUT (
		.PULSE(PULSE),
		.SYS_CLK(SYS_CLK),
		.A_RESET(A_RESET),
		.OUT_REG(OUT_REG));

time CLOCK_PERIOD=100ns;
time RUN_TIME=6000ns;

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
	PULSE='b0;
	#200ns;
	PULSE=~PULSE;
	#800ns;
	PULSE=~PULSE;
	#500ns;
	PULSE=~PULSE;
	#1200ns;
	PULSE=~PULSE;
	#400ns;
	PULSE=~PULSE;
	#1800ns;
	PULSE=~PULSE;
	
	
	
	end:   INPUT_GENERATOR

initial
	begin: CONTROL
	A_RESET=1'b1;
	#100ns;
	A_RESET=1'b0;
	#5500ns;
	A_RESET=1'b1;
	
	end: CONTROL	 
	
initial 
	begin: SYSTEM_RUN_TIME
	#RUN_TIME;
	$finish;
	end: SYSTEM_RUN_TIME

endmodule
