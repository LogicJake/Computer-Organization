module ControlUnit(op,func,Branch,Jump,RegDst,ALUsrc,ALUop,MemtoReg,RegWr,MemWr,ExtOp);
    input [5:0] op,func;
    output reg Branch,Jump,RegDst,ALUsrc,MemtoReg,RegWr,MemWr,ExtOp;
    output reg [2:0] ALUop;
    
    initial 
    begin
    Branch = 0;
    Jump = 0;
    RegDst = 0;   
    ALUsrc = 0;    
    ALUop = 3'b000;
    MemtoReg = 0;
    RegWr = 0;
    MemWr = 0;
    ExtOp = 0;  
    end
    
    
    always@(op or func)begin
        case(op)
            6'b000000:
            begin
              Branch = 0;
              Jump = 0;
              RegDst = 1;   //register Rd
              ALUsrc = 0;    
              if(func == 6'b100000)        ALUop = 3'b000;   //add
              else if(func == 6'b100010)   ALUop = 3'b001;   //sub
              else if(func == 6'b101010)   ALUop = 3'b111;   //slt
              else if(func == 6'b100100)   ALUop = 3'b010;   //and
              else if(func == 6'b100101)   ALUop = 3'b011;   //or
              else                         ALUop = 3'b110;    //the rest 
              MemtoReg = 0;
              RegWr = 1;
              MemWr = 0;
              ExtOp = 0;
            end
            
            6'b100011:   //lw
            begin
              Branch = 0;
              Jump = 0;
              RegDst = 0;   //register Rd
              ALUsrc = 1;    
              ALUop = 3'b000;
              MemtoReg = 1;
              RegWr = 1;
              MemWr = 0;
              ExtOp = 1;  
            end
            
            6'b101011:   //sw
            begin
              Branch = 0;
              Jump = 0;
              RegDst = 0;   
              ALUsrc = 1;    
              ALUop = 3'b000;
              MemtoReg = 0;
              RegWr = 0;
              MemWr = 1;
              ExtOp = 1;  
            end
            
            6'b000100:      //beq
            begin
              Branch = 1;
              Jump = 0;
              RegDst = 0;   
              ALUsrc = 0;    
              ALUop = 3'b001;
              MemtoReg = 0;
              RegWr = 0;
              MemWr = 0;
              ExtOp = 0;  
            end
            
            6'b000010:   //jump
            begin
              Branch = 0;
              Jump = 1;
              RegDst = 0;   
              ALUsrc = 0;    
              ALUop = 3'b000;
              MemtoReg = 0;
              RegWr = 0;
              MemWr = 0;
              ExtOp = 0;  
            end
       endcase
    end  
endmodule
