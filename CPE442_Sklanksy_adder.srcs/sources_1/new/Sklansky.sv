`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 05:36:13 PM
// Design Name: 
// Module Name: Sklansky
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


typedef struct {
    logic P;  // Propagate bit
    logic G;  // Generate bit
} pg_struct;

module Sklansky #(parameter N = 8)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    output logic [N-1:0] SUM,
    output logic CARRY
    );
    
    pg_struct  inputs[N-1:0], outputs[N-1:0];
    genvar i;
    generate
        for (i = 0; i < N; i++) begin
            GP_from_sum prep (A[i], B[i], inputs[i]);
        end
    endgenerate
    
    pg_struct threetwo, fivefour, sevensix;
    pg_struct sixfour, sevenfour;
    assign outputs[0] = inputs[0];
    assign outputs[1].P = inputs[1].P;
    assign outputs[2].P = inputs[2].P;
    assign outputs[3].P = inputs[3].P;
    assign outputs[4].P = inputs[4].P;
    assign outputs[5].P = inputs[5].P;
    assign outputs[6].P = inputs[6].P;
    assign outputs[7].P = inputs[7].P;


    group_generate GG0_0 (inputs[1], inputs[0], outputs[1].G);
    generate_propagate GP0_0 (inputs[3], inputs[2], threetwo);
    generate_propagate GP0_1 (inputs[5], inputs[4], fivefour);
    generate_propagate GP0_2 (inputs[7], inputs[6], sevensix);

    
    group_generate GG1_0  (inputs[2], outputs[1], outputs[2].G);
    group_generate GG1_1 (threetwo, outputs[1], outputs[3].G);
    generate_propagate GP1_0 (inputs[6], fivefour, sixfour);
    generate_propagate GP1_1 (sevensix, fivefour, sevenfour);

    
    group_generate GG2_0 (inputs[4], outputs[2], outputs[4].G);
    group_generate GG2_1 (fivefour, outputs[2], outputs[5].G);
    group_generate GG2_2 (sixfour, outputs[2], outputs[6].G);
    group_generate GG2_3 (sevenfour, outputs[2], outputs[7].G);


    
    
    
    assign SUM[0] = 0 ^ inputs[0].P; //where C-1 is the carry from previous
    assign SUM[1] = outputs[0].G ^ inputs[1].P; //where C0 is G0:0
    assign SUM[2] = outputs[1].G ^ inputs[2].P;
    assign SUM[3] = outputs[2].G ^ inputs[3].P;
    assign SUM[4] = outputs[3].G ^ inputs[4].P;
    assign SUM[5] = outputs[4].G ^ inputs[5].P;
    assign SUM[6] = outputs[5].G ^ inputs[6].P;
    assign SUM[7] = outputs[6].G ^ inputs[7].P;
    assign CARRY = outputs[N-1].G | (inputs[N-1].P & outputs[N-2].G);

    
    
endmodule

module GP_from_sum ( 
    input wire A,
    input wire B,
    output pg_struct OUT
    );
    
    assign OUT.P = A^B;
    assign OUT.G = A&B;
        
endmodule

module generate_propagate (
    input pg_struct UPPER,
    input pg_struct LOWER,
    output pg_struct OUT 
    );
        
    assign OUT.P = UPPER.P & LOWER.P;
    assign OUT.G = (UPPER.P & LOWER.G) | UPPER.G;
    
endmodule

module group_generate (
    input pg_struct UPPER,
    input pg_struct LOWER,
    output wire OUT_G
    );
    
    assign OUT_G = UPPER.G | (UPPER.P & LOWER.G);

endmodule

//module buffer (
//); 
//endmodule
