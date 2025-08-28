/*
S          f
0          w0
1          w1
*/

`timescale 1ns/1ps

module mux2To1 (
    input wire w0, w1, S,
    output reg f
);

    always @(*) begin
        if (S)
            f = w1;
        else
            f = w0;
    end

endmodule
