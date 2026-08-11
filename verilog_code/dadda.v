module dadda_8bits(N1, N2, out);
    input [7:0] N1, N2;
    output [15:0] out;
    wire [63:0] fios_ands
    wire [5:0] passo1;
    genvar i, j;
    generate
        for(i = 0; i < 8; i = i+1)
        begin: ands_N1
            for(j = 0; j < 8; j = j+1)
            begin: ands_N2
                assign fios_ands[(j*8)+i] = N1 & N2; 
            end
        end
    endgenerate

    

endmodule