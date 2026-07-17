module mult_sm(num1, num2, s);
	parameter W = 4;
	
	input [W-1:0] num1, num2;
	output [(2*W)-1:0] s;
	wire [(2*W)-2:0] mul;
	
	assign mul = num1[W-2:0] * num2[W-2:0];
	
	assign s = {num1[W-1]^num2[W-1], mul};
endmodule
