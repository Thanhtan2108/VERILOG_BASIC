`timescale 1ns/1ps 

module halfAdder (
    input A, B,
    output  wire S, C_Mem
);

    assign S = A ^ B; // xor
    assign C_Mem = A & B; // and

endmodule

module fullAdderModule (
    input A, B, C_IN,
    output Sum, 
    output wire C_Out
);
    wire SB, C_Out1, C_Out2; // declared wire connect blocks

    haflAdder hA1(.A(A), .B(B), .S(SB), .C_Mem(C_Out2));
    halfAdder hA2(.A(C_IN), .B(SB), .S(Sum), .C_Mem(C_Out1));
    assign C_Out = C_Out1 || C_Out2;

endmodule
