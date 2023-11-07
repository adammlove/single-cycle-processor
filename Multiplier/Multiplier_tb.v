module multiplier_tb();
    reg [63:0] a, b;
    wire [127:0] product;
    wire ovr;

    multiplier mult(a, b, ovr, product);

    initial begin
        a = 5;
        b = 8;
        #1;
        a = 4231;
        b = 6543;
        #1;
        a = -1;
        b = 0;
        #1;
        a = 12;
        b = -3;
        #1;
        a = -12;
        b = -3;
        #1;
        a = 64'h7000000000000000;
        b = 2;
        #1;
    end

endmodule