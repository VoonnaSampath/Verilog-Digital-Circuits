module mux2to1_case (output reg y, input a, b, sel);
    always @ (a or b or sel)
    begin
        case (sel)
            1'b0: y = a;   // When select is 0, output follows input a
            1'b1: y = b;   // When select is 1, output follows input b
            default: y = 1'bx; // Undefined select value
        endcase
    end
endmodule