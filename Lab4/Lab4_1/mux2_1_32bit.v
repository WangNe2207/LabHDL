module Mux2_1_32bit(input[31:0]in1,
						 input[31:0]in0,
						 input Sel,
						 output[31:0]Out);
						 
Mux2_1_1bit Mux1(
.in0(in0[0]),
.in1(in1[0]),
.Sel(Sel),
.Out(Out[0]));

Mux2_1_1bit Mux2(
.in0(in0[1]),
.in1(in1[1]),
.Sel(Sel),
.Out(Out[1]));

Mux2_1_1bit Mux3(
.in0(in0[2]),
.in1(in1[2]),
.Sel(Sel),
.Out(Out[2]));

Mux2_1_1bit Mux4(
.in0(in0[3]),
.in1(in1[3]),
.Sel(Sel),
.Out(Out[3]));

Mux2_1_1bit Mux5(
.in0(in0[4]),
.in1(in1[4]),
.Sel(Sel),
.Out(Out[4]));

Mux2_1_1bit Mux6(
.in0(in0[5]),
.in1(in1[5]),
.Sel(Sel),
.Out(Out[5]));

Mux2_1_1bit Mux7(
.in0(in0[6]),
.in1(in1[6]),
.Sel(Sel),
.Out(Out[6]));

Mux2_1_1bit Mux8(
.in0(in0[7]),
.in1(in1[7]),
.Sel(Sel),
.Out(Out[7]));

Mux2_1_1bit Mux9(
.in0(in0[8]),
.in1(in1[8]),
.Sel(Sel),
.Out(Out[8]));

Mux2_1_1bit Mux10(
.in0(in0[9]),
.in1(in1[9]),
.Sel(Sel),
.Out(Out[9]));

Mux2_1_1bit Mux11(
.in0(in0[10]),
.in1(in1[10]),
.Sel(Sel),
.Out(Out[10]));

Mux2_1_1bit Mux12(
.in0(in0[11]),
.in1(in1[11]),
.Sel(Sel),
.Out(Out[11]));

Mux2_1_1bit Mux13(
.in0(in0[12]),
.in1(in1[12]),
.Sel(Sel),
.Out(Out[12]));

Mux2_1_1bit Mux14(
.in0(in0[13]),
.in1(in1[13]),
.Sel(Sel),
.Out(Out[13]));

Mux2_1_1bit Mux15(
.in0(in0[14]),
.in1(in1[14]),
.Sel(Sel),
.Out(Out[14]));

Mux2_1_1bit Mux16(
.in0(in0[15]),
.in1(in1[15]),
.Sel(Sel),
.Out(Out[15]));

Mux2_1_1bit Mux17(
.in0(in0[16]),
.in1(in1[16]),
.Sel(Sel),
.Out(Out[16]));

Mux2_1_1bit Mux18(
.in0(in0[17]),
.in1(in1[17]),
.Sel(Sel),
.Out(Out[17]));

Mux2_1_1bit Mux19(
.in0(in0[18]),
.in1(in1[18]),
.Sel(Sel),
.Out(Out[18]));

Mux2_1_1bit Mux20(
.in0(in0[19]),
.in1(in1[19]),
.Sel(Sel),
.Out(Out[19]));

Mux2_1_1bit Mux21(
.in0(in0[20]),
.in1(in1[20]),
.Sel(Sel),
.Out(Out[20]));

Mux2_1_1bit Mux22(
.in0(in0[21]),
.in1(in1[21]),
.Sel(Sel),
.Out(Out[21]));

Mux2_1_1bit Mux23(
.in0(in0[22]),
.in1(in1[22]),
.Sel(Sel),
.Out(Out[22]));

Mux2_1_1bit Mux24(
.in0(in0[23]),
.in1(in1[23]),
.Sel(Sel),
.Out(Out[23]));

Mux2_1_1bit Mux25(
.in0(in0[24]),
.in1(in1[24]),
.Sel(Sel),
.Out(Out[24]));

Mux2_1_1bit Mux26(
.in0(in0[25]),
.in1(in1[25]),
.Sel(Sel),
.Out(Out[25]));

Mux2_1_1bit Mux27(
.in0(in0[26]),
.in1(in1[26]),
.Sel(Sel),
.Out(Out[26]));

Mux2_1_1bit Mux28(
.in0(in0[27]),
.in1(in1[27]),
.Sel(Sel),
.Out(Out[27]));

Mux2_1_1bit Mux29(
.in0(in0[28]),
.in1(in1[28]),
.Sel(Sel),
.Out(Out[28]));

Mux2_1_1bit Mux30(
.in0(in0[29]),
.in1(in1[29]),
.Sel(Sel),
.Out(Out[29]));

Mux2_1_1bit Mux31(
.in0(in0[30]),
.in1(in1[30]),
.Sel(Sel),
.Out(Out[30]));

Mux2_1_1bit Mux32(
.in0(in0[31]),
.in1(in1[31]),
.Sel(Sel),
.Out(Out[31]));

endmodule
