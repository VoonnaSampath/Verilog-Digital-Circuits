`include "adder4.v"
`include "subtractor4.v"
`include "and4.v"
`include "or4.v"
`include "xor4.v"
`include "alu.v"
module alu4bit_tb;
    reg [3:0] a, b;
    reg cin;
    reg [1:0] sel;
    wire [3:0] y;
    wire cout;

    alu4bit uut(.y(y), .cout(cout), .a(a), .b(b), .cin(cin), .sel(sel));
    initial begin
        $monitor("a=%b b=%b cin=%b sel=%b | y=%b cout=%b", a, b, cin, sel, y, cout);
        a = 4'b1010; b = 4'b0011; cin = 1'b0;

        sel = 2'b00; #5; // AND
        sel = 2'b01; #5; // OR
        sel = 2'b10; #5; // XOR
        sel = 2'b11; cin = 1'b0; #5; // ADD
        a = 4'b1111; b = 4'b0001; sel = 2'b11; cin = 1'b1; #5; // ADD (carry-in)
        $finish;
    end
endmodule