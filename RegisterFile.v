`timescale 1ns / 1ps
module RegisterFile(
input 				i_clk,
input         		init_value,
input 				i_WriteEn,
input [4:0] 		i_WriteAddress,
input [31:0] 		i_WriteData,
input [4:0] 		i_ReadAddress,
input [4:0] 		i_ReadAddress2,
output [31:0] 		o_ReadData,
output [31:0] 		o_ReadData2
  );

reg [31:0] Register [31:0];
reg temp_data = 32'h00000008;
integer index;
always @ (i_WriteEn)
begin
	if (init_value) begin
		for (index = 0; index < 32 ; index = index +1) begin
			Register[index] = index;
		end
	end	
	
end
always @ (posedge i_clk )
begin
	if (i_WriteEn)
		Register[i_WriteAddress] <= i_WriteData;
	else 
		Register[i_WriteAddress] <= Register[i_WriteAddress];
end

assign o_ReadData 	= Register[i_ReadAddress];
assign o_ReadData2 	= Register[i_ReadAddress2];

endmodule