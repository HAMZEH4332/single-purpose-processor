

module mux_16bit_8X1_team1(out_AR , out_PC , out_DR , out_AC , out_IR , out_TR , out_MEM ,out_Bus_mux,S,clk);

input [15:0] out_DR , out_AC , out_TR ,out_IR, out_MEM ;
input [11:0] out_PC , out_AR ;
input clk;
input [2:0] S;

output reg [15:0] out_Bus_mux;

always @(*) begin
   case(S)

        3'b001: out_Bus_mux = {4'b0 , out_AR};
        3'b010: out_Bus_mux = {4'b0 , out_PC};
        3'b011: out_Bus_mux = out_DR;
        3'b100: out_Bus_mux = out_AC;
        3'b101: out_Bus_mux = out_IR;
        3'b110: out_Bus_mux = out_TR;
        3'b111: out_Bus_mux = out_MEM;

    
	endcase
	
end
endmodule

