module DTCU_convert (
  input [5:0] opcode,
  input [4:0] rs, rt, rd, shamt,
  input [5:0]  func,
  output [31:0] instruction
) ;
 assign instruction  [31:26] = opcode;
 assign instruction  [25:21] = rs;
 assign instruction  [20:16] = rt;
 assign instruction  [15:11] = rd;
 assign instruction  [10:6]  = shamt;
 assign instruction  [5:0]   = func;
 
endmodule