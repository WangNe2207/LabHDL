module AU(
  input [31:0] i_in0,
  input [31:0] i_in1,
  input [31:0] i_A,
  input [1:0] i_select,
  output [31:0] o_Out
);

wire [31:0] AddOut;
wire [31:0] SubOut;
wire [31:0] IncreOut;
wire [31:0] DecreOut;
adder32 Add(
.cout(), //MSB, determines if answer is positive or negative
.s(AddOut),
.a(i_in0),
.b(i_in1),
.cin('b0) // if 1, subtract, if 0, add. This is XOR'ed with b
);
adder32 Sub(
.cout(), //MSB, determines if answer is positive or negative
.s(SubOut),
.a(i_in0),
.b(i_in1),
.cin('b1) // if 1, subtract, if 0, add. This is XOR'ed with b
);
adder32 DecreA(
.cout(), //MSB, determines if answer is positive or negative
.s(DecreOut),
.a(i_A),
.b('d1),
.cin('b1) // if 1, subtract, if 0, add. This is XOR'ed with b
);
adder32 IncreA(
.cout(), //MSB, determines if answer is positive or negative
.s(IncreOut),
.a(i_A),
.b('d1),
.cin('b0) // if 1, subtract, if 0, add. This is XOR'ed with b
);

Mux4_1_32bit Mux4(
.in0(DecreOut),
.in1(AddOut),
.in2(SubOut),
.in3(IncreOut),
.Sel(i_select),
.Out(o_Out)
);

endmodule
