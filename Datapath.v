module Datapath(clk, rst, RegDst, WDInp, RegWrite, ALUSrc,
		 ALUOperation, MemRead, MemWrite, MemToReg, PCSrc, opc, func, zero);
input clk;
input rst;
input [1:0] RegDst;
input WDInp;
input RegWrite;
input ALUSrc;
input [2:0] ALUOperation;
input MemRead;
input MemWrite;
input MemToReg;
input [1:0] PCSrc;
output [5:0] opc;
output [5:0] func;
output zero;

	wire [31:0] PCinp, PCout;
	Reg32 PC(
		.clk(clk),
		.rst(rst),
		.d(PCinp),
		.q(PCout)
		);
	
	wire [31:0] instruction;
	InstructionMemory IM(
		.address(PCout),
		.instruction(instruction)
		);
	assign opc = instruction[31:26];
	assign func = instruction[5:0];

	wire [4:0] RegDstMuxOut;
	Mux4to1_5bit RegDstMux(
		.inp0(instruction[20:16]),
		.inp1(instruction[15:11]),
		.inp2(5'b11111),
		.sel(RegDst),
		.out(RegDstMuxOut)
		);

	wire [31:0] WDInpMuxOut;
	wire [31:0] MemToRegMuxOut;
	wire [31:0] PC_upper;
	Mux2to1_32bit WDInpMux(
		.inp0(MemToRegMuxOut),
		.inp1(PC_upper),
		.sel(WDInp),
		.out(WDInpMuxOut)
		);

	wire [31:0] ReadData1, ReadData2;
	RegisterFile RF(
		.clk(clk),
		.rst(rst),
		.RegWrite(RegWrite),
		.ReadReg1(instruction[25:21]),
		.ReadReg2(instruction[20:16]),
		.WriteReg(RegDstMuxOut),
		.WriteData(WDInpMuxOut),
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)
		);

	wire [31:0] SignExtendOut;
	SignExtend SEX(
		.inp(instruction[15:0]),
		.out(SignExtendOut)
		);

	wire [31:0] ALUSrcMuxOut;
	Mux2to1_32bit ALUSrcMux(
		.inp0(ReadData2),
		.inp1(SignExtendOut),
		.sel(ALUSrc),
		.out(ALUSrcMuxOut)
		);

	wire [31:0] ALUresult;
	ALU alu(
		.A(ReadData1),
		.B(ALUSrcMuxOut),
		.ALUOperation(ALUOperation),
		.res(ALUresult),
		.zero(zero)
		);

	wire [31:0] DataMemOut;
	DataMemory DM(
		.clk(clk),
		.address(ALUresult),
		.WriteData(ReadData2),
		.ReadData(DataMemOut),
		.MemRead(MemRead),
		.MemWrite(MemWrite)
		);
	
	Mux2to1_32bit MemToRegMux(
		.inp0(ALUresult),
		.inp1(DataMemOut),
		.sel(MemToReg),
		.out(MemToRegMuxOut)
		);

	Adder_32bit adder1(
		.A(4),
		.B(PCout),
		.sum(PC_upper)
		);

	wire [31:0] SignExShLout;
	ShL2_32bit shl2(
		.inp(SignExtendOut),
		.out(SignExShLout)
		);

	wire [31:0] PCSrcMuxInp1;
	Adder_32bit adder2(
		.A(PC_upper),
		.B(SignExShLout),
		.sum(PCSrcMuxInp1)
		);

	Mux4to1_32bit PCSrcMux(
		.inp0(PC_upper),
		.inp1(PCSrcMuxInp1),
		.inp2({PCout[31:28], instruction[25:0], 2'b00}),
		.inp3(ReadData1),
		.sel(PCSrc),
		.out(PCinp)
		);
	
endmodule 
