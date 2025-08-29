
`timescale 1ns/1ps

module demux1To8Module (
    input wire Din, 
    input wire [2:0] S,
    output reg [7:0] Y
);

    always @ (*) begin
        Y = 8'b0;
        case (S)
            3'b000 : Y[0] = Din;
            3'b001 : Y[1] = Din;
            3'b010 : Y[2] = Din;
            3'b011 : Y[3] = Din;
            3'b100 : Y[4] = Din;
            3'b101 : Y[5] = Din;
            3'b110 : Y[6] = Din;
            3'b111 : Y[7] = Din;
        endcase
    end

endmodule

/*
C2: 
`timescale 1ns/1ps

module demux1To8Module (
    input wire Din, 
    input wire [2:0] S,
    output wire [7:0] Y
);

    assign Y = Din << S;

endmodule
*/
