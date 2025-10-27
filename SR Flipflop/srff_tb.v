module tb_sr_flipflop;
    reg S, R, CLK;
    wire Q, Qbar;

    // DUT: SR Flip-Flop
    sr_flipflop uut (
        .S(S), .R(R), .CLK(CLK),
        .Q(Q), .Qbar(Qbar)
    );

    initial begin
        $display("CLK  S  R  |  Q  Qbar");
        $display("----------------------");

        // Initial state
        CLK = 0; S = 0; R = 0; #5;

        // Case 1: Set = 1, Reset = 0 (when clock = 1)
        CLK = 1; S = 1; R = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, S, R, Q, Qbar);

        // Hold state (CLK = 0)
        CLK = 0; S = 0; R = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, S, R, Q, Qbar);

        // Case 2: Reset = 1, Set = 0 (when clock = 1)
        CLK = 1; S = 0; R = 1; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, S, R, Q, Qbar);

        // Hold state again
        CLK = 0; S = 0; R = 0; #5;
        $display(" %b   %b  %b  |  %b   %b", CLK, S, R, Q, Qbar);

        // Forbidden case: S = 1, R = 1 (when clock = 1)
        CLK = 1; S = 1; R = 1; #5;
        $display(" %b   %b  %b  |  %b   %b  <-- Forbidden", CLK, S, R, Q, Qbar);

        $finish;
    end
endmodule