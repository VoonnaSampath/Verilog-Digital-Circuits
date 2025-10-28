// Testbench for JK Flip-Flop
`include "jkff_behav.v"
module tb_jk_flip_flop;
    reg J, K, clk;
    wire Q;

    jk_flip_flop uut (J, K, clk, Q);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $display("Time | CLK J K | Q");
        $monitor("%4t |  %b  %b %b | %b", $time, clk, J, K, Q);

        // Apply various inputs to test behavior
        J = 0; K = 0; #10;  // Hold
        J = 0; K = 1; #10;  // Reset
        J = 1; K = 0; #10;  // Set
        J = 1; K = 1; #20;  // Toggle twice
        J = 0; K = 0; #10;  // Hold again

        $finish;
    end
endmodule