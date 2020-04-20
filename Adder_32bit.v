module Adder_32bit (A, B, sum, co);
input signed [31:0] A;
input signed [31:0] B;
output signed [31:0] sum;
output co;

	assign {co, sum} = A + B;
	
endmodule
