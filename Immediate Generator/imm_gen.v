module immediate_generator(instruction, val_out);
    input [31:0] instruction;
    output reg [63:0] val_out;


    always @(*) begin
    // sign extend the input to 64 bits
    case(instruction[6:0])
    // R-type
    7'b0110011: begin end

    // I-type
    7'b0010011: val_out = $signed(instruction[31:20]);
    7'b0000011: val_out = $signed(instruction[31:20]);
    7'b1100111: val_out = $signed(instruction[31:20]);
    7'b1110011: val_out = $signed(instruction[31:20]);

    // S-type
    7'b0100011: val_out = $signed({instruction[31:25], instruction[11:7]});

    // B-type
    7'b1100011: val_out = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});

    // U-type
    7'b0110111: val_out = $signed({instruction[31:12], 12'b000000000000});
    7'b0010111: val_out = $signed({instruction[31:12], 12'b000000000000});

    // J-type
    7'b1101111: val_out = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});
    
    endcase
    end
    
endmodule