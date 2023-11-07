module mux_tb(a, b, sel, out);
    output reg [63:0] a, b;
    output reg sel;
    input [63:0] out;
    
    multiplexer mux(a, b, sel, out);

initial begin
    a = 64'haaaaaaaaaaaaaaaa;
    b = 64'hffffffffffffffff;
    
    sel = 0;
    #1;
    sel = 1;
    #1;
end
endmodule