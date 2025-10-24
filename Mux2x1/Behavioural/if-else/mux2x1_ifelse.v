module mux2to1 (output reg y, input a, b, sel);
    always @ (a or b or sel)
    begin
        if (sel == 1'b0)
            y = a;      // When select is 0, output follows input a
        else
            y = b;      // When select is 1, output follows input b
    end
endmodule