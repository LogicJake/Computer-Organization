module NPC(
   input [15:0] immi16,
   input br,zero,jump,
   input [25:0] target,
   input [31:0] pc,
   output [31:0] npc);
   
   wire [31:0] pc_plus_4,pc_br;
   wire [31:0] immi32;
   wire [31:0] pc_j;
   
   assign pc_plus_4 = pc + 4;
   assign pc_br = pc_plus_4 + 4*{{16{immi16[15]}}, immi16};
   assign pc_j = {pc[31:28],target[25:0],2'b00};
   
   mux3 MUX3(.d0(pc_plus_4), .d1(pc_br), .d2(pc_j), .s1(zero & br), .s2(jump), .y(npc) );
  
   
endmodule 