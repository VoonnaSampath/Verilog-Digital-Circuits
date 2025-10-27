// Testbench for 4-bit Adder
`include "adder.v"
module tb_adder_4bit;
    reg [3:0] A, B;
    wire [4:0] SUM;

    adder_4bit uut (A, B, SUM);

    initial begin
        $fsdbDumpvars();
        $display("   A     B   |  SUM");
        $monitor(" %b  %b  |  %b", A, B, SUM);

        // Test all input cases
        A = 4'b0000; B = 4'b0000; #10;
        A = 4'b0001; B = 4'b0010; #10;
        A = 4'b0101; B = 4'b0011; #10;
        A = 4'b1000; B = 4'b0111; #10;
        A = 4'b1111; B = 4'b0001; #10;
        A = 4'b1111; B = 4'b1111; #10;

        $finish;
    end
endmodule
