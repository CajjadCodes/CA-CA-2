module SignalGen(RT,addi,andi,lw,sw,j,jal,jr,beq,bne,RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,ALUOp,WDInp);
input RT;
input addi;
input andi;
input lw;
input sw;
input j;
input jal;
input jr;
input beq;
input bne;
output reg [1:0]RegDst;
output reg RegWrite;
output reg ALUSrc;
output reg MemRead;
output reg MemWrite;
output reg MemToReg;
output reg [1:0]ALUOp;
output reg WDInp;

	always@(RT or addi or andi or lw or sw or j or jal or jr or beq or bne)begin
		if(RT) {RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,ALUOp,WDInp}=10'b0110000100;
		else if(addi) {RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,ALUOp,WDInp}=10'b0011000000;
		else if(andi) {RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,ALUOp,WDInp}=10'b0011000110;
		else if(lw) {RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,ALUOp,WDInp}=10'b0011101000;
		else if(sw) {RegWrite,ALUSrc,MemRead,MemWrite,ALUOp}=6'b010100;
		else if(j) {RegWrite,MemRead,MemWrite}=3'b000;
		else if(jal) {RegDst,RegWrite,MemRead,MemWrite,WDInp}=6'b101001;
		else if(jr) {RegWrite,MemRead,MemWrite}=3'b000;
		else if(beq|bne) {RegWrite,ALUSrc,MemRead,MemWrite,ALUOp}=6'b000001;
	end
endmodule
