`timescale 1ns / 1ps

module Mux32Bit3To1(out, in1, in2, in3, sel);
input [31:0] in1;
input [31:0] in2;
input [31:0] in3;
input [1:0] sel;
output reg [31:0] out;

        always @(in1, in2, in3, sel) begin
        if(sel == 0)
            out = in1;
        else if (sel == 1)
            out = in2;
        else if (sel == 2)
            out = in3;
        end
        
endmodule
