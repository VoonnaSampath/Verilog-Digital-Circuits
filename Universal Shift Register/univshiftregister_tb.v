// Testbench for 4-bit Universal Shift Register
`include "univshiftregister.v"
module tb_universal_shift_register;
    reg [3:0] data_in;
    reg clk, reset;
    reg [1:0] mode;
    reg serial_in_right, serial_in_left;
    wire [3:0] data_out;

    universal_shift_register uut (data_in, clk, reset, mode, serial_in_right, serial_in_left, data_out);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        $fsdbDumpvars();
        $display("Time | Mode Reset | Serial L | Serial R | Data In | Data Out");
        $monitor("%4t |  %b    %b    |    %b     |    %b    |  %b  |   %b",
                 $time, mode, reset, serial_in_left, serial_in_right, data_in, data_out);

        // Apply test sequences
        reset = 1; data_in = 4'b0000; mode = 2'b11; serial_in_left = 0; serial_in_right = 0; #10;
        reset = 0;
        
        data_in = 4'b1010; mode = 2'b11; #10;   // Parallel load
        mode = 2'b10; serial_in_right = 1; #10; // Shift left (LSB ← 1)
        mode = 2'b01; serial_in_left = 0; #10;  // Shift right (MSB ← 0)
        mode = 2'b00; #10;                      // Hold
        mode = 2'b10; serial_in_right = 1; #10; // Shift left again
        mode = 2'b11; data_in = 4'b1100; #10;   // Parallel load new data

        $finish;
    end
endmodule
