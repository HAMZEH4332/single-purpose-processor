

module decoder4X16_team1(
    output reg [15:0] T,
    input [3:0] SC,
    input clk
    );


always@(*)
begin 
assign T = 1 << SC ;

end
endmodule

