//Adds result of partial product to accumulator value

module Adder(IN1,IN2,SUM);

input [15:0]IN1; 
input[15:0]IN2;
output reg [16:0]SUM;
//reg [14:0]w;
//integer i;

always @(*) 
  begin
/*
    for (i= 0; i<=14; i= i+1) 
      begin
        {w[i],Sum[i]} = PP[i] + Acc[i];		//bit by bit behavioural? use for loop
      end
    {Sum[16],Sum[15]} = PP[15]+Acc[15];
*/
    SUM = IN1+IN2;
  end

endmodule
