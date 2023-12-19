module Mux4_1_1bit(input in0,
						 input in1,
						 input in2,
						 input in3,
						 input[1:0]Sel,
						 output Out);
	wire Nout0, Nout1;
	wire AndOut0, AndOut1, AndOut2, AndOut3;
	not(Nout0, Sel[0]);
	not(Nout1, Sel[1]);
	and(AndOut0, Nout0, Nout1, in0);
	and(AndOut1, Nout1, Sel[0], in1);
	and(AndOut2, Sel[1], Nout0, in2);
	and(AndOut3, Sel[1], Sel[0], in3);
	or(Out, AndOut0, AndOut1, AndOut2, AndOut3);
endmodule
