

module OUTR_reg_team1 #(parameter size=16)
(
input [7:0]in_OUTR ,
input clk , LD_OUTR ,
output reg [7:0] out_OUTR ,
output reg FGO 
);
initial begin 
out_OUTR = 8'h0;
FGO = 1'b1 ;
end

always @(posedge clk) begin 
	if (LD_OUTR)begin 
		out_OUTR <= in_OUTR ;
		FGO <= 1'b0 ;
	end 
	else begin 
		FGO <=  1'b1;		
	end
end

endmodule 



