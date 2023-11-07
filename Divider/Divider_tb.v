module divider_tb();
    reg [63:0] a, b;
    wire [63:0] quotient, remainder;

    divider div(a, b, , quotient, remainder);

    initial begin
        a = 8;
        b = 4;
        #1;
        a = 8;
        b = 3;
        #1;
        a = 64;
        b = 4;
        #1;
        a = 12;
        b = -3;
        #1;
        a = -12;
        b = 3;
        #1;
        a = -12;
        b = -3;
        #1;
    end

endmodule