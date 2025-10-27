module tff(q, t, clk, reset);
    input t, clk, reset;
    output reg q;
    always @(posedge clk or posedge reset)
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q;
endmodule