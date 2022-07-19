module universalShiftRegisterTb;
  wire [3:0] outp;
  reg clk, rst;
  reg [1:0] mode;
  reg [3:0] inp;
  
  universalShiftRegister jusr(outp, clk, rst, mode, inp);
  
  initial
  begin
    clk =0; mode = 2'b00; inp = 4'b0000;
    rst = 1; #10; rst = 0; #10;
    
    $display("RSLT\tD == DOUT");
    // Right Shift mode
    mode = 2'b00; rst = 1; #10; rst = 0; #10;
    mode = 2'b01; inp = 4'b0011; #10;
    if ( outp === 4'b1000 ) 
      $display("PASS\t%p is %p with %p", inp, mode, outp);
    else
      $display("FAIL\t%p is %p with %p", inp, mode, outp);
    MODE = 2'b01; DATAIN = 4'b0011; #10;
    if ( DATAOUT === 4'b1100 ) 
      $display("PASS\t%p is %p with %p",inp, mode, outp);
    else
      $display("FAIL\t%p is %p with %p", inp, mode, outp);
    
    
    //  Left Shift mode
    MODE = 2'b00; reset = 1; #10; reset = 0; #10;
    MODE = 2'b10; DATAIN = 4'b0111; #10;
    if ( DATAOUT === 4'b0001 ) 
      $display("PASS\t%p is %p with %p",inp, mode, outp);
    else
      $display("FAIL\t%p is %p with %p", inp, mode, outp);
    MODE = 2'b10; DATAIN = 4'b0111; #10;
    if ( DATAOUT === 4'b0011 ) 
      $display("PASS\t%p is %p with %p", inp, mode, outp);
    else
      $display("FAIL\t%p is %p with %p", inp, mode, outp);


    // parallel load mode
    MODE = 2'b00; reset = 1; #10; reset = 0; #10;
    MODE = 2'b11; DATAIN = 4'b1010; #10;
    if ( DATAOUT === 4'b1010 )
      $display("PASS\t%p is %p with %p", inp, mode, outp);
    else
      $display("FAIL\t%p is %p with %p", inp, mode, outp);

    #20;
    $finish;
  end
  
    
  

  
  always #5 clock = ~clock;
  
endmodule
