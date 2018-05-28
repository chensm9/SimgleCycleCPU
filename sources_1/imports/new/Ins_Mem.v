`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 15:18:02
// Design Name: 
// Module Name: Ins_Mem
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


module Ins_Mem(
    input [31:0] pc,
    input InsMemRW,
    output [5:0] opCode,   
    output [4:0] rs, rt, rd,  
    output [15:0] Immediate,
    output [25:0] j_addr,
    output [5:0] sa
    );
    reg [31:0] Ins;
    reg [7:0] Mem[0:127];
    // 从本地文件读取指令集并存储在Mem中
    initial begin
        $readmemb("C:/Users/admin/Desktop/SimgleCycleCPU/instructions.txt", Mem);
        Ins = 0;
    end
    always @(pc or InsMemRW) begin
        if (InsMemRW == 0) begin
            Ins = { Mem[pc], Mem[pc+1], Mem[pc+2], Mem[pc+3] };
        end
    end
    assign opCode = Ins[31:26];
    assign rs = Ins[25:21];
    assign rt = Ins[20:16];
    assign rd = Ins[15:11];
    assign Immediate = Ins[15:0];
    assign j_addr = Ins[25:0];
    assign sa = Ins[10:6];
endmodule
