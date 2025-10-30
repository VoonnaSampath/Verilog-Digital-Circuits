// Testbench for 4-bit Synchronous Up/Down Counter
module tb_sync_counter_4bit;
    reg clk, reset, up_down;
    wire [3:0] count;

    sync_counter_4bit uut (clk, reset, up_down, count);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time | RST UP/DOWN | COUNT");
        $monitor("%4t |  %b    %b    |  %b", $time, reset, up_down, count);

        // Apply test sequences
        reset = 1; up_down = 1; #10;  // Reset counter
        reset = 0; up_down = 1; #50;  // Count up
        up_down = 0; #50;             // Count down
        reset = 1; #10;               // Reset again
        up_down = 1; #30;             // Count up again

        $finish;
    end
endmodule