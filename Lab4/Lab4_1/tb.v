`timescale 1ns / 1ps
module tb(
  );
reg clk;
reg reset;
reg [31:0] A;
reg [31:0] in0;
reg [31:0] in1;
reg [2:0] select;
wire [31:0]out;

initial
begin
  clk <= 1'b0;
  forever
  begin
      #5 clk = ~clk;
  end
end

initial
begin

  reset <= 1'b0;
  select <= 3'b001;
  in0 <= 'hD4;
  in1 <= 'hD5;
  A <= 'hD6;
end



ALU_32 ALU(
.i_clk(clk),
.i_reset(reset),
.i_A(A),
.i_in0(in0),
.i_in1(in1),
.i_select(select),
.o_out(out)
  );

endmodule