module PCSrcGen(j,jal,jr,beq,bne,zero,PCSrc);
input j;
input jal;
input jr;
input beq;
input bne;
input zero;
output [1:0]PCSrc;
	wire MSB,LSB;
	assign MSB=j|jal|jr;
	assign LSB=jr|(beq&zero)|(bne&~zero);
	assign PCSrc={MSB,LSB};
endmodule
