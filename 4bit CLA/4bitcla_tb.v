`include "4bitcla.v"

module cla_4bit_tb();
reg [3:0] A, B;
reg Cin;
wire [3:0] S;
wire Cout;
cla_4bit UUT(
    .a(A),
    .b(B),
    .cin(Cin),
    .sum(S),
    .cout(Cout)
);

initial begin
		$fsdbDumpvars();
		
    $monitor("A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

    // Adding 5 + 7
    A = 4'b0011; // 5 in binary
    B = 4'b0111; // 7 in binary
    Cin = 1'b0;
    #10; // Wait for 10 time units for simulation to propagate the changes
    $display("%4d",S);
    
    // Adding 7 + 10
    A = 4'b0111; // 7 in binary
    B = 4'b1010; // 10 in binary
    Cin = 1'b0;
    #10; // Wait for 10 time units for simulation to propagate the changes
    $display("%4d",S);
     // Stops the simulation
end
endmodule