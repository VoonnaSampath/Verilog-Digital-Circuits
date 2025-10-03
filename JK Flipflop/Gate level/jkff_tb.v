`include "jkflipflop.v"

module jkff_tb;
reg j,k,clk;
wire Q,Qbar;

jkflipflop (j,k,clk,Q,Qbar);

initial begin

$display("CLK  J  K  |  Q  Qbar");
        $display("----------------------");

        CLK = 0; j = 0; k = 0; #5;

        CLK = 1; j = 1; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, j, k, Q, Qbar);

        // Hold state (CLK = 0)
        CLK = 0; j = 0; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, j, k, Q, Qbar);

        CLK = 1; j = 0; k = 1; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, j, k, Q, Qbar);

        CLK = 0; j = 0; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, j, k, Q, Qbar);

        // Toogle case: J = 1, K = 1 (when clock = 1)
        CLK = 1; j = 1; k = 1; #5;
        $display(" %b   %b  %b  |  %b   %b  <-- Toggle", CLK, j, k, Q, Qbar);

        $finish;
        
        end
        endmodule