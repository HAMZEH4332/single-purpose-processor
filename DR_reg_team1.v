module DR_reg_team1 #(parameter size = 16)
(
output reg [15:0]out_DR,
output reg Zero_DR ,
input [15:0]in_DR ,
input clk ,
input LD ,
input INR,
input RST_DR,
input CLR_GLOBAL
);


always @(*) begin
	if (RST_DR | CLR_GLOBAL )  begin
		out_DR <= {size{1'b0}};
	end
	else if (LD)  begin
		out_DR <= in_DR ;
	end
	else if (INR) begin
		out_DR = out_DR + 1;
	end
end
assign Zero_DR = (out_DR) ? 1'b0 : 1'b1 ;
endmodule




module DRC(LD, INR,CLR, T, D);
	input [15:0] T;
	input [7:0] D;
	output LD, INR , CLR;
	assign CLR = 0 ;
	assign INR = D[6] & T[5];
	assign LD = T[4] & (D[0] | D[1] | D[2] | D[6]);

endmodule