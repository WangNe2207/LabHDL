`timescale 1ns / 1ps
module tb(
  );
reg clk;
reg [9:0] address;
reg [7:0] writeData;
reg writeEn;
reg readEn;
wire [7:0] readData;

integer i;

initial
begin
  clk = 'b0;
  forever
  begin
    #5 clk = ~clk;
  end
end

initial
begin
  
  for(i=0;i<1024;i=i+1)
  begin
    address <= i;
    writeEn <= 'b1;
    readEn <= 'b0;
    writeData <= $random;
    @(posedge clk);
  end
  
  for(i=0;i<1024;i=i+1)
  begin
    address <= i;
    writeEn <= 'b0;
    readEn <= 'b1;
    @(posedge clk);
  end
  
  //@(posedge clk);
  $stop;
end

DataMemory datamemory (
.i_clk(clk),
.i_Address(address),
.i_WriteData(writeData),
.i_WriteEn(writeEn),
.i_ReadEn(readEn),
.o_ReadData(readData) 
  );

endmodule

