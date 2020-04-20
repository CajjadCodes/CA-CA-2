module InstMemTB();

	reg [31:0] addr;
	wire [31:0] inst;

	InstructionMemory IM(
		.address(addr),
		.instruction(inst)
		);

	initial begin
		#300
		addr = 0;
		#300
		addr = 4;
		#300
		addr = 12;
		#300
		$stop;
	end

endmodule
