module testbench();
    reg clk;
    reg reset;
    
    mips MIPS(clk,reset);
    
    
    initial begin
        clk = 0;
        reset = 1;
        #100;
            clk <= !clk;
        #100;
           reset <= 0;
        end
        
    always
      begin
          #100 clk = !clk;
      end
       
endmodule


