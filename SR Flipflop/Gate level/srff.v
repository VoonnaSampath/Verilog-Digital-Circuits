// SR Flip-Flop using SR latch (NAND gates, active-HIGH)
module sr_flipflop (
    input S,       // Set
    input R,       // Reset
    input CLK,     // Clock
    output Q,
    output Qbar
);
    wire S_g, R_g; // Gated inputs

    // Gate the inputs with clock
    and (S_g, S, CLK);
    and (R_g, R, CLK);

    // SR latch (active HIGH behavior)
    wire S_n, R_n;
    not (S_n, S_g);
    not (R_n, R_g);

    nand (Q, S_n, Qbar);
    nand (Qbar, R_n, Q);

endmodule