module ALU_tb();
    reg [63:0] a, b;
    reg [2:0] sel;
    wire [63:0] result;
    wire z_f, o_f;
    
    ALU alu(a, b, sel, result, z_f, o_f);

    initial begin
        // test addition
        sel = 3'b000;
        a = 6;
        b = 3;
        #1;
        a = 12;
        b = -12;
        #1;
        a = 64'h7000000000000000;
        b = 64'h7000000000000000;
        #1;

        // test subtraction
        sel = 3'b001;
        a = 6;
        b = 6;
        #1;
        a = 12;
        b = -12;
        #1;
        a = 64'h7000000000000000;
        b = 64'h7000000000000000;
        #1;

        // test multiplication
        sel = 3'b010;
        a = 5;
        b = 5;
        #1;
        a = 4;
        b = 0;
        #1;
        a = -12;
        b = 4;
        #1;
        a = 64'h7000000000000000;
        b = 2;
        #1;

        // test division
        sel = 3'b011;
        a = 5;
        b = 5;
        #1;
        a = 4;
        b = 0;
        #1;
        a = -12;
        b = 4;
        #1;
        a = 64'h7000000000000000;
        b = 2;
        #1;

        // test AND
        sel = 3'b100;
        a = 64'hffffffffffffffff;
        b = 64'haaaaaaaaaaaaaaaa;
        #1;
        a = 64'hffffffffffffffff;
        b = 64'h0000000000000000;
        #1;

        // test OR
        sel = 3'b101;
        a = 64'h5555555555555555;
        b = 64'haaaaaaaaaaaaaaaa;
        #1;
        a = 64'h0000000000000000;
        b = 64'h0000000000000000;
        #1;
    end
endmodule