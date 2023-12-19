`timescale 1 ns / 1 ps
module tb(
);
reg [31:0] in0;
reg [31:0] in1;
reg [31:0] A;
reg [2:0] select;
wire [31:0] out;
initial 
begin
  #5$display("The value of in0 is %h", in0); $display("The value of in1 is %h", in1); $monitor("ComplementA = %h", out);
  #5 $monitor("In0 And In1 = %h", out);
  #10 $monitor("In0 Xor In1 = %h", out);
  #10 $monitor("In0 Or In1 = %h", out);
  #10 $monitor("DecrementA = %h", out);
  #10 $monitor("In0 Add In1 = %h", out);
  #10 $monitor("In0 Sub In1 = %h", out);
  #10 $monitor("IncrementA = %h", out);
end
initial
begin
  in0 <= 'habef4567;
  in1 <= 'h1234fedc;
  A <= 'habcd1234;
  select <= 'b000;
  #10 select <= 'b001;
  #10 select <= 'b010;
  #10 select <= 'b011;
  #10 select <= 'b100;
  #10 select <= 'b101;
  #10 select <= 'b110;
  #10 select <= 'b111;
  #10
  $stop;
  
end
ALU_32bit ALU(
.i_in0(in0),
.i_in1(in1),
.i_A(A),
.i_select(select),
.o_out(out)
  );
endmodule
