

module AC_reg_team1 #(parameter size = 16) 
(
output reg [15:0]out_AC,
input [15:0]in_AC,
input clk ,
input LD ,
input INR,
input RST_AC,
input CLR_GLOBAL
);

always @(LD or RST_AC or INR or CLR_GLOBAL) begin

	if (RST_AC | CLR_GLOBAL )  begin
		out_AC <= {size{1'b0}};
	end
	else if (LD)  begin
		out_AC <= in_AC ;

	end
	else if (INR) begin
		out_AC <= out_AC + 1;
	end

end

endmodule


module ACC_team1(LD, INR, CLR, T, D, B, I);

	output LD, INR, CLR;
	input[15:0] T;
	input [7:0] D;
	input[11:0] B;
	input I;
	wire r, p;


	assign p = D[7] & I & T[3];
	assign r = D[7] & ~I & T[3];
	
	//AND = D[0] & T[5];  
	//ADD = T[5] & D[1];
	//DR = T[5] & D[2];
	//COM = B[9] & r;
	//SHL = B[6] & r;
	//SHR = B[7] & r;
	//INPR = B[11] & p;

	assign INR = r & T[3] & B[5];
	assign LD =( D[0] & T[5] | T[5] & D[1] | T[5] & D[2] | B[6] & r & T[3] | B[7] & r & T[3]| B[9] & r & T[3] | B[11] & p );  
    	assign CLR = r & B[11]; 
endmodule









module e_register_team1 (
input in_E ,
output reg out_E ,
input CLE , CME ,
input LD
);

always @(*) begin

    if (CLE) begin
        out_E <= 0;
    end else if (CME) begin
        out_E <= ~out_E;
	end
    if (LD) begin 
	out_E <= in_E;
	end
end
endmodule



// CLE  implementation 
//HLT make sure it existed .