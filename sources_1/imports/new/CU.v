`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 15:07:12
// Design Name: 
// Module Name: CU
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


module CU(
    input [5:0] opCode,
    input zero,
    output InsMemRW,
    output ExtSel,
    output PCWre,
    output RegDst,
    output RegWre,
    output reg [2:0] ALUOp,
    output ALUSrcA,
    output ALUSrcB,
    output reg [1:0] PCSrc,
    output mRD,
    output mWR,
    output DBDataSrc
    );

    assign PCWre = (opCode === 6'b111111) ? 0:1;
    assign ALUSrcA = (opCode === 6'b011000) ? 1:0;
    assign ALUSrcB = (opCode === 6'b000001 || opCode === 6'b010000 || opCode === 6'b011011 || opCode === 6'b100110 || opCode === 6'b100111) ? 1:0;
    assign DBDataSrc = (opCode === 6'b100111) ? 1:0;
    assign InsMemRW = 0;
    assign mRD = (opCode === 6'b100111) ? 1:0;
    assign mWR = (opCode === 6'b100110) ? 1:0;
    assign RegDst = (opCode === 6'b000001 || opCode === 6'b010000 || opCode === 6'b100111 || opCode === 6'b011011) ? 0:1;
    assign RegWre = (opCode === 6'b110000 || opCode === 6'b110001 || opCode === 6'b100110 || opCode === 6'b111111 || opCode === 6'b111000) ? 0:1;
    assign ExtSel = (opCode === 6'b010000) ? 0:1;

    always @(opCode or zero) begin
        if ((opCode === 6'b110000&&zero === 1) || (opCode === 6'b110001&&zero === 0))
            PCSrc = 2'b01;
        else if (opCode === 6'b111000)
            PCSrc = 2'b10;
        else
            PCSrc = 2'b00;
    
        if (opCode === 6'b000000 || opCode === 6'b000001 || opCode === 6'b100110 || opCode === 6'b100111)
            ALUOp = 3'b000;
        else if (opCode === 6'b000010 || opCode === 6'b110000 || opCode === 6'b110001)
            ALUOp = 3'b001;
        else if (opCode === 6'b011000)
            ALUOp = 3'b010;
        else if (opCode === 6'b010000 || opCode === 6'b010010)
            ALUOp = 3'b011;
        else if (opCode === 6'b010001)
            ALUOp = 3'b100;
        else if (opCode === 6'b011011 )
            ALUOp = 3'b110;
        else
            ALUOp= 3'b000;
    end
endmodule
