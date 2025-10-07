module fa4bit(sum, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;

    wire c1, c2, c3;

    fa o1 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );

    fa o2 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    fa o3 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    fa o4 (
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(cout)
    );
endmodule
