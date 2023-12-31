module full_adder(
    output cout,
    output sum,
    input ain,
    input bin,
    input cin
    );

    //assign bin2 = cin^bin; // XORing the inputs to bin with cin. If 1, subtract; if 0, add
    
    assign sum = ain^bin^cin;
    assign cout = (ain&bin) | (ain&cin) | (bin&cin);
endmodule
