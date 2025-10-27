// Testbench for T Flip-Flop
`include "tff.v"
module tb_t_flip_flop;
    reg T, clk;
    wire Q;

    t_flip_flop uut (T, clk, Q);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $display("Time | CLK T | Q");
        $monitor("%4t |  %b  %b | %b", $time, clk, T, Q);

        // Apply stimulus
        T = 0; #10;   // No toggle
        T = 1; #10;   // Toggle once
        T = 0; #10;   // Hold
        T = 1; #30;   // Multiple toggles
        T = 0; #10;   // Hold state

        $finish;
    end
endmodule