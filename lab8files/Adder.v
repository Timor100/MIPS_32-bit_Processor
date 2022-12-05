`timescale 1ns / 1ps

module Adder(In1, In2, AddResult);

    input [31:0]In1, In2;
    output reg [31:0] AddResult;
    
    always @(In1, In2)begin
        AddResult <= In1 + In2;
    end
endmodule
