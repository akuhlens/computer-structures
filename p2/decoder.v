`timescale 1ns / 1ps 

module decoder(
               input  [2:0] n,
               output [7:0] d
           );

   assign d[0] = ~n[0] & ~n[1] & ~n[2];
   assign d[1] =  n[0] & ~n[1] & ~n[2];
   assign d[2] = ~n[0] &  n[1] & ~n[2];
   assign d[3] =  n[0] &  n[1] & ~n[2];
   assign d[4] = ~n[0] & ~n[1] &  n[2];
   assign d[5] =  n[0] & ~n[1] &  n[2];
   assign d[6] = ~n[0] &  n[1] &  n[2];
   assign d[7] =  n[0] &  n[1] &  n[2];
   
endmodule
