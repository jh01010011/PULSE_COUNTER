timeunit 1ns;
timeprecision 1ps;

module TOP_TR (
	
	input logic PULSE_A,
	input logic PULSE_B,
	input logic SYS_CLK,
	input logic A_RESET,
	output logic [4:0] OUT_REG
);

logic INC, SCLR, LOAD;

FSM f1(.*);
DATA_PATH d1 (.*);

endmodule
