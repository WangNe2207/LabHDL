module Instruction_Decoder #(
	parameter function_field_width = 6 ,
	parameter opcode_field_width = 6 ,
	parameter CU_width = 8) (
	input  [function_field_width - 1 : 0] func,
	input  [opcode_field_width - 1 : 0	] opcode,
	output reg [CU_width - 1 : 0			] Control_Unit
 	);

localparam default_opcode = 	6'b000000;
localparam add_func  	  = 	6'b100000;
localparam sub_func   	  = 	6'b100010;
localparam lw_opcode 	  = 	6'b100110;
localparam sw_opcode	  =	 	6'b101011;

// init index of Control_Unit
localparam	RegDst						= 7; // index of the RegDst in CU output
localparam	ALUSrc						= 6;
localparam	MemToReg					= 5;
localparam	RegWrite					= 4;
localparam	MemRead 					= 3;
localparam	MemWrite					= 2;
localparam	ALUOp						= 1;

	always @ (func or opcode)
	begin
		case (opcode)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			default_opcode : 
				begin
					case (func)
						add_func : // 01
						begin
							Control_Unit[RegDst] 				= 1'b1; 
							Control_Unit[ALUSrc] 				= 1'b0;
							Control_Unit[MemToReg] 				= 1'b0;
							Control_Unit[RegWrite] 				= 1'b1;
							Control_Unit[MemRead]				= 1'b0;
							Control_Unit[MemWrite]				= 1'b0;
							Control_Unit[ALUOp:ALUOp - 1] 		= 2'b01; // bit ALUop tai index 3 va 2 la 01

						end
						sub_func : // 10
						begin
							Control_Unit[RegDst] 				= 1'b1; 
							Control_Unit[ALUSrc] 				= 1'b0;
							Control_Unit[MemToReg] 				= 1'b0;
							Control_Unit[RegWrite] 				= 1'b1;
							Control_Unit[MemRead]				= 1'b0;
							Control_Unit[MemWrite]				= 1'b0;
							Control_Unit[ALUOp:ALUOp - 1] 	= 2'b10; // bit ALUop tai index 3 va 2 la 01
						end
						default : begin
							Control_Unit[RegDst] 				= 1'b1; 
							Control_Unit[ALUSrc] 				= 1'b0;
							Control_Unit[MemToReg] 				= 1'b0;
							Control_Unit[RegWrite] 				= 1'b1;
							Control_Unit[MemRead]				= 1'b0;
							Control_Unit[MemWrite]				= 1'b0;
							Control_Unit[ALUOp:ALUOp - 1] 	= 2'b00; 
						end
					endcase
				end
			lw_opcode : begin // khi opcode cua lenh lw
				Control_Unit[RegDst] 				= 1'b0; 
				Control_Unit[ALUSrc] 				= 1'b1;
				Control_Unit[MemToReg] 				= 1'b1;
				Control_Unit[RegWrite] 				= 1'b1;
				Control_Unit[MemRead]				= 1'b1;
				Control_Unit[MemWrite]				= 1'b0;
				Control_Unit[ALUOp:ALUOp - 1] 		= 2'b01; 
			end
			sw_opcode : begin // khi opcode cua lenh sw
				Control_Unit[RegDst] 				= 1'b0; 
				Control_Unit[ALUSrc] 				= 1'b1;
				Control_Unit[MemToReg] 				= 1'b0;
				Control_Unit[RegWrite] 				= 1'b0;
				Control_Unit[MemRead]				= 1'b0;
				Control_Unit[MemWrite]				= 1'b1;
				Control_Unit[ALUOp:ALUOp - 1] 	= 	2'b01; 
			end
			default : begin
				Control_Unit[RegDst] 				= 1'b1; 
				Control_Unit[ALUSrc] 				= 1'b0;
				Control_Unit[MemToReg] 				= 1'b0;
				Control_Unit[RegWrite] 				= 1'b1;
				Control_Unit[MemRead]				= 1'b0;
				Control_Unit[MemWrite]				= 1'b0;
				Control_Unit[ALUOp:ALUOp - 1] 	= 2'b00; 
			end
		endcase
	end
endmodule
