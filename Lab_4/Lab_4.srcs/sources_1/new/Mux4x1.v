`timescale 1ns / 1ps
module Mux4x1(
    input A,
    input B,
    input C,
    input D,
    input [1:0] Select,
    output Out
    );
    assign Out = (A & Select[1] & Select[0]) | (B & Select[1] & ~Select[0])
                 | (C & ~Select[1] & Select[0]) | (D & ~Select[1] & ~Select[0]);
endmodule
