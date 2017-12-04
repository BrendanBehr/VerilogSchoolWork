`timescale 1ns / 1ps

module SimpleProcessor_New(
    input [15:0] instr,
    input clock,
    input Cin,
    output reg [15:0] IR,
    output reg [15:0] MD,
    output reg [15:0] AC,
    output reg [12:0] PC,
    output reg [12:0] MA

    );
    reg [2:0] opcode;
    reg AM;
    
    always @(posedge clock)
    begin
        //Set the opcode and the AM
        opcode <= instr[15:13];
        AM <= instr[12];
        
        //Ask ALU to perform operation
        
        //Ask Muxes to do stuff    
        
    end
endmodule
