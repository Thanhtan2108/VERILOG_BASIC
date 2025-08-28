# Half_Adder

Sơ đồ khối và bảng trạng thái

![Sơ đồ khối và bảng trạng thái](img/image.png)

## Viết testbench

1. Cần `timescale 1ns/1ps

2. Khai báo module `<nameModuleTB>;`

3. Khởi tạo các biến input/output
    1. input thì có kiểu reg
    2. output thì có kiểu wire

4. Gọi module cần test bằng uut và truyền tham số tương ứng

    ``` text
    <nameModuleTest> uut (
        // .parameter(parameter)
    );
    ```

5. Xác định là mạch tổ hợp hay mạch tuần tự
    1. Nếu là mạch tổ hợp thì không cần sinh xung clock trong khối always
    2. Nếu là mạch tuần tự cần sinh xung clock trong khối always

6. Sinh các test case trong khối initial

7. Kết thúc bằng #time $finish;

8. Có thể viết task để kiểm tra tự động. Có thể dùng các $display, $monitor,...

    -> chỉ cần nhìn qua console log, không cần soi waveform nhưng gây nặng file

9. Ngoài cách viết chương trình bằng các toán tử bit thì còn có thể đùng các Module Gate Level để viết

    -> Xem code halfAdderModuleGateLevel.v

    Có các module Gate Level như sau:

    1. nand (out, in1, in2);

    2. and (out, in1, in2);

    3. not (out, in);

    4. xor (out, in1, in2);

10. Bộ cộng này còn có thể được viết sử dụng khối always để luôn thực hiện

Khối này thực hiện suốt vòng đời chương trình

Có sử dụng toán tử sự kiện @ để thông báo có điều kiện trước khi thực hiện code trong always block

Code trong khối này chỉ thực hiện khi có bất kỳ sự thay đổi nào về điều kiện
