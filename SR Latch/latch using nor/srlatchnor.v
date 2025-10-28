// SR Latch using NOR gates (Gate-Level Modeling)
module sr_latch_nor (
    input S, R,
    output Q, Qn
);
    // Cross-coupled NOR gates
    nor (Q, R, Qn);   // Q = ~(R + Qn)
    nor (Qn, S, Q);   // Qn = ~(S + Q)
endmodule