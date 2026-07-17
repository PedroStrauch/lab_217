module MAC_SM (clk, rst, num1, num2, s);
	parameter W = 4;
	input clk, rst;
	input [W-1:0] num1, num2;
	output wire [(2*W)-1:0] s;
	reg [(2*W)-1:0] ac;
	wire [(2*W)-1:0] soma, mul;

	mult_sm m1(num1, num2, mul);
	soma_sm s1(mul, s, soma);
	assign s = ac;
	
	always @ (posedge clk or posedge rst)
	begin
		if(rst)
			ac <= 0;
		else
			ac <= soma;
	end 
endmodule 