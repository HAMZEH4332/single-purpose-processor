
module TR_reg_team1 #(parameter size=16)
(
input [size-1:0]in_TR,
input clk ,
input LD ,
input INR,
input CLR_TR,
output reg [size-1:0]out_TR,
input CLR_GLOBAL
);

always @(posedge clk) begin
	if (CLR_TR | CLR_GLOBAL)  begin
		out_TR = {size{1'b0}};
	end
	else if (LD)  begin
		out_TR = in_TR ;
	end
	else if (INR) begin
		out_TR = in_TR + 1;
	end

end
endmodule


