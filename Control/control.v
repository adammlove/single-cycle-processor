module control(instruction, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
    input [31:0] instruction;
    output reg branch, memread, memtoreg, memwrite, alusrc, regwrite;
    output reg [2:0] aluop;
    
    reg [6:0] opcode;

    always @(instruction) begin
        opcode = instruction[6:0];
    end

    always @(*) begin
        case(opcode)
            // R-type
            // (add, sub, mult, div, and, or)
            7'b0110011: begin
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
                aluop = 3'b000; // R-type
                
            end

            // I-type
            // (addi, ori, andi)
            7'b0010011: begin
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 1;
                regwrite = 1;
                aluop = 3'b001; // I-type
            end

            // lw
            7'b0000011: begin
                branch = 0;
                memread = 1;
                memtoreg = 1;
                memwrite = 0;
                alusrc = 1;
                regwrite = 1;
                aluop = 3'b010; // lw or sw
            end

            // sw
            7'b0100011: begin
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 1;
                alusrc = 1;
                regwrite = 0;
                aluop = 3'b010; // lw or sw
            end

            // BEQ
            7'b1100111: begin
                branch = 1;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 0;
                aluop = 3'b011; // branch
            end
        endcase
    end
endmodule