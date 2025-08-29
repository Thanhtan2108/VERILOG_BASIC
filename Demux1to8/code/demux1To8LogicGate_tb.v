
`timescale 1ns/1ps

module demux1To8LogicGateTestbench;

    reg d;
    reg sd;
    reg sd;
    reg sd;
    wire yd;
    wire yd;
    wire yd;
    wire yd;
    wire yd;
    wire yd;
    wire yd;
    wire y7;

    demux1To8LogicGate dut(
        .d(d),
        .s0(s0),
        .s1(s1),
        .s2(s2),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5),
        .y6(y6),
        .y7(y7),
    );

    initial begin
        // Initialize Inputs
        d = 0; s0 = 0; s1 = 0; s2 = 0;

        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
        #100; d = 1;s0 = 0;s1 = 0;s2 = 0;
        #100; d = 1;s0 = 1;s1 = 0;s2 = 0;
        #100; d = 1;s0 = 0;s1 = 1;s2 = 0;
        #100; d = 1;s0 = 1;s1 = 1;s2 = 0;
        #100; d = 1;s0 = 0;s1 = 0;s2 = 1;
        #100; d = 1;s0 = 1;s1 = 0;s2 = 1;
        #100; d = 1;s0 = 0;s1 = 1;s2 = 1;
        #100; d = 1;s0 = 1;s1 = 1;s2 = 1;
    end

endmodule