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


module ALUtb();

    //Inputs
    reg Cin;
    reg clock;
    reg[15:0] MD;
    reg[15:0] AC;
    reg[2:0]ALUOp;
    reg reset;
    
    //Outputs
    wire [15:0] ACC;
    wire Cout;
    
    ALU UUT(
        .Cin(Cin),
        .clock(clock),
        .MD(MD),
        .AC(AC),
        .ALUOp(ALUOp),
        .reset(reset),
        .ACC(ACC),
        .Cout(Cout)
    );
    
    //Initialize
    initial begin
        reset = 1;
        Cin = 1;
        clock = 0;
        AC = 16'h69;
        MD = 16'h1c;
        //Perform NOTa operation
        ALUOp = 3'b000;
        #10;
        //Perform ADD operation
        ALUOp = 3'b001;
        #10;        
        //Perform INCa operation
        ALUOp = 3'b010;
        #10;
        //Perform Zero Flag operation
        ALUOp = 3'b011;
        #10;            
        //Perform pass input b
        ALUOp = 3'b100;
        #10;            
        #5 $finish; 
    end
    
    always @clock #0.5 clock <= ~clock;
    always @(posedge clock) Cin <= Cout;
        always @(posedge clock) AC <= ACC;
endmodule
