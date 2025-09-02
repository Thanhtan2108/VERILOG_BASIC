`timescale 1ns/1ps

module ledSangDichTTR_TNV_TatValapLai(
    input Clk, RST, SS, MODE,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            LED = 0;
        else if (SS) begin
                if (MODE) begin
                    if (LED == 0)
                        LED = 8'b1000_0001;
                    else begin
                        LED[7:4] = LED[7:4] >> 1;
                        LED[3:0] = LED[3:0] << 1;
                    end
                end else begin
                    if (LED = 0)
                        LED = 8'b0001_1000;
                    else begin
                        LED[7:4] = LED[7:4] << 1;
                        LED[3:0] = LED[3:0] >> 1;
                    end
                end
        end else 
            LED = LED;
    end

endmodule
