module universalShiftRegister(DATAOUT, clock, reset, MODE, DATAIN);
  output reg [3:0] outp;
  input clk, rst;
  input [1:0] mode;
  input [3:0] inp;
  
  always @(posedge clk)
  begin
    if(rst)
      outp <= 0;
    else
      begin
        case(mode)
          2'b00 : outp <= outp;      
          2'b01 : outp <= {inp[0], outp[3:1]};
          2'b10 : outp <= {outp[2:0], inp[0]}
          2'b11 : outp <= inp;      
        endcase
      end
  end
  
endmodule
