timeunit 1ns;
timeprecision 1ps;

extern module FSM (		 
	input logic PULSE_A,
	logic PULSE_B,
	input logic SYS_CLK,
	input logic A_RESET,
	
	output logic INC,
	output logic SCLR,
	output logic LOAD
);

module FSM(.*);

logic [2:0] P_STATE, N_STATE;
always_comb
begin:NSOL

begin: NSL

N_STATE='bx;

case(P_STATE)
2'b00: begin
	   if(PULSE_A)N_STATE=2'b01;
	   else N_STATE=P_STATE;
	   end
2'b01: begin
	   if(PULSE_A)N_STATE=P_STATE;
	   else N_STATE=2'b10;
	   end
2'b10: begin
	   if(PULSE_B)N_STATE=2'b11;
	   else N_STATE=P_STATE;
	   end
2'b11:N_STATE=2'b11;
default: N_STATE=2'b00;
endcase
end:NSL

begin: OL

{INC,SCLR,LOAD}='b0;

case(P_STATE)
2'b00: SCLR=1'b1;
2'b01: INC=1'b1;
2'b10: INC=1'b1;
2'b11: LOAD=1'b1;
default:;
endcase
end: OL

end:NSOL

always@(posedge SYS_CLK, posedge A_RESET)
begin:PSR
	   if(A_RESET)P_STATE<=2'b00;
	   else P_STATE<=N_STATE;
end:PSR

endmodule:FSM
