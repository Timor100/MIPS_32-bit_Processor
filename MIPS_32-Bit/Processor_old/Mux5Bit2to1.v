`timescale 1ns / 1ps

module Mux5Bit2to1(out, inA, inB, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input sel;
    
    always @(inA, inB, sel) begin
        if(sel == 0)
            out = inA;
        else
            out = inB;
        end
endmodule
