`timescale 1 ns / 1 ps
module LU(
  input [31:0] i_in0,
  input [31:0] i_in1,
  input [31:0] i_A,
  input [1:0] i_select,
  output [31:0] o_out
  );
  
wire [31:0] ComplementOut;
wire [31:0] AndOut;
wire [31:0] OrOut;
wire [31:0] ExOrOut;

ComplementA Complement(
.in(i_A),
.out(ComplementOut)
);
and32 And(
.a(i_in0),
.b(i_in1),
.out(AndOut)
);
xor_gate_32bit Xor32(
.a(i_in0),
.b(i_in1),
.out(ExOrOut)
);

or32 or32bit(
.a(i_in0),
.b(i_in1),
.result(OrOut)
);

Mux4_1_32bit Mux4(
.in0(ComplementOut),
.in1(AndOut),
.in2(ExOrOut),
.in3(OrOut),
.Sel(i_select),
.Out(o_out)
);

endmodule
