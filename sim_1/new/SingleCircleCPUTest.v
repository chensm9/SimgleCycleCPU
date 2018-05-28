`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 22:01:10
// Design Name: 
// Module Name: SingleCircleCPUTest
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


module SingleCircleCPUTest;

    // Inputs
    reg CLK;
    reg Reset;

    // Outputs
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] currentPC, nextPC;
    wire [31:0] result;
    wire [5:0] opCode;
    
    wire [2:0] ALUOp;
    wire [1:0] PCSrc;
    wire [31:0] ImExt, DMOut;
    wire [15:0] Immediate;
    wire [4:0] rs, rt, rd;
    wire [5:0] sa;
    wire [25:0] j_addr;
    wire zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre,InsMemRW, mRD, mWR, ExtSel, RegDst;
    SingleCycleCPU sc_cpu (
        .clk(CLK), 
        .Reset(Reset),
        .opCode(opCode),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .currentPC(currentPC),
        .nextPC(nextPC),
        .result(result),
//        .ALUOp(ALUOp),
//        .ImExt(ImExt),
        .DMOut(DMOut),
//        .Immediate(Immediate),
        .rs(rs),
        .rt(rt)
//        .rd(rd)
//        .sa(sa),
//        .j_addr(j_addr),
//        .zero(zero),
//        .PCWre(PCWre),
//        .ALUSrcA(ALUSrcA),
//        .ALUSrcB(ALUSrcB),
//        .DBDataSrc(DBDataSrc),
//        .RegWre(RegWre),
//        .InsMemRW(InsMemRW),
//        .mRD(mRD),
//        .mWR(mWR),
//        .ExtSel(ExtSel),
//        .RegDst(RegDst),
//        .PCSrc(PCSrc)
    );

    initial begin
        // Initialize Inputs
        CLK = 0;
        Reset = 0;
        #50; // 刚开始设置pc为0
            CLK = 1;
        #50;
            Reset = 1;
        forever #50 begin // 产生时钟信号
            CLK = !CLK;
        end
    end

endmodule
