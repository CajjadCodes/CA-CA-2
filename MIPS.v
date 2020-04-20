module MIPS(clk,rst);
input clk;
input rst;
	wire opc,func,zero,RegDst,RegWrite,ALUSrc,MemRead,MemWrite,MemToReg,WDInp,PCSrc;
	Datapath DP(
		.clk(clk),
		.rst(rst),
		.RegDst(RegDst),
		.WDInp(WDInp),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.ALUOperation(ALUOperation),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.MemtoReg(MemToReg),
		.PCSRc(PCSrc),
		.opc(opc),
		.func(func),
		.zero(zero)
		);
	Controller C(
		.opc(opc),
		.func(func),
		.zero(zero),
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.MemToReg(MemToReg),
		.WDInp(WDInp),
		.PCSrc(PCSrc)
		);
endmodule
