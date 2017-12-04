`timescale 1ns / 1ps


module ALU(
    input Cin,
    input clock,
    input reset,
    input [15:0] MD,
    input [15:0] AC,
    input [2:0] ALUOp,
    output reg [15:0] ACC,
    output reg Cout
    );
    
    always @(posedge reset)
     begin
    Cout <=0; 
    ACC <= AC;
    end
    always @(posedge clock)
    begin
        //ALU (16b) NOTa, ADD, INCa, Zero Flag, Pb
        case(ALUOp)
            3'b000: begin
                //NOTa
                ACC <= ~AC;
            end
            3'b001: begin
                //ADD
                ACC <= AC + MD + Cin;
                Cout <= AC[15] + MD[15];
            end
            3'b010: begin
                //INCa
                ACC <= AC + 2;
            end
            3'b011: begin
                //Zero Flag
                if(AC == 0)begin
                    ACC <= 1;
                    end
                else begin
                    ACC <= 0;
                end
            end
            3'b100: begin
                //Pass b
                ACC <= MD;
            end
        endcase
        
        
    end
endmodule
