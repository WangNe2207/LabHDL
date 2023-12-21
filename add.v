`timescale 1ns/1ps
module add (
  input [2:0] a, b, 
  input clk,
  output reg x , y
);

always @ (posedge clk)
begin
  x = a + 3'b001;
  y = b + a;
end

endmodule