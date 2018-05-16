timeunit 1ns;
timeprecision 1ps;

module TOP_HP (
	
	input logic PULSE,
	input logic SYS_CLK,
	input logic A_RESET,
	output logic [4:0] OUT_REG
);

logic INC, SCLR, LOAD;

FSM f1(.*);
DATA_PATH d1 (.*);

endmodule
