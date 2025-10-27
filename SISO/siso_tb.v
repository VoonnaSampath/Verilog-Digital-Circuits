// Testbench for SISO Shift Register
`include "siso.v"
module tb_shift_register_siso;
    reg clk, reset, serial_in;
    wire serial_out;

    shift_register_siso uut (clk, reset, serial_in, serial_out);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpvars();
        $display("Time | RST IN | Shift Register Output");
        $monitor("%4t |  %b   %b |    %b", $time, reset, serial_in, serial_out);

        // Test sequence
        reset = 1; serial_in = 0; #10;
        reset = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;

        $finish;
    end
endmodule
