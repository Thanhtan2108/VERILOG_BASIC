`timescale 1ns/1ps

module ledSangDichTSP_PST_TatValapLai(
    input Clk, RST, SS, MODE,
    output reg [7:0]LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            LED = 0;
        else if (SS) begin
                if (MODE) begin
                    if (LED == 0)
                        LED = 8'b0000_0001;
                    else 
                        LED = LED << 1;
                end else begin
                    if (LED == 0)
                        LED = 8'b1000_0000;
                    else    
                        LED = LED >> 1;
                end
        end else 
            LED = LED;
    end

endmodule
