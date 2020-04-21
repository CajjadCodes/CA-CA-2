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

	always@(RT or addi or andi or lw or sw or j or jal or jr or beq or bne) begin
		ALUOp = 2'b00; RegDst = 2'b00;
		{WDInp, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg} = 6'b0;
		if (RT) begin
			RegDst = 2'b01; RegWrite = 1'b1;
			ALUOp = 2'b10;
		end
		else if (addi) begin
			{RegWrite, ALUSrc} = 2'b11;
		end
		else if (andi) begin
			{RegWrite, ALUSrc} = 2'b11;
			ALUOp = 2'b11;
		end
		else if (lw) begin
			{RegWrite, ALUSrc, MemRead, MemToReg} = 4'b1111;
		end
		else if (sw) begin
			{ALUSrc, MemWrite} = 2'b11;
		end
		else if (beq | bne) begin
			ALUOp = 2'b01;
		end
		else if (jal) begin
			RegDst = 2'b10;
			{RegWrite, WDInp} = 2'b11;
		end
		//No change for "j" and "jr"
	end
endmodule
