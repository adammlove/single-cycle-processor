module data_mem_tb();
    reg memwrite, memread, clk;
    reg [63:0] address, data_in;
    wire [63:0] data_out;

    data_mem data(address, clk, data_in, data_out, memwrite, memread);

    initial begin
        clk = 0;
        #1;

        address = 64'h0000000400000004;
        data_in = 64'h1234567890abcdef;
        memread = 1;
        memwrite = 0;

        clk = 1;
        #1;

        clk = 0;
        #1;

        address = 64'h0000000400000004;
        data_in = 64'h1234567890abcdef;
        memread = 0;
        memwrite = 1;

        clk = 1;
        #1;

        clk = 0;
        #1;

        address = 64'h0000000400000004;
        data_in = 64'h1234567890abcdef;
        memread = 1;
        memwrite = 0;

        clk = 1;
        #1;

        clk = 0;
        #1;

        address = 64'h0000000400000004;
        data_in = 64'h1234567890abcdef;
        memread = 0;
        memwrite = 0;

        clk = 1;
        #1;

        clk = 0;
        #1;


    end
endmodule