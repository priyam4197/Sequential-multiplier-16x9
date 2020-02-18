//16x1 multiplier generates partial product of 16 bit

module PPGen(MX,M_BIT,PPOUT);

input [15:0]MX; input M_BIT;
output [15:0]PPOUT;

reg [15:0]PPOUT;

always @(*)

begin
if (M_BIT == 0)
PPOUT = 0;
else
PPOUT = MX;
end

endmodule