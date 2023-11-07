module sixteenbitadder_tb(a, b, cin, cout, sum);
  output reg [15:0] a, b;
  output reg cin;
  input wire cout;
  input wire [15:0] sum;

  sixteenbitadder adder(a, b, cin, cout, sum);

initial begin
    // test random numbers
    cin = 0;
    a = 16'h7eed;
    b = 16'h3333;
    #1;
    
    // test cout
    cin = 0;
    a = 16'h8888;
    b = 16'h8abc;
    #1;

    // test cin
    cin = 1;
    #1;

    // test over
    cin = 1'bx;
    a = 16'bx;
    b = 16'bx;
end

endmodule