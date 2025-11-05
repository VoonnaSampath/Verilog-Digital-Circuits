module mealy_1101(clk, reset, x, y);
    input clk, reset, x;
    output reg y;
    reg [1:0] state;

    // State encoding for readability
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            y <= 0;
        end else begin
            case (state)
                S0: begin
                    if (x) state <= S1;
                    else   state <= S0;
                    y <= 0;
                end
                S1: begin
                    if (x) state <= S2;
                    else   state <= S0;
                    y <= 0;
                end
                S2: begin
                    if (~x) state <= S3;
                    else    state <= S2;
                    y <= 0;
                end
                S3: begin
                    if (x) begin
                        state <= S1;
                        y <= 1; // Output when transition 1101 occurs
                    end else begin
                        state <= S0;
                        y <= 0;
                    end
                end
                default: begin
                    state <= S0;
                    y <= 0;
                end
            endcase
        end
    end
endmodule


module moore_1101(clk, reset, x, y);
    input clk, reset, x;
    output reg y;
    reg [2:0] state;

    // State encoding for readability
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b011, S3 = 3'b010, S4 = 3'b110;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            state <= S0;
            y <= 0;
        end else begin
            case(state)
                S0: begin // idle
                    if (x) state <= S1;
                    else   state <= S0;
                end
                S1: begin // first 1
                    if (x) state <= S2;
                    else   state <= S0;
                end
                S2: begin // two 1s
                    if (~x) state <= S3;
                    else   state <= S2;
                end
                S3: begin // 110
                    if (x) state <= S4; // complete 1101
                    else   state <= S0;
                end
                S4: begin // output state
                    if (x) state <= S2;
                    else   state <= S0;
                end
                default: state <= S0;
            endcase
            y <= (state == S4) ? 1 : 0;
        end
    end
endmodule
