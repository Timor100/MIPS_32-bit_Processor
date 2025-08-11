`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Team Members: Timor Shahin, Logan Mitchell Eaton, Evan Bradley Rains
// Overall percent effort of each team meber: 
// Timor 33% ; Logan 33% ; Evan 33%
//////////////////////////////////////////////////////////////////////////////////


module Hazard(
Special_ID,
Func_ID, 
Rs_ID, 
Rt_ID, 
//Rd_ID, 

WriteReg_EX, 

//WriteReg_MEM,

MemRead_EX,
//RegWrite_EX,
//MemRead_MEM,
//RegWrite_MEM,
Branch_MEM,
IsJal_EX,
Jump_EX,

NotStall_PC, 
NotStall_IFID, 
//MuxControl,
Flush_ID,
Flush_EX,
Flush_MEM,

RegWrite_WB,
WriteReg_WB
);

input [5:0] Special_ID;
input [5:0] Func_ID;

input [4:0] Rs_ID; 
input [4:0] Rt_ID; 
//input [4:0] Rd_ID; 

input [4:0] WriteReg_EX; 

//input [4:0] WriteReg_MEM;

input MemRead_EX;
//input RegWrite_EX;
//input MemRead_MEM;
//input RegWrite_MEM;
input Branch_MEM;

input IsJal_EX;
input [1:0] Jump_EX;


input RegWrite_WB;
input [4:0] WriteReg_WB;

output reg NotStall_PC; 
output reg NotStall_IFID; 
//output reg MuxControl;

output reg Flush_ID;
output reg Flush_EX;
output reg Flush_MEM;

always @(*) 
    begin
    if((IsJal_EX == 1) || (Jump_EX == 1) || (Jump_EX == 2))
    begin
    Flush_ID <= 1;
    Flush_EX <= 1;
    Flush_MEM <= 1;
    NotStall_PC <= 1;
    NotStall_IFID <= 1;
 //   MuxControl <= 0;
    end
     else if(Branch_MEM == 1)
    begin
    Flush_ID <= 1;
    Flush_EX <= 1;
    Flush_MEM <= 1;
    NotStall_PC <= 1;
    NotStall_IFID <= 1;
//    MuxControl <= 0;
    end
    else if(((Special_ID == 0) && (Func_ID == 6'b001000)) || (Special_ID == 6'b000011) || (Special_ID == 6'b000010))
    begin
    NotStall_PC <= 0;
    NotStall_IFID <= 0;
 //   MuxControl <= 1;
    end
 //    else if (((MemRead_EX && (((WriteReg_EX == Rs_ID)&&(Rs_ID != 0)) || ((WriteReg_EX == Rt_ID)&&(Rt_ID != 0)))) || (MemRead_MEM && (((WriteReg_MEM == Rs_ID)&&(Rs_ID != 0))||((WriteReg_MEM == Rt_ID)&&(Rt_ID != 0)))))) 
       else if (((MemRead_EX && (((WriteReg_EX == Rs_ID)&&(Rs_ID != 0)) || ((WriteReg_EX == Rt_ID)&&(Rt_ID != 0)))))) 
        begin
        NotStall_PC <= 0;
        NotStall_IFID <= 0;
//        MuxControl <= 0;
        Flush_EX <= 1;
        end
//    else if(((RegWrite_EX && (((Rs_ID == WriteReg_EX)&&(Rs_ID != 0)) || ((Rt_ID == WriteReg_EX)&&(Rt_ID != 0)))) || (RegWrite_MEM && (((Rs_ID == WriteReg_MEM)&&(Rs_ID != 0)) || ((Rt_ID == WriteReg_MEM)&&(Rt_ID != 0)))) || (RegWrite_WB && (((Rs_ID == WriteReg_WB)&&(Rs_ID != 0)) || ((Rt_ID == WriteReg_WB)&&(Rt_ID != 0))))))
      else if (RegWrite_WB && (((Rs_ID == WriteReg_WB)&&(Rs_ID != 0)) || ((Rt_ID == WriteReg_WB)&&(Rt_ID != 0))))  
        begin 
        NotStall_PC <= 0;
        NotStall_IFID <= 0;
  //      MuxControl <= 0;
        Flush_EX <= 1;
        end
    else
        begin
        NotStall_PC <= 1;
        NotStall_IFID <= 1;
  //      MuxControl <= 1;
        Flush_ID <= 0;
        Flush_EX <= 0;
        Flush_MEM <= 0;
        end
    end
endmodule
