
/*
Bảng trạng thái T Flip-Flop
Clock (cạnh ↑)	    Reset	    T	    Q (hiện tại)	    Q (kế tiếp)	    Giải thích
↑	                1	        X	        X	                0	        Reset chủ động, Q luôn = 0
↑	                0	        0	        Q	                Q	        T = 0 → Giữ nguyên trạng thái
↑	                0	        1	        0	                1	        T = 1 → Q đổi trạng thái
↑	                0	        1	        1	                0	        T = 1 → Q đổi trạng thái
*/

`timescale 1ns/1ps   // Định nghĩa đơn vị thời gian mô phỏng

module tFlipFlop (
    input wire T,       // Ngõ vào T
    input wire clk,     // Ngõ vào clock
    input wire reset,   // Ngõ vào reset (mức cao, async)
    output reg Q,       // Ngõ ra Q
    output wire Qn      // Ngõ ra đảo Q
);

    // Qn là đảo của Q
    assign Qn = ~Q;

    // Flip-Flop T: tác động cạnh lên của clock hoặc reset
    always @(posedge clk or posedge reset) begin
        if (reset) 
            Q <= 1'b0;              // Reset Q = 0
        else if (T) 
            Q <= ~Q;                // Toggle Q nếu T = 1
        else 
            Q <= Q;                 // Giữ nguyên nếu T = 0
    end

endmodule
