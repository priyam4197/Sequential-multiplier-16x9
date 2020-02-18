//sequencer points to next state based on present state

module sequencer(INAddr,CLK,RST,OUTAddr);

input [3:0]INAddr;	//next state from control logic
input CLK,RST;
output reg [3:0]OUTAddr;	//output is present state signal to be fed to control ROM 

always @(negedge CLK) 
  begin
    if (~RST) 
      begin		//RESET is active LOW
        OUTAddr = 4'b0000;
      end
    else
      begin
        OUTAddr = INAddr;
      end
  end

endmodule
