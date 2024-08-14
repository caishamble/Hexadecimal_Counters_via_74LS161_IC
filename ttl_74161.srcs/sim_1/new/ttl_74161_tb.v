`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 12:14:51 AM
// Design Name: 
// Module Name: ttl_74161_tb
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


// Test: 4-bit modulo 16 binary counter with parallel load, asynchronous clear


module ttl_74161_tb;

    // Inputs
    reg ld, cet, cep, clk, clr;
    reg [3:0] p;

    // Outputs
    wire [3:0] q;
    wire tc;

    // Instantiate the module under test
    ttl_74161 uut (
        .ld(ld),
        .p(p),
        .q(q),
        .cet(cet),
        .cep(cep),
        .clk(clk),
        .tc(tc),
        .clr(clr)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    // Reset
    initial begin
        ld = 0;
        p = 4'b0000;
        clk = 0;
        clr = 0;
        cep = 0;
        cet = 0;
    end
    
    // Test scenarios
    initial begin
        // Scenario 1: clr = 0
        #15 clr = 1;

        #15 p = 3;
        // Scenario 2: clr = 1, ld = 1
        #15 ld = 1;

        // Scenario 3: clr = 1, ld = 1, cep = 1, cet = 1
        # 15 cep = 1; cet = 1;

        // End simulation
        #350 $finish;
    end
endmodule
