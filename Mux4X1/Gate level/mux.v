module mmux(out,s,i);
input [3:0] i;
input [1:0] s;
output out;
wire [3:0] w;
wire sbar1,sbar0 ;

not n0 (sbar0,s[0]);
not n1 (sbar1,s[1]);

and a1 (w[0],sbar1,sbar0,i[0]);
and a2 (w[1],sbar1,s[0],i[1]);
and a3 (w[2],s[1],sbar0,i[2]);
and a4 (w[3],s[1],s[0],i[3]);

or o1 (out,w[0],w[1],w[2],w[3]);

endmodule