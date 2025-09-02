
`timescale 1ns/1ps

module chiaXung50MhzThanh1Hz (
    input Clk50MHz,
    output reg Clk1Hz
);

    reg [24:0] cnt;

    initial begin
        cnt <= 1;
        Clk1Hz <= 0;
    end

    always @ (posedge Clk50MHz) begin
        if (cnt == 25_000_000) begin
            Clk1Hz <= ~Clk1Hz;
            cnt <= 1;
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule


module dem8Bit (
    input Clk1Hz, RST, UD, SS,
    output reg [7:0]Led8_Out
);

    always @ (posedge Clk1Hz) begin
        if (RST) begin
            Led8_Out <= 8'b0000_0000;
        end else if (SS) begin
            if(UD) begin
                if(Led8_Out == 8'hFF)
                    Led8_Out <= 8'b0000_0000;
                else
                    Led8_Out <= Led8_Out + 1;
            end else begin
                if(Led8_Out == 8'b0000_0000)
                    Led8_Out <= 8'hFF;
                else
                    Led8_Out <= Led8_Out - 1;
            end
        end else begin
            Led8_Out <= Led8_Out;
        end
    end

endmodule


module dem8Bit1HZ (
    input Clk50MHz, RST, UD, SS,
    output reg [7:0]LED8_OUT
);

    wire Clk1Hz;

    chiaXung50MHzThanh1Hz module1 (.Clk50MHz(Clk50MHz), .Clk1Hz(Clk1Hz));
    dem8Bit module2 (.Clk1Hz(Clk1Hz), .RST(RST), .UD(UD), .SS(SS), .Led8_Out(LED8_OUT));

endmodule
