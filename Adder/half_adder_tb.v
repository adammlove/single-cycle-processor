module half_adder_tb(a, b, cout, sum);
  output reg a, b;
  input wire cout;
  input wire sum;

  halfadder adder(a, b, cout, sum);

initial begin
    a = 0; b = 0;
    #1;
    a = 0; b = 1;
    #1;
    a = 1; b = 0;
    #1;
    a = 1; b = 1;
    #1;
end

endmodule