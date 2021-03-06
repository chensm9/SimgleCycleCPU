`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 15:20:50
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input CLK,
    input RST,
    input RegWre,
    input RegDst,
    input DBDataSrc,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] ALUresult,
    input [31:0] DMDataOut,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    wire [4:0] WriteReg;
    wire [31:0] WriteData;
    reg [31:0] regFile[1:31];
    integer i;
    
    assign WriteReg = (RegDst === 1) ? rd : rt;
    assign WriteData = (DBDataSrc === 1) ? DMDataOut : ALUresult;
   
    assign ReadData1 = (rs == 0) ? 0 : regFile[rs];
    assign ReadData2 = (rt == 0) ? 0 : regFile[rt];
    
    always @ (negedge CLK or negedge RST) begin // ������ʱ�ӱ��ش���
        if (RST == 0) begin
            for(i = 1; i < 32; i = i+1)
                regFile[i] <= 0;
        end
        else if(RegWre == 1 && WriteReg != 0) // WriteReg != 0��$0 �Ĵ��������޸�
            regFile[WriteReg] <= WriteData;   // д�Ĵ���
    end
endmodule
