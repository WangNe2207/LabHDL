`timescale 1ns / 1ps
module ALU_32b(
  input i_clk,
  input i_reset,
  input 			[31:0] i_A,
  input			[31:0] i_in0,
  input 			[31:0] i_in1,
  input 			[2:0]  i_select,
  output reg 	[31:0] o_out
  );
initial 
begin
  #10 $display("The value of in0 is %0d", i_in0); $display("The value of in1 is %0d", i_in1); 
  #10 $monitor("Result = %0d", o_out);
end
parameter COMPLEMENT_A			= 3'b000;  // in this mode, i_in0 will be added with A
parameter AND 						= 3'b001;
parameter EX_OR 					= 3'b010;
parameter OR 						= 3'b011;
parameter DECREMENT_A 			= 3'b100;
parameter ADD 						= 3'b101;
parameter SUBTRACT 				= 3'b110;
parameter INCREMENT_A 			= 3'b111;   //in this mode, A = A + 1

always @ (*)
	begin
		case (i_select)
			COMPLEMENT_A :
				begin
				o_out <= i_in0 + i_A;
				end
			AND :
				begin
				o_out <= i_in0 & i_in1;
				end
			EX_OR :
				begin
				o_out <= i_in0 ^ i_in1;
				end
			OR :
				begin
				o_out <= i_in0 | i_in1;
				end
			DECREMENT_A :
				begin
				o_out <= i_A - 1'd1;
				end
			ADD :
				begin
				o_out <= i_in0 + i_in1;
				end
			SUBTRACT :
				begin
				o_out <= i_in0 - i_in1;
				end
			INCREMENT_A :
				begin
				o_out <= i_A + 1'd1;
				end
		endcase
	end
endmodule
