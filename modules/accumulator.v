//Accumulator takes output from the adder and stores the MSB 17 bits of final answer
//LSB 8 bits are stored in a shift register

module Accumulator(IN,LD_ACC,CLR_ACC,ACC,D_OUT,CLK);

input [16:0]IN; 
input LD_ACC, CLR_ACC, CLK;
output D_OUT; 
output reg [16:0]ACC; //output reg[7:0]shiftReg;

always @(posedge CLK) begin
if (CLR_ACC) begin
ACC <= 17'd0; 
//shiftReg <= 8'b0;
end
else if (LD_ACC) begin 
ACC = IN;
end
end
assign D_OUT = ACC[0];
endmodule 
