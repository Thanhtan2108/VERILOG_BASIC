
`timescale 1ns/1ps

module fullAdderModuleTestbench;

    // 1. Khai báo tín hiệu testbench
    reg A;
    reg B;
    reg C_IN;
    wire Sum;
    wire C_Out;

    // 2. Gọi module DUT (Device Under Test)
    fullAdderModule uut (
        .A(A),
        .B(B),
        .C_IN(C_IN),
        .Sum(Sum),
        .C_Out(C_Out)
    );

    // không cần sinh clock vì đây là mạch tổ hợp

    // 3. Sinh stimulus
    initial begin
        // Khởi tạo
        A = 0;
        B = 0;
        C_IN = 0;
        #5;

        A = 0;
        B = 0;
        C_IN = 1;
        #5;

        A = 0;
        B = 1;
        C_IN = 0;
        #5;

        A = 0;
        B = 1;
        C_IN = 1;
        #5;

        A = 1;
        B = 0;
        C_IN = 0;
        #5;

        A = 1;
        B = 0;
        C_IN = 1;
        #5;

        A = 1;
        B = 1;
        C_IN = 0;
        #5;

        A = 1;
        B = 1;
        C_IN = 1;
        #5;

        // Kết thúc mô phỏng
        #10 $finish;
    end

endmodule
