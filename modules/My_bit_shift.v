//shift multiplier My to use in 16x1 multiplier

module ShiftMy(IN_MY,LD_MY,SFT_MY,CLK,MY_BIT);

input wire [8:0]IN_MY;  
input CLK; 
input LD_MY,SFT_MY; 

output MY_BIT;

reg [8:0]MY;

  always @(posedge CLK) 
    begin
      if (LD_MY) 
        begin
          MY = IN_MY; 
        end	
      else 
        if(SFT_MY) 
          begin
            MY <= MY>>1;
          end
      else 
        MY <= MY;
        //MY_BIT <= MY[0];
    end

assign MY_BIT= MY[0];

endmodule
