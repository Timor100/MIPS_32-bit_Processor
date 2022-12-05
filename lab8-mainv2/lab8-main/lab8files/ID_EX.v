`timescale 1ns / 1ps

module ID_EX(
Clk,

RegWrite_ID,
MemtoReg_ID,
Branch_ID,
MemRead_ID,
MemWrite_ID,
ALUSrc_ID,
RegDst_ID,

IsJal_ID,
IsShift_ID,
ALUOp_ID,
Jump_ID,
Size_ID,

PCAddResult_ID,
ReadData1_ID,
ReadData2_ID,
Offset_ID,
Rs_ID,
Rt_ID,
Rd_ID,

PC_ID,
outx_ID,

RegWrite_EX,
MemtoReg_EX,
Branch_EX,
MemRead_EX,
MemWrite_EX,
ALUSrc_EX,
RegDst_EX,

IsJal_EX,
IsShift_EX,
ALUOp_EX,
Jump_EX,
Size_EX,

PCAddResult_EX,
ReadData1_EX,
ReadData2_EX,
Offset_EX,
Rs_EX,
Rt_EX,
Rd_EX,

PC_EX,
outx_EX,

Reset,
Flush
);

input Clk;

//input Flush2;

input RegWrite_ID;
input MemtoReg_ID;
input Branch_ID;
input MemRead_ID;
input MemWrite_ID;
input ALUSrc_ID;
input RegDst_ID;

input IsJal_ID;
input IsShift_ID;
input [3:0] ALUOp_ID;
input [1:0] Jump_ID;
input [1:0] Size_ID;

input [31:0] PCAddResult_ID;
input [31:0] ReadData1_ID;
input [31:0] ReadData2_ID;
input [31:0] Offset_ID;
input [4:0] Rs_ID;
input [4:0] Rt_ID;
input [4:0] Rd_ID;

input [31:0] PC_ID;
input [27:0] outx_ID;

output reg RegWrite_EX;
output reg MemtoReg_EX;
output reg Branch_EX;
output reg MemRead_EX;
output reg MemWrite_EX;
output reg ALUSrc_EX;
output reg RegDst_EX;

output reg IsJal_EX;
output reg IsShift_EX;
output reg [3:0] ALUOp_EX;
output reg [1:0] Jump_EX;
output reg [1:0] Size_EX;

output reg [31:0] PCAddResult_EX;
output reg [31:0] ReadData1_EX;
output reg [31:0] ReadData2_EX;
output reg [31:0] Offset_EX;
output reg [4:0] Rs_EX;
output reg [4:0] Rt_EX;
output reg [4:0] Rd_EX;

output reg [31:0] PC_EX;
output reg [27:0] outx_EX;

input Reset;
input Flush;


always @(posedge Clk, posedge Reset) begin
    if (Reset == 1)begin
    RegWrite_EX = 0;
    MemtoReg_EX = 0;
    Branch_EX = 0;
    MemRead_EX = 0;
    MemWrite_EX = 0;
    ALUSrc_EX = 0;
    RegDst_EX = 0;
    
    IsJal_EX = 0;
    IsShift_EX = 0;
    ALUOp_EX = 0;
    Jump_EX = 0;
    Size_EX = 0;
    
    PCAddResult_EX = 0;
    ReadData1_EX = 0;
    ReadData2_EX = 0;
    Offset_EX = 0;
    Rs_EX = 0;
    Rt_EX = 0;
    Rd_EX = 0;
    
    PC_EX = 0;
    outx_EX = 0;
    end
    else if ((Flush == 1))begin
    RegWrite_EX = 0;
    MemtoReg_EX = 0;
    Branch_EX = 0;
    MemRead_EX = 0;
    MemWrite_EX = 0;
    ALUSrc_EX = 0;
    RegDst_EX = 0;
    
    IsJal_EX = 0;
    IsShift_EX = 0;
    ALUOp_EX = 0;
    Jump_EX = 0;
    Size_EX = 0;
    
    PCAddResult_EX = 0;
    ReadData1_EX = 0;
    ReadData2_EX = 0;
    Offset_EX = 0;
    Rs_EX = 0;
    Rt_EX = 0;
    Rd_EX = 0;
    
    PC_EX = 0;
    outx_EX = 0;
    end
    else begin
    RegWrite_EX = RegWrite_ID;
    MemtoReg_EX = MemtoReg_ID;
    Branch_EX = Branch_ID;
    MemRead_EX = MemRead_ID;
    MemWrite_EX = MemWrite_ID;
    ALUSrc_EX = ALUSrc_ID;
    RegDst_EX = RegDst_ID;
    
    IsJal_EX = IsJal_ID;
    IsShift_EX = IsShift_ID;
    ALUOp_EX = ALUOp_ID;
    Jump_EX = Jump_ID;
    Size_EX = Size_ID;
    
    PCAddResult_EX = PCAddResult_ID;
    ReadData1_EX = ReadData1_ID;
    ReadData2_EX = ReadData2_ID;
    Offset_EX = Offset_ID;
    Rs_EX = Rs_ID;
    Rt_EX = Rt_ID;
    Rd_EX = Rd_ID;
    
    PC_EX = PC_ID;
    outx_EX = outx_ID;
    end
end

endmodule