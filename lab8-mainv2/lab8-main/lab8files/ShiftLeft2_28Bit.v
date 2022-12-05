`timescale 1ns / 1ps

module ShiftLeft2_28Bit(in, out);
input [25:0] in;
output reg [27:0] out;

    always @(in) begin
        out[27:2] <= in;
        out[1:0] <= 2'b00;
        end
        
endmodule
