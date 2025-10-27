`include "mealymoore1101.v" "dff.v"
module fsm_1101_tb;
    reg clk, reset, x;
    wire y_mealy, y_moore;

    mealy_1101 mealy_u(clk, reset, x, y_mealy);
    moore_1101 moore_u(clk, reset, x, y_moore);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $monitor("Time=%0t | x=%b | Mealy=%b | Moore=%b", $time, x, y_mealy, y_moore);
        reset = 1; x = 0; #10;
        reset = 0;

        // Apply pattern: "0011011101"
        x = 0; #10; x = 0; #10; // idle
        x = 1; #10; x = 1; #10; // "11"
        x = 0; #10;             // "110"
        x = 1; #10;             // "1101" (output)
        x = 1; #10; x = 0; #10;
        x = 1; #10;
        $finish;
    end
endmodule
