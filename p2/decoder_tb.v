`timescale 1ns / 1ps

module decoder_tb;
   reg [2:0] n, e;
   wire [7:0] d;
   
   decoder d0(.n(n), .d(d));

   int        i, p;

   initial begin
      $display("----------------------------------------------");
      for (i=0; i<8; i++) begin
         assign n = i;
         #1;
         $display("n=%b, d=%b",n,d);
         assert(d == 1 << i) else $fatal(1, "DIE!");
      end
      $display("----------------------------------------------");
      $display("PASSED");
      $finish;        
   end
endmodule

