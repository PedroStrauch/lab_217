module mac(clk, rst, en, n1, n2, out, cp, cn);
    
    parameter w = 8;

    input clk, rst, en;
    input [w-1:0] n1, n2;
    output [2*w-1:0] out;
    output cp, cn;

    wire [2*w-3:0] soma_p, soma_n;
    reg [2*w-3:0] rp, rn;
    wire neg;

    dadda_s_7x7bits mp(n1[w-2:0], n2[w-2:0], rp, soma_p, cp);
    dadda_s_7x7bits mn(n1[w-2:0], n2[w-2:0], rn, soma_n, cn);

    assign neg = n1[w-1]^n2[w-1];

    always @(posedge clk or posedge rst) begin
        if(rst)
        begin
            rp <= 0;
            rn <= 0;
        end
        if(en & neg)
            rn <= soma_n;
        if(en & ~neg)
            rp <= soma_p;
    end

    assign out = rp - rn;
endmodule