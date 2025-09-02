
`timescale 1ns/1ps

module ledSangDichTheo4CheDoTestbench;

    reg Clk, RST, SS;
    reg [1:0] MODE;
    wire [7:0] LED;

    // Instantiate DUT
    ledSangDichTheo4CheDo uut (
        .Clk(Clk),
        .RST(RST),
        .SS(SS),
        .MODE(MODE),
        .LED(LED)
    );

    // Clock generator: 10ns period
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;   // Toggle every 5ns → 10ns period
    end

    // Test sequence
    initial begin
        // Reset ban đầu
        RST = 1; SS = 0; MODE = 2'b00;
        #20;
        RST = 0; SS = 1;

        // MODE 0: sáng dần rồi reset
        MODE = 2'b00;
        #200;

        // MODE 1: tắt dần rồi reset
        MODE = 2'b01;
        #200;

        // MODE 2: tắt dần → sáng full → quay lại
        MODE = 2'b10;
        #200;

        // MODE 3: sáng dần → tắt hết → quay lại
        MODE = 2'b11;
        #200;

        // Thử tạm dừng (SS=0 giữ nguyên LED)
        SS = 0;
        #50;
        SS = 1;
        #100;

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
