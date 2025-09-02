// Nếu chỉ cần các tần số chuẩn chia đôi liên tiếp (1 Hz, 2 Hz, 4 Hz, 8 Hz …)
`timescale 1ns/1ps

module chiaXungTrenBoard1Hz (
    input wire clk, output wire q
);

    #(parameter N = 26)

    // khởi tạo tín hiệu
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;

    // khối state logic
    always @ (posedge clk) begin
        r_reg <= r_next;
    end

    // khối next state logic
    assign r_next = r_reg + 1; // cộng nhị phân

    // khối output logic
    assign q = r_reg[25]; // 1Hz ở bit 25, chia chuẩn chính xác hoàn toàn

endmodule
