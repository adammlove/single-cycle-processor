module multiplexer(A, B, sel, out);
    input [63:0] A, B;
    input sel;              // select A or B
    output reg [63:0] out;

    always @(*)
    begin
        // change output depending on value of select
        case(sel)
            default: out <= A;
            1'b1: out <= B;
        endcase
    end
endmodule