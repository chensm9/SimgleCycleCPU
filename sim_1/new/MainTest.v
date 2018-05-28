`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 23:21:15
// Design Name: 
// Module Name: MainTest
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


module MainTest;
    reg SYS_CLK, RST;
    reg [1:0] SW_in;
    wire [3:0] ctrlBits;
    wire [7:0] dispcode;
    wire [31:0] rsData, rtData, curPC, ALUresult, DBdata, nextPC;
    Main main(SYS_CLK, SYS_CLK, RST, SW_in, ctrlBits, dispcode, rsData, rtData, curPC, ALUresult, DBdata, nextPC);
     initial begin
       // Initialize Inputs
       SYS_CLK = 0;
       SW_in = 2;
       RST = 0;
       #50; // 刚开始设置pc为0
           SYS_CLK = 1;
       #50;
           RST = 1;
       forever #50 begin // 产生时钟信号
           SYS_CLK = !SYS_CLK;
       end
   end
endmodule
