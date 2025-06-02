

module INPR_reg_team1 #(parameter size = 16)
(
//output reg FGI ,
output reg [7:0] out_INPR ,
input [7:0]in_INPR 

//input RST_INPR, LD_INPR,clk ,RST_FGI

);
initial out_INPR = 8'hff;
/*
always @(*) begin
    if (RST_INPR) begin
        out_INPR <= 8'b0;
        FGI <= 0;
    end
    else if (LD_INPR) begin
        out_INPR <= in_INPR; // Load input data
        FGI <= 1;           // Set flag to indicate data is ready
    end
    else if (RST_FGI) begin
        FGI <= 0;           // Clear flag after data is read
    end
end*/
endmodule 



