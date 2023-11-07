module programcounter(next_address, clk, address);
    input [31:0] next_address;
    output reg [31:0] address;
    input wire clk;
    
    // load the initial program counter address
    initial begin
        address = 32'h00000000;
    end

    // each clock cycle, update the program counter
    always @(posedge clk)
    begin
        address <= next_address;
    end
endmodule