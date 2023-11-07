module halfadder(A, B, cout, sum);
    input A, B;             // bits to add
    output cout, sum;       // carry out and summation

    assign sum = A ^ B;     // calculate the sum
    assign cout = A & B;    // calculate carry out

endmodule

module fulladder(A, B, cin, cout, sum);
    input A, B, cin;        // bits to add, A, B and carry in
    output cout, sum;       // carry out and summation

    wire cout_a;            // carry out for A, used to calculate final carry out
    wire sum_a;             // summation for A, goes to A bit for 2nd half adder
    wire cout_b;            // carry out for B, used to calculate final carry out
    wire sum_b;             // summation for B, used to calculte final sum

    halfadder ha_a(A,     B,   cout_a, sum_a);        // set up first half adder
    halfadder ha_b(sum_a, cin, cout_b, sum_b);  // set up second half adder

    assign cout = cout_a | cout_b;  // calculate carry out
    assign sum = sum_b;             // calculate sum

endmodule

module fourbitadder(A, B, cin, cout, sum);
    input [3:0] A, B;   // 4 bit inputs A and B
    input cin;          // carry in
    output cout;        // carry out
    output [3:0] sum;   // 4 bit summation

    wire cout_a;        // carry out for full adder a, goes to carry in for full adder b
    wire cout_b;        // carry out for full adder b, goes to carry in for full adder c
    wire cout_c;        // carry out for full adder c, goes to carry in for full adder d

    // set up all 4 full adders, cascading into each other
    fulladder fa_a(A[0], B[0], cin,    cout_a, sum[0]);
    fulladder fa_b(A[1], B[1], cout_a, cout_b, sum[1]);
    fulladder fa_c(A[2], B[2], cout_b, cout_c, sum[2]);
    fulladder fa_d(A[3], B[3], cout_c, cout,   sum[3]);

endmodule

module sixteenbitadder(A, B, cin, cout, sum);
    input [15:0] A, B;  // 16 bit inputs A and B
    input cin;          // carry in
    output cout;        // carry out
    output [15:0] sum;  // 16 bit summation

    wire cout_a;        // carry out for 4-bit adder a, goes to carry in for 4-bit adder b
    wire cout_b;        // carry out for 4-bit adder b, goes to carry in for 4-bit adder c
    wire cout_c;        // carry out for 4-bit adder c, goes to carry in for 4-bit adder d

    // set up all 4-bit adders, cascading into each other
    fourbitadder fb_a(A[3:0],   B[3:0],   cin,    cout_a, sum[3:0]);
    fourbitadder fb_b(A[7:4],   B[7:4],   cout_a, cout_b, sum[7:4]);
    fourbitadder fb_c(A[11:8],  B[11:8],  cout_b, cout_c, sum[11:8]);
    fourbitadder fb_d(A[15:12], B[15:12], cout_c, cout,   sum[15:12]);

endmodule

module thirtytwobitadder(A, B, cin, cout, sum);
    input [31:0] A, B;  // 32 bit inputs A and B
    input cin;          // carry in
    output cout;        // carry out
    output [31:0] sum;  // 32 bit summation

    wire cout_a;        // carry out for 16-bit adder a, goes to carry in for 16-bit adder b

    // set up all 16-bit adders, cascading into each other
    sixteenbitadder sb_a(A[15:0],  B[15:0],  cin,    cout_a, sum[15:0]);
    sixteenbitadder sb_b(A[31:16], B[31:16], cout_a, cout,   sum[31:16]);
endmodule

module sixtyfourbitadder(A, B, cout, ovr, sum);
    input [63:0] A, B;  // 64 bit inputs A and B
    output cout;        // carry out
    output ovr;         // overflow
    output [63:0] sum;  // 64 bit summation

    wire cout_a;

    thirtytwobitadder tt_a(A[31:0],  B[31:0],  1'b0,   cout_a, sum[31:0]);
    thirtytwobitadder tt_b(A[63:32], B[63:32], cout_a, cout,   sum[63:32]);
    
    assign ovr = ((~sum[63]) & A[63] & B[63])|(sum[63] & (~A[63]) & (~B[63]));
endmodule