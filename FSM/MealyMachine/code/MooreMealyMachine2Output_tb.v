
`timescale 1ns/1ps

module mooreMachine2OutputTestbench;
    reg clk, reset, a, b;
    wire y0, y1, tt_ht;

    mooreMachine2Output uut(
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1),
        .tt_ht(tt_ht)
    );

    // khởi tạo xung clock, chu kỳ 20ns, Ton = 10ns
    always begin
        #10;
        clk =  clk;
    end

    // các testbench
    initial begin
        // ổn định
        clk = 0;

        // Kiểm tra reset
        reset = 1; 
        a = 1;
        b = 1; 
        #10;

        // các test case
        reset = 1; 
        a = 0;
        b = 0; 
        #20;

        reset = 0;
        a = 0;
        #20;

        a = 1;
        b = 1;
        #20;

        a = 1;
        b = 1;
        #20;

        a = 1;
        b = 0;
        #20;

        a = 1;
        #20;

        a = 0;
        #20;
        
        $finish;
        #20;
    end

endmodule
