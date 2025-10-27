`include "tff.v" "mod6counter.v"

module mod6_counter_tb;
    reg clk, reset;
    wire [2:0] q;

    mod6_counter uut(.q(q), .clk(clk), .reset(reset));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        $fsdbDumpvars();
        $monitor("Time=%0t | q=%b", $time, q);
        reset = 1; #12;
        reset = 0; #100;
        $finish;
    end
endmodule