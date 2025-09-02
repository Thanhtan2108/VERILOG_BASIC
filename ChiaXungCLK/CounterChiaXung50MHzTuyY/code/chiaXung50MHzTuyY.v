
`timescale 1ns/1ps

module chiaXung50MHzTuyY (
    input  wire Clk50MHz,
    input  wire [1:0] SPEED,       // 0: 1Hz, 1: 5Hz
    output reg  Clk1_5Hz
);

    reg [24:0] cnt;

    initial begin
        cnt <= 1;
        Clk1_5Hz <= 0;
    end

    always @ (posedge Clk50MHz) begin
        if (SPEED == 2'b00) begin
            if(cnt == 25_000_000) begin
                Clk1_5Hz <= ~Clk1_5Hz;
                cnt <= 1;
            end else begin
                cnt <= cnt + 1;
            end
        end else if (SPEED == 2'b01) begin
            if(cnt == 5_000_000) begin
                Clk1_5Hz <= ~ Clk1_5Hz;
                cnt <= 1;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

endmodule
