
`timescale 1ns/1ps

module ledSangDichTNV_TatVaLapLai (
    input Clk, RST,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            LED = 8'b1000_0001;
        else if (LED == 0)
            LED = 8'b1000_0001;
        else begin
            LED[7:4] = LED[7:4] >> 1;
            LED[3:0] = LED[3:0] << 1;
        end
    end

endmodule
