module tff (t,clk,q,qbar);
input t,clk;
output q,qbar;
wire w1,w2;

nand (w1,t,clk,qbar);
nand (w2,t,clk,q);

nand (q,w1,qbar);
nand (qbar,w2,q);

endmodule