`timescale 1ns/1ps

module dFlipFlopTestbench;

    // 1. Khai báo tín hiệu
    reg  D;
    reg  Clk;
    wire Q;
    wire Qn;

    // 2. Kết nối DUT
    dFlipFlop uut (
        .D   (D),
        .Clk (Clk),
        .Q   (Q),
        .Qn  (Qn)
    );

    // 3. Clock generator: chu kỳ 20 ns
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;  // half period = 10 ns → period = 20 ns
    end

    // 4. Stimulus cho D: chu kỳ 10 ns (thay đổi mỗi 5 ns)
    initial begin
        D = 0;
        forever #5 D = ~D;
    end

    // 5. Waveform dump và kết thúc mô phỏng
    initial begin
        #10 $finish;           // chạy 10 ns rồi dừng    
    end

endmodule
