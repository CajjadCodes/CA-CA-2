module Adder_32bit (A, B, sum);
input signed [31:0] A;
input signed [31:0] B;
output signed [31:0] sum;

	assign sum = A + B;
	
endmodule
