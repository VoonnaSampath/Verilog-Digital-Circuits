`include "srlatch.v"

module srlatch_tb;   // ✅ Add the testbench module declaration

    reg S, R;
    wire Q, Qn;

    // Instantiate the DUT (Device Under Test)
    srlatch uut (
        .s(S),
        .r(R),
        .q(Q),
        .qbar(Qn)
    );

    initial begin
        $fsdbDumpvars();
        $display("S R | Q Qn");
        $monitor("%b %b | %b %b", S, R, Q, Qn); // ✅ Optional: live monitoring

        // Test cases
        S = 0; R = 0; #5;   // Hold
        S = 1; R = 0; #5;   // Set
        S = 0; R = 1; #5;   // Reset
        S = 0; R = 0; #5;   // Hold again
        S = 1; R = 1; #5;   // Invalid state

        $finish;
    end

endmodule