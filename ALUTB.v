module ALUTB();
	reg signed [31:0] A, B;
	reg [2:0] ALUOperation;
	wire signed [31:0] res;
	wire zero;

	ALU alu(
		.A(A),
		.B(B),
		.ALUOperation(ALUOperation),
		.res(res),
		.zero(zero)
		);

	initial begin
		#300
		A = 5;
		B = 2;
		#200
		ALUOperation = 3'b010; //Add

		#300
		A = 7;
		B = -3;
		#300
		ALUOperation = 3'b011; //Sub

		#300
		A = 32'b00000000011111111111111111111111;
		B = 32'b10000111100000000111110000011100;
		#200
		ALUOperation = 3'b000; //And

		#300
		A = 9;
		B = 9;
		#200
		ALUOperation = 3'b011; //Sub

		#300 
		A = 2;
		B = 4;
		ALUOperation = 3'b111; //Slt
		#200
		A = -6;
		B = 2;
		#200
		A = 14;
		B = 2;
		
		#400;
		$stop;
	end

endmodule
