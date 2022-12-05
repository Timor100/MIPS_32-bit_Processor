`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input signed [31:0] A, B;	    // inputs

	output reg signed [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0

	always @(*)
	begin
		case(ALUControl)
		4'b0000: 	// 0 is Add
			ALUResult <= A + B;
		4'b0001: 	// 1 is sub
			ALUResult <= A - B;
		4'b0010: 	// 2 is mult
			ALUResult <= A * B;
		4'b0011: 	//3 is div
			ALUResult <= A / B;
		4'b0100: 	//4 is shift left
			ALUResult <= B << A[10:6];
		4'b0101: 	//5 is shift right
			ALUResult <= B >> A[10:6];
		4'b0110: 	//6 is logical and
			ALUResult <= A & B;
		4'b0111: 	//7 is logical or
			ALUResult <= A | B;
		4'b1000: 	//8 is logical xor
			ALUResult <= A ^ B;
		4'b1001: 	//9 is logical nor
			ALUResult <= ~(A | B);
		4'b1010:    //10 is not equal
		    if(A != B)
		    ALUResult <= 32'd0;
		    else 
		    ALUResult <= 32'd1;
		4'b1011: //11 is less than 0
		    if(A < 0)
		    ALUResult <= 32'd0;
		    else
		    ALUResult <= 32'd1;
		4'b1100:     //12  is less than or equal 0
		    if(A <= 0)
		    ALUResult <= 32'd0;
		    else
		    ALUResult <= 32'd1;
		4'b1101: 	//13 is greater than 0
			if (A > 0)
			ALUResult <= 32'd0;
			else
			ALUResult <= 32'd1;
		4'b1110: 	//14 is A less than B
			if (A < B)
			ALUResult <= 32'd1;
			else
			ALUResult <= 32'd0;
		4'b1111: //15 greater than or equal to 0
		    if (A >= 0)
		    ALUResult <= 32'd0;
		    else
		    ALUResult <= 32'd1;
		default: 
			ALUResult <= A + B;
		endcase
	end
	always @(ALUResult)
		begin
		if(ALUResult == 0)
		Zero <= 1;
		else
		Zero <= 0;
	end
endmodule

