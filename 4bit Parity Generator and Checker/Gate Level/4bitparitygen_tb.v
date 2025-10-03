`include "4bitparitygen.v"

module paritygen4bit_tb;
    reg [3:0] data;
    reg parity_mode;

    wire parity;

    parity_generator_4bit gen1(
        .data(data), 
        .parity(parity), 
        .parity_mode(parity_mode)    );

    initial begin
    
        $fsdbDumpvars();
        $display("DATA  MODE  PARITY");

        // Example test cases
        data = 4'b0110; parity_mode = 0;#5;
        $display("%b   %b     %b", data, parity_mode, parity);

        data = 4'b0110; parity_mode = 1;  #5;
        $display("%b   %b     %b", data, parity_mode, parity);

        data = 4'b0111; parity_mode = 0;  #5; 
        $display("%b   %b     %b", data, parity_mode, parity);

        data = 4'b0111; parity_mode = 1;  #5; 
        $display("%b   %b     %b", data, parity_mode, parity);

        $finish;
    end
endmodule