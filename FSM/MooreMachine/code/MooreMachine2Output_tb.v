
`timescale 1ns/1ps

module mooreMachine2OutputTestbench;
    reg Clock, Resetn, w;
    wire z, tt_ht;

    mooreMachine2Output uut(
        .Clock(Clock),
        .Resetn(Resetn),
        .w(w),
        .z(z),
        .tt_ht(tt_ht)
    );

    // khởi tạo xung clock, chu kỳ 20ns, Ton = 10ns
    always begin
        #10;
        Clock = ~Clock;
    end

    // các testbench
    initial begin
        // ổn định
        Clock = 0;

        // Kiểm tra reset
        Resetn = 0; 
        w = 0; 
        #10;

        // các test case
        Resetn = 1; 
        
        w = 1; 
        #40;

        w = 0;
        #20;

        w = 1;
        #20;

        $finish;
        #20;
    end

endmodule
