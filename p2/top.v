`timescale 1ns / 1ps 

module top(
           input  [2:0] n,
           input        e,
           output [7:0] d
           );

   wire [7:0] d0;
   assign es = {8{e}};
   decoder decoder0(.n(n), .d(d0));
   assign d = d0[7:0] & {8{e}};

endmodule
