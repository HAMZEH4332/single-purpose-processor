
module decoder3X8_team1(
    
    output reg [7:0] D,
    input [2:0] opcode
    );
always@(*)
begin 
assign D = 1 << opcode ;
end
endmodule



















