module DataMemory (clk, MemRead, MemWrite, address, WriteData, ReadData);
input clk;
input MemRead;
input MemWrite;
input [31:0] address;
input [31:0] WriteData;
output [31:0] ReadData;

	reg [31:0] DataMem [0:8192]; //64 KB - 8 KW

	assign ReadData = MemRead? DataMem[address[31:2]]: 32'bz;
	
	always @(posedge clk) begin
		if (MemWrite) 
			DataMem[address[31:2]] <=  WriteData;
	end

	initial begin 
		$readmemb("Mem.data", DataMem);
	end
endmodule 