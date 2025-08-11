`timescale 1ns / 1ps

module MEM_WB(
Clk,
RegWrite_MEM,
MemtoReg_MEM,
ReadData_MEM,
ALUResult_MEM,
WriteReg_MEM,

IsJal_MEM,
Jump_MEM,
PC_MEM,
out1_MEM,
ReadData1_MEM,

RegWrite_WB,
MemtoReg_WB,
ReadData_WB,
ALUResult_WB,
WriteReg_WB,

IsJal_WB,
Jump_WB,
PC_WB,
out1_WB,
ReadData1_WB,

Reset
);

input Clk;
input RegWrite_MEM;
input MemtoReg_MEM;
input [31:0] ReadData_MEM;
input [31:0] ALUResult_MEM;
input [4:0] WriteReg_MEM;

input IsJal_MEM;
input [1:0] Jump_MEM;
input [31:0] PC_MEM;
input [27:0] out1_MEM;
input [31:0] ReadData1_MEM;

output reg RegWrite_WB;
output reg MemtoReg_WB;
output reg [31:0] ReadData_WB;
output reg [31:0] ALUResult_WB;
output reg [4:0] WriteReg_WB;

output reg IsJal_WB;
output reg [1:0] Jump_WB;
output reg [31:0] PC_WB;
output reg [27:0] out1_WB;
output reg [31:0] ReadData1_WB;

input Reset;

always @(posedge Clk, posedge Reset) begin
    if(Reset == 1)begin
    RegWrite_WB = 0;
    MemtoReg_WB = 0;
    ReadData_WB = 0;
    ALUResult_WB = 0;
    WriteReg_WB = 0;
    
    IsJal_WB = 0;
    Jump_WB = 0;
    PC_WB = 0;
    out1_WB = 0;
    ReadData1_WB = 0;
    end
    else begin
    RegWrite_WB = RegWrite_MEM;
    MemtoReg_WB = MemtoReg_MEM;
    ReadData_WB = ReadData_MEM;
    ALUResult_WB = ALUResult_MEM;
    WriteReg_WB = WriteReg_MEM;
    
    IsJal_WB = IsJal_MEM;
    Jump_WB = Jump_MEM;
    PC_WB = PC_MEM;
    out1_WB = out1_MEM;
    ReadData1_WB = ReadData1_MEM;
    end
end

endmodule