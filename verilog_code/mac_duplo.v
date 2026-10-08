module mac(clk, en, rst, n1, n2, s);
    parameter w1 = 8;
    parameter w2 = 8;
    parameter w3 = 20;

    input clk, rst, en;
    input [w1-1:0] n1;
    input [w2-1:0] n2;
    reg [w3-1:0] rp, rn;
    wire [w1+w2-3:0] mult;
    wire [w3-1:0] soma_p, soma_n;
    output [w3-1:0] s;

    assign soma_p = rp + {6'b0, mult};
    assign soma_n = rn + {6'b0, mult};
    
    dadda_7x7bits m(n1[w2-2:0], n2[w2-2:0], mult);
    always @(posedge clk or posedge rst) begin
        if(rst)
        begin
            rp <= 0;
            rn <= 0;
        end
        if(en & n1[w1-1]^n2[w2-1])
            rn <= soma_n;
        if(en & ~n1[w1-1]^n2[w2-1])
            rp <= soma_p;
    end

    assign s = rp - rn;
endmodule