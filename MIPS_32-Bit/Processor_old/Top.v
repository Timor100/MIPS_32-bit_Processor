`timescale 1ns / 1ps

// Team Members: Timor Shahin, Logan Mitchell Eaton, Evan Bradley Rains
// Overall percent effort of each team meber: 
// Timor 33% ; Logan 33% ; Evan 33%
// 5 stages, braches resolve at MEM stage

module Top(v0, v1, Reset, Clk);
input Reset, Clk;
output [31:0] v0;
output [31:0] v1;
//wire [31:0] Address;    
  
wire [31:0] PCAddResult;    
wire [31:0] Instruction; 
//
wire [31:0] PCAdderResult_ID;
wire [31:0] Controller_ID;
wire [4:0] ReadReg1_ID;
wire [4:0] ReadReg2_ID;
wire [15:0] Offset_ID;
wire [4:0] Rt_ID;
wire [4:0] Rd_ID;
wire [25:0] J_ID;
//
wire RegWrite_ID;
wire MemtoReg_ID;
wire Branch_ID;
wire MemRead_ID;
wire MemWrite_ID;
wire ALUSrc_ID;
wire RegDst_ID;

wire IsJal_ID;
wire IsShift_ID;
wire [3:0] ALUOp_ID;
wire [1:0] Jump_ID;
wire [1:0] Size_ID;

wire [31:0] ReadData1_ID;
wire [31:0] ReadData2_ID;
//wire [31:0] Offset_ID;
//wire [4:0] Rt_ID;
//wire [4:0] Rd_ID;

wire RegWrite_EX;
wire MemtoReg_EX;
wire Branch_EX;
wire MemRead_EX;
wire MemWrite_EX;
wire ALUSrc_EX;
wire RegDst_EX;

wire IsJal_EX, IsJal_MEM, IsJal_WB;
wire IsShift_EX;
wire [3:0] ALUOp_EX;
wire [1:0] Jump_EX, Jump_MEM, Jump_WB;
wire [1:0] Size_EX;

wire [31:0] PCAddResult_EX;
wire [31:0] ReadData1_EX;
wire [31:0] ReadData2_EX;
wire [31:0] Offset_EX;
wire [4:0] Rt_EX;
wire [4:0] Rd_EX;
//

wire Zero_EX;
wire [31:0] AddResult_EX;
wire [31:0] ALUResult_EX;

wire [4:0] WriteReg_EX;
wire [1:0] Size_MEM;
wire RegWrite_MEM;
wire MemtoReg_MEM;
wire Branch_MEM;
wire MemRead_MEM;
wire MemWrite_MEM;
wire Zero_MEM;
wire [31:0] AddResult_MEM;
wire [31:0] ALUResult_MEM;
wire [31:0] ReadData2_MEM, ReadData1_MEM, ReadData1_WB;
wire [4:0] WriteReg_MEM;
//
wire [31:0] ReadData_MEM;
wire RegWrite_WB;
wire MemtoReg_WB;
wire [31:0] ReadData_WB;
wire [31:0] ALUResult_WB;
wire [4:0] WriteReg_WB;
//
wire [27:0] out1;
wire [31:0] out2;
wire [31:0] out3;

//wire [31:0] AdderResult_MEM;
//wire [31:0] ReadData1_ID;
//wire [31:0] ReadData2_ID;

wire [31:0] Offset_ID2;

// wire RegWrite_WB;
wire PCSrc;
wire [4:0] outData;
wire [31:0] PC_8;
wire [31:0] WData1;
//wire [31:0] WData2;
wire [31:0] ALUin1;
wire [31:0] ALUin2;
wire [31:0] ShiftOut;

wire [31:0] PC_ID;
wire [31:0] PC_EX, PC_MEM, PC_WB;
wire [27:0] out1_EX, out1_MEM, out1_WB;

wire    NotStall_PC; 
wire    NotStall_IFID; 
wire    MuxControl;
wire    Flush_ID;
wire    Flush_EX;
wire    Flush_MEM;

wire Flush;

wire [3:0] ALUOp;
wire [1:0] Jump, Size;
wire RegWrite, MemRead, MemWrite, BranchX, ALUSrc, Mem2Reg, RegDst, IsJal, IsShift;

//wire Clk;
//wire Out55;    
//wire [31:0] v0, v1;

wire [31:0] PC, WriteData10;
 //   ClkDiv n5(Clkin, Reset, Clk);
 //   Two4DigitDisplay n10(Clkin, v1[15:0], v0[15:0], out7, en_out);
wire [1:0] A, B;
wire [31:0] Mux1Out, Mux2Out;
wire [4:0] Rs_EX;
    
    ProgramCounter a1(out3, PC, Reset, Clk, NotStall_PC);
    PCAdder a2(PC, PCAddResult);
    InstructionMemory a3(PC, Instruction);
    Mux32Bit2To1 a5(out2, PCAddResult, AddResult_MEM, PCSrc);
    Mux32Bit3To1 a6(out3, out2, {PC_WB[31:28],out1_WB}, ReadData1_WB, Jump_WB);
    ShiftLeft2_28Bit a7(J_ID, out1);
    
    Hazard h99(
    Controller_ID[31:26],
    Controller_ID[5:0], 
    Controller_ID[25:21], 
    Controller_ID[20:16], 
    Controller_ID[15:11], 
    
    WriteReg_EX, 
    
    WriteReg_MEM,
    
    MemRead_EX,
    RegWrite_EX,
    MemRead_MEM,
    RegWrite_MEM,
    PCSrc,
    IsJal_WB,
    Jump_WB,
    
    NotStall_PC, 
    NotStall_IFID, 
    MuxControl,
    Flush_ID,
    Flush_EX,
    Flush_MEM,
    
    RegWrite_WB,
    WriteReg_WB
    );
    
    //PCAdder b10(PCAdderResult_ID, PC_8);
    Mux32Bit2To1 b11(WriteData10, WData1, PC_WB, IsJal_WB);
    Mux32Bit2To1 b12(WData1, ReadData_WB, ALUResult_WB, MemtoReg_WB);
    Mux5Bit2to1 j1(outData, WriteReg_WB, {5'd31}, IsJal_WB); 
    RegisterFile b1(ReadReg1_ID, ReadReg2_ID, outData, WriteData10, RegWrite_WB, Clk, ReadData1_ID, ReadData2_ID, v0, v1);
    SignExtension b20(Offset_ID, Offset_ID2);
    
//    Mux1Bit2to1 fh1(IsJal_WB, RegWrite_WB, Out55);
    
    Forwarding forward1(Rs_EX, Rt_EX, WriteReg_MEM, WriteReg_WB, RegWrite_MEM, RegWrite_WB, A, B);
    
    Mux32Bit3To1 muxA(Mux1Out, ReadData1_EX, ALUResult_MEM, WData1, A);
    Mux32Bit3To1 muxB(Mux2Out, ReadData2_EX, ALUResult_MEM, WData1, B);
    
    Controller b3(Controller_ID, ALUOp, RegWrite, MemRead, MemWrite, BranchX, Jump, ALUSrc, Mem2Reg, RegDst, IsJal, IsShift, Size);
    ShiftLeft2 c19(Offset_EX, ShiftOut);
    Adder c20(PCAddResult_EX, ShiftOut, AddResult_EX);
    Mux5Bit2to1 j2(WriteReg_EX, Rt_EX, Rd_EX, RegDst_EX);
    
    Mux32Bit2To1 c30(ALUin1, Mux1Out, Offset_EX, IsShift_EX);
    Mux32Bit2To1 c31(ALUin2, Mux2Out, Offset_EX, ALUSrc_EX);
    
    ALU32Bit c32(ALUOp_EX, ALUin1, ALUin2, ALUResult_EX, Zero_EX);
    
    Branch d15(Zero_MEM, Branch_MEM, PCSrc);
    
    DataMemory f15(ALUResult_MEM, ReadData2_MEM, Clk, MemWrite_MEM, MemRead_MEM, ReadData_MEM, Size_MEM); 
    
    ControllerMux f45(MuxControl, 4'b0000, ALUOp, RegWrite, MemRead, MemWrite, BranchX, Jump ,ALUSrc, Mem2Reg, RegDst, IsJal, IsShift, Size, ALUOp_ID, RegWrite_ID, MemRead_ID, MemWrite_ID, Branch_ID, Jump_ID ,ALUSrc_ID, MemtoReg_ID, RegDst_ID, IsJal_ID, IsShift_ID, Size_ID, Flush);
    
    IF_ID a4(
    Clk,
    PCAddResult,
    Instruction,
    PC,
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
    Flush_ID,
    NotStall_IFID
    );
    
        ID_EX b2(
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
        
        PCAdderResult_ID,
        ReadData1_ID,
        ReadData2_ID,
        Offset_ID2,
        ReadReg1_ID,
        Rt_ID,
        Rd_ID,
        
        PC_ID,
        out1,
        
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
        out1_EX,
        Reset,
        Flush_EX,
        Flush
        );
    
            EX_MEM c1(
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
            Mux2Out,
            WriteReg_EX,
            
            IsJal_EX,
            Jump_EX,
            PCAddResult_EX,
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
            Flush_MEM
            );
                MEM_WB d1(
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

endmodule
