`timescale 1ns/1ps

module demux1To8Testbench;

    reg Din;
    reg [2:0] S;
    wire [7:0] Y;

    // Kết nối DUT
    demux1To8Module dut (
        .Din(Din),
        .S(S),
        .Y(Y)
    );

    initial begin
        // Khởi tạo
        Din = 0; S = 3'b000;
        #10;

        // Test 1: Din=1, quét S từ 0..7
        Din = 1;
        S = 3'b000; #10;
        S = 3'b001; #10;
        S = 3'b010; #10;
        S = 3'b011; #10;
        S = 3'b100; #10;
        S = 3'b101; #10;
        S = 3'b110; #10;
        S = 3'b111; #10;

        // Test 2: Din=0, quét lại S từ 0..7
        Din = 0;
        S = 3'b000; #10;
        S = 3'b001; #10;
        S = 3'b010; #10;
        S = 3'b011; #10;
        S = 3'b100; #10;
        S = 3'b101; #10;
        S = 3'b110; #10;
        S = 3'b111; #10;

        #20 $finish;
    end

endmodule
