`timescale 1ns/1ps

module SISO_DFFTestbench;

    reg Din;
    reg CLK;
    wire Sout;

    // Kết nối DUT
    SISI_DFF dut (
        .Din(Din),
        .CLK(CLK),
        .Sout(Sout)
    );

    // Clock generator: chu kỳ 20 ns
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;
    end

    // Stimulus cho Din
    initial begin
        // Khởi tạo
        Din = 0;

        // Đưa dữ liệu nối tiếp từng bit vào Din
        #15 Din = 1;   // bit 1
        #20 Din = 0;   // bit 0
        #20 Din = 1;   // bit 1
        #20 Din = 1;   // bit 1

        #40 $finish;
    end

endmodule
