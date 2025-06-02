module top_module (

	input clk ,
	input CLR_GLOBAL,
	output [15:0] out_MEM , out_DR , out_AC , out_IR , out_TR ,
 	output [11:0] out_PC ,
	output [11:0] out_AR ,
	output out_E ,
	output [2:0] S,
	output [3:0] SC,
	input [7:0] outt_INPR
);

wire Zero_DR ;


datapath_team1 DPtop (
    .AND(AND),
    .ADD(ADD),
    .LDA(LDA),
    .COM(COM),
    .SHL(SHL),
    .SHR(SHR),
    .INPR_C(INPR_C),
    .RST_PC(RST_PC),
    .RST_AR(RST_AR),
    .RST_AC(RST_AC),
    .RST_DR(RST_DR),
    .RST_TR(RST_TR),
    .LD_PC(LD_PC),
    .LD_AR(LD_AR),
    .LD_AC(LD_AC),
    .LD_DR(LD_DR),
    .LD_IR(LD_IR),
    .LD_OUTR(LD_OUTR),
    .LD_TR(LD_TR),
    .INR_PC(INR_PC),
    .INR_AR(INR_AR),
    .INR_AC(INR_AC),
    .INR_DR(INR_DR),
    .INR_TR(INR_TR),
    .CLR_TR(CLR_TR),
    .Write(Write),
    .Read(Read),
    .S(S),
    .out_MEM(out_MEM),
    .out_DR(out_DR),
    .out_AC(out_AC),
    .out_IR(out_IR),
    .out_TR(out_TR),
    .out_PC(out_PC),
    .out_AR(out_AR),
    .out_E(out_E),
    .clk(clk),
    .CLR_GLOBAL(CLR_GLOBAL),
    .Zero_DR(Zero_DR), 
	 .FGI(FGI),
	 .CLE(CLE),
    	 .CME(CME) ,
	.out_INPR(out_INPR)
);








control_unit_team1 CUtop (
    .clk(clk),
    .out_IR(out_IR),
    .out_AC(out_AC),
    .out_DR(out_DR),
    .out_INPR(out_INPR),
    .AND(AND),
    .ADD(ADD),
    .LDA(LDA),
    .COM(COM),
    .SHL(SHL),
    .SHR(SHR),
    .INPR_C(INPR_C),
    .RST_PC(RST_PC),
    .RST_AR(RST_AR),
    .RST_AC(RST_AC),
    .RST_DR(RST_DR),
    .RST_TR(RST_TR),
    .LD_PC(LD_PC),
    .LD_AR(LD_AR),
    .LD_AC(LD_AC),
    .LD_DR(LD_DR),
    .LD_IR(LD_IR),
    .LD_OUTR(LD_OUTR),
    .LD_TR(LD_TR),
    .INR_PC(INR_PC),
    .INR_AR(INR_AR),
    .INR_AC(INR_AC),
    .INR_DR(INR_DR),
    .INR_TR(INR_TR),
    .CLR_TR(CLR_TR),
    .Write(Write),
    .Read(Read),
    .S(S),
    .CLR_GLOBAL(CLR_GLOBAL),
    .Zero_DR(Zero_DR),
	 .FGI(FGI),
	 .CLE(CLE),
    	 .CME(CME), 
	.HLT(HLT),
	.SC(SC)
);



endmodule 
