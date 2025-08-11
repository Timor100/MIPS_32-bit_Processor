`timescale 1ns / 1ps

module IF_ID(
Clk,
PCAdderResult_IF,
Instruction_IF,
PC_IF,
PCAdderResult_ID,
Controller_ID,
ReadReg1_ID,
ReadReg2_ID,
Offset_ID,
Rt_ID,
Rd_ID,
J_ID,
PC_ID,
Reset,
Flush,
NotStall
);

input Clk;
input [31:0] PCAdderResult_IF;
input [31:0] Instruction_IF;
input [31:0] PC_IF;
output reg [31:0] PCAdderResult_ID;
output reg [31:0] Controller_ID;
output reg [4:0] ReadReg1_ID;
output reg [4:0] ReadReg2_ID;
output reg [15:0] Offset_ID;
output reg [4:0] Rt_ID;
output reg [4:0] Rd_ID;
output reg [25:0] J_ID;
output reg [31:0] PC_ID;

input Reset;
input Flush;
input NotStall;


always @(posedge Clk, posedge Reset) begin
    if(Reset == 1)begin
    PCAdderResult_ID = 0;
    Controller_ID = 0;
    ReadReg1_ID = 0;
    ReadReg2_ID = 0;
    Offset_ID = 0;
    Rt_ID = 0;
    Rd_ID = 0;
    J_ID = 0;
    PC_ID = 0;
    end
    else if(Flush == 1)begin
    PCAdderResult_ID = 0;
    Controller_ID = 0;
    ReadReg1_ID = 0;
    ReadReg2_ID = 0;
    Offset_ID = 0;
    Rt_ID = 0;
    Rd_ID = 0;
    J_ID = 0;
    PC_ID = 0;
    end
    else if(NotStall == 1)begin
    PCAdderResult_ID = PCAdderResult_IF;
    Controller_ID = Instruction_IF;
    ReadReg1_ID = Instruction_IF [25:21];
    ReadReg2_ID = Instruction_IF [20:16];
    Offset_ID = Instruction_IF [15:0];
    Rt_ID = Instruction_IF [20:16];
    Rd_ID = Instruction_IF [15:11];
    J_ID = Instruction_IF [25:0];
    PC_ID = PC_IF;
    end
    else if(NotStall == 0)begin
    end
end

endmodule