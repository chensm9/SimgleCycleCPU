`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:43:23
// Design Name: 
// Module Name: Debounce
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

module Debounce(clk, key_in, key_out);
    parameter SAMPLE_TIME = 20'hf_ffff;
    input clk;
    input key_in;
    output key_out;

    reg [21:0] count_low;
    reg [21:0] count_high;
    
    reg key_out_reg;
    
    always @(posedge clk) begin
        if(key_in ==1'b0)
            count_low <= count_low + 1;
        else
            count_low <= 0;
    end
    
    always @(posedge clk) begin
        if(key_in ==1'b1)
            count_high <= count_high + 1;
        else
            count_high <= 0;
    end
    
    always @(posedge clk) begin
        if(count_high == SAMPLE_TIME)
            key_out_reg <= 1;
        else if(count_low == SAMPLE_TIME)
            key_out_reg <= 0;
    end
    
    assign key_out = key_out_reg;
endmodule 
