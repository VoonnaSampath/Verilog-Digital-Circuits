module srlatch (q,qbar,s,r);
input s,r;
output q,qbar;
wire sbar,rbar;

not n1 (sbar,s);
not n2 (rbar,r);

nand a1 (q,sbar,qbar);
nand a2 (qbar,q,rbar);

endmodule