
module control_unit_team1 (
	input clk ,
	input CLR_GLOBAL,
	input [15:0] out_IR , out_AC , out_DR ,
	input [7:0] out_INPR ,  
	output RST_PC, RST_AR, RST_AC, RST_DR, RST_TR,
	output LD_PC, LD_AR, LD_AC, LD_DR, LD_IR, LD_OUTR, LD_TR,
    	output INR_PC, INR_AR, INR_AC, INR_DR, INR_TR,
   	output CLR_TR,
    	output Write, Read,
	output [2:0] S ,
	output AND, ADD, LDA, COM, SHL, SHR, INPR_C ,
	input Zero_DR,
	input FGI,
	output HLT,  
    	output CLE,
  	output CME ,
	wire [3:0] SC 
);
	wire ION , IOF ;
	wire p ;
	wire r ;
	reg R ;
	
	wire I ; 
	wire [15:0] T;
	wire [7:0] D;
	wire[11:0] B;
	wire INR_SC, CLR_SC ;
	wire INC_AC;
assign R = 1'b0 ;
assign p = D[7] & I & T[2] ;
assign ION = p & B[7] ;
assign IOF = p & B[6] ;
assign CLE = r & T[3] & B[10];
assign CME = r & T[3] & B[8];
assign HLT = r & T[3]& B[0];
assign I = out_IR [15] ;
assign r = D[7] & ~I ;
		assign B = r  ? out_IR [11:0] : 12'bZ;
		     assign B[0] = (out_IR[11:0] ==  12'b000000000001);
                     assign B[1] = (out_IR[11:0] ==  12'b000000000010);
                     assign B[2] = (out_IR[11:0] ==  12'b000000000100);
                     assign B[3] = (out_IR[11:0] ==  12'b000000001000);
                     assign B[4] = (out_IR[11:0] ==  12'b000000010000);
                     assign B[5] = (out_IR[11:0] ==  12'b000000100000);
                     assign B[6] = (out_IR[11:0] ==  12'b000001000000);
                     assign B[7] = (out_IR[11:0] ==  12'b000010000000);
                     assign B[8] = (out_IR[11:0] ==  12'b000100000000);
                     assign B[9] = (out_IR[11:0] ==  12'b001000000000);
                     assign B[10] = (out_IR[11:0] == 12'b010000000000);
                     assign B[11] = (out_IR[11:0] == 12'b100000000000);


    reg [15:0] T_safe;
    reg [7:0] D_safe;
    reg R_safe;
        // Sanitize inputs to replace 'x' or 'z' with a known value (e.g., 0)
       assign T_safe = (|T === 1'bx) ? 16'b0 : T;  // If any T bit is 'x', replace with 0
       assign D_safe = (|D === 1'bx) ? 8'b0 : D;   // If any D bit is 'x', replace with 0
       assign R_safe = (R === 1'bx) ? 1'b0 : R;    // If R is 'x', replace with 0


// Generate x signals

sequence_counter_team1 SQC (
	.CLR_SC(CLR_SC) ,
	.clk(clk) , 
	.INR_SC(INR_SC) , 
	.SC(SC),
	.CLR_GLOBAL(CLR_GLOBAL) , 
	.HLT(HLT)
	);


decoder4X16_team1 DEC4X16(
	.T(T),
	.SC(SC),
	.clk(clk)
	);


decoder3X8_team1 DEC3X8 (
	.D(D) , 
	.opcode(out_IR[14:12])
	);



encoder8X3_team1 enc8X3 (
	.T(T_safe),
	.D(D_safe) ,
	.R (R_safe) ,
	.S(S), 
	.I(I)
	);

ACC_team1 acc(
	 .LD(LD_AC),
	 .INR(INR_AC),
	 .CLR(RST_AC),
	 .T(T_safe),
	 .D(D_safe),
	 .B(B),
	 .I(I)
	 );

ARC arc(
	.LD(LD_AR), 
	.CLR(RST_AR), 
	.INR(INR_AR), 
	.T(T_safe), 
	.D(D_safe), 
	.I(I) , 
	.R(R_safe),
	.clk(clk)
	);

DRC drc(
	.LD(LD_DR), 
	.INR(INR_DR), 
	.CLR(RST_DR),
	.T(T_safe), 
	.D(D_safe));

IRC irc(
	.LD(LD_IR), 
	.T(T_safe) ,
	.R(R_safe)
	);

MemoryC_team1 memc(
	.Write(Write), 
	.Read(Read) , 
	.T(T_safe), 
	.D(D_safe), 
	.I(I) , 
	.R(R_safe)
	);

PCC pcc(
	.CLR(RST_PC), 
	.INR(INR_PC), 
	.LD(LD_PC), 
	.I(I), 
	.E(E), 
	.T(T_safe), 
	.D(D_safe), 
	.B(B), 
	.AC(out_AC),
	.R(R_safe),
	.Zero_DR(Zero_DR),
	.r(r), 
	.p(p),
	.FGO(FGO),
	.FGI(FGI),
	.DR(out_DR)
	);

sequence_counterC_team1 SCC(
	.INR(INR_SC) , 
	.CLR(CLR_SC) , 
	.T(T_safe), 
	.D(D_safe), 
	.R(R_safe),
	.clk(clk),
	.B(B) ,
	.r(r)
	);



adder_and_logic_unit_control_team1 adder_control(
	.D(D_safe) ,
	.T(T_safe),
	.B(B) ,
	.p(p) , 
	.r(r) , 
	.AND(AND), 
	.ADD(ADD),
	.LDA(LDA) , 
	.COM(COM) , 
	.SHL(SHL) , 
	.SHR(SHR) ,
	.INPR_C(INPR_C) 
	);




interrupt_team1 interrupt (
    .INTR_EN(INTR_EN),
    .INTR(INTR)
    ); 

IEN_team1 ien(
    .CLR_GLOBAL(CLR_GLOBAL),
    .clk(clk),
    .ION(ION),
    .IOF(IOF),
    .INTR_EN(INTR_EN)
);

endmodule 







