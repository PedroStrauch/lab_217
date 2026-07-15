module fs(a, b, cin, s, cout);
	input a, b, cin;
	output s, cout;
	
	assign s = a^b^cin;
	assign cout = (cout&b)|(cout&~a)|(b&~a);
endmodule

module soma_sm(num1, num2, s);
	parameter W = 7;
	
	input [W-1:0] num1, num2;
	output [W:0] s;
	wire [W:0] sinaisIguais, sinaisDiferentes; 
	wire signed [W-1:0] subtracao;

	
	assign subtracao = {1'b0, num1[W-2:0]} - {1'b0, num2[W-2:0]};
	assign sinaisDiferentes = {subtracao[W-1]^num1[W-1], subtracao[W-1] ? (~subtracao)+1'b1 : subtracao};
	assign sinaisIguais = {num1[W-1], {1'b0, num1[W-2:0]} + {1'b0, num2[W-2:0]}};
	
	assign s = (num1[W-1]^num2[W-1]) ? sinaisIguais : sinaisDiferentes;

endmodule

module mult_sm(num1, num2, s);
	parameter W = 4;
	
	input [W-1:0] num1, num2;
	output [(2*W)-1:0] s;
	wire [(2*W)-2:0] mul;
	
	assign mul = num1[W-2:0] * num2[W-2:0];
	
	assign s = {num1[W-1]^num2[W-1], mul};
endmodule
