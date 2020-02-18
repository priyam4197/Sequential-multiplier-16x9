//**********16x9 multiplier using sequential blocks**********//

module seq16x9(RESET,in_Mx,in_My,Prod,CLK);

//Multiplier and multiplicand inputs to be stored in Mx and My registers
input [15:0]in_Mx; 
input [8:0]in_My; 
input RESET;
input CLK;			
wire [15:0]Mx; 
wire [8:0]My;

//all control signals
wire load_Mx,load_My,shift_My,clear_Acc,load_Acc,shift_In;	

//intermediate wires
wire [3:0]PrsntState; 
wire [3:0]NextState;
wire [7:0]shiftReg; 
wire [15:0]PP; 
wire [16:0]Acc; 
wire [16:0]Sum; 
wire My_bit, D_out;	

//25 bits final product output
output wire [24:0]Prod;

//Call control table module to initialte all control signals
ControlTable CT(PrsntState,NextState,load_Mx,load_My,shift_My,clear_Acc,load_Acc,shift_In,CLK);
sequencer SEQ(NextState,CLK,RESET,PrsntState);


loadIn INPUT(in_Mx,in_My,load_Mx,load_My,CLK,Mx,My,My_bit,shift_My);
//ShiftMy SHIFT_My(My,load_My,shift_My,CLK,My_bit);
PPGen PPG(Mx,My_bit,PP);
Adder ADD(PP,Acc[16:1],Sum);
Accumulator ACC(Sum,load_Acc,clear_Acc,Acc,D_out,CLK);
ShiftReg SHIFT_In(shiftReg,shift_In,D_out,CLK,clear_Acc);

assign Prod = {Acc,shiftReg};

endmodule 
