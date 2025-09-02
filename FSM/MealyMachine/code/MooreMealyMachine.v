
`timescale 1ns/1ps

module mooreMealyMachine (
    input wire clk, reset, a, b,
    output wire y0, y1
);
    // đặt địa chỉ cho node
    localparam [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

    // khai báo biến tạm chứa ttht, ttkt
    reg [1:0] tt_ht, tt_kt;

    // khối đồng bộ - Khối Output logic
    always @ (posedge clk) begin
        if(reset) begin
            tt_ht <= s0;
        end else begin
            tt_ht <=tt_kt;
        end
    end

    // Giải thuật của máy - Khối State/Next State register
    always @ (*) begin
        case(tt_ht) 
            s0 :
                if(a) begin
                    if(b) begin
                        tt_kt = s2;
                    end else begin
                        tt_kt = s1;
                    end
                end else begin 
                    tt_kt = s0;
                end
            s1 :
                if(a) begin
                    tt_kt = s0;
                end else begin
                    tt_kt = s1;
                end
            s2 :
                tt_kt = s0;
            default :
                tt_kt = s0;
        endcase
    end

    // Moore output logic
    assign y1 = (tt_ht == s0) || (tt_ht == s1);

    //Mealy output logic
    assign y0 = (tt_ht == s0) & a & b;

endmodule
