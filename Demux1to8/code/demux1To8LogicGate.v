
`timescale 1ns/1ps

module demux1To8LogicGate(
    input d,
    input s0,
    input s1,
    input s2,
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7);

not (s0n,s0),(s1n,s1),(s2n,s2);
and (y0,d,s0n,s1n,s2n),(y1,d,s0,s1n,s2n),(y2,d,s0n,s1,s2n),(y3,d,s0,s1,s2n),(y4,d,s0n,s1n,s2),(y5,d,s0,s1n,s2),(y6,d,s0n,s1,s2),(y7,d,s0,s1,s2);

endmodule