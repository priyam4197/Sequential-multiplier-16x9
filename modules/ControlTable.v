//ROM based design to store 6 bits of control signal and 4 bit next state

module ControlTable(PRSNTSTATE,NEXTSTATE,LOAD_MX,LOAD_MY,SHIFT_MY,CLEAR_ACC,LOAD_ACC,SHIFT_IN,CLK);

input [3:0]PRSNTSTATE; 
reg   [9:0]ControlSig; 
input CLK;
output LOAD_MX,LOAD_MY,SHIFT_MY,CLEAR_ACC,LOAD_ACC,SHIFT_IN;
output [3:0] NEXTSTATE;

always @(posedge CLK) begin
case(PRSNTSTATE)
4'b0000: ControlSig = 10'b1101000001;
4'b0001: ControlSig = 10'b0010110010;
4'b0010: ControlSig = 10'b0010110011;
4'b0011: ControlSig = 10'b0010110100;
4'b0100: ControlSig = 10'b0010110101;
4'b0101: ControlSig = 10'b0010110110;
4'b0110: ControlSig = 10'b0010110111;
4'b0111: ControlSig = 10'b0010111000;
4'b1000: ControlSig = 10'b0010111001;
4'b1001: ControlSig = 10'b0010111010;
4'b1010: ControlSig = 10'b0000001010;
default: ControlSig = 10'b0000000000;
endcase
end

assign NEXTSTATE = ControlSig[3:0];
 
//assign PRSNTSTATE = ControlSig[3:0];
assign LOAD_MX = ControlSig[9];
assign LOAD_MY = ControlSig[8];
assign SHIFT_MY = ControlSig[7];
assign CLEAR_ACC = ControlSig[6];
assign LOAD_ACC = ControlSig[5];
assign SHIFT_IN = ControlSig[4];

endmodule
