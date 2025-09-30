`include "4bitparitycheck.v"
module testbench;
    reg [3:0] data;
    reg parity_mode;
    reg parity;         // received parity bit

    wire error;

    parity_checker_4bit chk1(
        .data(data), 
        .parity(parity), 
        .parity_mode(parity_mode), 
        .error(error)
    );

    initial begin
    
        $fsdbDumpvars();
        $display("DATA  MODE  PARITY  ERROR");

        data = 4'b0110; parity_mode = 0; parity = 0; #5; // Even mode, correct parity
        $display("%b   %b     %b      %b", data, parity_mode, parity, error);

        data = 4'b0110; parity_mode = 0; parity = 1; #5; // Even mode, wrong parity
        $display("%b   %b     %b      %b", data, parity_mode, parity, error);

        data = 4'b0110; parity_mode = 1; parity = 1; #5; // Odd mode, correct parity
        $display("%b   %b     %b      %b", data, parity_mode, parity, error);

        data = 4'b0110; parity_mode = 1; parity = 0; #5; // Odd mode, wrong parity
        $display("%b   %b     %b      %b", data, parity_mode, parity, error);

        $finish;
    end
endmodule