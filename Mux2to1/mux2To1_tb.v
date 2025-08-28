`timescale 1ns/1ps

module mux2To1Testbench;

    // 1) Khai báo tín hiệu
    reg  w0, w1, S;
    wire f;

    // 2) Kết nối DUT
    mux2To1 dut (
        .w0(w0),
        .w1(w1),
        .S (S),
        .f (f)
    );

    initial begin
        integer i;
        {S, w0, w1} = 3'b000;
        #10;
        for (i = 0; i < 8; i = i + 1) begin
            {S, w0, w1} = i[2:0]; // S = MSB
            #10;
        end
        #20 $finish;
    end

endmodule
