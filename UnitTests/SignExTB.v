module SignExTB();

	reg [15:0] inp;
	wire [31:0] out;
	
	SignExtend SEX(
		.inp(inp),
		.out(out)
		);
	
	initial begin
		#300
		inp = 16'b0101010101010101;
		#300
		inp = 16'b1000111000000111;
		#400
		$stop;
	end

endmodule
