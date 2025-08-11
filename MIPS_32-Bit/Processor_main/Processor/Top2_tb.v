`timescale 1ns / 1ps

// Team Members: Timor Shahin, Logan Mitchell Eaton, Evan Bradley Rains
// Overall percent effort of each team meber: 
// Timor 33% ; Logan 33% ; Evan 33%


module Top2_tb();
reg Reset;
reg Clk;

wire [7:0] en_out;
wire [6:0] out7;

Top2 z1(en_out, out7, Reset, Clk);

initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
initial begin
    Reset <= 1;
    #200
    Reset <= 0;
end
endmodule
