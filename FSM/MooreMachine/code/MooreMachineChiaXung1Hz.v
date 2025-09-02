// máy trạng thái moore có 2 ngõ ra z và tt_ht chạy bằng tần số 1Hz
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


module mooreMachine2Output (
    // Khai báo input, output
    input Clock, Resetn, w,
    output z,
    output reg [1:0] tt_ht
);

    // khai báo biến tạm chứa trạng thái kế tiếp,
    // không cần biến chứa trạng thái hiện tại vì đã được đem làm output
    reg [1:0] tt_kt = 0;

    // Đặt đại chỉ cho từng node
    parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;

    // Giải thuật cho khối Moore - khối State/Next state register
    always @ (w, tt_ht) begin
        case (tt_ht)
            A : 
                if(w) begin
                    tt_kt = B;
                end else begin
                    tt_kt = A;
                end
            B : 
                if(w) begin
                    tt_kt = C;
                end else begin
                    tt_kt = A;
                end
            C : 
                if(w) begin
                    tt_kt = C;
                end else begin
                    tt_kt = A;
                end
            default :
                tt_kt = 2'bxx;
        endcase
    end

    // Xử lý khối đồng bộ -Khối Output logic - Khối có xung Clock mới thực hiện
    always @ (negedge Resetn, posedge Clock) begin
        if(Resetn == 0) begin
            // Nếu Reset tác động thì máy sẽ reset về trạng thái bắt đầu
            tt_ht <= A;
        end else begin
            tt_ht <= tt_kt;
            /*
            Ví dụ tt_ht đang ở A, tt_kt sẽ là B
            Kích 1 xung Clock thì lúc nào từ A sẽ chuyển sang B nếu w = 1
                => lúc này tt_ht sẽ là tt_kt trước đó nghĩa là tt_ht = B.
            Hoặc nếu TT_ht đang ở A, tt_kt sẽ là A nếu w = 0
                => lúc này tt_ht sẽ là tt_kt trước đo nghĩa là tt_ht = A.
            */
        end
    end

    // Xác định ngõ ra bằng 1 khi nào
    assign z = (tt_ht == C);
    
endmodule


module mooreMachineChiaXung1Hz (
    input clk_50m, reset, w,
    output z, clk_1hz,
    output [1:0] tt_ht
);
    wire clk_i;

    chiaXungTrenBoard1Hz IC1 (clk_50m, clk_i);
    mooreMachine2Output IC2 (clk_i, reset, w, z, tt_ht);

    assign clk_1hz = clk_i;

endmodule
