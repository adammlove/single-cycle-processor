module ALU_control(instruction, ALUop_in, ALUop);
    input [31:0] instruction;
    input [2:0] ALUop_in;
    output reg [2:0] ALUop;

    wire [6:0] funct67;
    wire [2:0] funct3;

    assign funct67 = instruction[31:25];
    assign funct3 = instruction[14:12];

    always @(*) begin
        case(ALUop_in)
        // R-type
        3'b000: begin
            case({funct67, funct3})
            default: begin
                ALUop = 3'b000;
            end

            // addition
            10'b0000000000: begin
                ALUop = 3'b001;
            end

            // subtraction
            10'b0100000000: begin
                ALUop = 3'b010;
            end

            // multiplication
            10'b0000001000: begin
                ALUop = 3'b011;
            end

            // division
            10'b0000001100: begin
                ALUop = 3'b100;
            end

            // AND
            10'b0000000111: begin
                ALUop = 3'b101;
            end

            // OR
            10'b0000000110: begin
                ALUop = 3'b110;
            end

            endcase
        end

        // I-type
        3'b001: begin
            case(funct3)
            // addi
            3'b000: begin
                ALUop = 3'b001;
            end

            // ori
            3'b110: begin
                ALUop = 3'b110;
            end

            // andi
            3'b111: begin
                ALUop = 3'b101;
            end
            endcase
        end

        // lw, sw
        3'b010: begin
            case(funct3)
            3'b010: begin
                ALUop = 3'b001;
            end
            endcase
        end

        // branch
        3'b011: begin
            case(funct3)
            // BEQ
            3'b000: begin
                ALUop = 3'b010;
            end
            endcase
        end

        endcase
    end
endmodule