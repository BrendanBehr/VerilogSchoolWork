`timescale 1ns / 1ps


module PC_ALU(
    input [15:0]MAi,
    input [15:0]IR,
    input [15:0]MD,
    input MAMux,
    input [1:0]PCMux,
    input FINALMux,
    input clock,
    input reset,
    output reg [15:0]MAo
    );
    reg [11:0] PCInc;
    reg [11:0] PCBranch;
    
    always @(posedge reset) MAo <= MAi;
    always @(posedge clock) begin
        //MA Mux        
        Mux2x1(IR, MAi, MAMux, PCBranch);
        
        //PC Mux
        Mux2x1(PCBranch, IR, MAi, 0, PCMux, PCBranch);        
        
        //Final Mux
        Mux2x1(PCBranch, PCInc, FINALMux, MAo);
    
    end
    
endmodule