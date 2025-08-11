`timescale 1ns / 1ps

module Mux1Bit2to1(IsJal, RegWrite_WB, out);
input IsJal, RegWrite_WB;
output reg out;

always @(*)begin
    if(IsJal == 1)begin
    out <= 1;
    end
    else begin
    out <= RegWrite_WB;
    end
end
endmodule
