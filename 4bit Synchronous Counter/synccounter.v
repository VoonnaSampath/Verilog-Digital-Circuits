// 4-bit Synchronous Up/Down Counter using Behavioral Modeling
module sync_counter_4bit (input clk, reset, up_down, output reg [3:0] count);
    always @(posedge clk or posedge reset) //up_down = 1(up)/0(down) 
    begin
        if (reset)
            count <= 4'b0000;                  // Reset counter to 0
        else if (up_down)
            count <= count + 1;                // Up counter mode
        else
            count <= count - 1;                // Down counter mode
    end
endmodule