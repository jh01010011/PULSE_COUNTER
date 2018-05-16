timeunit 1ns;
timeprecision 1ps;

module FSM_tb;

logic PULSE;
logic SYS_CLK;
logic A_RESET;
logic INC;
logic SCLR;
logic LOAD;



// Unit Under Test port map
	FSM UUT (
		.PULSE(PULSE),
		.SYS_CLK(SYS_CLK),
		.A_RESET(A_RESET),
		.INC(INC),
		.SCLR(SCLR),
		.LOAD(LOAD));

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
	PULSE='b0;
	
	#500ns;
	PULSE=~PULSE;
	#1200ns;
	PULSE=~PULSE;
	#200ns;
	PULSE=~PULSE;
	#800ns;
	PULSE=~PULSE;
	#900ns;
	PULSE=~PULSE;
	end: INPUT_GENERATOR

initial
	begin: CONTROL
	A_RESET='b1;
	#100ns;
	A_RESET=~A_RESET;
	end: CONTROL	 
	
initial 
	begin: SYSTEM_RUN_TIME
	#RUN_TIME;
	$finish;
	end: SYSTEM_RUN_TIME

endmodule
