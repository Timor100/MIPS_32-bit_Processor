`timescale 1ns / 1ps

module Branch(Zero, IsBranch, Out);

    input Zero, IsBranch;
    output reg Out;
    
    always@(Zero, IsBranch) begin
        if((Zero == 1) && (IsBranch == 1))
            Out = 1;
        else
            Out = 0;
    end
endmodule
