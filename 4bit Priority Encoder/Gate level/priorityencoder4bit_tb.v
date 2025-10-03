`include "priorityencoder4bit.v"

module priencoder4bit_tb;
reg i3,i2,i1,i0;
wire ;
wire valid;

priencoder4bit a1 (i3,i2,i1,i0,y1,y0,valid);

initial begin

$fsdbDumpvars();

$display("i3 i2 i1 i0 y1 y0 valid");
i3=0; i2=0; i1=0; i0=0;
#5 $display("%b  %b  %b  %b  %b  %b  %b",i3,i2,i1,i0,y1,y0,valid);
#5 i3=0; i2=0; i1=0; i0=1;
#5 $display("%b  %b  %b  %b  %b  %b  %b",i3,i2,i1,i0,y1,y0,valid);
#5 i3=0; i2=0; i1=1; i0= 1'bx;
#5 $display("%b  %b  %b  %b  %b  %b  %b",i3,i2,i1,i0,y1,y0,valid);
#5 i3=0; i2=1; i1=1'bx; i0=1'bx;
#5 $display("%b  %b  %b  %b  %b  %b  %b",i3,i2,i1,i0,y1,y0,valid);
#5 i3=1; i2= 1'bx; i1=1'bx; i0=1'bx;
#5 $display("%b  %b  %b  %b  %b  %b  %b",i3,i2,i1,i0,y1,y0,valid);
#5 $finish;

end
endmodule
