// 4-to-2 Priority Encoder using Behavioral Modeling
module priority_encoder_4to2 (input [3:0] D, output reg [1:0] Y, output reg valid);
    always @(*)
    begin
        valid = 1'b1; // Assume valid by default
        casez (D)
            4'b1???: Y = 2'b11; // Highest priority (D3)
            4'b01??: Y = 2'b10; // Next priority (D2)
            4'b001?: Y = 2'b01; // Next priority (D1)
            4'b0001: Y = 2'b00; // Lowest priority (D0)
            default: begin
                Y = 2'b00;
                valid = 1'b0;  // No input is active
            end
        endcase
    end
endmodule