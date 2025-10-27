// Testbench for 4-bit Ring Counter
`include "ringcounter.v"
module tb_ring_counter;
    reg clk, reset;
    wire [3:0] q;

    ring_counter uut (clk, reset, q);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        $fsdbDumpvars();
        $display("Time | Reset | Count");
        $monitor("%4t |   %b   |  %b", $time, reset, q);

        // Apply test sequence
        reset = 1; #10;             // Activate reset
        reset = 0; #50;             // Run the counter for a few cycles
        reset = 1; #10;             // Reset again to restart sequence
        reset = 0; #50;

        $finish;
    end
endmodule
