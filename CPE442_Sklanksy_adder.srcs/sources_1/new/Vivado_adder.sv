`timescale 1ns/1ps

module vivado_adder #(parameter WIDTH = 8)(
    input logic [WIDTH-1:0] A ,
    input logic [WIDTH-1:0] B ,
    output logic [WIDTH-1:0] SUM ,
    output logic CARRY    
);

    logic [WIDTH:0] long_sum; 
    assign long_sum = A+B;
    assign SUM = long_sum[WIDTH-1:0];
    assign CARRY = long_sum[WIDTH];
    
endmodule