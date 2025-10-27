`include "mux2.v"
`include "barrelshifter4bit.v"

module barrel_shifter_4bit_tb;
    reg [3:0] d;
    reg [1:0] s;
    wire [3:0] y;

    barrel_shifter_4bit uut(.y(y), .d(d), .s(s));

    initial begin
        $fsdbDumpvars();
        $monitor("d=%b, s=%b | y=%b", d, s, y);
        d = 4'b1101;  s = 2'b00; #5; // No shift
        d = 4'b1101;  s = 2'b01; #5; // Shift by 1
        d = 4'b1101;  s = 2'b10; #5; // Shift by 2
        d = 4'b1101;  s = 2'b11; #5; // Shift by 3
        d = 4'b0011;  s = 2'b01; #5; // Vary d, shift by 1
        d = 4'b1010;  s = 2'b10; #5; // Vary d, shift by 2
        $finish;
    end
endmodule