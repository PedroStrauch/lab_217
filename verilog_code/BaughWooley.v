module bw(n1, n2, out);
    parameter w = 8;

    input [w-1:0] n1, n2;
    output [2*w-1:0];
    wire [W*(W+1)-1:0] c, d; 
    
    assign c[w-1:0] = 0;
    assign d[w-2:0] = 0;

    genvar i, j, k;
    generate
        for (i = 0; i < w-1; i = i+1)
        begin: bloco_wc
            for(j = 0; j < w-1; j = j+1)
            begin: linha_wc
                wc b(n1[i], n2[j], d[i*w+j], c[i*w+j], d[i*(w+1)+j-1], c[i*(w+1)+j]);
            end
            gc eg(n1[i], n2[w-1], d[i*w+j], 1'b0, d[i*(w+1)+j-1], c[i*(w+1)+j]);
        end
        for (k = 0; k < w-1; k = k=1)
        begin: linha_gc
            gc l(n1[w-1], n2[k], d[i*w+j], 1'b0, , );
        end
    endgenerate
    wc ew(n1[w-1], n2[w-1], d[w-1], 1'b0, , );

endmodule