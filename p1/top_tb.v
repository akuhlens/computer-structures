`timescale 1ns / 1ps

module testbench;
   reg a, b;
   wire myand, myor, mynot;
   
   top top0(
            .a(a),
            .b(b),
            .myAnd(myand),
            .myOr(myor),
            .myNot(mynot)
            );


   initial
     begin

        assign a = 0;
        assign b = 0;
        
        #1;
        assert(myand == 0) else $error("0 myAnd 0 failed");
        assert(myor  == 0) else $error("0 myOr 0 failed");
        assert(mynot == 1) else $error("myNot 0 failed");

        assign a = 1;
        #1;
        assert(myand == 0) else $error("1 myAnd 0 failed");        
        assert(myor  == 1) else $error("1 myOr 0 failed");
        assert(mynot == 0) else $error("myNot 1 failed");

        assign b = 1;        
        #1; 
        assert(myand == 1) else $error("1 myAnd 1 failed");
        assert(myor  == 1) else $error("1 myOr 1 failed");

        assign a = 0;        
        #1;
        assert(myand == 0) else $error("0 myAnd 1 failed");
        assert(myor  == 1) else $error("0 myOr 1 failed");

        $finish;        
     end
endmodule // testbench

