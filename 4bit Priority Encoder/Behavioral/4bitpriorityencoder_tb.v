// Testbench for 4-to-2 Priority Encoder
`include "4bitpriorityencoder.v"
module tb_priority_encoder_4to2;
    reg [3:0] D;
    wire [1:0] Y;
    wire valid;

    priority_encoder_4to2 uut (D, Y, valid);

    initial begin
        $fsdbDumpvars();
        $display(" D3 D2 D1 D0 | Y1 Y0 | Valid");
        $monitor("  %b  %b  %b  %b |  %b  %b |   %b", D[3], D[2], D[1], D[0], Y[1], Y[0], valid);

        // Test all input combinations
        D = 4'b0000; #10;
        D = 4'b0001; #10;
        D = 4'b0010; #10;
        D = 4'b0100; #10;
        D = 4'b1000; #10;
        D = 4'b1010; #10;
        D = 4'b0111; #10;
        D = 4'b1100; #10;

        $finish;
    end
endmodule
