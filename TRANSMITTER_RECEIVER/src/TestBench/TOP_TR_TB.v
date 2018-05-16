`timescale 1ps / 1ps
module TOP_TR_tb;


//Internal signals declarations:
logic PULSE_A;
logic PULSE_B;
logic SYS_CLK;
logic A_RESET;
logic [4:0]OUT_REG;



// Unit Under Test port map
	TOP_TR UUT (
		.PULSE_A(PULSE_A),
		.PULSE_B(PULSE_B),
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
	PULSE_A='b0;
	PULSE_B='b0;
	#200ns;
	PULSE_A=~PULSE_A;
	#800ns;
	PULSE_A=~PULSE_A;
	#500ns;
	PULSE_B=~PULSE_B;
	#1200ns;
	PULSE_B=~PULSE_B;
	
	
	
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
