
`timescale 1ns/1ps

module ledSangDich2BitTSP (
    input Clk, RST,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST) 
            LED = 8'b0000_0000;
        else if (LED == 8'hFF)
            LED = 8'b0000_0000;
        else
            LED = LED >> 2 + 8'b1100_0000;
    end

endmodule
