`timescale 1ns / 1ps

// Team Members: Timor Shahin, Logan Mitchell Eaton, Evan Bradley Rains
// Overall percent effort of each team meber: 
// Timor 33% ; Logan 33% ; Evan 33%
// 5 stages, braches resolve at MEM stage

module Top2(en_out, out7, Reset, Clk);
input Reset, Clk;
output [7:0] en_out;
output [6:0] out7;
//wire ClkOut;
wire [31:0] v0, v1;

 //   ClkDiv n5(Clk, Reset, ClkOut);
    Two4DigitDisplay n10(Clk, v0[15:0], v1[15:0], out7, en_out);
    
    Top main1(v0, v1, Reset, Clk);
    
endmodule
