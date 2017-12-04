`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2017 03:03:49 PM
// Design Name: 
// Module Name: Lab3_tb
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


module ALU_tb();
    //inputs
    reg [3:0]instr;
    reg [63:0]A;
    reg [63:0]B;
    
    //output
    wire [63:0]Out;
    
    ALU UUT(
        .instr(instr),
        .A(A),
        .B(B),
        .Out(Out)
    );
    
    //Initial begin
    initial begin
        A = 64'h65465ca55ffb4754;
        B = 64'h1cbe2a14ba428791;
        //Perform AND operation
        instr = 4'b0000;
        #10;
        //Perform OR operation
        instr = 4'b0001;
        #10;        
        //Perform add operation
        instr = 4'b0010;
        #10;
        //Perform subtract operation
        instr = 4'b0110;
        #10;            
        //Perform pass input b
        instr = 4'b0111;
        #10;                       
        //Perform NOR operation
        instr = 4'b1100;
        #10;
        #5 $finish; 
    end
        
endmodule
