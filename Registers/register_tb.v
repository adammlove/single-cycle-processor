module registers_tb();
    reg write, clk;
    reg [4:0]  sel_r1, sel_r2, sel_w;
    reg [63:0] data_in;
    wire [63:0] data_out1, data_out2;
    
    allregisters registers(write, clk, sel_r1, sel_r2, sel_w, data_in, data_out1, data_out2);

    initial begin
        clk = 0;
        write = 1;
        #1;
        
        clk = 1;
        sel_w = 0;
        data_in = 64'h1234567812345678;
        #1;
        
        clk = 0;
        #1;
        
        sel_w = 31;
        data_in = 64'h00000000ffffffff;
        clk = 1;
        #1;
        
        clk = 0;
        #1;
        
        clk = 1;
        sel_r1 = 0;
        sel_r2 = 31;
        write = 0;
        sel_w = 5;
        data_in = 64'h0000000000534642;
        #1;
        
        clk = 0;
        #1;
        
        clk = 1;
        sel_r1 = 31;
        sel_r2 = 5;
        #1;

    end

endmodule