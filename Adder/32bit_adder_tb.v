module thirtytwobitadder_tb(a, b, cin, cout, sum);
  output reg [31:0] a, b;
  output reg cin;
  input wire cout;
  input wire [31:0] sum;

  thirtytwobitadder adder(a, b, cin, cout, sum);

initial begin
    // test random numbers (no cout)
    cin = 0;
    a = 32'h7eed7eed;
    b = 32'h33333333;
    #1;
    
    // test cout
    cin = 0;
    a = 32'h88888888;
    b = 32'h8abcdabe;
    #1;

    // test cin
    cin = 1;
    #1;

    // test over
    cin = 1'bx;
    a = 32'bx;
    b = 32'bx;
end

endmodule