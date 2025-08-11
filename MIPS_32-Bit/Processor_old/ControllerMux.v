`timescale 1ns / 1ps

module ControllerMux(Control, Zero, ALUOp, RegWrite, MemRead, MemWrite, Branch, Jump ,ALUSrc, Mem2Reg, RegDst, IsJal, IsShift, Size, ALUOp_ID, RegWrite_ID, MemRead_ID, MemWrite_ID, Branch_ID, Jump_ID ,ALUSrc_ID, MemtoReg_ID, RegDst_ID, IsJal_ID, IsShift_ID, Size_ID, Flush);
input [3:0] ALUOp;
input [1:0] Jump, Size;
input RegWrite, MemRead, MemWrite, Branch, ALUSrc, Mem2Reg, RegDst, IsJal, IsShift;
input Control;
input [3:0] Zero;

output reg [3:0] ALUOp_ID;
output reg [1:0] Jump_ID, Size_ID;
output reg RegWrite_ID, MemRead_ID, MemWrite_ID, Branch_ID, ALUSrc_ID, MemtoReg_ID, RegDst_ID, IsJal_ID, IsShift_ID;
output reg Flush;

always @(Control, Zero, ALUOp, RegWrite, MemRead, MemWrite, Branch, Jump ,ALUSrc, Mem2Reg, RegDst, IsJal, IsShift, Size) begin
    if(Control == 0)begin
    ALUOp_ID = 0;
    Jump_ID = 0;
    Size_ID = 0;
    RegWrite_ID = 0;
    MemRead_ID = 0;
    MemWrite_ID = 0; 
    Branch_ID = 0;
    ALUSrc_ID = 0; 
    MemtoReg_ID = 0; 
    RegDst_ID = 0; 
    IsJal_ID = 0; 
    IsShift_ID = 0;
    Flush <= 1;
    end
    else if (Control == 1)begin
    ALUOp_ID = ALUOp;
    Jump_ID = Jump;
    Size_ID = Size;
    RegWrite_ID = RegWrite;
    MemRead_ID = MemRead;
    MemWrite_ID = MemWrite; 
    Branch_ID = Branch;
    ALUSrc_ID = ALUSrc; 
    MemtoReg_ID = Mem2Reg; 
    RegDst_ID = RegDst; 
    IsJal_ID = IsJal; 
    IsShift_ID = IsShift;
    Flush <= 0;
    end
end

endmodule
