module test;//testbench code.
  reg [15:0]in;//input
  reg reset;//for setting the initial password
  wire out;//This gives the output
  
  RSSS dut(.in(in),.reset(reset),.out(out)); // to bring the Main module on which we are testing different input values
  
  initial 
  begin
    reset<=1;
    in<=6969;
    #5
    reset<=0;
    in<=6969;
    #10
    if(out==0)
      begin
        $display("Lock Opened");
      end
    else
      begin
        $display("Wrong Password");
      end
  end
endmodule

//Main Code
module RSSS(in,reset,out);
input [15:0]in;
input reset;
output out;
wire [15:0]w1;
wire [15:0]w2;
take_in T1(reset,in,w1,w2);
compare C1(w1,w2,out);
endmodule


module take_in (reset,in , out1,out2);
input [15:0] in;
input reset;
reg control;
reg [15:0] mem;
output reg [15:0] out1 , out2;
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

module compare(inp1,inp2,outlock);
input [15:0]inp1;
input [15:0]inp2;
output reg outlock;
always @(*)
begin
	if(inp1==inp2)
	begin
		outlock<=0;
    end
    else
    begin
		outlock<=1;
	end
end
endmodule
