module SinglePortRam(
  input i_clk,
  input i_cs,
  input i_wr_e,
  input i_oe,
  input [6:0] i_address,
  inout [7:0] io_data
  );
  
reg [7:0] data [127:0];
reg [7:0] out_data;
  
always@(posedge i_clk)
begin
  if(i_cs & i_wr_e)
    data[i_address] <= io_data;
end
always@(posedge i_clk)
begin
  if(i_cs & !i_wr_e)
    out_data <= data[i_address];
end
assign io_data = i_cs & i_oe & !i_wr_e ? out_data : 'hz;
endmodule
