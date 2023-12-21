module DataMemory(
  input         init_value,
  input [31:0]	i_Address,
  input [31:0] 	i_WriteData,
  input 				i_WriteEn,
  input 				i_ReadEn,
  output reg [31:0] 	o_ReadData 
  );

reg [31:0] Register [31:0];

integer index;

always @ (*)
begin
  if (init_value) begin
		for (index = 0; index < 32 ; index = index +1) begin
			Register[index] = index;
		end
	end	
	else if (i_WriteEn == 1'b1 ) 
		Register[i_Address] <= i_WriteData;
	else if (i_ReadEn == 1'b1)
		o_ReadData = Register [i_Address];
end

endmodule
