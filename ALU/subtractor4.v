module fs4bit(d, bout, a, b, bin);
    input [3:0] a, b;
    input bin;
    output [3:0] d;
    output bout;

    wire b1, b2, b3;

    fs o1 (
        .a(a[0]),
        .b(b[0]),
        .bin(bin),
        .d(d[0]),
        .bout(b1)
    );

	 fs o2 (
        .a(a[1]),
        .b(b[1]),
        .bin(b1),
        .d(d[1]),
        .bout(b2)
    ); 
	fs o3 (
        .a(a[2]),
        .b(b[2]),
        .bin(b2),
        .d(d[2]),
        .bout(b3)
    ); 
	fs o4 (
        .a(a[3]),
        .b(b[3]),
        .bin(bin),
        .d(d[3]),
        .bout(bout)
    );
    
 endmodule