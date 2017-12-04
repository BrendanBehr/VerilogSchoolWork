`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2017 02:27:26 PM
// Design Name: 
// Module Name: PC_ALU_tb
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


module PC_ALU_tb();

    //Inputs
    reg [15:0]MAi;
    reg [15:0]IR;
    reg [15:0]MD;
    reg MAMux;
    reg [1:0]PCMux;
    reg FINALMux;
    reg clock;
    reg reset;
    
    //Outputs
    wire [15:0]MAo;
    
    PC ALU UUT(
        .MAi(MAi),
        .clock(clock),
        .IR(IR),
        .MD(MD),
        .MAMux(MAMux),
        .PCMux(PCMux),
        .FINALMux(FINALMux),
        .reset(reset),
        .MAo(MAo)
    );
    
    //Initialize
    initial begin
        reset = 1;
        clock = 0;
        MAi = 16'h69;
        MD = 16'h1c;
        IR = 16'hb4;
        //MAMux = 0, PCMux = 0, Final Mux = 00
        MAMux <=1'b0; 
        PCMux <=1'b0; 
        FINALMux <=2'b00; 
        #10;
        //MAMux = 0, PCMux = 0, Final Mux = 01
        FINALMux <=2'b01; 
        #10;        
        //MAMux = 0, PCMux = 0, Final Mux = 10
        FINALMux <=2'b10; 
        #10; 
        //MAMux = 0, PCMux = 1, Final Mux = 00
        PCMux <= 1'b1;
        FINALMux <= 2'b00;
        #10;
        //MAMux = 0, PCMux = 1, Final Mux = 01
        FINALMux <= 2'b01;
        #10;        
        //MAMux = 0, PCMux = 1, Final Mux = 10
        FINALMux <= 2'b10;
        #10; 
        //MAMux = 1, PCMux = 0, Final Mux = 00
        MAMux <= 1'b1;
        PCMux <= 1'b0;
        FINALMux <= 2'b00;
        #10;
        //MAMux = 1, PCMux = 0, Final Mux = 01
        PCMux <= 2'b01;
        #10;        
        //MAMux = 1, PCMux = 0, Final Mux = 10
        FINALMux <= 2'b10;
        #10; 
        //MAMux = 1, PCMux = 1, Final Mux = 00
        PCMux <= 1'b1;
        FINALMux <= 2'b00;
        #10;
        //MAMux = 1, PCMux = 1, Final Mux = 01
        FINALMux 1'b01;
        #10;        
        //MAMux = 1, PCMux = 1, Final Mux = 10
        FINALMux = 2'b10;
        #10; 
        $finish; 
    end
    
    always @clock #0.5 clock <= ~clock;
    always @(posedge clock) MAi <= MAo;
endmodule
