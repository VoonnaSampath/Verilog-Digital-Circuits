module array_multiplier_4x4(
    input [3:0] a, b,
    output [7:0] p
);
    wire [3:0] pp0, pp1, pp2, pp3;
    wire s1_1, s1_2, s1_3;
    wire c1_1, c1_2, c1_3;

    wire s2_1, s2_2;
    wire c2_1, c2_2;

    wire s3_1;
    wire c3_1;

    wire c4_0, c5_0, c6_0;

    // Partial products
    and(pp0[0], a[0], b[0]);
    and(pp0[1], a[1], b[0]);
    and(pp0[2], a[2], b[0]);
    and(pp0[3], a[3], b[0]);

    and(pp1[0], a[0], b[1]);
    and(pp1[1], a[1], b[1]);
    and(pp1[2], a[2], b[1]);
    and(pp1[3], a[3], b[1]);

    and(pp2[0], a[0], b[2]);
    and(pp2[1], a[1], b[2]);
    and(pp2[2], a[2], b[2]);
    and(pp2[3], a[3], b[2]);

    and(pp3[0], a[0], b[3]);
    and(pp3[1], a[1], b[3]);
    and(pp3[2], a[2], b[3]);
    and(pp3[3], a[3], b[3]);

    // Stage 1
    assign p[0] = pp0[0];

    fa fa1_1(.a(pp0[1]), .b(pp1[0]), .cin(1'b0), .sum(s1_1), .cout(c1_1));
    fa fa1_2(.a(pp0[2]), .b(pp1[1]), .cin(pp2[0]), .sum(s1_2), .cout(c1_2));
    fa fa1_3(.a(pp0[3]), .b(pp1[2]), .cin(pp2[1]), .sum(s1_3), .cout(c1_3));

    // Stage 2
    fa fa2_1(.a(s1_2), .b(pp3[0]), .cin(c1_1), .sum(s2_1), .cout(c2_1));
    fa fa2_2(.a(s1_3), .b(pp2[2]), .cin(c1_2), .sum(s2_2), .cout(c2_2));

    // Stage 3
    fa fa3_1(.a(pp1[3]), .b(pp2[3]), .cin(pp3[1]), .sum(s3_1), .cout(c3_1));
    fa fa4_0(.a(s2_2), .b(s3_1), .cin(c1_3), .sum(c4_0), .cout(c5_0));
    fa fa5_0(.a(pp3[2]), .b(c2_2), .cin(c3_1), .sum(c6_0), .cout(p[7]));

    // Final output assignments
    assign p[1] = s1_1;
    assign p[2] = s2_1;
    assign p[3] = c4_0;
    assign p[4] = c5_0;
    assign p[5] = c6_0;
    assign p[6] = pp3[3] | c2_1; // Final bit often ORed with last carry chain in basic array structure

endmodule