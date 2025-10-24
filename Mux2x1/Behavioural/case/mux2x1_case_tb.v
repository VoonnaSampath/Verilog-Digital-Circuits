`include "mux2x1_case.v"
module tb_mux2to1_case;
    reg a, b, sel;
    wire y;

    mux2to1_case uut (y, a, b, sel);

    initial begin
        
        $fsdbDumpvars();
        $display("SEL A B | Y");
        $monitor(" %b   %b %b | %b", sel, a, b, y);

        // Test all input combinations
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;

        $finish;
    end
endmodule