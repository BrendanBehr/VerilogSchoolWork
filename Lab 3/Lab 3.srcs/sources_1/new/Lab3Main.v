`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 02:03:44 PM
// Design Name: 
// Module Name: Lab3Main
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


module Lab3Main(
    input [3:0] instr,
    input [63:0]A,
    input [63:0]B,
    output reg [63:0] Out
    );
    
    always @(instr)
    begin
        if(instr == 4'b0000)
            //Perform AND operation
            Out = A & B;
        else if(instr == 4'b0001)
            //Perform OR operation
            Out = A | B;
        else if(instr == 4'b0010)
            //perform add operation
            Out = A + B;
        else if(instr == 4'b0110)
            //perform subtract operation
            Out = A - B;
        else if(instr == 4'b0111)
            //Pass input b
            Out = B;
        else if(instr == 4'b1100)
            //perform NOR operation
            Out = ~(A | B);
    end
endmodule
