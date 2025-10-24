module mux2to1 (output y, input a, b, sel);
    wire not_sel, a_and, b_and;

    not (not_sel, sel);           // Invert select line
    and (a_and, a, not_sel);      // a AND (NOT sel)
    and (b_and, b, sel);          // b AND sel
    or  (y, a_and, b_and);        // OR of both terms
endmodule