module mux2
   (input [31:0] d0, d1,	
	input s,		
	output [31:0] y);	

	assign y = s ? d1 : d0;

endmodule 

module mux2_5
   (input [4:0] d0, d1,	
	input s,		
	output [4:0] y);	

	assign y = s ? d1 : d0;
endmodule

module mux3
   (input [31:0] d0, d1, d2,
	input s1,s2,		
	output [31:0] y);	

   wire [31:0]tempy;
	mux2 FiRST(d0,d1,s1,tempy);
   mux2 SECOND(tempy,d2,s2,y);
endmodule 