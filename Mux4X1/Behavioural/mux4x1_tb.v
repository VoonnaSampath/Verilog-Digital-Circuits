`include "mux4x1.v"
module mux4x1_tb;
reg a,b,c,d;
reg [1:0] sel;
wire y;

mux4to1_case (y,a,b,c,d,sel);  // calling the module name given in the design module
initial
begin
$fsdbDumpvars();   //To create the waveform file for the verdi
$monitor("a=%b b=%b c=%b d=%b time=%0t: sel=%b y=%b",a,b,c,d,$time,sel,y);
	a=1'b0; b=1'b1;
	c=1'bz; d=1'bx;
	  
      	sel[1]=1'b0; sel[0]=1'b0;
	#5 sel[1]=1'b0; sel[0]=1'b1;
	#5 sel[1]=1'b1; sel[0]=1'b0;
	#5 sel[1]=1'b1; sel[0]=1'b1;
	#5 $finish; // to terminate the program 

end
endmodule