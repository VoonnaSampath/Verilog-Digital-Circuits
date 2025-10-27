// Testbench for BCD to 7-Segment Display Decoder
`include "bcdto7segment.v"
module tb_bcd_to_7seg;
    reg [3:0] bcd;
    wire [6:0] seg;

    bcd_to_7seg uut (bcd, seg);

    initial begin
        $fsdbDumpvars();
        $display("BCD | Segments (abcdefg)");
        $monitor(" %b | %b", bcd, seg);

        // Test all BCD digits 0–9 and invalid values
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0011; #10;
        bcd = 4'b0100; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b0110; #10;
        bcd = 4'b0111; #10;
        bcd = 4'b1000; #10;
        bcd = 4'b1001; #10;
        bcd = 4'b1010; #10; // Invalid (>9)

        $finish;
    end
endmodule
