`include "dflipflop.v"
module dff_tb;
reg d,clk;
wire q,qbar;

dff (d,clk,q,qbar);

initial begin
$fsdbDumpvars();

$display("CLK  D |  Q  Qbar");
        $display("----------------------");
clk=1; d=0; 
#5 $display(" %b   %b  |  %b   %b", clk, d, q, qbar);
#5 clk =0; d=1'bx;
#5 $display(" %b   %b  |  %b   %b", clk, d, q, qbar);
#5 clk =1; d=1;
#5 $display(" %b   %b  |  %b   %b", clk, d, q, qbar);
#5 clk =1; d=0;
#5 $display(" %b   %b  |  %b   %b", clk, d, q, qbar);
#5 $finish;

end
endmodule