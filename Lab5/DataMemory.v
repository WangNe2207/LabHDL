module DataMemory(
  input i_clk,
  input [9:0] i_Address,
  input [31:0] i_WriteData,
  input i_WriteEn,
  input i_ReadEn,
  output [31:0] o_ReadData 
  );

reg [7:0] register [1023:0];
reg [9:0] pointer;


always@(posedge i_clk)
begin
  if(i_WriteEn)
    register[pointer] <= i_WriteData;
end 


always@(posedge i_clk)
begin
  if((i_WriteEn && !i_ReadEn) || (!i_WriteEn && i_ReadEn))
    pointer <= i_Address;
end

assign o_ReadData = (i_ReadEn) ? register[pointer] : 
                      'hz;
endmodule
