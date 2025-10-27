module mod6_counter(q, clk, reset);
    input clk, reset;
    output [2:0] q;
    wire [2:0] q_int;
    wire t0, t1, t2, reset_preset;

    // Internal T inputs (obtained by K-map for MOD-6 using T FFs)
    assign t0 = 1;                 // Toggle every clock
    and (t1, q_int[0]);            // Toggle on q0 high
    and (t2, q_int[0], q_int[1]);  // Toggle on q0 and q1 high

    // Counter reset to zero when state 110 (6)
    assign reset_preset = (q_int == 3'b110);

    tff tff0(q_int[0], t0, clk, reset | reset_preset);
    tff tff1(q_int[1], t1, clk, reset | reset_preset);
    tff tff2(q_int[2], t2, clk, reset | reset_preset);

    assign q = q_int;
endmodule