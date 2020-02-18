module TB;

reg [16:0]Sum; reg CLK, load_Acc, clear_Acc;
wire D_out; wire [16:0]Acc;

Accumulator ACC(Sum,load_Acc,clear_Acc,Acc,D_out,CLK);
  
  initial 
    begin
      $monitor($time, " Sum=%b, load_Acc=%b, clear_Acc=%b, Acc=%b, D_out=%b, CLK=%b", Sum,load_Acc,clear_Acc,Acc,D_out,CLK);
        #15 Sum = 17'b11001100110101011; load_Acc = 0; clear_Acc = 1;
        #10 Sum = 17'b11111000010101000; load_Acc = 1; clear_Acc = 0;
        #10 Sum = 17'b01010101001010111; load_Acc = 1; clear_Acc = 0; 
    end
  initial 
    begin
      CLK = 0;
      forever
        #5 CLK = !CLK;
    end
    
endmodule
