module mult_sm(n1, n2, s);
	parameter w = 8;
	
	input [w-1:0] n1, n2;
	output [(2*w)-1:0] s;
	wire [(2*w)-3:0] mul;
	
	dadda_7bits m(n1[w-2:0], n2[w-2:0], mul);
	assign s = {n1[w-1]^n2[w-1],1'b0, mul};
endmodule
