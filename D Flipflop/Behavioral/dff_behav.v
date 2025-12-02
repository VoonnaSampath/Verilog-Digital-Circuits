// D Flip-Flop with Asynchronous Reset (Behavioral Model)
module d_flip_flop_async_reset (input D, clk, reset, output reg Q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            Q <= 1'b0;   // Asynchronous reset to 0
        else
            Q <= D;      // Capture input D on positive clock edge
    end
endmodule
// End of File