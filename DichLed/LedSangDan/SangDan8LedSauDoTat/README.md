# 8 Led Sáng Dần Sau Đó Tắt Lần Lượt Theo 4 Chế Độ

Có SS = 1 : Cho phép dịch, SS = 0 : Dừng, Led đứng im

Có MODE = 0 : Sáng dần rồi lặp lại từ phải sang trái , MODE = 1 : Tắt dần rồi lặp lại từ phải sang trái, MODE = 2 : Tắt dần rồi sáng từ trái sang phải, MODE = 3 : Sáng dần rồi tắt từ trái sang phải

## Yêu cầu chi tiết

### Điều kiện chung

SS = 1 → chạy.

SS = 0 → LED giữ nguyên.

RST = 1 → LED tắt hết (0000_0000).

Các phép gán trong mạch tuần tự đồng bộ đều là non-blocking ( => )

#### MODE = 0 (sáng dần rồi lặp lại, phải → trái)

Chuỗi LED:

0000_0000
0000_0001  
0000_0011  
0000_0111  
0000_1111  
...  
1111_1111 → reset lại 0000_0001
0000_0001 (reset lặp lại)

=> Dùng dịch trái + OR 1.

#### MODE = 1 (tắt dần rồi lặp lại, phải → trái)

Chuỗi LED:

1111_1111  
1111_1110  
1111_1100  
1111_1000  
...  
0000_0000 → reset lại 1111_1110
1111_1110 (lặp lại)

=> Dùng dịch trái + OR 0.

#### MODE = 2 (tắt dần → sáng hẳn → quay lại, trái → phải)

Chuỗi LED:

1111_1111  
0111_1111  
0011_1111  
0001_1111  
0000_1111  
...  
0000_0001  
0000_0000  
1111_1111 (reset lại → tắt dần tiếp)
0111_1111  
0011_1111  
0001_1111  
0000_1111  
...  
0000_0001  
0000_0000  
1111_1111 (reset lại → tắt dần tiếp)

=> Dịch phải và gán MSB = 0, khi 0000_0000 thì nạp 1111_1111.

#### MODE = 3 (sáng dần → tắt hẳn → quay lại, trái → phải)

Chuỗi LED:

0000_0000  
1000_0000  
1100_0000  
1110_0000  
1111_0000  
...  
1111_1111  
0000_0000 (reset lại → sáng dần tiếp)
1000_0000  
1100_0000  
1110_0000  
1111_0000  
...  
1111_1111  
0000_0000 (reset lại → sáng dần tiếp)

=> Dịch phải và OR 1 vào MSB, khi đủ 1111_1111 thì clear lại 0000_0000.
