module data_mem(address, clk, data_in, data_out, memwrite, memread);
    input memwrite, memread, clk;
    input [63:0] address, data_in;
    output reg [63:0] data_out;

    // 1 kilobyte
    reg [7:0] mem [0:1024];

    // initialize memory to 0
    integer i;
    initial begin
        for(i=0; i<1024; i=i+1) begin
            mem[i] = 8'h00;
        end
        
        // value a
        {mem[0], mem[1], mem[2], mem[3]} = 1000;

        // value b
        {mem[8], mem[9], mem[10], mem[11]} = $signed(-200);

        // value c
        {mem[16], mem[17], mem[18], mem[19]} = 300;

        // value d
        {mem[24], mem[25], mem[26], mem[27]} = 700;

        // value e
        {mem[32], mem[33], mem[34], mem[35]} = 100;

        // value f
        {mem[40], mem[41], mem[42], mem[43]} = 3;

    end

    always @(negedge clk) begin
        // write data using lower 32 bits
        if(memwrite) begin
            data_out <= 64'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            mem[address] <= data_in[31:24];
            mem[address+1] <= data_in[23:16];
            mem[address+2] <= data_in[15:8];
            mem[address+3] <= data_in[7:0];
        end
        // read data
        // since registers are 64-bit, perform sign extension
        if(memread) begin
            data_out <= $signed({mem[address], mem[address+1], mem[address+2], mem[address+3]});
        end
    end
endmodule