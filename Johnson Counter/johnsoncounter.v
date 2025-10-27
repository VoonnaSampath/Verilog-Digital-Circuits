// 4-bit Johnson Counter using Behavioral Modeling
module johnson_counter (input clk, reset, output reg [3:0] q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 4'b0000;                // Initialize counter to 0
        else
            q <= {~q[0], q[3:1]};        // Feedback inverted LSB to MSB
    end
endmodule