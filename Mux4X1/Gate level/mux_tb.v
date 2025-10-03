`include "mux.v" // including the design file

module mux_tb;
reg [3:0] I;
reg [1:0] S;
wire OUT;

mmux a1 (OUT,S,I);  // calling the module name given in the design module
initial
begin
$fsdbDumpvars();   //To create the waveform file for the verdi

	I=4'b1010;
	  
      	S[1]=1'b0; S[0]=1'b0;
	#5 S[1]=1'b0; S[0]=1'b1;
	#5 S[1]=1'b1; S[0]=1'b0;
	#5 S[1]=1'b1; S[0]=1'b1;
	#5 $finish; // to terminate the program 

end
endmodule