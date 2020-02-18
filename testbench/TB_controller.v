//test bench for control register

module TB_controller;

reg CLK, RESET; 
wire [3:0]PRSNTSTATE, NEXTSTATE; 
wire load_Mx,load_My,shift_My,clr_Acc,load_Acc,shift_in;

ControlTable CT(PRSNTSTATE,NEXTSTATE,load_Mx,load_My,shift_My,clr_Acc,load_Acc,shift_in,CLK);
sequencer SEQ(NEXTSTATE,CLK,RESET,PRSNTSTATE);
  initial 
    begin
      $monitor ($time,"CLK=%b, load_Mx=%b, load_My=%b, shift_My=%b, clr_Acc=%b, load_Acc=%b, shift_in=%b", CLK,load_Mx,load_My,shift_My,clr_Acc,load_Acc,shift_in);
      RESET = 1'b1;
    end
  
  initial 
    begin
      CLK = 0;
      forever
        #5 CLK = !CLK;
    end
endmodule
