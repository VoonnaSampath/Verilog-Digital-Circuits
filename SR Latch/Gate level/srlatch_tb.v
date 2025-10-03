`include "srlatch.v"

    reg S, R;
    wire Q, Qn;

srlatch uut (
  .s(S),
  .r(R),
  .q(Q),
  .qbar(Qn)
    );

initial 
begin

$fsdbDumpvars();

 $display("S R | Q Qn");
        
        // Initial state: both 0 (hold previous state)
        S = 0; R = 0; #5;
        $display("%b %b | %b %b", S, R, Q, Qn);

        // Set: S=1, R=0
        S = 1; R = 0; #5;
        $display("%b %b | %b %b", S, R, Q, Qn);

        // Reset: S=0, R=1
        S = 0; R = 1; #5;
        $display("%b %b | %b %b", S, R, Q, Qn);

        // Hold: S=0, R=0 (should retain last state)
        S = 0; R = 0; #5;
        $display("%b %b | %b %b", S, R, Q, Qn);

        // Invalid: S=1, R=1 (for NOR SR latch, both outputs are 0)
        S = 1; R = 1; #5;
        $display("%b %b | %b %b", S, R, Q, Qn);

        $finish;
end
endmodule