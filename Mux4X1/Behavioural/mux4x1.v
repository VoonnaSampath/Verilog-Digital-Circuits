module mux4to1_case (output reg y, input a, b, c, d, input [1:0]sel);
    always @ (a or b or c or d or sel)
    begin
        case ({sel[1],sel[0]})
            2'b00: y = a;   // When select is 0, output follows input a
            2'b01: y = b;   // When select is 1, output follows input b
	    2'b10: y = c;
	    2'b11: y = d;
            default: y = 1'bx; // Undefined select value
        endcase
    end
endmodule
