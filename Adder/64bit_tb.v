module sixtyfourbit_tb(a, b, cin, cout, overflow, sum);
  output reg [63:0] a, b;
  output reg cin;
  input wire cout, overflow;
  input wire [63:0] sum;

  sixtyfourbitadder adder(a, b, cin, cout, overflow, sum);

initial begin
  // test random numbers (no overflow)
  cin = 0;
  a = 64'h2de3aab587bb3212;
  b = 64'h432ab543ede98790;
  #1;

  // test carry in
  cin = 1;
  #1;

  // test overflow
  cin = 0;
  a = 64'h7fffffffffffffff;
  b = 64'h0000000000000001;
  #1;

  // two highest signed integers
  cin = 0;
  a = 64'h7fffffffffffffff;
  b = 64'h7fffffffffffffff;
  #1;

  // two lowest signed integers
  cin = 0;
  a = 64'h8000000000000000;
  b = 64'h8000000000000000;
  #1;

  // highest and lowest signed integers
  cin = 0;
  a = 64'h7fffffffffffffff;
  b = 64'h8000000000000000;
  #1;

  // have carry in cause overflow
  cin = 1;
  a = 64'h7fffffffffffffff;
  b = 64'h0000000000000000;
  #1;

  end

endmodule