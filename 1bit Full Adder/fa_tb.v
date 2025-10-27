`include "fa.v"

module fa_tb();
reg A, B, Cin;
wire Sum;
wire Cout;
fa UUT(
    .a(A),
    .b(B),
    .cin(Cin),
    .sum(Sum),
    .cout(Cout)
);

initial begin
		$fsdbDumpvars();
		
    $monitor("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);

    // when cin=0
    A = 1; 
    B = 0; 
    Cin = 0;
    #10; // Wait for 10 time units for simulation to propagate the changes
    
    // cin=1
    A = 1; 
    B = 0; 
    Cin = 1;
    #10; // Wait for 10 time units for simulation to propagate the changes
     // Stops the simulation
end
endmodule