module Regfile(
   input clk, 
   input we,		                   //sign to write
   input [4:0] ra1, ra2, wa,	   //two read address, one write address	   
   input [31:0] wd,			           //data to write
   output [31:0] rd1, rd2);	      //data readed
   reg [31:0] rf [0:31];      //regfile
	
	initial 
	begin
    rf[0] = 32'b0; // 0register
    rf[9] = 32'b00000000000000000000000000000010;   //2
    rf[11] = 32'b00000000000000000000000000000100;   //4
 
   end
	
	always @(posedge clk)		
		if(we) rf[wa] <= wd;	
	
	//2 read port
	assign rd1 = (ra1 != 0)? rf[ra1]:0;
	assign rd2 = (ra2 != 0)? rf[ra2]:0;
	
endmodule 

