
module encoder8X3_team1 (
    input I ,
    input [15:0] T ,
    input [7:0] D ,
    input R,
    output reg [2:0] S    // 3-bit binary output
);
    wire  [7:0] X ;  // 8 input line

    
    assign X[1] = (D[4] & T[4]) | (D[5] & T[5]);            // AR
    assign X[2] = T[0] | D[5] & T[4];                                   // PC
    assign X[3] = (D[0] & T[5]) | (D[1] & T[5]) | (D[2] & T[5] | D[6] & T[6]); // DR
    assign X[4] = (D[3] & T[4]);                          // AC
    assign X[5] = T[2] ;                                   // IR
    assign X[6] = (1'b0);                          // TR
    assign X[7] = (T[1] & ~R) | ((D[0] | D[1] | D[2] | D[6]) & T[4] | ~D[7] & I & T[3]); // Memory



    assign S = (
              	  X[1] == 1 ? 3'b001 :
                  X[2] == 1 ? 3'b010 :
                  X[3] == 1 ? 3'b011 :
                  X[4] == 1 ? 3'b100 :
                  X[5] == 1 ? 3'b101 :
                  X[6] == 1 ? 3'b110 :
                  X[7] == 1 ? 3'b111 : 3'b000); // Default to 000 if no input is active

endmodule

