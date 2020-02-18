//TB for sequential multiplier

module TB_seq;

reg [15:0]in_Mx; 
reg [8:0]in_My; 
reg CLK;
reg RESET;
wire [24:0]Prod;

seq16x9 MULT(RESET,in_Mx,in_My,Prod,CLK);

initial begin
$monitor($time, " in_Mx = %b, in_My = %b, Prod = %h, CLK = %b", in_Mx,in_My,Prod,CLK );

in_Mx = 16'hffff; in_My = 9'h1ff; RESET = 1'b1;
//#100 in_Mx = 16'b1111101110101111; in_My = 9'b111101001;
end

initial begin
CLK = 0;
forever
#5 CLK = !CLK;
end

endmodule
