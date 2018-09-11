`timescale 1ns / 1ps //specify how detailed of a simulation we want to
                     //run


module testbench();
   wire led;
   //wires are for module outputs
   reg  sw;
   //reg(isters) are for module inputs
   
   //connect our module for testing
   top top0 (
             .led(led),
             .sw(sw)
             );
   

   initial
     begin
        
        #100 // a 100 nanosecond delay
          
          //set sw to "low" and test
          //that the led also goes
          //"low"
          sw = 0;
        // set sw=0
        #100 //another 100 nanosecond (ns) delay
          // if the led is not "low"
          // fail with an error
          // message
          assert( led == 0) else $fatal(1, "LED==0 Failed");
        
        
        #100 //100 ns delay
          sw = 1;
        //now we try setting the switch to “high”
        #100
          //if the LED is not “high”,
          //fail with an error message
          assert( led == 1) else $fatal(1, "LED==1 Failed");
        
        
        #100 // another 100ns delay, just for
          // funzies
          //hooray, we passed the test
          //bench!
          $display("@@@Passed");
        
        $finish;
        

     end // initial begin

endmodule
