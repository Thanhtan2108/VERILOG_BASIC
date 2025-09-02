// Nếu cần tần số bất kỳ, chuẩn xác tuyệt đối (1 Hz, 2 Hz, 5 Hz, 10 Hz …)
`timescale 1ns/1ps

module chiaXung50MHzThanh1Hz (
    input Clk50MHz,
    output reg Clk1Hz
);

    reg [24:0] cnt; // biến đếm Clk để chia xung theo tần số mới*2

    initial begin
        cnt <= 1;
        Clk1Hz <= 0;
    end

    always @ (posedge Clk50MHz) begin
        if (cnt == 25_000_000) begin // khi đạt đủ thời gian thì đảo xung để tạo Clk có tần số mới
            Clk1Hz <= ~Clk1Hz;
            cnt <= 1;
        end else begin // khi chưa đủ thời gian thì tăng biến đếm
            cnt <= cnt + 1;
        end
    end

endmodule
