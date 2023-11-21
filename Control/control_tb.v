module control_tb();
    reg [31:0] instruction;
    wire branch, memread, memtoreg, memwrite, alusrc, regwrite;
    wire [2:0] aluop;

    control control(instruction, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);

    initial begin
        instruction = 32'b00000000000000000000000000110011;
        #1;
        instruction = 32'b00000000000000000000000000010011;
        #1;
        instruction = 32'b00000000000000000000000000000011;
        #1;
        instruction = 32'b00000000000000000000000000100011;
        #1;
        instruction = 32'b00000000000000000000000001100111;
        #1;
    end
endmodule