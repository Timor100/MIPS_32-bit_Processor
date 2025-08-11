`timescale 1ns / 1ps

module EX_MEM(
Clk,
Size_EX,
RegWrite_EX,
MemtoReg_EX,
Branch_EX,
MemRead_EX,
MemWrite_EX,
Zero_EX,
AddResult_EX,
ALUResult_EX,
ReadData2_EX,
WriteReg_EX,

IsJal_EX,
Jump_EX,
PC_EX,
out1_EX,
ReadData1_EX,

Size_MEM,
RegWrite_MEM,
MemtoReg_MEM,
Branch_MEM,
MemRead_MEM,
MemWrite_MEM,
Zero_MEM,
AddResult_MEM,
ALUResult_MEM,
ReadData2_MEM,
WriteReg_MEM,

IsJal_MEM,
Jump_MEM,
PC_MEM,
out1_MEM,
ReadData1_MEM,

Reset,
Flush
);

input Clk;
input [1:0] Size_EX;
input RegWrite_EX;
input MemtoReg_EX;
input Branch_EX;
input MemRead_EX;
input MemWrite_EX;
input Zero_EX;
input [31:0] AddResult_EX;
input [31:0] ALUResult_EX;
input [31:0] ReadData2_EX;
input [4:0] WriteReg_EX;

input IsJal_EX;
input [1:0] Jump_EX;
input [31:0] PC_EX;
input [27:0] out1_EX;
input [31:0] ReadData1_EX;

output reg [1:0] Size_MEM;
output reg RegWrite_MEM;
output reg MemtoReg_MEM;
output reg Branch_MEM;
output reg MemRead_MEM;
output reg MemWrite_MEM;
output reg Zero_MEM;
output reg [31:0] AddResult_MEM;
output reg [31:0] ALUResult_MEM;
output reg [31:0] ReadData2_MEM;
output reg [4:0] WriteReg_MEM;

output reg IsJal_MEM;
output reg [1:0] Jump_MEM;
output reg [31:0] PC_MEM;
output reg [27:0] out1_MEM;
output reg [31:0] ReadData1_MEM;

input Reset;
input Flush;

always @(posedge Clk, posedge Reset) begin
    if (Reset == 1)begin
    Size_MEM = 0;
    RegWrite_MEM = 0;
    MemtoReg_MEM = 0;
    Branch_MEM =  0;
    MemRead_MEM = 0;
    MemWrite_MEM = 0;
    Zero_MEM = 0;
    AddResult_MEM = 0;
    ALUResult_MEM = 0;
    ReadData2_MEM = 0;
    WriteReg_MEM = 0;
    
    IsJal_MEM = 0;
    Jump_MEM = 0;
    PC_MEM = 0;
    out1_MEM = 0;
    ReadData1_MEM = 0;
    end
    else if (Flush == 1)begin
    Size_MEM = 0;
    RegWrite_MEM = 0;
    MemtoReg_MEM = 0;
    Branch_MEM =  0;
    MemRead_MEM = 0;
    MemWrite_MEM = 0;
    Zero_MEM = 0;
    AddResult_MEM = 0;
    ALUResult_MEM = 0;
    ReadData2_MEM = 0;
    WriteReg_MEM = 0;
    
    IsJal_MEM = 0;
    Jump_MEM = 0;
    PC_MEM = 0;
    out1_MEM = 0;
    ReadData1_MEM = 0;
    end
    else begin
    Size_MEM = Size_EX;
    RegWrite_MEM = RegWrite_EX;
    MemtoReg_MEM = MemtoReg_EX;
    Branch_MEM =  Branch_EX;
    MemRead_MEM = MemRead_EX;
    MemWrite_MEM = MemWrite_EX;
    Zero_MEM = Zero_EX;
    AddResult_MEM = AddResult_EX;
    ALUResult_MEM = ALUResult_EX;
    ReadData2_MEM = ReadData2_EX;
    WriteReg_MEM = WriteReg_EX;
    
    IsJal_MEM = IsJal_EX;
    Jump_MEM = Jump_EX;
    PC_MEM = PC_EX;
    out1_MEM = out1_EX;
    ReadData1_MEM = ReadData1_EX;
    end
end

endmodule
