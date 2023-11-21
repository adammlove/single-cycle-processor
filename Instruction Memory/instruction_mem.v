module instruction_memory(address, instruction);
    input [31:0] address;
    output reg [31:0] instruction;

    // 1 kilobyte
    reg [31:0] mem [0:255];

    // load program
    integer i;
    initial begin
        // initialize memory to 0
        for(i=0; i<=255; i=i+1) begin
            mem[i] = 32'h00000000;
        end

        // load in the program
        $readmemb("program.txt", mem);
    end

    // output the instruction as a 32 bit value
    always @(*) begin
        instruction = mem[address>>2];
    end
    
endmodule