module PC #(parameter WIDTH = 32)
   (input ena, clk, rst,                
   input [WIDTH-1:0] data,                
   output reg [WIDTH-1:0] out);

always @(posedge clk)     
   if(rst)         
		out <= 32'h0000_3000;      
	else if (ena)
		out <= data;

endmodule

