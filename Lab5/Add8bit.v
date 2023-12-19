`timescale 1ns / 1ps

module adder32(
    output cout, //MSB, determines if answer is positive or negative
    output [31:0] s,
    input [31:0] a,
    input [31:0] b,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [31:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;                          
    assign bin[5] = b[5]^cin;
    assign bin[6] = b[6]^cin;
    assign bin[7] = b[7]^cin;
    assign bin[8] = b[8]^cin;
    assign bin[9] = b[9]^cin;
    assign bin[10] = b[10]^cin;
    assign bin[11] = b[11]^cin;
    assign bin[12] = b[12]^cin;                          
    assign bin[13] = b[13]^cin;
    assign bin[14] = b[14]^cin;
    assign bin[15] = b[15]^cin;    
    assign bin[16] = b[16]^cin;
    assign bin[17] = b[17]^cin;
    assign bin[18] = b[18]^cin;
    assign bin[19] = b[19]^cin;
    assign bin[20] = b[20]^cin;                          
    assign bin[21] = b[21]^cin;
    assign bin[22] = b[22]^cin;
    assign bin[23] = b[23]^cin;
    assign bin[24] = b[24]^cin;
    assign bin[25] = b[25]^cin;
    assign bin[26] = b[26]^cin;
    assign bin[27] = b[27]^cin;
    assign bin[28] = b[28]^cin;                          
    assign bin[29] = b[29]^cin;
    assign bin[30] = b[30]^cin;
    assign bin[31] = b[31]^cin;
    
      
    wire [32:1] carry; 
     full_adder FA0(carry[1],s[0],a[0],bin[0],cin);
     full_adder FA1(carry[2],s[1],a[1],bin[1],carry[1]);
     full_adder FA2(carry[3],s[2],a[2],bin[2],carry[2]);
     full_adder FA3(carry[4],s[3],a[3],bin[3],carry[3]);
     full_adder FA4(carry[5],s[4],a[4],bin[4],carry[4]);
     full_adder FA5(carry[6],s[5],a[5],bin[5],carry[5]);
     full_adder FA6(carry[7],s[6],a[6],bin[6],carry[6]);
     full_adder FA7(carry[8],s[7],a[7],bin[7],carry[7]);
     
     full_adder FA8(carry[9],s[8],a[8],bin[8],carry[8]);
     full_adder FA9(carry[10],s[9],a[9],bin[9],carry[9]);
     full_adder FA10(carry[11],s[10],a[10],bin[10],carry[10]);
     full_adder FA11(carry[12],s[11],a[11],bin[11],carry[11]);
     full_adder FA12(carry[13],s[12],a[12],bin[12],carry[12]);
     full_adder FA13(carry[14],s[13],a[13],bin[13],carry[13]);
     full_adder FA14(carry[15],s[14],a[14],bin[14],carry[14]);
     full_adder FA15(carry[16],s[15],a[15],bin[15],carry[15]);
     full_adder FA16(carry[17],s[16],a[16],bin[16],carry[16]);
     full_adder FA17(carry[18],s[17],a[17],bin[17],carry[17]);
     full_adder FA18(carry[19],s[18],a[18],bin[18],carry[18]);
     full_adder FA19(carry[20],s[19],a[19],bin[19],carry[19]);
     full_adder FA20(carry[21],s[20],a[20],bin[20],carry[20]);
     full_adder FA21(carry[22],s[21],a[21],bin[21],carry[21]);
     full_adder FA22(carry[23],s[22],a[22],bin[22],carry[22]);
     full_adder FA23(carry[24],s[23],a[23],bin[23],carry[23]);
     full_adder FA24(carry[25],s[24],a[24],bin[24],carry[24]);
     full_adder FA25(carry[26],s[25],a[25],bin[25],carry[25]);
     full_adder FA26(carry[27],s[26],a[26],bin[26],carry[26]);
     full_adder FA27(carry[28],s[27],a[27],bin[27],carry[27]);
     full_adder FA28(carry[29],s[28],a[28],bin[28],carry[28]);
     full_adder FA29(carry[30],s[29],a[29],bin[29],carry[29]);
     full_adder FA30(carry[31],s[30],a[30],bin[30],carry[30]);
     full_adder FA31(carry[32],s[31],a[31],bin[31],carry[31]);
     
     assign cout = cin^carry[32];
   
endmodule
