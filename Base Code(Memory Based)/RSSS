//Main Module
module RSSS(in,reset,out);
input [15:0]in;
input reset;
output out;
wire [15:0]w1;
wire [15:0]w2;
take_in T1(reset,in,w1,w2); //Input Taken Here
compare C1(w1,w2,out); //2 inputs are compared after Storing in memory addresses.
endmodule
//After this Module Instantiation is done for Input and comparison purpose.


//Input Module and value is stored at Memory address(reg mem)
module take_in (reset,in , out1,out2);
input [15:0] in;
input reset;
reg control;
reg [15:0] mem; //memory location
output reg [15:0] out1 , out2;//value passed on to two different outputs for comparison
always @ (*)
	begin
		if(reset)
			begin
				mem <= in;
				out1<= mem;
			end
		else
			begin
				mem <= in;
				out2<=mem;
			end
			
	end
	
endmodule
//Input Processed.

//Compare module to compare the two Outputs of the input module.
module compare(inp1,inp2,outlock);
input [15:0]inp1;
input [15:0]inp2;
output reg outlock;
always @(*)
begin
	if(inp1==inp2)
	begin
		outlock<=0; //In order to open the lock
    end
    else
    begin
		outlock<=1; //for wrong password input the Lock stays locked.
	end
end
endmodule
