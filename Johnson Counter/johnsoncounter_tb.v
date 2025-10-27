// Testbench for 4-bit Johnson Counter
`include "johnsoncounter.v"
module tb_johnson_counter;
    reg clk, reset;
    wire [3:0] q;

    johnson_counter uut (clk, reset, q);

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $display("Time | Reset | Count");
        $monitor("%4t |   %b   |  %b", $time, reset, q);

        // Test sequence
        reset = 1; #10;             // Activate reset
        reset = 0; #100;            // Run Johnson counter cycles
        reset = 1; #10;             // Reset and start again
        reset = 0; #60;

        $finish;
    end
endmodule
