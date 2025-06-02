module top_module_tb;

// Outputs
wire [15:0] out_MEM, out_DR, out_AC, out_IR, out_TR;
wire [11:0] out_PC, out_AR;
wire E;
wire [2:0] S;
wire [3:0] SC;
// Clock Signal
reg clk;
reg [7:0] outt_INPR ; 




initial begin 
outt_INPR = 8'hff ;
    clk = 1; 
end


always begin 
    #10 clk = ~clk;
end
top_module uut (
    .clk(clk),               
    .CLR_GLOBAL(CLR_GLOBAL),
    .out_MEM(out_MEM),       
    .out_DR(out_DR),         
    .out_AC(out_AC),        
    .out_IR(out_IR),         
    .out_TR(out_TR),        
    .out_PC(out_PC),         
    .out_AR(out_AR),         
    .out_E(out_E),                   
    .S(S),              
    .outt_INPR(outt_INPR),
    .SC(SC)
);


initial begin
    $monitor("SC=%0d | MEM=%h | DR=%h | AC=%h | IR=%h | TR=%h | PC=%h | AR=%h | E=%b | S=%b",
        SC, out_MEM, out_DR, out_AC, out_IR, out_TR, out_PC, out_AR, E, S);
end



endmodule
