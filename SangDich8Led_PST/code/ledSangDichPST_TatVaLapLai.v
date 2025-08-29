
`timescale 1ns/1ps

module ledSangDichPST_TatHet (
    input Clk, RST,
    output reg [7:0] LED
);

    always @ (posedge Clk or posedge RST) begin
        if (RST) 
            LED = 8'b0000_0001;
        else begin 
            if (LED == 8'b0000_0000)
                LED = 8'b0000_0001;
            else
                LED = LED << 1;
        end
    end

endmodule
