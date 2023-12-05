`timescale 1ns / 1ps
module RegisterFile(
input i_clk,
input i_ReadWriteEn,
input [4:0] i_WriteAddress,
input [31:0] i_WriteData,
input [4:0] i_ReadAddress,
input [4:0] i_readAddress2,
output [31:0] o_ReadData,
output [31:0] o_ReadData2
  );
reg state;
reg [4:0] WrPointer;
reg [4:0] RdPointer;
reg [4:0] RdPointer2;
reg [31:0] Register [31:0];
localparam IDLE = 1'b0,
          USED = 1'b1;

always@(posedge i_clk)
begin
  if(i_ReadWriteEn)
    Register[WrPointer] <= i_WriteData;
end

always@(*)
begin
  if(!i_ReadWriteEn)
    WrPointer <= 'd0;
  else 
    WrPointer <= i_WriteAddress;
end



always@(posedge i_clk)
begin
  if(!i_ReadWriteEn)
  begin
    RdPointer <= 'd0;
    RdPointer2 <= 'd0;
  end
  else
  begin 
    RdPointer <= i_ReadAddress;
    RdPointer2 <= i_readAddress2;
  end
end

assign o_ReadData = Register[RdPointer];
assign o_ReadData2 = Register[RdPointer2];

endmodule