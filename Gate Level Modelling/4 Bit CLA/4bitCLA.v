module cla_4bit(
input [3:0] a,
input [3:0] b,
input cin,
output [3:0] sum,
output cout  );

wire [3:0] g, p, c;

// Generate and propagate logic
//G = A and B;
//P = A xor B;

and (g[0], a[0], b[0]);
and (g[1], a[1], b[1]);
and (g[2], a[2], b[2]);
and (g[3], a[3], b[3]);

xor (p[0], a[0], b[0]);
xor (p[1], a[1], b[1]);
xor (p[2], a[2], b[2]);
xor (p[3], a[3], b[3]);

// Carry logic
//c0 = G0 + P0Cin(c1_p0g0)
wire c1_p0g0, c2_p1g1, c2_p1p0g0, c3_p2g2, c3_p2p1g1, c3_p2p1p0g0;
and (c1_p0g0, p[0], cin);
or  (c[0], g[0], c1_p0g0);

//c1 = G1 + P1G0(c2_p1g1) + P1P0Cin(c2_p1p0g0)
and (c2_p1g1, p[1], g[0]);
and (c2_p1p0g0, p[1], p[0], cin);
or  (c[1], g[1], c2_p1g1, c2_p1p0g0);

//c2 = G2 + P2G1(c3_p2g2) + P2P1G0(c3_p2p1g1) + P2P1P0Cin(c3_p2p1p0g0)
and (c3_p2g2, p[2], g[1]);
and (c3_p2p1g1, p[2], p[1], g[0]);
and (c3_p2p1p0g0, p[2], p[1], p[0], cin);
or  (c[2], g[2], c3_p2g2, c3_p2p1g1, c3_p2p1p0g0);

// Cout(c3) = G3 + P3G2(cout_p3g2) + P3P2G1(cout_p3p2g1) + P3P2P1G0(cout_p3p2p1g0) + P3P2P1P0Cin(cout_p3p2p1p0cin)
wire cout_p3g2, cout_p3p2g1, cout_p3p2p1g0, cout_p3p2p1p0cin;
and (cout_p3g2, p[3], g[2]);
and (cout_p3p2g1, p[3], p[2], g[1]);
and (cout_p3p2p1g0, p[3], p[2], p[1], g[0]);
and (cout_p3p2p1p0cin, p[3], p[2], p[1], p[0], cin);
or  (cout, g[3], cout_p3g2, cout_p3p2g1, cout_p3p2p1g0, cout_p3p2p1p0cin);

// Sum logic
xor (sum[0], p[0], cin);
xor (sum[1], p[1], c[0]);
xor (sum[2], p[2], c[1]);
xor (sum[3], p[3], c[2]);
endmodule