// JK Flip-Flop using Behavioral Modeling
module jk_flip_flop (input J, K, clk, output reg Q);
    always @(posedge clk)
    begin
        if (J == 0 && K == 0)
            Q <= Q;         // Hold state
        else if (J == 0 && K == 1)
            Q <= 1'b0;      // Reset
        else if (J == 1 && K == 0)
            Q <= 1'b1;      // Set
        else if (J == 1 && K == 1)
            Q <= ~Q;        // Toggle
    end
endmodule