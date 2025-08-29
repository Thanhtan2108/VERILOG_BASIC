
`timescale 1ns/1ps

module decoder2To4ModuleTestbench;
    reg a,b,en;
    wire [3:0]y;

    decoder2To4Module dut(
        .en(en),
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        en=1; a=1'bx; b=1'bx; #5
        en=0; a=0; b=0; #5
        en=0; a=0; b=1; #5
        en=0; a=1; b=0; #5
        en=0; a=1; b=1; #5

        $finish;
    end

endmodule
