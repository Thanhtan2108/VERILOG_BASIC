`timescale 1ns/1ps 

module halfAdder (
    input A, B,
    output  wire S, C
);

    assign S = A ^ B; // xor
    assign C = A & B; // and

endmodule
