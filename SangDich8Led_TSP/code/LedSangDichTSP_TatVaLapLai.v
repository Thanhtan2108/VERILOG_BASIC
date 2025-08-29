
`timescale 1ns/1ps

module ledSangDichTSP_TatVaLapLai (
    input Clk, RST,
    output reg [7:0] LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST) 
            LED = 8'b1000_0000; // State 1
        else begin
            if (LED == 8'b0000_0000) 
                LED = 8'b1000_0000; // State 9 -> State 1
            else 
                LED = LED >> 1; // State 1 -> State 9
        end
    end

endmodule
