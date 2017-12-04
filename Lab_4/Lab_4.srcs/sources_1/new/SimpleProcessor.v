`timescale 1ns / 1ps

module SimpleProcessor(
    input [15:0] instr,
    input clock,
    input C,
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
        //State 0 at reset
        IR <= PC;
  
        //State 1
        PC <= PC + 1;
        
        //Case to switch between different states
        //Stores the opcode, AM, and addresses from the instruction
        opcode <= instr[15:13];
        AM <= instr[12];
        
        case(opcode)
            3'b000: begin
                //State 2
                AC <= ~AC;
                end
            3'b011: begin
                //State 3
                AC = AC + 1;
                end
            3'b010: begin
                //Checks to make sure that the Accumulator and Adress Mode are greater than 0
                //If they are proceed to state 4, if not, return to state 0
                if(AC > 0 && AM > 0)begin 
                    //State 4
                    MA <= IR[11:0];
                                                    
                    //State 5
                    MD <= MA;
                                                    
                    //State 6
                    PC <= MD;
                    end
                else if(AC > 0 && AM == 0)begin
                    
                    //State 7
                    PC <= IR;
                    end
                end
            default: begin
                //State 8
                MA <=IR[11:0];
                
                if(opcode == 3'b100) begin
                    if(AM) begin
                        //State 9
                        MD <= MA;
                        
                        //State 10
                        MA <= MD;
                        end
                    //State 11
                    MA <= AC;
                    AC <= 0;     
                    end
                else begin
                    //State 12
                    MD <= MA;
                    
                    if(AM) begin
                        //State 13
                        MA <= MD;
                        
                        //State 14
                        MD <= MA;
                        end
                    
                    if(opcode == 3'b001) begin
                        //State 15
                        AC <= AC + MD + C;
                        end
                    else begin
                        //State 16
                        AC <= MD;
                        end
                    end
                end
            endcase
    end
endmodule
