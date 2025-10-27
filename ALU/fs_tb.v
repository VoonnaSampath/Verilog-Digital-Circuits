`include "fs.v"
module fs_tb;

  reg a, b, bin;
  wire d, bout;

  // Instantiate the design under test
  fs uut (
    .d(d),
    .bout(bout),
    .a(a),
    .b(b),
    .bin(bin)
  );

  initial begin
    
    $fsdbDumpvars();
    $display("A B Bin | D Bout");
    $display("---------------");

    // Apply all input combinations
    a=0; b=0; bin=0; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=0; b=0; bin=1; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=0; b=1; bin=0; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=0; b=1; bin=1; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=1; b=0; bin=0; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=1; b=0; bin=1; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=1; b=1; bin=0; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    a=1; b=1; bin=1; #10;
    $display("%b %b  %b  | %b   %b", a,b,bin,d,bout);

    $finish;
  end

endmodule
