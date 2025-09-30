module parity_checker_4bit(
    input [3:0] data,
    input parity, // received parity bit
    input parity_mode, // 0 = even, 1 = odd
    output error // 1: error detected
);
    wire xor_out, check_bit;

    // Calculate expected parity
    xor (xor01, data[0], data[1]);
    xor (xor012, xor01, data[2]);
    xor (xor_out, xor012, data[3]);

    // Compare received and expected parity (adjust for mode)
    xor (check_bit, xor_out, parity_mode); // expected parity for chosen mode
    xor (error, parity, check_bit); // error if bits differ
endmodule
