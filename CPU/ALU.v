module ALU(op,A,B,result,zero);
    input[2:0] op;
    input[31:0] A,B;
    output[31:0] result;
    output zero;
    
    reg[31:0] result;
    assign zero = (result?0:1);
    always@(op or A or B) begin
        if(op==3'b000)   result = A + B;
        else if(op==3'b001)   result = A - B;
        else if(op==3'b111)   result = ((A<B)?1:0);
        else if(op==3'b010)   result = A & B;
        else if(op==3'b011)   result = A | B;
        else if(op==3'b100)   result = ~A;
        else                  result = 8'b0;
        
   end
endmodule
