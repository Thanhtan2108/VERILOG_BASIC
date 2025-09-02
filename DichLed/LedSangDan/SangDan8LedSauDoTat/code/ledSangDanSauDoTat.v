`timescale 1ns/1ps

module ledSangDichTheo4CheDo (
    input wire Clk, RST, SS,
    input wire [1:0] MODE,
    output reg [7:0] LED
);

    always @(posedge Clk or posedge RST) begin
        if (RST) begin
            LED <= 8'b0000_0000;   // Reset tất cả LED
        end
        else if (SS) begin
            case (MODE)
                // MODE 0: sáng dần rồi lặp lại (phải → trái)
                2'b00: begin
                    if (LED == 8'b0000_0000)
                        LED <= 8'b0000_0001;               // bắt đầu sáng từ LED0
                    else if (LED == 8'b1111_1111)
                        LED <= 8'b0000_0001;               // reset về lại 1 LED
                    else
                        LED <= (LED << 1) | 8'b0000_0001;  // dịch trái + OR 1
                end

                // MODE 1: tắt dần rồi lặp lại (phải → trái)
                2'b01: begin
                    if (LED == 8'b0000_0000)
                        LED <= 8'b1111_1110;               // sau khi tắt hết → reset lại trạng thái 1111_1110
                    else if (LED == 8'b1111_1111)
                        LED <= 8'b1111_1110;               // trạng thái khởi đầu
                    else
                        LED <= (LED << 1);                  // dịch trái, chèn 0
                end

                // MODE 2: tắt dần → sáng hẳn → quay lại (trái → phải)
                2'b10: begin
                    if (LED == 8'b0000_0000)
                        LED <= 8'b1111_1111;               // reset lại full sáng
                    else
                        LED <= (LED >> 1);                  // dịch phải, MSB tự thành 0
                end

                // MODE 3: sáng dần → tắt hẳn → quay lại (trái → phải)
                2'b11: begin
                    if (LED == 8'b0000_0000)
                        LED <= 8'b1000_0000;               // bắt đầu từ MSB = 1
                    else if (LED == 8'b1111_1111)
                        LED <= 8'b0000_0000;               // khi đủ sáng → clear về 0
                    else
                        LED <= (LED >> 1) | 8'b1000_0000;  // dịch phải + OR 1 vào MSB
                end
            endcase
        end
    end

endmodule
