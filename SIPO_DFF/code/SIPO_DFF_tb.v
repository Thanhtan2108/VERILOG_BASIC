`timescale 1ns/1ps

module SIPO_DFFTestbench;

    reg Din, Clk;
    wire Q1, Q2, Q3, Q4;

    // Kết nối DUT
    SIPO_DFF dut (
        .Din(Din),
        .Clk(Clk),
        .Q1(Q1), 
        .Q2(Q2), 
        .Q3(Q3), 
        .Q4(Q4)
    );

    // Tạo clock 20ns
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // tương đương always
    end

    // Chuỗi 1011 LSB first
    initial begin
        Din = 0;
        #12 Din = 1;  // nhập bit 1 LSB
        #20 Din = 1;  // nhập bit 0
        #20 Din = 0;  // nhập bit 1
        #20 Din = 1;  // nhập bit 1
        #40 $finish;
    end

endmodule
