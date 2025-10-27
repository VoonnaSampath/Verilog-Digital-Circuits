`include "jkff.v"
module jkff_tb;
reg j,k,clk;
wire Q,Qbar;

jkflipflop (j,k,clk,Q,Qbar);

initial begin

$fsdbDumpvars();
$display("CLK  J  K  |  Q  Qbar");        
$display("----------------------");

        clk = 0; j = 0; k = 0; #5;

        clk = 1; j = 1; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", clk, j, k, Q, Qbar);

        // Hold state (CLK = 0)
        clk = 0; j = 0; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", clk, j, k, Q, Qbar);

        clk = 1; j = 0; k = 1; #5;
        $display(" %b   %b  %b  |  %b   %b", clk, j, k, Q, Qbar);

        clk = 0; j = 0; k = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", clk, j, k, Q, Qbar);

        // Toogle case: J = 1, K = 1 (when clock = 1)
        clk = 1; j = 1; k = 1; #5;
        $display(" %b   %b  %b  |  %b   %b  <-- Toggle", clk, j, k, Q, Qbar);

        $finish;
        
        end
        endmodule