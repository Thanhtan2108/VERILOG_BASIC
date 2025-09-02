
`timescale 1ns/1ps
/*
Công thức: tần số fout được chia từ fclk tương ứng với bit k
            k = log2(fclk/fout) - 1 (có làn tròn số, lấy số nguyên)
*/

module chiaXungTrenBoard1Hz (
    input wire clk, output wire q
);

    #(parameter N = 26) // xung của board là 50MHz = 2^26

    // khởi tạo tín hiệu
    reg [N-1:0] r_reg; // giá trị đếm hiện tại
    wire [N-1:0] r_next; // giá trị đếm kế tiếp

    // khối state logic
    always @ (posedge clk) begin
        r_reg <= r_next;
    end

    // khối next state logic
    assign r_next = r_reg + 1; // cộng nhị phân

    // khối output logic
    assign q = r_reg[25]; // lấy 1Hz ở bit thứ 25

endmodule


module mooreMealyMachine2Output (
    input wire clk, reset, a, b,
    output wire y0, y1,
    output reg [1:0] tt_ht
);
    // đặt địa chỉ cho node
    localparam [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

    // khai báo biến tạm chứa ttht, ttkt
    reg [1:0] tt_kt = 0;

    // khối đồng bộ - Khối Output logic
    always @ (posedge reset, posedge clk) begin
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


module mooreMealyMachineChiaXung1Hz (
    input clk_50m, reset, a, b,
    output y0, y1, clk_1hz,
    output [1:0] tt_ht
);
    wire clk_i;
    
    chiaXungTrenBoard1Hz IC1 (clk_50m, clk_i);
    mooreMealyMachine2Output IC2 (clk_i, reset, a, b, y0, y1, tt_ht);

    assign clk_1hz = clk_i;

endmodule
