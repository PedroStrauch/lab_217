module soma_sm(num1, num2, s);
	parameter W = 8;
	
	input [W-1:0] num1, num2;
	output [W:0] s;
	wire [W:0] sinaisIguais, sinaisDiferentes; 
	wire signed [W-1:0] subtracao;

	
	assign subtracao = {1'b0, num1[W-2:0]} - {1'b0, num2[W-2:0]};
	assign sinaisDiferentes = {subtracao[W-1]^num1[W-1], subtracao[W-1] ? (~subtracao)+1'b1 : subtracao};
	assign sinaisIguais = {num1[W-1], {1'b0, num1[W-2:0]} + {1'b0, num2[W-2:0]}};
	
	assign s = (num1[W-1]^num2[W-1]) ? sinaisDiferentes : sinaisIguais;

endmodule