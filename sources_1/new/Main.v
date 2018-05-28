`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 20:47:17
// Design Name: 
// Module Name: Main
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


module Main(
    input CPU_CLK, SYS_CLK, RST,
    input [1:0] SW_in,
    output [3:0] ctrlBits,
    output [7:0] dispcode
    );
    wire [31:0] rsData, rtData, curPC, ALUresult, DBdata, nextPC;
    wire [3:0] num;
    wire [1:0] counter;
    wire SYS_CLK_DIV, DE_CPU_CLK;
    wire [5:0] opCode;
    wire [31:0] rsData, rtData, curPC, ALUresult, DBdata, nextPC;
    wire [4:0] rs, rt;
    wire N_DE_CPU_CLK;
    assign N_DE_CPU_CLK = !DE_CPU_CLK;
    SingleCycleCPU cpu(N_DE_CPU_CLK, RST, opCode, rsData, rtData, curPC, nextPC, ALUresult, DBdata, rs, rt);
    CLK_DIV clk_div(SYS_CLK, SYS_CLK_DIV);
    Data_Selector ds(curPC, nextPC, rsData, rtData, ALUresult, DBdata, rs, rt, SW_in, counter, num, ctrlBits);
    Debounce de(SYS_CLK ,CPU_CLK, DE_CPU_CLK);
    Seg7_LED seg7(num, dispcode);
    Gen_Counter gc(SYS_CLK_DIV, counter);
endmodule
