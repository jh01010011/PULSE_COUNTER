timeunit 1ns;
timeprecision 1ps;


extern module PRNG (
	input logic SCLR,
	logic LOAD,
	logic EN,
	logic [3:0] SEED,
	logic SYS_CLK,
	output logic[3:0] PRN
);


module PRNG(.*); 

always_ff@(posedge SYS_CLK)
begin
	if(SCLR)
	PRN<=4'b0001; 
	else if(LOAD) 
	PRN<=SEED;
	else if(EN) PRN<={PRN[2:0],(PRN[3]^PRN[0])};
end

endmodule :PRNG
