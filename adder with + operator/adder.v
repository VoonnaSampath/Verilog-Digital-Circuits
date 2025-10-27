// 4-bit Adder using + Operator (Behavioral Model)
module adder_4bit (input [3:0] A, B, output [4:0] SUM);
    assign SUM = A + B; // Behavioral addition using '+' operator
endmodule