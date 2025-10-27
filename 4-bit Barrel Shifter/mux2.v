module mux2(y, a, b, s);
    input a, b, s;
    output y;
    wire sbar, a1, b1;

    not (sbar, s);
    and (a1, a, sbar);
    and (b1, b, s);
    or  (y, a1, b1);
endmodule