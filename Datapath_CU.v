
module Datapath_CU 
(
	input 	[31:0]	i_data,
	input 	init_value,
	input 			i_clk,
	output 	[31:0]	o_data,o_data1,o_data2
);
//define address field 
localparam 	field_32_bit				= 31;		//32 bit
localparam 	field_16_bit 				= 15;  		//15 bit
localparam	opcode_field_width			= 5;		//6 bit
localparam	register_field_width		= 4;		//5 bit
localparam	immediate_field_width		= 15;		//16 bit
localparam	address_field_width			= 25;		//26 bit
localparam	shamt_field_width			= 4;		//5 bit
localparam	function_field_width		= 5;		//6 bit
	
localparam	op_index						= 31;
localparam	rs_index						= 25;
localparam	rt_index						= 20;
localparam	rd_index						= 15;
localparam	function_index				= 5;
localparam	immediate_index 			= rd_index;
localparam	address_index 				= rs_index;

// define Control Unit
localparam	CU_width 					= 7; // 8 bit

localparam	RegDst						= 7; // index of the RegDst in CU output
localparam	ALUSrc						= 6;
localparam	MemToReg						= 5;
localparam	RegWrite						= 4;
localparam	MemRead 						= 3;
localparam	MemWrite						= 2;
localparam	ALUOp							= 1;

// init field 
wire [opcode_field_width:0] 		i_ID		 		= i_data[op_index : (op_index - opcode_field_width) 	];
wire [register_field_width:0]		i_RR1				= i_data[rs_index : (rs_index - register_field_width)	];
wire [register_field_width:0]		i_RR2				= i_data[rt_index : (rt_index - register_field_width)	];
wire [register_field_width:0]		i_Mux_RegDST		= i_data[rd_index : (rd_index - register_field_width)	];
wire [function_field_width:0]		i_function			= i_data[function_index : (function_index - function_field_width )];
wire [immediate_field_width:0]	i_SignExtend 			= i_data[immediate_index : (immediate_index - immediate_field_width)];


// init out Mux ALUSrc
wire [field_32_bit : 0]				o_Mux_ALUSrc;

// init out Mux MemToReg
wire [field_32_bit : 0]				o_Mux_MemToReg;

// init out MUX RegDst
wire [register_field_width : 0] 	o_Mux_RegDST;

// init Control Unit output
wire [CU_width:0]						o_Control_Unit ;

// init out RegisterFile
wire [field_32_bit : 0]				o_RD1;
wire [field_32_bit : 0]				o_RD2;

// init out Sign Extend
wire [field_32_bit : 0]				o_SignExtend;

// init out ALU
wire [field_32_bit : 0]				o_ALU;

// init out Data Memory
wire [field_32_bit : 0]				o_DataMemory;

// init out ALU Control
wire [2:0]								o_ALUcontrol;

//------------ Fetch -------------//
				Mux2_1_5bits Mux_RegDst (
				.in0						(i_RR2),
				.in1						(i_Mux_RegDST),
				.sel						(o_Control_Unit[RegDst]),
				.out						(o_Mux_RegDST)
				);
				
				RegisterFile Register_File(
				.i_clk					(i_clk),
				.init_value				(init_value),
				.i_ReadAddress			(i_RR1),
				.i_ReadAddress2			(i_RR2),
				.i_WriteEn				(o_Control_Unit[RegWrite]),
				.i_WriteAddress			(o_Mux_RegDST),
				.i_WriteData			(o_Mux_MemToReg),
				.o_ReadData				(o_RD1),
				.o_ReadData2			(o_RD2)
				);
				
				SignExtend Sign_Extend(
				.unextend				(i_SignExtend),
				.extended				(o_SignExtend)
				);
//------------ Instruction   Decoder -------------//
				Instruction_Decoder ID (
				.func					(i_function),
				.opcode					(i_ID),
				.Control_Unit			(o_Control_Unit)
				);
				
				ALU_Control ALUC (
				.i_ALUop 				(o_Control_Unit[ALUOp : ALUOp-1]),
				.o_ALUcont				(o_ALUcontrol)
				);

//------------ ALU -------------//
				Mux2_1_32bits Mux_ALUSrc (
				.in0						(o_RD2),
				.in1						(o_SignExtend),
				.sel						(o_Control_Unit[ALUSrc]),
				.out						(o_Mux_ALUSrc)
				);
				
				ALU_32b ALU(
				.i_clk					(i_clk),
				.i_A					(32'b0),
				.i_in0					(o_RD1),
				.i_in1					(o_Mux_ALUSrc),
				.i_select				(o_ALUcontrol),
				.o_out					(o_ALU)
				);
				
//------------ Memmory Access -------------//
				DataMemory Data_Memmory(
				.init_value				(init_value),
				.i_Address				(o_ALU),
				.i_WriteData			(o_RD2),
				.i_WriteEn				(o_Control_Unit[MemWrite]), //
				.i_ReadEn				(o_Control_Unit[MemRead]), //
				.o_ReadData				(o_DataMemory) 
				);
				
//------------ Result Write  -------------//

				Mux2_1_32bits  Mux_MemToReg(
				.in0						(o_ALU),
				.in1						(o_DataMemory),
				.sel						(o_Control_Unit[MemToReg]),
				.out						(o_Mux_MemToReg)
				);  
				
assign o_data  = o_RD1;
assign o_data1 = o_RD2;
assign o_data2 = o_Mux_MemToReg;
endmodule
