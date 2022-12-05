`timescale 1ns / 1ps

module Controller(Instruction, ALUOp, RegWrite, MemRead, MemWrite, Branch, Jump ,ALUSrc, Mem2Reg, RegDst, IsJal, IsShift, Size);

    input [31:0] Instruction;
    wire [5:0]OPCode = Instruction[31:26];
    wire [5:0]FuncCode = Instruction[5:0];
    wire [4:0]RTCode = Instruction[20:16];
    output reg [3:0] ALUOp;
    output reg [1:0] Jump, Size;
    output reg RegWrite, MemRead, MemWrite, Branch, ALUSrc, Mem2Reg, RegDst, IsJal, IsShift;
    
    
    always @(*)
    begin
    case(OPCode)
        6'b000000: //add, sub, jr, and, or, nor, xor, sll, srl, slt
            case(FuncCode)
                6'b100000://add 
                    begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b100010://sub
                    begin
                    ALUOp <= 4'b0001;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b001000: //jr
                    begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b10;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b100100: //and
                    begin
                    ALUOp <= 4'b0110;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b100101: //or
                    begin
                    ALUOp <= 4'b0111;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b100111: //nor
                    begin
                    ALUOp <= 4'b1001;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b100110: //xor
                   begin
                    ALUOp <= 4'b1000;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
                6'b000000: //sll
                   begin
                   if(Instruction[15:11] == 0)begin
                   ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                   end
                   else begin
                    ALUOp <= 4'b0100;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 1;
                    Size <= 2'b00;
                    end
                    end
                6'b000010: //srl
                    begin
                    ALUOp <= 4'b0101;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 1;
                    Size <= 2'b00;
                    end
                6'b101010: //slt
                    begin
                    ALUOp <= 4'b1110;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
              default: begin
               ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
              end     
            endcase
        6'b001100: //andi
                begin
                    ALUOp <= 4'b0110;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 1;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b001000: //addi
                begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 1;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                 end
        6'b011100: //mult
            begin
                    ALUOp <= 4'b0010;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 1;
                    RegDst <= 1;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b101011: //sw
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 1;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b101001: //sh
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 1;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b01;
                    end
        6'b101000: //sb
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 1;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b10;
                    end
        6'b100011: //lw
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 1;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b100001: //lh
            begin
                   ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 1;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b01;
                    end
        6'b100000: //lb
        begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 1;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b10;
                    end
        6'b000001: //bgez bltz
            if(RTCode == 5'b00001)//bgez
            begin
                    ALUOp <= 4'b1111;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
            else //bltz
                    begin
                    ALUOp <= 4'b1011;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        
        6'b000100: //beq
            begin
                    ALUOp <= 4'b0001;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b000101: //bne
            begin
                    ALUOp <= 4'b1010;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b000111: //bgtz
            begin
                    ALUOp <= 4'b1101;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b000110: //blez
            begin
                    ALUOp <= 4'b1100;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 1;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b000010: //j
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b01;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b000011: //jal
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b01;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 1;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b001101: //ori
            begin
                    ALUOp <= 4'b0111;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 1;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b001110: //xori
            begin
                    ALUOp <= 4'b1000;
                  RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 1;
                    RegDst <= 0;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
        6'b001010: //slti
            begin
                    ALUOp <= 4'b1110;
                    RegWrite <= 1;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 1;
                    Mem2Reg <= 1;
                    RegDst <=0 ;
                    IsJal <= 0;
                    IsShift <= 0;
                    Size <= 2'b00;
                    end
          default:
            begin
                    ALUOp <= 4'b0000;
                    RegWrite <= 0;
                    MemRead <= 0;
                    MemWrite <= 0;
                    Branch <= 0;
                    Jump <= 2'b00;
                    ALUSrc <= 0;
                    Mem2Reg <= 0;
                    RegDst <= 0;
                    IsJal <= 0;
                    end
    endcase
end
endmodule
