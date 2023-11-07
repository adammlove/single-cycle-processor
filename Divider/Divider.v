module divider(a, b, ovr, quotient, remainder);
    input [63:0] a, b;
    output reg [63:0] quotient, remainder;
    output reg ovr;

    // internal variables
    reg [127:0] rem;
    reg [63:0] div;
    reg negative;
    integer i;

    // initialize all registers to 0
    initial begin
        quotient = 64'h0000000000000000;
        remainder = 64'h0000000000000000;
        rem = 128'h00000000000000000000000000000000;
        div = 64'h0000000000000000;
    end

    // when input value changes
    always @(a, b) begin

        // determine number of negatives
        // done by checking MSB of both inputs
        case({a[63], b[63]})

            // no negatives
            2'b00: begin
                negative = 1'b0;
                rem = {64'h0000000000000000, a};
                div = b;
            end

            // one negative
            2'b10: begin
                negative = 1'b1;
                rem = {64'h0000000000000000, ~a + 1'b1};
                div = b;
            end
            2'b01: begin
                negative = 1'b1;
                rem = {64'h0000000000000000, a};
                div = ~b + 1'b1;
            end

            // two negatives
            2'b11: begin
                negative = 1'b0;
                rem = {64'h0000000000000000, ~a + 1'b1};
                div = ~b + 1'b1;
            end
        endcase

        // bit shift remainder register
        rem = rem << 1;

        // complete 64 loops
        for(i=0; i<64; i=i+1) begin
            rem[127:64] = rem[127:64]-div;

            // negative remainder
            case(rem[127])
            1'b1: begin
                rem[127:64] = rem[127:64] + div;
                rem = rem << 1;
            end

            // positive or zero remainder
            1'b0: begin
                rem = rem << 1;
                rem = rem + 1'b1;
            end
            endcase
        end

        // final bit shift
        rem[127:64] = rem[127:64] >> 1;

        // store remainder
        remainder = rem[127:64];
        
        // store quotient
        if(negative) begin
            quotient = ~rem[63:0] + 1'b1;
        end
        if(~negative) begin
            quotient = rem[63:0];
        end

        // overflow
        ovr = (~negative & quotient[63])|(negative & ~quotient[63]);
    end

endmodule