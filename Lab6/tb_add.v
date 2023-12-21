`timescale 1ps/1ps
module tb_add;
  reg clk , init_value_en;
  reg [5:0] opcode;
  reg [4:0] rs, rt, rd, shamt;
  reg [5:0]  func;
  wire [31:0] instruction;
  wire [31:0] o_data,o_data1,o_data2;

  DTCU_convert DTCU_CV(
    .opcode(opcode),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .shamt(shamt),
    .func(func),
    .instruction(instruction)
  );

  Datapath_CU DTCU (
    .i_clk (clk),
    .init_value (init_value_en),
    .i_data(instruction),
    .o_data(o_data),
    .o_data1(o_data1),
    .o_data2(o_data2)
  );
    
    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end
        
    initial begin
      init_value_en = 1'b0;
      #1 init_value_en = 1'b1;
      
    // lenh add
    // 000000 00001 00010 00011 000000000010000
      @ (posedge clk);
      $display ("This is the add");
      opcode = 000000;
      rs = 5'b00101;
      rt = 5'b00100;
      rd = 5'b00001;
      shamt = 5'b00000;
      func = 6'b100000;
      #2 init_value_en = 1'b0;
      @ (posedge clk);
      opcode = 000000;
      rs = 5'b00001;
      rt = 5'b00000;
      rd = 5'b00000;
      shamt = 5'b00000;
      func = 6'b100000;
    // lenh lw
    // 100110 00010 00001 00000 000000000000000
      @ (posedge clk);
      $display("This is the lw");
      opcode = 6'b100110;
      rs = 5'b00101;
      rt = 5'b00001;
      rd = 5'b00000;
      shamt = 5'b00000;
      func = 6'b000000;
      @ (posedge clk);
      opcode = 6'b100110;
      rs = 5'b00001;
      rt = 5'b00000;
      rd = 5'b00000;
      shamt = 5'b00000;
      func = 6'b000000;
    // lenh sw 
    // 101011 00010 00001 00000 000000000000000
      @ (posedge clk);
      $display("This is the sw");
      opcode = 6'b101011;
      rs = 5'b00010;
      rt = 5'b00111;
      rd = 5'b00000;
      shamt = 5'b00000;
      func = 6'b000000;
      @ (posedge clk);
      opcode = 6'b100110;
      rs = 5'b00010;
      rt = 5'b00000;
      rd = 5'b00000;
      shamt = 5'b00000;
      func = 6'b000000;
   end
   
endmodule

