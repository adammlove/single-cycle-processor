module PC_tb();
    reg clk;
    wire [31:0] adder_next_address, current_counter;

    thirtytwobitadder adder(current_counter, 32'h00000004, , , adder_next_address);
    programcounter PC(adder_next_address, clk, current_counter);

always begin
    clk = 0;
    #1;
    clk = 1;
    #1;
end

endmodule