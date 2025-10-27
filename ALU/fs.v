module fs (d,bout,a,b,bin);
input a,b,bin;
output d,bout;

wire w1,w1bar,w2,w3,abar;

not n1 (abar,a);
not n2 (w1bar,w1);

xor x1 (w1,a,b);
xor x2 (d,w1,bin);

and a1 (w2,w1bar,bin);
and a2 (w3,abar,b);

or o1 (bout,w2,w3);

endmodule