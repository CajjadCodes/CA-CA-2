module MIPS(clk,rst);
input clk;
input rst;
	
	wire [1:0] RegDst, PCSrc;
	wire [2:0] ALUOperation;
	wire [5:0] opc, func;
	wire WDInp, RegWrite, ALUSrc;
	wire MemRead, MemWrite, MemToReg, zero;
	
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
		.MemToReg(MemToReg),
		.PCSrc(PCSrc),
		.opc(opc),
		.func(func),
		.zero(zero)
		);
	Controller CU(
		.opc(opc),
		.func(func),
		.zero(zero),
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.ALUOperation(ALUOperation),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.MemToReg(MemToReg),
		.WDInp(WDInp),
		.PCSrc(PCSrc)
		);
endmodule
