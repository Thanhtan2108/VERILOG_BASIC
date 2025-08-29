
`timescale 1ns/1ps

module counter4BitUpDown (
    input [3:0] MIN,
    input [3:0] MAX,
    input Clk, RST, SS, MODE,
    output reg [3:0] OUT
);

    always @ (posedge Clk or posedge RST) begin
        if (RST)
            OUT <= 4'b0000;
        else if (SS) begin
            if (MODE)
                OUT <= (OUT == MAX) ? MIN : OUT + 1;
            else
                OUT <= (OUT == MIN) ? MAX : OUT - 1;
        end else if (SS = 1'b0)
            OUT <= OUT;
    end

endmodule
