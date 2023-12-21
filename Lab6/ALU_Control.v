`timescale 1ns/1ps
module ALU_Control #(
	parameter ALUop_Width		= 2,
	parameter ALU_select_width = 3)
	(
	input 		[ALUop_Width -1 : 0	] 		i_ALUop,
	output reg	[ALU_select_width -1 : 0]  o_ALUcont
	);

localparam add =  2'b01;
localparam sub =  2'b10;
localparam ALU_select_add =  3'b101;
localparam ALU_select_sub =  3'b110;
	
	always @ (i_ALUop)
	begin
		case (i_ALUop)
			add : 
			begin
				o_ALUcont = ALU_select_add;
			end
			sub : 
			begin
				o_ALUcont = ALU_select_sub;
			end
			default
			begin
				o_ALUcont = 3'b000;
			end
		endcase
	end
endmodule