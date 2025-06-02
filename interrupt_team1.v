
module interrupt_team1 (
    input INTR_EN,
    output reg INTR
);


always @(INTR_EN) begin
    if (INTR_EN) begin
        INTR <= 1; 
    end else begin
        INTR <= INTR_EN;
    end
end
endmodule 


module IEN_team1 (
    input CLR_GLOBAL,
    input clk,
    input ION,
    input IOF,
    output reg INTR_EN
);

always @(posedge clk) begin
    if (CLR_GLOBAL) begin
        INTR_EN <= 0;
    end else if (ION) begin
        INTR_EN <= 1;
    end else if (IOF) begin
        INTR_EN <= 0;
    end
end

endmodule