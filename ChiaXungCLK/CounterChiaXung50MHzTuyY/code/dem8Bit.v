
`timescale 1ns/1ps

module dem8Bit (
    input  wire Clk1_5Hz,
    input  wire RST,
    input  wire UD,        // 0: Up, 1: Down
    input  wire SS,        // 1: Enable, 0: Hold
    output reg [7:0] Led8_Out
);

    always @(posedge Clk1_5Hz or posedge RST) begin
        if (RST) begin
            Led8_Out <= 8'b0000_0000;
        end else if (SS) begin
            if (UD == 1'b0) begin
                // Đếm lên
                if (Led8_Out == 8'hFF)
                    Led8_Out <= 8'b0000_0000;
                else
                    Led8_Out <= Led8_Out + 1;
            end else begin
                // Đếm xuống
                if (Led8_Out == 8'b0000_0000)
                    Led8_Out <= 8'hFF;
                else
                    Led8_Out <= Led8_Out - 1;
            end
        end else begin
            Led8_Out <= Led8_Out;
        end
    end

endmodule
