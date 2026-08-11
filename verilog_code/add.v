module fa(a, b, c, s, cout);
    input a, b, c;
    output s, cout;

    assign s = a ^ b ^ c;
    assign cout = (a & b) | (b & c) | (a & c);  
endmodule

module ha(a, b, s, cout);
    input a, b;
    output s, cout;

    assign s = a ^ b;
    assign cout = a & b;

endmodule