`timescale 1ns / 1ps

module tb_half_adder;
    reg  a, b;
    wire sum, carry;
    
    // Instantiate the Half Adder
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    
    // Test stimulus
    initial begin
        // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish; // End simulation
    end
endmodule
