module sequence_counter_team1 (
    input  CLR_SC,  
    input  clk,
    input INR_SC,     
    output reg [3:0] SC  ,
    input CLR_GLOBAL , 
    input HLT 
);



    always @(posedge clk)  begin
	 
	if (CLR_SC | CLR_GLOBAL) begin
            SC <= 4'h0; 
	end
	if (HLT) begin 
		SC <= SC ;
	end
        else if (SC >= 4'hF) begin
            SC <= 4'h0; 
	end else if (INR_SC) begin 
	    SC <= SC + 1'b1;
	    
    end
end

endmodule


//add a sequence counter control 
module sequence_counterC_team1 (
    output reg CLR, 
    output reg INR, 
    input [15:0] T, 
    input [7:0] D, 
    input R, 
    input clk,
    input r ,
    input [11:0] B 
);
  

    always @(*) begin

        // Logic to compute CLR
        CLR = (R & T[2] |
 	D[0] & T[5] |
 	D[1] & T[5] | 
	D[2] & T[5] | 
	D[3] & T[4] | 
	D[4] & T[4] | 
	D[5] & T[5] | 
	D[6] & T[6] |
	D[7] & T[4] |
 	r & T[4]) ? 1'b1 : 1'b0 ;

        // Logic to compute INR
        INR = (CLR == 1'b0) ? 1'b1 : 1'b0;
    end

    // Proper initialization to avoid undefined behavior
    initial begin
        CLR = 1'b1; 
        INR = 1'b0;
    end
endmodule





