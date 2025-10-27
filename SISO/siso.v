// 4-bit Serial-In Serial-Out (SISO) Shift Register using Behavioral Modeling
module shift_register_siso (input clk, reset, serial_in, output reg serial_out);
    reg [3:0] shift_reg; // Internal 4-bit register

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            shift_reg <= 4'b0000;           // Clear the register
        else
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left with new serial input
    end

    always @(*)
        serial_out = shift_reg[3]; // Output the last bit (MSB)
endmodule
