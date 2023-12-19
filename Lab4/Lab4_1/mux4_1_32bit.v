module Mux4_1_32bit(
input[31:0]in0,
input[31:0]in1,
input[31:0]in2,
input[31:0]in3,
input[1:0]Sel,
output[31:0]Out);

Mux4_1_1bit Mux1(
in0[0],
in1[0],
in2[0],
in3[0],
Sel,
Out[0]);

Mux4_1_1bit Mux2(
in0[1],
in1[1],
in2[1],
in3[1],
Sel,
Out[1]);

Mux4_1_1bit Mux3(
in0[2],
in1[2],
in2[2],
in3[2],
Sel,
Out[2]);

Mux4_1_1bit Mux4(
in0[3],
in1[3],
in2[3],
in3[3],
Sel,
Out[3]);
Mux4_1_1bit Mux5(
in0[4],
in1[4],
in2[4],
in3[4],
Sel,
Out[4]);

Mux4_1_1bit Mux6(
in0[5],
in1[5],
in2[5],
in3[5],
Sel,
Out[5]);

Mux4_1_1bit Mux7(
in0[6],
in1[6],
in2[6],
in3[6],
Sel,
Out[6]);

Mux4_1_1bit Mux8(
in0[7],
in1[7],
in2[7],
in3[7],
Sel,
Out[7]);

Mux4_1_1bit Mux9(
in0[8],
in1[8],
in2[8],
in3[8],
Sel,
Out[8]);

Mux4_1_1bit Mux10(
in0[9],
in1[9],
in2[9],
in3[9],
Sel,
Out[9]);

Mux4_1_1bit Mux11(
in0[10],
in1[10],
in2[10],
in3[10],
Sel,
Out[10]);

Mux4_1_1bit Mux12(
in0[11],
in1[11],
in2[11],
in3[11],
Sel,
Out[11]);
Mux4_1_1bit Mux13(
in0[12],
in1[12],
in2[12],
in3[12],
Sel,
Out[12]);

Mux4_1_1bit Mux14(
in0[13],
in1[13],
in2[13],
in3[13],
Sel,
Out[13]);

Mux4_1_1bit Mux15(
in0[14],
in1[14],
in2[14],
in3[14],
Sel,
Out[14]);

Mux4_1_1bit Mux16(
in0[15],
in1[15],
in2[15],
in3[15],
Sel,
Out[15]);
Mux4_1_1bit Mux17(
in0[16],
in1[16],
in2[16],
in3[16],
Sel,
Out[16]);

Mux4_1_1bit Mux18(
in0[17],
in1[17],
in2[17],
in3[17],
Sel,
Out[17]);

Mux4_1_1bit Mux19(
in0[18],
in1[18],
in2[18],
in3[18],
Sel,
Out[18]);

Mux4_1_1bit Mux20(
in0[19],
in1[19],
in2[19],
in3[19],
Sel,
Out[19]);
Mux4_1_1bit Mux21(
in0[20],
in1[20],
in2[20],
in3[20],
Sel,
Out[20]);

Mux4_1_1bit Mux22(
in0[21],
in1[21],
in2[21],
in3[21],
Sel,
Out[21]);

Mux4_1_1bit Mux23(
in0[22],
in1[22],
in2[22],
in3[22],
Sel,
Out[22]);

Mux4_1_1bit Mux24(
in0[23],
in1[23],
in2[23],
in3[23],
Sel,
Out[23]);

Mux4_1_1bit Mux25(
in0[24],
in1[24],
in2[24],
in3[24],
Sel,
Out[24]);

Mux4_1_1bit Mux26(
in0[25],
in1[25],
in2[25],
in3[25],
Sel,
Out[25]);

Mux4_1_1bit Mux27(
in0[26],
in1[26],
in2[26],
in3[26],
Sel,
Out[26]);

Mux4_1_1bit Mux28(
in0[27],
in1[27],
in2[27],
in3[27],
Sel,
Out[27]);
Mux4_1_1bit Mux29(
in0[28],
in1[28],
in2[28],
in3[28],
Sel,
Out[28]);

Mux4_1_1bit Mux30(
in0[29],
in1[29],
in2[29],
in3[29],
Sel,
Out[29]);

Mux4_1_1bit Mux31(
in0[30],
in1[30],
in2[30],
in3[30],
Sel,
Out[30]);

Mux4_1_1bit Mux32(
in0[31],
in1[31],
in2[31],
in3[31],
Sel,
Out[31]);

endmodule
