module alu4bit (
    output reg [3:0] y,
    output reg cout,
    output reg bout,
    input [3:0] a,
    input [3:0] b,
    input cin,
    input [1:0] sel
);
    wire [3:0] and_out, or_out, xor_out, sum, d;
    wire sum_cout,b_out;

    // Assume gate-level 4-input modules with default fill-ins
    and4 u_and0(and_out[0], a[0], b[0], 1'b1, 1'b1);
    and4 u_and1(and_out[1], a[1], b[1], 1'b1, 1'b1);
    and4 u_and2(and_out[2], a[2], b[2], 1'b1, 1'b1);
    and4 u_and3(and_out[3], a[3], b[3], 1'b1, 1'b1);

    or4 u_or0(or_out[0], a[0], b[0], 1'b0, 1'b0);
    or4 u_or1(or_out[1], a[1], b[1], 1'b0, 1'b0);
    or4 u_or2(or_out[2], a[2], b[2], 1'b0, 1'b0);
    or4 u_or3(or_out[3], a[3], b[3], 1'b0, 1'b0);

    fa4bit u_add(
        .sum(sum),
        .cout(sum_cout),
        .a(a),
        .b(b),
        .cin(cin)
    );
    
    fs4bit u_sub (
        .a(a),
        .b(b),
        .bin(cin),
        .d(d),
        .bout(b_out)
    );
    always @(*) begin
        case (sel)
            2'b00: begin y = and_out; cout = 0; end
            2'b01: begin y = or_out; cout = 0; end
            2'b10: begin y = d; bout = b_out; end
            2'b11: begin y = sum; cout = sum_cout; end
            default: begin y = 4'b0000; cout = 0; end
        endcase
    end
endmodule