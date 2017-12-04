`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2017 03:45:34 PM
// Design Name: 
// Module Name: Carry-Lookahead stim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Carry_Lookahead_stim;
    //Inputs
    reg A [63:0];
    reg B [63:0];
    reg CLK;
    reg c0;
    
    //Outputs
    wire sum [63:0];
    
    //Instantaite the Unit Under Test (UUT)
    Carry_Lookahead_stim uut(
        .A(A),
        .B(B),
        .CLK(CLK),
        .c0(c0),
        .sum(sum)
        );
        
        initial begin
            A = 64'b1111;
            B = 64'b1010;
            c0 = 1'b0;
            #20 $finish;
        end
        
            always @ CLK #0.5 CLK <= ~CLK;
        
    
endmodule
