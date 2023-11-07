module multiplier(mult_1, mult_2, ovr, product);
    input [63:0] mult_1, mult_2;    // inputs
    output reg [127:0] product;     // product
    output reg ovr;                 // overflow

    // internal variables
    reg [63:0] mcand, multiplier;
    reg negative;
    integer i;
    
    // reset product
    initial begin
        product = 128'h00000000000000000000000000000000;
    end

    // updates on mult_1 and mult_2
    always @(*) begin

        // determine negatives
        case({mult_1[63], mult_2[63]})
        // both positive
        2'b00: begin
            negative = 0;
            mcand = mult_1;
            multiplier = mult_2;
        end
        
        // one negative
        2'b01: begin
            negative = 1;
            mcand = mult_1;
            multiplier = ~mult_2 + 1;
        end
        2'b10: begin
            negative = 1;
            mcand = ~mult_1 + 1;
            multiplier = mult_2;
        end

        // both negative
        2'b11: begin
            negative = 0;
            mcand = ~mult_1 + 1;
            multiplier = ~mult_2 + 1;
        end
        endcase
        
        // fill the product register
        // THIS NEEDS TO BE BLOCKING
        product = {64'h0000000000000000, multiplier};

        // complete all 64 bit shifts
        for(i = 0; i<=63; i = i + 1) begin
            if(product[0] == 1'b1) begin
                product[127:64] = product[127:64] + mcand;
            end
            product = product >> 1;
        end

        // if the product should be negative, calculate 2s compliment
        if(negative) begin
            product = ~product + 1;
        end

        // overflow
        ovr = (~negative & (|product[127:63])) | (negative & ~(|product[127:63]));
    end

endmodule