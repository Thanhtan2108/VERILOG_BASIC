
`timescale 1ns/1ps   // Định nghĩa đơn vị thời gian mô phỏng

module tFlipFlopTestbench;

    // 1. Khai báo tín hiệu
    reg T;
    reg clk;
    reg reset;
    wire Q;
    wire Qn;

    // 2. Gọi module DUT (Device Under Test)
    tFlipFlop uut (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qn(Qn)
    );

    // 3. Sinh clock (chu kỳ 10ns = 100MHz)
    always #5 clk = ~clk;

    // 4. Sinh stimulus
    initial begin
        // Khởi tạo
        clk = 0;
        reset = 1; T = 0;

        // Tạo file để lưu waveform (dùng với GTKWave)
        // $dumpfile("T_FlipFlop_tb.vcd");
        // $dumpvars(0, tb_T_FlipFlop);

        // Reset
        #10 reset = 0;

        // Test case 1: T=0 → Q giữ nguyên
        #10 T = 0;

        // Test case 2: T=1 → Q toggle
        #20 T = 1;

        // Test case 3: Toggle liên tục
        #40 T = 1;

        // Test case 4: Quay lại giữ nguyên
        #20 T = 0;

        // Reset lần nữa
        #20 reset = 1;
        #10 reset = 0;

        // Kết thúc mô phỏng
        #50 $finish;
    end

    // 5. Monitor kết quả
    // initial begin
    //     $monitor("Time=%0t | reset=%b | T=%b | Q=%b | Qn=%b", $time, reset, T, Q, Qn);
    // end

endmodule
