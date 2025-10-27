// Testbench for 4-bit Register with Enable and Reset
`include "4bitreg.v"
module tb_register_4bit;
    reg [3:0] D;
    reg clk, reset, enable;
    wire [3:0] Q;

    register_4bit uut (D, clk, reset, enable, Q);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $display("Time | RST EN | D    | Q");
        $monitor("%4t |  %b   %b | %b | %b", $time, reset, enable, D, Q);

        // Test sequence
        reset = 1; enable = 0; D = 4'b0000; #10;   // Apply reset
        reset = 0; enable = 1; D = 4'b1010; #10;   // Load D into register
        enable = 0; D = 4'b1100; #10;              // Disable load (Q holds)
        enable = 1; D = 4'b1111; #10;              // Load new data
        reset = 1; #10;                            // Reset register
        reset = 0; enable = 1; D = 4'b0101; #10;   // Load new value

        $finish;
    end
endmodule