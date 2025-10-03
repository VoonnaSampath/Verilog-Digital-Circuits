module jkflipflop(j,k,clk,q,qbar);
input j,k,clk;
output q,qbar;
wire w1,w2;

nand n1 (w1,j,clk);
nand n2 (w2,k,clk);

nand n3 (q,w1,qbar);
nand n4 (qbar,w2,q);

endmodule