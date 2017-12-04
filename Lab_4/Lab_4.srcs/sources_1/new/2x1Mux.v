`timescale 1ns / 1ps
module Mux2x1(
    input A,
    input B,
    input Select,
    output Out
    );
    assign Out = A & Select | B & ~Select;
endmodule
