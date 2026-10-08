module bw2 (n1, n2, out);
    //Eh preciso que w1 >= w2
    parameter w1 = 8;
    parameter w2 = 3;

    input [w1-1:0] n1;
    input [w2-1:0] n2;
    output [w1+w2-1:0] out;
    wire [(w1+1)*w2-1:0] c, d;
    wire [w2-1:0] carrie;
    wire n;
    assign carrie[0] = 0;

    assign c[w2-2:0] = 0;
    assign c[w2-1] = 1;
    assign d[w2-2:0] = 0;

    genvar i, j, k, a;
    generate
        for(i = 0; i < w1-1; i = i+1)
        begin: linhas
            for(j = 0; j < w2-1; j = j+1)
            begin: colunas
                wc bloco(n1[i], n2[j], d[w2*i+j], c[w2*i+j], d[(i +1)*w2+j-1], c[(i+1)*w2+j]);
            end
            gc col(n1[i], n2[w2-1], (i == w1-w2)? 1'b1 : 1'b0, c[w2*i+w2-1], d[(i+1)*w2+w2-2], c[(i+1)*w2+w2-1]);
        end
        for(k = 0; k < w2-1; k = k+1)
        begin: linha_gc
            gc lin(n1[w1-1], n2[k], d[(w1-1)*w2+k], c[(w1-1)*w2+k], d[w1*w2+k-1], c[w1*w2+k]);
            fa al(c[w1*w2+k], d[w1*w2+k], carrie[k], out[w2+k], carrie[k+1]);
        end
        for (a = 0; a < w1; a = a+1)
        begin: coluna_out
            assign out[a] = d[w2*a+w2-1];
        end
    endgenerate

    wc ew(n1[w1-1], n2[w2-1], c[w2*w1-1], 1'b0, d[(w1+1)*w2-2], c[(w1+1)*w2-1]);
    fa af(c[(w1+1)*w2-1], 1'b1, carrie[w2-1], out[w1+w2-1], n);

endmodule