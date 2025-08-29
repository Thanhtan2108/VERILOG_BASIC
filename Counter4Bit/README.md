# Counter 4 Bit - Đếm lên, xuống

Module có các tín hiệu như sau:

    input : Clk, RST, SS, MODE, MIN, MAX

    output : OUT

Trong đó:

    SS = 1 : enable counter, SS = 0 : stop

    MODE = 1 : Up counter, MODE = 0 : Down counter

    MIN <= counter <= MAX
