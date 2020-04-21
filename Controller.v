module Controller(opc,func,zero,RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,WDInp,PCSrc,ALUOperation);
input [5:0]opc;
input [5:0]func;
input zero;
output [1:0]RegDst;
output RegWrite;
output ALUSrc;
output MemRead;
output MemWrite;
output MemToReg;
output WDInp;
output [1:0]PCSrc;
output [2:0]ALUOperation;
	
	wire RT,addi,andi,lw,sw,j,jal,jr,beq,bne;
	OpcDcd OD(
		.opc(opc),
		.RT(RT),
		.addi(addi),
		.andi(andi),
		.lw(lw),
		.sw(sw),
		.j(j),
		.jal(jal),
		.jr(jr),
		.beq(beq),
		.bne(bne)
		);
	wire [1:0]ALUOp;
	SignalGen SG(
		.RT(RT),
		.addi(addi),
		.andi(andi),
		.lw(lw),
		.sw(sw),
		.j(j),
		.jal(jal),
		.jr(jr),
		.beq(beq),
		.bne(bne),
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.MemToReg(MemToReg),
		.ALUOp(ALUOp),
		.WDInp(WDInp)
		);
	ALUControl AC(
		.ALUOp(ALUOp),
		.func(func),
		.ALUOperation(ALUOperation)
		);
	PCSrcGen PG(
		.j(j),
		.jal(jal),
		.jr(jr),
		.beq(beq),
		.bne(bne),
		.zero(zero),
		.PCSrc(PCSrc)
		);
endmodule
