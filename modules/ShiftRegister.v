//shift register to store lower bits of final product

module ShiftReg(SHIFTREG,SFT_IN,D_OUT,CLK,CLR_ACC);

input CLK; 
input SFT_IN, D_OUT,CLR_ACC; 
output reg [7:0]SHIFTREG;

always @(posedge CLK)
begin
if (CLR_ACC) begin
SHIFTREG = 8'd0;
end
else if (SFT_IN) begin
SHIFTREG = {D_OUT,SHIFTREG[7:1]};
end
end

endmodule
