
`timescale 1ns/1ps

module halfAdderModuleGateLevel (S, C, A, B);

    output S, C;
    input A, B;

    xor #2 (S, A, B); // = assign #2 S = A ^ B; delay 2s
    and #1 (C, A, B); // = assign #1 C = A & B; delay 1s

endmodule
