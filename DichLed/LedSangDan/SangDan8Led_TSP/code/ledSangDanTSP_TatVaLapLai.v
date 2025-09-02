
`timescale 1ns/1ps

module ledSangDanTSP_TatVaLapLai (
    input Clk, RST, SS,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            LED = 8'b1000_0000;
        else if (SS) begin
                if (LED == 8'b1111_1111)
                    LED = 8'b1000_0000;
                else begin
                    LED = LED >> 1;
                    LED[7] = 1'b1;
                end
            else 
                LED = LED;
        end
    end

endmodule
