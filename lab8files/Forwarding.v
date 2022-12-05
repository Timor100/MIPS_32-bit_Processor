`timescale 1ns / 1ps

module Forwarding(Rs, Rt, Rd_MEM, Rd_WB, RegWrite_MEM, RegWrite_WB, A, B);
input [4:0] Rs, Rt, Rd_MEM, Rd_WB;
input RegWrite_MEM, RegWrite_WB;
output reg [1:0] A, B;

always @(*)begin
    A = 0;
    B = 0;
    
    if((RegWrite_MEM == 1)&&(Rd_MEM != 0)&&(Rs == Rd_MEM))begin
        A = 1;
    end
    else if((RegWrite_WB == 1)&&(Rd_WB != 0)&&(Rs == Rd_WB))begin
        A = 2;
    end
    if((RegWrite_MEM == 1)&&(Rd_MEM != 0)&&(Rt == Rd_MEM))begin
        B = 1;
    end
    else if((RegWrite_WB == 1)&&(Rd_WB != 0)&&(Rt == Rd_WB))begin
        B = 2;
    end

end
endmodule
