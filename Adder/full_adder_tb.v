module full_adder_tb(a, b, cin, cout, sum);
  output reg a, b;
  output reg cin;
  input wire cout;
  input wire sum;

  fulladder adder(a, b, cin, cout, sum);

initial begin
    a = 0; b = 0; cin = 0;
    #1;
    a = 0; b = 1; cin = 0;
    #1;
    a = 1; b = 0; cin = 0;
    #1;
    a = 1; b = 1; cin = 0;
    #1;
    a = 0; b = 0; cin = 1;
    #1;
    a = 0; b = 1; cin = 1;
    #1;
    a = 1; b = 0; cin = 1;
    #1;
    a = 1; b = 1; cin = 1;
    #1;
end

endmodule