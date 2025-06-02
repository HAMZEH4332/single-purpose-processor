module Memory_team1 (
    out_MEM,
    in_MEM,
    addr_Reg,
    Write,
    Read,
clk
);
    parameter n = 16; // Memory word size
input clk ;    
input [n-1:0] in_MEM;          // Input data
    input [11:0] addr_Reg;         // Address register
    input Write, Read;             // Write/Read control signals
    output reg [n-1:0] out_MEM;    // Output data
    reg [15:0] mem [4096:0];       // Memory array (4096 x 16 bits)


    integer file;                  // File handle for appending write operations

    // Initialize memory from the file
    initial begin
        $readmemh("mem_init.txt", mem); // Load memory contents from mem_init.txt
        //file = $fopen("mem_init.txt", "r+"); // Open mem_init.txt in append mode for writing
    end

    // Memory operations
    always @(posedge clk or Read or Write ) begin
         if (addr_Reg == 12'h0) begin
            out_MEM = 16'hz; // High-impedance state when not reading
		$display("Error: Cannot access this location.");
	end else if (Write) begin
            mem[addr_Reg] = in_MEM; // Write data into memory

	     //$fseek(file, addr_Reg * 5, 0);
            //$fwrite(file,"%h", in_MEM);
        end

        else if (Read) begin
            out_MEM = mem[addr_Reg]; // Read data from memory
        end

        if (Write && Read) begin
            $display("Error: Cannot read and write at the same time.");
        end
    end

endmodule




module MemoryC_team1(Write, Read , T, D, I , R);
	input R ;
	input  I;
	input [15:0] T ;
	input [7:0] D;
	output Write, Read;

	

	
	assign Write = 
	D[6] & T[6] | 
	D[5] & T[4] | 
	D[3] & T[4] |
	R & T[1] ;
	assign Read =
	 ~D[7] & I & T[3] |
	 D[6] & T[4] | 
	 D[2] & T[4] |
	 D[1] & T[4] | 
	 D[0] & T[4] |
	 ~R & T[1] ;

endmodule
