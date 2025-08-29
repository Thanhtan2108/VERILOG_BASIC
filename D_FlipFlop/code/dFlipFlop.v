`timescale 1ns/1ps

module dFlipFlop (
    input  wire D,
    input  wire Clk,
    output reg  Q,
    output reg  Qn
);

    // Đồng bộ hóa cả Q và Qn trên cạnh lên Clk
    always @(posedge Clk) begin
        Q  <= D;
        Qn <= ~Q;    // hoặc ~D, tuỳ yêu cầu thiết kế
    end

endmodule

/*
C2:
`timescale 1ns/1ps

module dFlipFlop (
    input  wire D,
    input  wire Clk,
    output reg  Q
);
    always @ (posedge Clk) begin
        Q <= D;
    end

endmodule
*/