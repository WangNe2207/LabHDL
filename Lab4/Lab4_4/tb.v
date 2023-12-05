`timescale 1ns / 1ps
module tb(
  );
reg clk;
reg cs;
reg wr_e;
reg oe;
reg [6:0] address;
wire [7:0] data;

reg [7:0] temp_data;
integer i;

initial 
begin
  clk <= 'b0;
  forever 
  begin
    #5 clk <= ~clk;
  end
end

assign data = !oe ?  temp_data: 'hz;
initial 
begin
  
  for(i=0;i<127;i=i+1)
  begin
    address <= i;
    wr_e <= 1;
    cs <= 1;
    oe <= 0;
    temp_data <= $random;
    @(posedge clk);
  end
  
  
  for(i=0;i<127;i=i+1)
  begin
    address <= i;
    wr_e <= 0;
    cs <= 1;
    oe <= 1;
    @(posedge clk);
  end
  
  @(posedge clk);
  $stop;
end

SinglePortRam SPR(
.i_clk(clk),
.i_cs(cs),
.i_wr_e(wr_e),
.i_oe(oe),
.i_address(address),
.io_data(data)
  );
endmodule
