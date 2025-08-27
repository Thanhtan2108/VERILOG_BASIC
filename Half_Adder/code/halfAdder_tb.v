
`timescale 1ns/1ps

module halfAdderTestbench;

    // 1. Khai báo tín hiệu testbench
    reg A;
    reg B;
    wire S;
    wire C;

    // 2. Gọi module DUT (Device Under Test)
    halfAdder uut (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    // không cần sinh clock vì đây là mạch tổ hợp

    // 3. Sinh stimulus
    initial begin
        // Khởi tạo
        A = 0;
        B = 0;
        #5;

        A = 0;
        B = 1;
        #5;

        A = 1;
        B = 0;
        #5;

        A = 1;
        B = 1;
        #5;

        // Kết thúc mô phỏng
        #10 $finish;
    end

endmodule
