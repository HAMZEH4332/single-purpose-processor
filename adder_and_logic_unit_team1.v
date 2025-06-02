module adder_and_logic_unit_team1 ( 
    input [15:0] out_AC,
    input [15:0] out_DR, 
    input [7:0] INPR,
    input AND, ADD, LDA , COM, SHL, SHR, INPR_C,
    output reg [15:0] out_logic,
    output reg in_E,
    input clk , 
    output reg FGI
    
);
initial begin FGI = 1 ; end 
always @(*) begin
    case (1'b1)
        AND: begin
            out_logic = out_AC & out_DR;
            in_E = 0;
        end
        ADD: begin
            {in_E, out_logic} = out_AC + out_DR;
        end
        LDA: begin
            out_logic = out_DR;
            in_E = 0;
        end
        INPR_C: begin
            out_logic = {8'b0, INPR};
            in_E = 0;
	    FGI = 0 ;
        end
        COM: begin
            out_logic = ~out_AC;
            in_E = 0;
        end
        SHR: begin
            out_logic = out_AC >> 1;
            in_E = out_AC[0];
        end
        SHL: begin
            out_logic = out_AC << 1;
            in_E = out_AC[15];
        end
        default: begin
            out_logic = 16'b0;
            in_E = 0;
        end
    endcase
end

endmodule






module adder_and_logic_unit_control_team1 (
    input [7:0] D,
    input [15:0] T, 
    input [11:0] B,
    input p, 
    input r,
    output reg AND, ADD, LDA , COM, SHL, SHR, INPR_C
);

always@(*) begin 
     AND = D[0];  
     ADD =  D[1];
     LDA =   D[2];
     INPR_C = B[11] & p;
     COM = B[9] & r & T[2];
     SHL = B[6] & r & T[2];
     SHR = B[7] & r & T[2];
	
end
endmodule







