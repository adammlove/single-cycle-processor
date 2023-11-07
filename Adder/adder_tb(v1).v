module adder_tb(a, b, cout, sum);
output reg a, b;
input wire cout, sum;

halfadder ha(a, b, cout, sum);
initial begin
    $monitor("a = %h, b = %h, cout = %h, sum = %h", a, b, cout, sum);
    a = 0; b = 0;
    #1;
    a = 1; b = 0;
    #1;
    a = 0; b = 1;
    #1;
    a = 1; b = 1;
end
endmodule