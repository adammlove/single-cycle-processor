module instruction_mem_tb();
    wire [31:0] address, next_address, instruction;
    reg clk;

    programcounter PC(next_address, clk, address);
    thirtytwobitadder adder(address, 32'h00000004, 1'b0, , next_address);
    instruction_memory mem(address, instruction);

    integer i;
    initial begin
        for(i = 0; i<15; i=i+1) begin
            clk = 1'b0;
            #1;
            clk = 1'b1;
            #1;
        end
    end
endmodule