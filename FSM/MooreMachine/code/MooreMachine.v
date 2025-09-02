// máy trạng thái moore với 1 ngõ ra là z

`timescale 1ns/1ps

module mooreMachine (Clock, Resetn, w, z);
    // Khai báo input, output
    input Clock, Resetn, w;
    output z;

    // khai báo biến tạm chứa trạng thái hiện tại, trạng thái kế tiếp
    reg [2:1] tt_ht;
    reg [2:1] tt_kt;

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
