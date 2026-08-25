module mac(clk, en, rst, n1, n2, s);
    parameter w1 = 8;
    parameter w2 = 8;

    input clk, rst, en;
    input [w1-1:0] n1;
    input [w2-1:0] n2;
    reg [w1+w2-1:0] rp, rn;
    wire [w1+w2-1:0] mult, soma_p, soma_n;
    output [w1+w2-1:0] s;

    assign soma_p = rp + mult;
    assign soma_n = rn + {1'b0, mult[w1+w2-2:0]};
    
    mult_sm m(n1, n2, mult);
    always @(posedge clk, posedge rst) begin
        if(rst)
        begin
            rp <= 0;
            rn <= 0;
        end
        if(en & mult[w1+w2-1])
            rn <= soma_n;
        if(en & ~mult[w1+w2-1])
            rp <= soma_p;
    end

    assign s = rp - rn;
endmodule