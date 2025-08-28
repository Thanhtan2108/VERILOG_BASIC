
`timescale 1ns/1ps

module halfAdderAlwaysBlock (S, C, A, B);
    output S, C;
    input A, B;

    reg S, C; // biến có thể thay đổi liên tục trong quá trình tính toán trong khối always -> tạo bộ đệm

    always @ (A or B)
        begin
            S = A ^ B;
            C = A & B;
        end

endmodule
