module dff (d,clk,q,qbar);
input d,clk;
output q,qbar;
wire dbar,w1,w2;

not (dbar,d);

nand (w1,d,clk);
nand (w2,dbar,clk);

nand (q,w1,qbar);
nand (qbar,w2,q);

endmodule