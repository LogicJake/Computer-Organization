`include "RegisterFile.v"
`include "IM.v"
`include "EXT.v"
`include "NPC.v"
`include "DM.v"
`include "MUX.v"
`include "ALU.v"
`include "PC.v"

module mips(clk,reset);
    input clk,reset;
    
    reg PcW;
    wire zero,jump,branch,RegDst,ALUsrc,MemtoReg,RegWr,MemWr,ExtOp;
    wire [31:0] outpc,npc,ins,writeData,immi32,ReadData1,ReadData2,dataCh,ALUresult,memout;
    wire [15:0] immi16;
    wire [25:0] target;
    wire [2:0] ALUop;
    wire [4:0] RegAddr;
    
    initial begin
       PcW = 1;
    end

    PC pc(PcW,clk,reset,npc,outpc);
    im_4k IM(outpc[11:2],ins);         //read instruct
    //output control sign
    ControlUnit control(ins[31:26],ins[5:0],branch,jump,RegDst,ALUsrc,ALUop,MemtoReg,RegWr,MemWr,ExtOp);
    NPC Npc(ins[15:0],branch,zero,jump,ins[25:0],outpc,npc);
    mux2_5 Mux2_5(ins[20:16],ins[15:11],RegDst,RegAddr);
    mux2 Mux2(ReadData2,immi32,ALUsrc,dataCh);      
    ALU alu(ALUop,ReadData1,dataCh,ALUresult,zero);
    Regfile regfile(clk,RegWr,ins[25:21],ins[20:16],RegAddr,writeData,ReadData1,ReadData2);
    Signext signExtend(ins[15:0],ExtOp,immi32);
    mux2 Mux2_(ALUresult,memout,MemtoReg,writeData);
    dm_4k DM(ALUresult[9:0],ReadData2,MemWr,clk,memout);
    
endmodule
