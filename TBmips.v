module TBmips();

	reg clk = 0, rst = 0;
	
	MIPS mips(
		.clk(clk),
		.rst(rst)
		);
	
	always #300 clk = ~clk;
	initial begin
		#100
		rst = 1;
		#300
		rst = 0;
	
		#4000
		$stop;
	end

endmodule
