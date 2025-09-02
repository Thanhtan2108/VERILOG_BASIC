
`timescale 1ns/1ps

module dem8Bit50MHzTuyY (
    input  wire Clk50MHz,
    input  wire RST,
    input  wire UD,
    input  wire SS,
    input  wire SPEED,         // 0: 1Hz, 1: 5Hz
    output wire [7:0] LED8_OUT
);

    wire Clk1_5Hz;

    // Gọi module chia xung
    chiaXung50MhzTuyY u_ChiaXung (
        .Clk50MHz(Clk50MHz),
        .SPEED(SPEED),
        .ClkOut(Clk1_5Hz)
    );

    // Gọi module counter
    dem8Bit u_counter (
        .Clk1_5Hz(Clk1_5Hz),
        .RST(RST),
        .UD(UD),
        .SS(SS),
        .Led8_Out(LED8_OUT)
    );

endmodule
