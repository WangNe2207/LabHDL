module Datapath(
input i_clk,
//input [5:0] i_opcode,
// RF I/O
//input [4:0] i_first5bits,
//input [4:0] i_second5bits,
//input [15:0] i_immediate,
//input i_regDst,
//input i_ReadWriteRF,
//input [31:0] i_WriteData, 
//input i_RFSource,
//output [31:0] o_RFout,
//output [31:0] o_RFout2,
//ALU I/O
input i_AluSource,
input  [2:0]i_AluControl,
output [31:0] o_ALU_Out,
output [31:0] o_Mux32Out,
output [31:0] o_SignExtendOut,
//DataMemory I/O
input i_DMSource,
input i_DMValue,
input [31:0] i_WriteDataDM,
input [31:0] i_WriteAddressDM,
input i_WriteEnDataMemory,
input i_ReadEnDataMemory,
input i_MemToReg,
output [31:0] o_DataMemoryOut
//input i_memWrite,
//input i_memRead,
//input i_memToReg

  );
wire [4:0] i_third5bits = i_immediate[15:11];
wire [4:0] regDst;
wire [31:0] RFout;
wire [31:0] RFout2;
wire [31:0] SignExtendOut;
wire [31:0] Mux32Out;
wire [31:0] DataMemoryOut;
wire [31:0] MemToReg;
wire [31:0] RFValue;
wire [31:0] DM_Address;
wire [31:0] DM_Value;

assign o_RFout = RFout;
assign o_RFout2 = RFout2;
assign o_Mux32Out = Mux32Out;
assign o_SignExtendOut = SignExtendOut;
assign o_DataMemoryOut = DataMemoryOut;

Mux2_1_5bits Mux5 (
.in0(i_second5bits),
.in1(i_third5bits),
.sel(i_regDst),
.out(regDst)
);
Mux2_1_32bits mux32_LoadRFValue (
.in0(MemToReg),
.in1(i_WriteData),
.sel(i_RFSource),
.out(RFValue)
);
RegisterFile RF (
.i_clk(i_clk),
.i_ReadWriteEn(i_ReadWriteRF),
.i_WriteAddress(regDst),
.i_WriteData(RFValue),
.i_ReadAddress(i_first5bits),
.i_readAddress2(i_second5bits),
.o_ReadData(RFout),
.o_ReadData2(RFout2)
  );
SignExtend signExtend(
.unextend(i_immediate),
.extended(SignExtendOut)
);
Mux2_1_32bits mux32 (
.in0(RFout2),
.in1(SignExtendOut),
.sel(i_AluSource),
.out(Mux32Out)
);
ALU_32b ALU(
.i_clk(i_clk),
.i_reset('b0),
.i_A('d0),
.i_in0(RFout),
.i_in1(Mux32Out),
.i_select(i_AluControl),
.o_out(o_ALU_Out)
  );
Mux2_1_32bits mux32_LoadDM_Address (
.in0(o_ALU_Out),
.in1(i_WriteAddressDM),
.sel(i_DMSource),
.out(DM_Address)
);
Mux2_1_32bits mux32_LoadDM_Value (
.in0(RFout2),
.in1(i_WriteDataDM),
.sel(i_DMValue),
.out(DM_Value)
);
DataMemory DataMemory(
.i_clk(i_clk),
.i_Address(DM_Address),
.i_WriteData(DM_Value),
.i_WriteEn(i_WriteEnDataMemory), //
.i_ReadEn(i_ReadEnDataMemory), //
.o_ReadData(DataMemoryOut) 
  );
Mux2_1_32bits mux32_afterDM (
.in0(DataMemoryOut),
.in1(o_ALU_Out),
.sel(i_MemToReg),
.out(MemToReg)
);  
endmodule
