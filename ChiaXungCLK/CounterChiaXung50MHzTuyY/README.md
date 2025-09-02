# Chia Xung Clock hệ thống 50MHz thành xung Clock Tùy Ý Để Đếm 8Bit

Thiết kế mạch đếm lên/xuống hiển thị Led đơn như sau:

    8 Led hiển thị giá trị đếm lên/xuống theo xung Clock tùy ý được chọn bởi ngõ vào Speed

    RST mức 1

    SPEED = 0 : 1Hz , SPEED = 1 : 5Hz

    UD = 0 : đếm lên , UD = 1 : Đếm xuống

    SS = 1 : cho phép đếm, SS = 0 : ngưng đếm

Ngõ vào :
        Clk50MHz, RST, UD, SS, SPEED

Ngõ ra : LED8_OUT
