`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2017 02:54:48 PM
// Design Name: 
// Module Name: Look Ahead Adder
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


module LookAheadAdder(
    output reg[63:0] sum,
    input [63:0] A,
    input [63:0] B,
    input c0,
    input CLK
    );
    
        reg x;
        reg [63:0] carry;
    always @(posedge CLK)
begin
    x = 1;
    carry[0] = c0;
    carry[1] = A[0] & B[0] | (A[0] | B[0]) & carry[0];
    while (x < 64)
    begin
       
       sum[x] = (A[x-1] & B[x-1] | (A[x-1]^B[x-1]) & sum[x-1]) ^ A[x] ^ B[x];
       x = x + 1;
    end
    
 end
    
endmodule
