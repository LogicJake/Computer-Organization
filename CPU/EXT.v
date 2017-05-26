module Signext 
	#(parameter WIDTH= 16)
	(input [WIDTH-1:0] a, 
	input en,
	output reg[31:0] y);
	
	always @(a or en) begin
	    if(en) assign y = {{32-WIDTH{a[WIDTH-1]}}, a};
	end
	
endmodule

