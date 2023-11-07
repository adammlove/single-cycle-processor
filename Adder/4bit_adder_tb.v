module fourbitadder_tb(a, b, cin, cout, sum);
  output reg [4:0] a, b;
  output reg cin;
  input wire cout;
  input wire [3:0] sum;

  fourbitadder adder(a, b, cin, cout, sum);

initial begin
    cin = 0;
    for(a = 0; a <= 4'hF; a=a+1) begin
        for(b = 0; b <= 4'hF; b=b+1) begin
            #1;
        end
    end
    cin = 1;
    for(a = 0; a <= 4'hF; a=a+1) begin
        for(b = 0; b <= 4'hF; b=b+1) begin
            #1;
        end
    end
    cin = 1'bx;
    a = 5'bx;
    b = 5'bx;
end

endmodule