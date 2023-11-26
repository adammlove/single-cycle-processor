module ALU_control_tb();
    reg [31:0] instruction;
    reg [2:0] ALUop_in;

    wire [2:0] ALUop;

    ALU_control control(instruction, ALUop_in, ALUop);

    initial begin

        ALUop_in = 3'b000;
        instruction = 32'b00000000000000000000000000000000;
        #1;
        instruction = 32'b01000000000000000000000000000000;
        #1;
        instruction = 32'b00000010000000000000000000000000;
        #1;
        instruction = 32'b00000010000000000100000000000000;
        #1;
        instruction = 32'b00000000000000000111000000000000;
        #1;
        instruction = 32'b00000000000000000000000000000000;
        #1;

        ALUop_in = 3'b001;
        instruction = 32'b00000000000000000000000000000000;
        #1;
        instruction = 32'b00000000000000000110000000000000;
        #1;
        instruction = 32'b00000000000000000111000000000000;
        #1;

        ALUop_in = 3'b010;
        instruction = 32'b00000000000000000010000000000000;
        #1;

        ALUop_in = 3'b011;
        instruction = 32'b00000000000000000000000000000000;
        #1;
    end

endmodule