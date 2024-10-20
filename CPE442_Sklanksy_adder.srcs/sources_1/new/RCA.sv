`timescale 1ns / 1ps

module ripple_carry_adder #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] A, B,  // Inputs: A and B
    input  logic             Cin,   // Carry-in
    output logic [WIDTH-1:0] Sum,   // Sum output 
    output logic             Cout   // Carry-out
);

    // Internal carry signals
    logic [WIDTH:0] carry;

    // Assign the carry-in to the first internal carry signal
    assign carry[0] = Cin;

    // Ripple carry logic
    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin
            full_adder FA (
                .a(A[i]),
                .b(B[i]),
                .c_in(carry[i]),
                .sum(Sum[i]),
                .c_out(carry[i+1])
            );
        end
    endgenerate

    // Assign the final carry-out
    assign Cout = carry[WIDTH];

endmodule


// Full adder module for one bit
module full_adder (
    input  logic a, b, c_in,
    output logic sum, c_out
);
    assign {c_out, sum} = a + b + c_in;
endmodule
