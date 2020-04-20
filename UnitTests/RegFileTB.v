module RegFileTB();

	reg clk = 0, rst = 0, RegWrite = 0;
	reg [4:0] ReadReg1, ReadReg2, WriteReg;
	reg [31:0] WriteData;
	wire [31:0] ReadData1, ReadData2;
	
	RegisterFile RF(
		.clk(clk), 
		.rst(rst), 
		.RegWrite(RegWrite), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
		);

	always #71 clk = ~clk;
	initial begin
		#300
		rst = 1;
		#300 
		rst = 0;
		#300 
		WriteReg = 6;
		#100
		WriteData = 912;
		#100
		RegWrite = 1;
		#200
		RegWrite = 0;
		#100
		ReadReg1 = 6;
		#400
		$stop;

	end

endmodule
