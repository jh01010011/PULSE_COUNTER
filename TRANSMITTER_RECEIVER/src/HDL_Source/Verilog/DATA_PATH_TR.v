timeunit 1ns;
timeprecision 1ps;

module DATA_PATH (
	input logic SCLR,
	logic INC,
	logic LOAD,
	logic SYS_CLK,
	output logic [4:0] OUT_REG
);	
logic[4:0] COUNT;
always_ff@(posedge SYS_CLK)
begin:COUNTER
	if(SCLR)COUNT<='b0;
	else if(INC)COUNT<=COUNT+1;
end:COUNTER	   

always_ff@(posedge SYS_CLK)
begin: STORE
	 if(LOAD)OUT_REG<=COUNT;
end: STORE
endmodule :DATA_PATH
