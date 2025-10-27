`include "array4x4multiplier.v"
`include "fa.v"

module array_multiplier_4x4_tb;
    reg [3:0] a, b;
    wire [7:0] p;

    array_multiplier_4x4 uut (.a(a), .b(b), .p(p));

    initial begin
        $fsdbDumpvars();
        $monitor("a=%d b=%d | product=%d (bin=%b)", a, b, p, p);
        a = 0; b = 0; #5;
        a = 4'd3; b = 4'd4; #5;
        a = 4'd9; b = 4'd15; #5;
        a = 4'd15; b = 4'd15; #5;
        a = 4'd7; b = 4'd10; #5;
        $finish;
    end
endmodule
