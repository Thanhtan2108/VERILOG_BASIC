
`timescale 1ns/1ps

module ledSangDanTSP_PST_TatVaLapLai (
    input Clk, RST, SS, MODE,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            LED = 8'b0000_0000;
        else if (SS) begin
            if (MODE) begin
                if (LED == 0)
                    LED = 8'b0000_0001;
                else if (LED = 8'hFF)
                    LED = 8'b0000_0001;
                else begin
                    LED = LED << 1;
                    LED[0] = 1'b1;
                end
            end else begin
                if (LED == 0)
                    LED = 8'b1000_0000;
                else if (LED = 8'hFF)
                    LED = 8'b1000_0000;
                else begin
                    LED = LED >> 1;
                    LED[7] = 1'b1;
                end
            end 
        end else 
            LED = LED;
    end

endmodule
