module Mux2_1_1bit(input in0,
						 input in1,
						 input Sel,
						 output Out);
	wire AndOut1, AndOut2, Nout;
	and(AndOut1, in1, Sel);
	not(Nout, Sel);
	and(AndOut2, in0, Nout);
	or(Out, AndOut1, AndOut2);
endmodule
