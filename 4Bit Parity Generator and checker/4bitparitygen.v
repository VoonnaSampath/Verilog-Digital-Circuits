module parity_generator_4bit(
    input [3:0] data,
    input parity_mode, // 0 = even, 1 = odd
    output parity
);
    wire xor_out;

    // XOR together all bits of input: even parity bit
    xor (xor01, data[0], data[1]);
    xor (xor012, xor01, data[2]);
    xor (xor_out, xor012, data[3]);

    // Even parity: as calculated, Odd parity: invert of even
    xor (parity, xor_out, parity_mode); // parity_mode: 0→even, 1→odd
endmodule
