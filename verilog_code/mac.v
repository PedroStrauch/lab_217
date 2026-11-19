module mac(clk, rst, en, n1, n2, out);
    input clk, rst, en;
    input [7:0] n1, n2;
    reg [15:0] rp, rn;
    wire mul;
    output [15:0] out;

    assign mul = n1 * n2;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            rp <= 0;
            rn <= 0;
        end
        else begin
            rp <= rp+mul;
        end
    end
    assign out = rp;
endmodule