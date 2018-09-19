`timescale 1ns / 1ps

module top_tb;
   reg [2:0] n;
   reg e;
   wire [7:0] d;
   
   top t0(.n(n), .e(e), .d(d));

   int        i, p;

   initial begin
      $display("----------------------------------------------");

      for (i=0; i<8; i++) begin
         assign n = i;
         assign e = 0;
         #1;
         $display("n=%b,e=%b,d=%b",n,e,d);
         assert(d == 0) else $fatal(1, "DIE!");
         
         assign e = 1;
         #1;
         $display("n=%b,e=%b,d=%b",n,e,d);
         assert(d == 1 << i) else $fatal(1, "DIE!");
      end
      $display("----------------------------------------------");
      $display("PASSED");
      $finish;        
   end
endmodule

