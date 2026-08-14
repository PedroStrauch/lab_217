module bw(n1, n2, out);
    parameter w = 8;

    input [w-1:0] n1, n2;
    output [2*w-1:0] out;
    wire [w*(w+1)-1:0] c, d;
    wire [w-1:0] carrie;
    wire n;
    assign carrie[0] = 1;
    
    assign c[w-1:0] = 0;
    assign d[w-2:0] = 0;

    genvar i, j, k, a;
    generate
        for (i = 0; i < w-1; i = i+1)
        begin: bloco_wc
            for(j = 0; j < w-1; j = j+1)
            begin: linha_wc
                wc b(n1[i], n2[j], d[i*w+j], c[i*w+j], d[(i+1)*w+j-1], c[(i+1)*w+j]);
            end
            gc eg(n1[i], n2[w-1], c[i*w+w-1], 1'b0, d[(i+1)*w+w-2], c[(i+1)*w+w-1]);
        end
        for (k = 0; k < w-1; k = k+1)
        begin: linha_gc
            gc l(n1[w-1], n2[k], d[(w-1)*w+k], c[(w-1)*w+k], d[w*w+k-1], c[w*w+k]);
            fa al(c[w*w+k], d[w*w+k], carrie[k], out[w+k], carrie[k+1]);
        end
        for (a = 0; a < w; a = a+1)
        begin: coluna_out
            assign out[a] = d[w*a+w-1];
        end
    endgenerate

    wc ew(n1[w-1], n2[w-1], c[w*w-1], 1'b0, d[(w+1)*w-2], c[(w+1)*w-1]);
    fa af(c[(w+1)*w-1], 1'b1, carrie[w-1], out[2*w-1], n);

endmodule