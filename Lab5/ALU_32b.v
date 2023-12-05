`timescale 1ns / 1ps
module ALU_32(
  input i_clk,
  input i_reset,
  input [31:0] i_A,
  input [31:0] i_in0,
  input [31:0] i_in1,
  input [2:0] i_select,
  output reg [31:0] o_out
  );
//initial 
//begin
//  #10 $display("The value of in0 is %0d", i_in0); $display("The value of in1 is %0d", i_in1); 
//  #10 $monitor("Result = %0d", o_out);
//end
localparam 
            COMPLEMENT_A = 3'b000, // in this mode, i_in0 will be added with A
            AND = 3'b001,
            EX_OR = 3'b010,
            OR = 3'b011,
            DECREMENT_A = 3'b100,
            ADD = 3'b101,
            SUBTRACT = 3'b110,
            INCREMENT_A = 3'b111; //in this mode, A = A + 1
reg [2:0] state;
reg [31:0] sub_output;
always@(posedge i_clk)
begin
  if(i_reset)
  begin
    state <= COMPLEMENT_A;
  end
  else
  begin
    case(i_select)
      3'b000: state <= COMPLEMENT_A;
      3'b001: state <= AND;
      3'b010: state <= EX_OR;
      3'b011: state <= OR;
      3'b100: state <= DECREMENT_A;
      3'b101: state <= ADD;
      3'b110: state <= SUBTRACT;
      3'b111: state <= INCREMENT_A;
    endcase
  end
end

// complement A
always@(*)
begin
  if(state==COMPLEMENT_A)
    begin
      sub_output <= i_in0 + i_A;
    end
end
//AND
always@(*)
begin
  if(state==AND)
    begin
      sub_output <= i_in0 & i_in1;
    end
end
// EX_OR
always@(*)
begin
  if(state==EX_OR)
    begin
      sub_output <= i_in0 ^ i_in1;
    end
end
//OR
always@(*)
begin
  if(state==OR)
    begin
      sub_output <= i_in0 | i_in1;
    end
end 
//DECREMENT_A 
always@(*)
begin
  if(state==DECREMENT_A)
    begin
      sub_output <= i_A - 1'd1;
    end
end
//ADD
always@(*)
begin
  if(state==ADD)
    begin
      sub_output <= i_in0 + i_in1;
    end
end
//SUBTRACT
always@(*)
begin
  if(state==SUBTRACT)
    begin
      sub_output <= i_in0 - i_in1;
    end
end
//INCREMENT_A
always@(*)
begin
  if(state==INCREMENT_A)
    begin
      sub_output <= i_A + 1'd1;
    end
end
always@(posedge i_clk)
begin
  o_out <= sub_output;
end
endmodule