`timescale 1ns / 1ps
module tb(
  );
reg clk;
reg ReadWriteEn;
reg [4:0] WriteAddress;
reg [31:0] WriteData;
reg [4:0] ReadAddress;
reg [4:0] ReadAddress2;
wire [31:0] ReadData;
wire [31:0] ReadData2;
integer i;
integer j;
initial
begin
  clk = 1'b0;
  forever
  begin
    #5 clk = ~clk;
  end
end

initial
begin
  for(i=0;i<32;i=i+1)
  begin
    ReadWriteEn <= 'b1;
    WriteAddress <= i;
    WriteData <= $random;
    @(posedge clk);
  end
  
  i = 0;
  while(i<32)
  begin
    ReadWriteEn <= 'b1;
    ReadAddress <= i;
    ReadAddress2 <= 32 -i -1;
    i=i+1;
    @(posedge clk);
  end
  
  //@(posedge clk);
  $stop;
end
  
RegisterFile registerfile(
.i_clk(clk),
.i_ReadWriteEn(ReadWriteEn),
.i_WriteAddress(WriteAddress),
.i_WriteData(WriteData),
.i_ReadAddress(ReadAddress),
.i_readAddress2(ReadAddress2),
.o_ReadData(ReadData),
.o_ReadData2(ReadData2)
  );
  
endmodule