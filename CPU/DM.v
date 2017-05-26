module dm_4k(addr,din,we,clk,dout);
   input [11:2] addr;
   input [31:0] din;
   input clk,we;
   output [31:0] dout;
   
   reg [31:0] dm[1023:0] ;
   
   //initial 
   //begin 
   //dm[2] = 32'b00000000000000000000000000000101;
   //end
   
   assign dout = dm[addr[11:2]];
   
   always @(posedge clk)
     if(we)
        dm[addr[11:2]] <= din;
endmodule
   
