`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 19:40:33
// Design Name: 
// Module Name: SingleCycleCPU
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


module SingleCycleCPU(
    input clk, Reset,
    output [5:0] opCode,
    output [31:0] ReadData1, ReadData2, currentPC, nextPC, result, DMOut,
    output [4:0] rs, rt
);
    wire [4:0] rd;
    wire [2:0] ALUOp;
    wire [1:0] PCSrc;
    wire [31:0] ImExt;
    wire [15:0] Immediate;
    wire [5:0] sa;
    wire [25:0] j_addr;
    wire zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst;
    PC pc(PCWre, PCSrc, clk, Reset, ImExt, j_addr, ExtSel, currentPC, nextPC);
    Ins_Mem im(currentPC, InsMemRW, opCode, rs, rt, rd, Immediate, j_addr, sa);
    CU cu(opCode, zero, InsMemRW, ExtSel, PCWre, RegDst, RegWre, ALUOp, ALUSrcA, ALUSrcB, PCSrc, mRD, mWR, DBDataSrc);
    ALU alu(ALUSrcA, ALUSrcB, sa, ALUOp, ReadData1, ReadData2, ImExt, result, zero);
    Data_Mem dm(clk, result, ReadData2, mRD, mWR, DMOut);
    RegisterFile rf(clk, Reset, RegWre, RegDst, DBDataSrc, rs, rt, rd, result, DMOut, ReadData1, ReadData2);
    Extend ext(Immediate, ExtSel, ImExt);
endmodule
