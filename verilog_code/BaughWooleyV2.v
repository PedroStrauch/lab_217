module bw2 (n1, n2, out);
    //Eh preciso que w1>= w2
    parameter w1 = 8;
    parameter w2 = 7;

    input [w1-1:0] n1;
    input [w2-1:0] n2;
    output [w1+w2-1:0] out;

    genvar i, j, k;
    generate
        for(i = 0; i < w1; i = i+1)
        begin: linhas
            for(j = 0; j < w2-1; j = j+1)
            begin: colunas
                wc bloco(n1[i], n2[j], , , , );
            end
            gc col(n1[i], n2[w2-1], );
        end
        for(k = 0; k < w2-1; k = k+1)
        begin: linha_gc
            gc lin(n1[w1-1], n2[k], , , , );
        end
    endgenerate

endmodule