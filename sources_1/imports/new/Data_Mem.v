`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 15:18:02
// Design Name: 
// Module Name: Data_Mem
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

module Data_Mem(
    input clk,
    input [31:0] address,
    input [31:0] DataIn, // [31:24], [23:16], [15:8], [7:0]
    input mRD, // 为 1，读(lw)；为 0,输出高组态
    input mWR, // 为 1，写(sw)；为 0，无操作
    output [31:0] DataOut
    );
    reg [7:0] ram [0:63]; //存储器
    integer i;  
    initial begin  
        for (i = 0; i < 64; i = i+1) ram[i] <= 0;  
    end  
    // 读
    assign DataOut[7:0] = (mRD==1)?ram[address + 3]:8'bz; // z 为高阻态
    assign DataOut[15:8] = (mRD==1)?ram[address + 2]:8'bz;
    assign DataOut[23:16] = (mRD==1)?ram[address + 1]:8'bz;
    assign DataOut[31:24] = (mRD==1)?ram[address ]:8'bz;
    // 写
    always@( negedge clk) begin
        if( mWR==1 ) begin
            ram[address] <= DataIn[31:24];
            ram[address+1] <= DataIn[23:16];
            ram[address+2] <= DataIn[15:8];
            ram[address+3] <= DataIn[7:0];
        end
    end
endmodule
