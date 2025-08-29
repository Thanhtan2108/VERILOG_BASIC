`timescale 1ns/1ps

module dFlipFlop (
    input  wire D,
    input  wire Clk,
    output reg  Q
);
    always @ (negedge Clk) begin
        Q <= D;
    end

endmodule

module SISI_DFF (
    input wire Din, CLK,
    output wire Sout
);

    wire Q3D2, Q2D1, Q1D0;

    dFlipFlop FF3(.D(Din), .Clk(CLK), .Q(Q3D2));
    dFlipFlop FF2(.D(Q3D2), .Clk(CLK), .Q(Q2D1));
    dFlipFlop FF1(.D(Q2D1), .Clk(CLK), .Q(Q1D0));
    dFlipFlop FF0(.D(Q1D0), .Clk(CLK), .Q(Sout));

endmodule
