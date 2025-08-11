`timescale 1ns / 1ps

// Team Members: Timor Shahin, Logan Mitchell Eaton, Evan Bradley Rains
// Overall percent effort of each team meber: 
// Timor 33% ; Logan 33% ; Evan 33%


module Top_tb();
reg Reset;
reg Clk;
wire [31:0] v0;
wire [31:0] v1;

Top z1(v0, v1, Reset, Clk);

initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
initial begin
    Reset <= 1;
    #100
    Reset <= 0;
//    #500
//    Reset <= 1;
//    #20
//    Reset <= 0;
end
endmodule
