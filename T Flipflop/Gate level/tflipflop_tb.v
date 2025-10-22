`include "tflipflop.v"

module tff_tb;
reg t,clk;
wire q,qbar;

tff dut (t,clk,q,qbar);

initial begin

$fsdbDumpvars();

$display("clk, t, q, qbar ");
$display("----------------");

clk=1; t=0;
#5 $display("%b  %b  %b  %b",clk,t,q,qbar);
#5 clk=0; t=0;
#5 $display("%b  %b  %b  %b",clk,t,q,qbar);
#5 clk=1; t=1;
#5 $display("%b  %b  %b  %b",clk,t,q,qbar);
#5 clk=0; t=0;
#5 $display("%b  %b  %b  %b",clk,t,q,qbar);

#5 $finish;
end
endmodule