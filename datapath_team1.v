
module datapath_team1 
(	input clk,
        input AND, ADD, LDA , COM, SHL, SHR, INPR_C,
	input RST_PC, RST_AR, RST_AC, RST_DR, RST_TR,
	input  LD_PC, LD_AR, LD_AC, LD_DR, LD_IR, LD_OUTR, LD_TR,
    	input  INR_PC, INR_AR, INR_AC, INR_DR, INR_TR,	
   	input  CLR_TR,
    	input  Write, Read,
	input  [2:0] S,
	input CLR_GLOBAL ,
	output [15:0] out_MEM , out_DR , out_AC , out_IR , out_TR ,
 	output [11:0] out_PC ,
	output [11:0] out_AR ,
	output out_E ,
	output Zero_DR,
	output FGI,
	input CLE ,CME,
	input [7:0] out_INPR
);
	wire [15:0] out_logic ;
	wire [7:0] INPR_in, out_OUTR;
	wire [15:0] out_Bus_mux;
	wire [15:0] in_MEM , in_DR ;
	wire in_E ;
    // Program Counter (PC)
   PC_reg_team1  PC (
    .out_PC(out_PC),
    .in_PC(out_Bus_mux[11:0]), // Slice appropriately for 12 bits
    .clk(clk),
    .LD(LD_PC),
    .INR(INR_PC),
    .RST_PC(RST_PC),
    .CLR_GLOBAL(CLR_GLOBAL)
    
);


    // Address Register (AR)
    AR_reg_team1 AR (
        .out_AR(out_AR),
        .in_AR(out_Bus_mux[11:0]),
	.clk(clk),
        .LD(LD_AR),
        .INR(INR_AR),
        .RST_AR(RST_AR),
        .CLR_GLOBAL(CLR_GLOBAL)
    
    );

    // Data Register (DR)
    DR_reg_team1 DR (
        .out_DR(out_DR),
        .in_DR(out_Bus_mux), 
        .clk(clk),
        .LD(LD_DR),
        .INR(INR_DR),
        .RST_DR(RST_DR),
        .CLR_GLOBAL(CLR_GLOBAL),
	.Zero_DR(Zero_DR)
   
    );
	
    // Accumulator (AC)
    AC_reg_team1 AC (
        .out_AC(out_AC),
        .in_AC(out_logic),
        .clk(clk),
        .LD(LD_AC),
        .INR(INR_AC),
        .RST_AC(RST_AC),
        .CLR_GLOBAL(CLR_GLOBAL) 

    );

    // Instruction Register (IR)
    IR_reg_team1 IR (
        .out_IR(out_IR),
        .in_IR(out_Bus_mux), 
        .clk(clk),
        .LD(LD_IR)
    );

    // Temporary Register (TR)
    TR_reg_team1 TR (
        .out_TR(out_TR),
        .in_TR(out_Bus_mux),
        .clk(clk),
        .LD(LD_TR),
        .INR(INR_TR),
        .CLR_TR(RST_TR), 
	.CLR_GLOBAL(CLR_GLOBAL)
  

  );

    // Input Register (INPR)
    INPR_reg_team1 INPR (
        .out_INPR(out_INPR),
        .in_INPR(INPR_in)
    );

    // Output Register (OUTR)
    OUTR_reg_team1 OUTR (
        .out_OUTR(out_OUTR),
        .in_OUTR(out_Bus_mux[7:0]),
        .clk(clk),
        .LD_OUTR(LD_OUTR),
	.FGO(FGO)
    );

    // Memory Module
    Memory_team1 Memory (
        .out_MEM(out_MEM), 
        .in_MEM(out_Bus_mux),   
        .addr_Reg(out_AR),
        .Write(Write),
        .Read(Read) , 
	.clk(clk)
    );

   
   mux_16bit_8X1_team1 MUX (
	 .clk(clk) ,	
	.S(S) ,
	.out_MEM(out_MEM) ,
	.out_AR(out_AR) ,
	.out_PC(out_PC) ,
 	.out_DR(out_DR) ,
 	.out_AC(out_AC) ,
 	.out_IR(out_IR) ,
 	.out_TR(out_TR) ,
	.out_Bus_mux(out_Bus_mux) 
	 
); 




adder_and_logic_unit_team1 adder_un( 
	  .out_AC(out_AC) ,
	  .out_DR(out_DR) ,  
	  .INPR(out_INPR),
	  .out_logic(out_logic) , 
	 .AND(AND), 
	 .ADD(ADD),
	 .LDA(LDA) , 
	 .COM(COM) , 
	 .SHL(SHL) , 
	 .SHR(SHR) ,
	 .INPR_C(INPR_C),
	 .clk(clk),
	 .FGI(FGI),
	.in_E(in_E)
	);


 e_register_team1 E_reg(
 	.in_E(in_E) ,
 	.out_E(out_E) ,
 	.CLE(CLE) ,
 	.CME(CME) ,
 	.LD(LD_AC)
	 );

endmodule
























































