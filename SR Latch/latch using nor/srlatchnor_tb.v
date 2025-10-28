`include "sr_latch_nor.v"

module sr_latch_nor_tb;
    reg S, R;
    wire Q, Qn;

    // Instantiate the DUT (Device Under Test)
    sr_latch_nor uut (.S(S), .R(R), .Q(Q), .Qn(Qn));

    initial begin
        $fsdbDumpvars();
        $display("Time | S R | Q Qn | Description");
        $monitor("%4t | %b %b | %b  %b | %s", $time, S, R, Q, Qn, desc);

        // Initialize
        S = 0; R = 0; #5; desc = "Hold (no change)";
        S = 1; R = 0; #5; desc = "Set (Q=1)";
        S = 0; R = 0; #5; desc = "Hold (Q retains 1)";
        S = 0; R = 1; #5; desc = "Reset (Q=0)";
        S = 0; R = 0; #5; desc = "Hold (Q retains 0)";
        S = 1; R = 1; #5; desc = "Invalid (Q & Qn=0)";
        S = 0; R = 0; #5; desc = "Return to Hold";

        $finish;
    end

    // Optional string variable to describe each state
    string desc;
endmodule