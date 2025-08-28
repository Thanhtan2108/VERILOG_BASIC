
`timescale 1ns/1ps

module halfAdderGateLevelTestbench();

    reg A;
    reg B;
    wire S;
    wire C;

    halfAdderModuleGateLevel uut (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

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
