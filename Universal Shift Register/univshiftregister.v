// 4-bit Universal Shift Register using Behavioral Modeling
module universal_shift_register (
    input [3:0] data_in,
    input clk, reset,
    input [1:0] mode,
    input serial_in_right, serial_in_left,
    output reg [3:0] data_out
);
    // Mode selection:
    // 00 -> Hold (no change)
    // 01 -> Shift right
    // 10 -> Shift left
    // 11 -> Parallel load

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            data_out <= 4'b0000;                 // Asynchronous reset
        else begin
            case (mode)
                2'b00: data_out <= data_out;                             // Hold
                2'b01: data_out <= {serial_in_left, data_out[3:1]};      // Shift right
                2'b10: data_out <= {data_out[2:0], serial_in_right};     // Shift left
                2'b11: data_out <= data_in;                              // Parallel load
                default: data_out <= data_out;
            endcase
        end
    end
endmodule