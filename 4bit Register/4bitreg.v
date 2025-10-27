// 4-bit Register with Enable and Reset (Behavioral Model)
module register_4bit (input [3:0] D, input clk, reset, enable, output reg [3:0] Q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            Q <= 4'b0000;            // Asynchronous reset: clear the register
        else if (enable)
            Q <= D;                  // Load data when enable is high
        else
            Q <= Q;                  // Hold current value when enable is low
    end
endmodule