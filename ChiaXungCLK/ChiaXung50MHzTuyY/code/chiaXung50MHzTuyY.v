
`timescale 1ns/1ps

module chiaXung50MHzTuyY (
    input Clk50MHz, 
    input MODE[1:0],
    output reg Clk
);

    reg [24:0] cnt; // biến đếm Clk để chia xung theo tần số mới lớn nhất*2

    initial begin
        cnt <= 1;
        Clk <= 0;
    end

    always @ (posedge Clk50MHz) begin
        if (MODE == 2'b00) begin
            if (cnt == 25_000_000) begin // khi đạt đủ thời gian thì đảo xung để tạo Clk có tần số mới
                Clk <= ~Clk;
                cnt <= 1;
            end else begin // khi chưa đủ thời gian thì tăng biến đếm
                cnt <= cnt + 1;
            end
        end else if (MODE == 2'b01) begin
            if (cnt == 12_500_000) begin // khi đạt đủ thời gian thì đảo xung để tạo Clk có tần số mới
                Clk <= ~Clk;
                cnt <= 1;
            end else begin // khi chưa đủ thời gian thì tăng biến đếm
                cnt <= cnt + 1;
            end
        end
    end

endmodule
