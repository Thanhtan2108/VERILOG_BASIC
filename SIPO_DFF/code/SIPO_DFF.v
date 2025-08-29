`timescale 1ns/1ps

module dFlipFlop (
    input  wire D,
    input  wire Clk,
    output reg  Q
);

    always @(posedge Clk) begin
        Q <= D;
    end

endmodule

// 4-bit SIPO Shift Register
module SIPO_DFF (
    input  wire Din,
    input  wire Clk,
    output wire Q1, Q2, Q3, Q4
);

    dFlipFlop FF1(.D(Din), .Clk(Clk), .Q(Q1));
    dFlipFlop FF2(.D(Q1),  .Clk(Clk), .Q(Q2));
    dFlipFlop FF3(.D(Q2),  .Clk(Clk), .Q(Q3));
    dFlipFlop FF4(.D(Q3),  .Clk(Clk), .Q(Q4));

endmodule
