module barrel_shifter_4bit(y, d, s);
    input  [3:0] d;
    input  [1:0] s; // Shift amount: 00=no shift, 01=1, 10=2, 11=3 right shifts
    output [3:0] y;

    wire [3:0] stage1, stage2;

    // Stage 1: Shift by 1 bit if s[0] == 1
    mux2 m0_s1(stage1[0], d[0], d[1], s[0]);
    mux2 m1_s1(stage1[1], d[1], d[2], s[0]);
    mux2 m2_s1(stage1[2], d[2], d[3], s[0]);
    mux2 m3_s1(stage1[3], d[3], 1'b0, s[0]);   // Shift in 0

    // Stage 2: Shift by 2 bits if s[1] == 1
    mux2 m0_s2(stage2[0], stage1[0], stage1[2], s[1]);
    mux2 m1_s2(stage2[1], stage1[1], stage1[3], s[1]);
    mux2 m2_s2(stage2[2], stage1[2], 1'b0,     s[1]); // Shift in 0
    mux2 m3_s2(stage2[3], stage1[3], 1'b0,     s[1]); // Shift in 0

    assign y = stage2;
endmodule