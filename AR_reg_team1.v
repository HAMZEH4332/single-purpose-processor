

module AR_reg_team1 #(parameter size = 16) 
(
output reg [11:0]out_AR,
input [11:0]in_AR,
input clk,
input LD ,
input INR,
input RST_AR,
input CLR_GLOBAL
);
reg [11:0] AR ;
always @(posedge clk) begin
	if (LD)  begin
		AR = in_AR [11:0];
	end
	else if (RST_AR | CLR_GLOBAL)  begin
		AR = 12'b0;
	end
	
	if (INR) begin
                AR = AR + 1;
	end

end
assign out_AR = AR ;
endmodule



module ARC (
    input I,
    input R,
    input clk,         // Add clock signal for synchronization
    input [15:0] T,
    input [7:0] D,
    output reg LD,     // Changed to reg for sequential logic
    output reg CLR,    // Changed to reg for sequential logic
    output reg INR     // Changed to reg for sequential logic
);


       assign CLR = R & T[0];                  // Synchronized CLR signal
       assign INR = D[5] & T[4];               // Synchronized INR signal
       assign LD = (~D[7] & I & T[3]) | (T[2] & ~R) | (~R & T[0]); // Synchronized LD signal

endmodule
