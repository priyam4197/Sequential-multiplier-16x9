//to load Mx and My

module loadIn(IN_MX,IN_MY,LOAD_MX,LOAD_MY,CLK,mx,my,MY_BIT,SFT_MY);

input CLK;
input LOAD_MX,LOAD_MY,SFT_MY;
input wire [15:0]IN_MX; 
input wire [8:0]IN_MY;

output reg [15:0]mx;
output reg [8:0]my;
output MY_BIT;

wire SFT_MY;

always @(posedge CLK) 
  begin
    if (LOAD_MX) 
      begin
        mx <= IN_MX; 
      end
    if (LOAD_MY)
      begin
        my <= IN_MY;
      end
    else 
      if(SFT_MY) 
        begin
          my <= (my>>1);
        end
  end
  assign MY_BIT = my[0];

endmodule
