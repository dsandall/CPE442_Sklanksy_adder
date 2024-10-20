module tb_adder_Nbit;

    parameter N = 8;

    // Testbench signals
    logic [N-1:0] A;         // 8-bit input A
    logic [N-1:0] B;         // 8-bit input B
    logic [N-1:0] SUM;       // 8-bit sum output
    logic CO;              // Carry out
     logic [N:0] expected_sum;
     logic expected_CO;

    // Instantiate the DUT
    Sklansky #(N) dut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CO)
    );

    // Test procedure
    initial begin
        // Cycle through all values for A and B
        for (int i = 0; i < (2**N); i++) begin 
            for (int j = 0; j < (2**N); j++) begin 
                A = i; // Assign value to A
                B = j; // Assign value to B
                #1; // Wait for the output to stabilize

                // Calculate expected sum and carry
                expected_sum = A + B; 
                expected_CO = expected_sum[N]; // Carry out

                // Check if the DUT output matches the expected values
                if (SUM !== expected_sum[N-1:0] || CO !== expected_CO) begin
                    $display("Error: A=%0d, B=%0d, SUM=%0d, CO=%b, Expected SUM=%0d, Expected CO=%b",
                             A, B, SUM, CO, expected_sum[N-1:0], expected_CO);
                end else begin
                    $display("Pass: A=%0d, B=%0d, SUM=%0d, CO=%b", A, B, SUM, CO);
                end
            end
        end
        $finish; // End the simulation
    end

endmodule
