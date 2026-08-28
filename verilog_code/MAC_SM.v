module MAC_SM (clk, rst, n1, n2, out);
	parameter W = 4;
	input clk, rst;
	input [W-1:0] n1, n2;
	output wire [(2*W)-1:0] out;
	reg [(2*W)-1:0] ac;
	wire [(2*W)-1:0] soma, mul;

	mult_sm m1(n1, n2, mul);
	soma_sm s1(mul, out, soma);
	assign out = ac;
	
	always @ (posedge clk or posedge rst)
	begin
		if(rst)
			ac <= 0;
		else
			ac <= soma;
	end 
endmodule 