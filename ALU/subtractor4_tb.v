`include "subtractor4.v"
module fs4bit_tb;

    reg [3:0] a, b;
    reg bin;
    
    wire [3:0] d;
    wire bout;

    fs4bit uut (
        .a(a),
        .b(b),
        .bin(bin),
        .d(d),
        .bout(bout)
    );

    initial begin
    
        $fsdbDumpvars();
        
        $display("Time\t a    b  bin | d  bout");
        $display("-------------------------------");
        
        // Test vectors
        a = 4'b0000; b = 4'b0000; bin = 0; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        a = 4'b0001; b = 4'b0010; bin = 0; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        a = 4'b1010; b = 4'b0101; bin = 1; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        a = 4'b1111; b = 4'b1111; bin = 0; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        a = 4'b1001; b = 4'b0110; bin = 1; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        a = 4'b1100; b = 4'b0011; bin = 0; #10;
        $display("%0t\t%b %b  %b   | %b   %b", $time, a, b, bin, d, bout);

        $finish;
    end
endmodule