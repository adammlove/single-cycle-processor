module imm_gen_tb();
    reg [31:0] instruction;
    wire [31:0] imm;

    immediate_generator imm_gen(instruction, imm);

    initial begin
        instruction = 32'b11010010101101110101110110110011;
        #1;
        instruction = 32'b00000001010100000000000000010011;
        #1;
        instruction = 32'b10000001010100000000000000000011;
        #1;
        instruction = 32'b00000001010100000000000001100111;
        #1;
        instruction = 32'b10110001010100000000000001110011;
        #1;
        instruction = 32'b11111111000000000001000000100011;
        #1;
        instruction = 32'b00000000000000000000000011100011;
        #1;
        instruction = 32'b00101110110110000000000000110111;
        #1;
        instruction = 32'b10101110110110000000000000010111;
        #1;
        instruction = 32'b11010101010001010101000001101111;
        #1;
    end
endmodule