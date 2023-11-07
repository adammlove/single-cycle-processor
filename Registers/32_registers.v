module allregisters(write, clk, sel_r1, sel_r2, sel_w, data_in, data_out1, data_out2);
    input write, clk;
    input [4:0] sel_r1, sel_r2, sel_w;
    input [63:0] data_in;
    output reg [63:0] data_out1, data_out2;

    // all 32 registers
    reg [63:0] register [0:31];

    // initalize registers to 0x0000000000000000
    initial begin
        for(integer i = 0; i <=31; i = i+1) begin
            register[i] = 64'h0000000000000000;
        end
    end

    // select registers to read from
    always @(sel_r1, sel_r2) begin
        data_out1 <= register[sel_r1];
        data_out2 <= register[sel_r2];
    end

    // logic for writing to register
    always @(negedge clk) begin
        // write must be enabled, cannot write to 0 register
        if(write & (sel_w != 0)) begin
            // select which register to write to
            register[sel_w] <= data_in;
        end
    end

endmodule