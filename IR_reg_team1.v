

module IR_reg_team1 #(parameter size=16)
(
output reg [15:0]out_IR,
input [15:0]in_IR,
input clk ,
input LD 
);

always @(*) begin

	if (LD)  begin
		out_IR = in_IR ;
	end

	end
endmodule

module IRC(LD, T , R );
	input [15:0] T ;
	input R;

	output LD ;
	assign LD = ~R & T[1] ;

endmodule