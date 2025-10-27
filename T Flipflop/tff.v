// T Flip-Flop using Behavioral Modeling
module t_flip_flop (input T, clk, output reg Q);
    always @(posedge clk)
    begin
        if (T)
            Q <= ~Q;   // Toggle when T = 1
        else
            Q <= Q;    // Hold previous state when T = 0
    end
endmodule