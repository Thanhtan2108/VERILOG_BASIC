
`timescale 1ns/1ps

module ledSangDichTSP_TatHet (
    input Clk, RST,
    output reg [7:0] LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST) 
            LED = 8'b1000_0000;
        else
            LED = LED >> 1;
    end

endmodule
