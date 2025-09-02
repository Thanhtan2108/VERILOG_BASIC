
`timescale 1ns/1ps

module chiaXung50MHzThanh5Hz (
    input Clk50MHz,
    output reg Clk5Hz
);

    reg [22:0] cnt; // biến đếm Clk để chia xung theo tần số mới*2

    initial begin
        cnt <= 1;
        Clk5Hz <= 0;
    end

    always @ (posedge Clk50MHz) begin
        if (cnt == 5_000_000) begin // khi đạt đủ thời gian thì đảo xung để tạo Clk có tần số mới
            Clk5Hz <= ~Clk5Hz;
            cnt <= 1;
        end else begin // khi chưa đủ thời gian thì tăng biến đếm
            cnt <= cnt + 1;
        end
    end

endmodule
