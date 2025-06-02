module PC_reg_team1 (
    output [11:0] out_PC,
    input [11:0] in_PC,
    input clk,
    input LD,
    input INR,
    input RST_PC,
    input CLR_GLOBAL
);

    reg [11:0] PC;

    // Initialize PC with zero
    initial PC = 12'b1;

    always @(posedge clk) begin
        if (RST_PC || CLR_GLOBAL) begin
            PC <= 12'b0; // Reset PC to zero
        end else if (LD) begin
            PC <= in_PC; // Load a new value into PC
        end else if (INR) begin
            PC <= PC + 1; // Increment PC
        end
    end

    assign out_PC = PC;

endmodule





module PCC(CLR, INR, LD, I, E, T, D, B, AC , R , Zero_DR , r , p , FGO , FGI , DR);
	
	input I, E , R ,r , p;
	input [15:0] T;
	input [7:0] D;
	input [11:0] B;
	input [15:0] AC;
	input Zero_DR;
	output CLR, INR, LD;
	input FGO , FGI;
	input [15:0] DR;

 	assign LD = T[4] & D[4] | D[5] & T[5];        // if one of these conditions is true then pc = load data                             |  p & B[9] & FGI | p & B[8] & FGO
	assign INR =  ~R & T[1] | R & T[2] | D[6] & T[6] & Zero_DR | r & B[4] & (~AC[15]) & T[3] | r & B[3] & AC[15] & T[3] | r & B[2] & ~(|AC ) & T[3] | r & B[1] & (~E) & T[3] | ~(|DR) & T[6]  ;	
	assign CLR= R & T[1];  // CLR PC

endmodule
