`timescale 1ns / 1ps 

module top(
           input  a, b,
           output myAnd, myOr, myNot
           );
   assign myAnd = a & b;
   assign myOr  = a | b;
   assign myNot = ~a;
endmodule
