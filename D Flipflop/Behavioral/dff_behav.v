// D Flip-Flop with Asynchronous Reset (Behavioral Model)
module d_flip_flop_async_reset (input D, clk, reset, output reg Q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            Q <= 1'b0;   // Asynchronous reset to 0
        else
            Q <= D;      // Capture input D on positive clock edge
    end
endmodule

// Testbench for D Flip-Flop with Asynchronous Reset
module tb_d_flip_flop_async_reset;
    reg D, clk, reset;
    wire Q;

    d_flip_flop_async_reset uut (D, clk, reset, Q);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time | RST CLK D | Q");
        $monitor("%4t |  %b   %b  %b | %b", $time, reset, clk, D, Q);

        // Apply input stimulus
        reset = 1; D = 0; #10;  // Apply reset
        reset = 0; D = 1; #10;  // Normal operation
        D = 0; #10;
        reset = 1; #7;          // Assert reset asynchronously
        reset = 0; #6;          // Release reset
        D = 1; #10;
        D = 0; #10;

        $finish;
    end
endmodule
