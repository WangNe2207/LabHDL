`timescale 1ns / 1ps
module tb(
  );
reg clk;
// RF I/O
reg [4:0] first5bits;
reg [4:0] second5bits;
reg [15:0] immediate;
reg regDst;
reg ReadWriteRF;
reg [31:0] WriteData;
reg RFSource; //
wire [31:0] RFout;
wire [31:0] RFout2;
// ALU I/O
reg AluSource;
reg [2:0] AluControl;
wire [31:0] ALU_out;
wire [31:0] Mux32Out;
wire [31:0] SignExtendOut;
//DataMemory I/O
reg DMSource;
reg DMValue;
reg [31:0] WriteDataDM;
reg [31:0] WriteAddressDM;
reg WriteEnDataMemory;
reg ReadEnDataMemory;
reg MemToReg;
wire [31:0] DataMemoryOut;

integer i;
integer j;
initial
begin
  clk <= 'b0;
  forever
  begin
    #5 clk <= ~clk;
  end
end

initial
begin
  // init value for RegisterFile
  for(i=0;i<32;i=i+1)
  begin
    regDst <= 'b0;
    ReadWriteRF <= 'b1;
    RFSource <= 'b1;
    second5bits <= i;
    WriteData <= i;
    @(posedge clk);
  end
  RFSource <= 'b0;
  // init value for Datamemory
  
  DMSource <= 'b1;
  DMValue <= 'b1;
  for(j=0;j<1024;j=j+1)
  begin
    WriteEnDataMemory <= 'b1;
    ReadEnDataMemory <='b0;
    WriteDataDM <= j;
    WriteAddressDM <= j;
    @(posedge clk);
  end
  DMSource <= 'b0;
  DMValue <= 'b0;
  
  //test lw $1, 0($2)
  regDst <= 'b0;
  ReadWriteRF <= 'b1;
  first5bits <= 'd2; 
  second5bits <= 'd1;
  immediate <= 'd0;
  @(posedge clk);
  @(posedge clk);
  AluSource <= 'b1;
  @(posedge clk);
  AluControl <= 3'b101;
  @(posedge clk);
  @(posedge clk);
  WriteEnDataMemory <= 'b0;
  ReadEnDataMemory <='b1;
  @(posedge clk);
  @(posedge clk);
  MemToReg <= 'b0;
  //@(posedge clk);
  ReadWriteRF <= 'b1;
  first5bits <= 'd1;
  //second5bits <= 'd1;
  //i = 0;
  //while(i<32)
  //begin
  //  ReadWriteRF <= 'b1;
   // first5bits <= i;
    //ReadAddress2 <= 32 -i -1;
  //  i=i+1;
  //  @(posedge clk);
  //end
  // Test Add instructe
  //regDst <= 'b1;
  //ReadWriteRF <= 'b1;
  //first5bits <= 'd9;
  //second5bits <= 'd10; 
  //immediate <= 'b0100000000000000;
  //@(posedge clk);
  //@(posedge clk);
  //AluSource <= 'b0;
  //@(posedge clk);
  //AluControl <= 3'b101;
  //DMSource <= 'b0;
  //DMValue <= 'b0;
  //@(posedge clk);
  //@(posedge clk);
  
  //MemToReg <= 'b1;
  //@(posedge clk);
  //ReadWriteRF <= 'b1;
  //RFSource <= 'b0;
  //first5bits <= 'b01000;
  @(posedge clk);
  @(posedge clk);
  $stop;
end

Datapath Datapath (
.i_clk(clk),

// RF I/O
.i_first5bits(first5bits),
.i_second5bits(second5bits),
.i_immediate(immediate),
.i_regDst(regDst),
.i_ReadWriteRF(ReadWriteRF),
.i_WriteData(WriteData), 
.i_RFSource(RFSource),
.o_RFout(RFout),
.o_RFout2(RFout2),
//ALU I/O
.i_AluSource(AluSource),
.i_AluControl(AluControl),
.o_ALU_Out(ALU_out),
.o_Mux32Out(Mux32Out),
.o_SignExtendOut(SignExtendOut),
//DataMemory I/O
.i_DMSource(DMSource),
.i_DMValue(DMValue),
.i_WriteDataDM(WriteDataDM),
.i_WriteAddressDM(WriteAddressDM),
.i_WriteEnDataMemory(WriteEnDataMemory),
.i_ReadEnDataMemory(ReadEnDataMemory),
.i_MemToReg(MemToReg),
.o_DataMemoryOut(DataMemoryOut)
  );  
  

endmodule

