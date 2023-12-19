module ALU_32bit(
  input [31:0] i_in0,
  input [31:0] i_in1,
  input [31:0] i_A,
  input [2:0] i_select,
  output [31:0] o_out
  );
  
wire [31:0] LUOut;
wire [31:0] AUOut;
LU LUmodule(
.i_in0(i_in0),
.i_in1(i_in1),
.i_A(i_A),
.i_select(i_select[1:0]),
.o_out(LUOut)
  );

AU AUmodule(
.i_in0(i_in0),
.i_in1(i_in1),
.i_A(i_A),
.i_select(i_select[1:0]),
.o_Out(AUOut)
);

Mux2_1_32bit mux2(
.in1(AUOut),
.in0(LUOut),
.Sel(i_select[2]),
.Out(o_out)
);
endmodule
