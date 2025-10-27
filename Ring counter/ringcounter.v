// 4-bit Ring Counter using Behavioral Modeling
module ring_counter (input clk, reset, output reg [3:0] q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 4'b0001;           // Initialize with one hot bit
        else
            q <= {q[2:0], q[3]};    // Rotate left (circular shift)
    end
endmodule