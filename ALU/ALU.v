module ALU(a_in, b_in, sel, result, z_f, o_f);
    input [63:0] a_in, b_in;          // inputs
    input [2:0] sel;            // select operation
    output reg [63:0] result;   // result
    output reg z_f, o_f;    // flags: zero, carry, overflow
    
    // intermediate registers
    reg [63:0] a, b;

    // used for outputting results and flags
    wire [63:0] add_result, mult_result, div_quotient, div_remainder;
    wire add_cout, add_ovr;

    // initialize the adder, multiplier, and divider
    sixtyfourbitadder adder(a, b, add_cout, add_ovr, add_result);
    multiplier mult(a, b, mult_result);
    divider div(a, b, div_quotient, div_remainder);

    always @(*) begin

        // select operation
        case(sel)
            // addition
            3'b000: begin
                a <= a_in;
                b <= b_in;
                result <= add_result;
                z_f <= ~|result;
                o_f <= add_ovr;
            end
            // subtraction
            3'b001: begin
                a <= a_in;
                b <= ~b_in + 1'b1;  // two's compliment
                result <= add_result;
                z_f <= ~|result;
                o_f <= add_ovr;
            end
            // multiplication
            3'b010: begin
                a <= a_in;
                b <= b_in;
                result <= mult_result;
                z_f <= ~|result;
                o_f <= 1'b0;
            end
            // division
            3'b011: begin
                a <= a_in;
                b <= b_in;
                result <= div_quotient;
                z_f <= ~|result;
                o_f <=  1'b0;
            end
            // AND
            3'b100: begin
                result <= a_in & b_in;
                z_f <= ~|result;
                o_f <= 1'b0;
            end
            // OR
            3'b101: begin
                result <= a_in | b_in;
                z_f <= ~|result;
                o_f <= 1'b0;
            end

        endcase
        
    end


endmodule