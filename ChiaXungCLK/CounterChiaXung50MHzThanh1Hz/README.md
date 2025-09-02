# Chia Xung Clock hệ thống 50MHz thành xung Clock 1Hz Để Đếm 8Bit

Thiết kế mạch đếm lên/xuống hiển thị Led đơn như sau:

    8 Led hiển thị giá trị đếm lên/xuống theo xung Clock

    RST mức 1

    UD = 1 : đếm lên , UD = 0 : Đếm xuống

    SS = 1 : cho phép đếm, SS = 0 : ngưng đếm

Ngõ vào :
        Clk50MHz, RST, UD, SS

Ngõ ra : LED8_OUT
