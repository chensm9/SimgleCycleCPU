`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 15:07:12
// Design Name: 
// Module Name: PC
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


module PC(
    input PCWre,
    input [1:0] PCSrc,
    input CLK,
    input Reset,
    input [31:0] ImExt, // ����չ��������
    input [25:0] j_addr,      // jָ� 25λ��ַ
    output reg [31:0] currentPC,
    output reg [31:0] nextPC
    );
    always @(posedge CLK or negedge Reset) begin
        if (Reset == 0) begin
            currentPC = 0;
        end
        else if (PCWre == 1) begin
            currentPC = nextPC;
        end 
    end
    always @(PCWre or PCSrc or ImExt or j_addr) begin
        if (PCWre == 1) begin
            if (PCSrc == 2'b00) 
                nextPC = currentPC + 4;
            else if (PCSrc == 2'b01)
                nextPC = currentPC + 4 + (ImExt << 2);
            else if (PCSrc == 2'b10) begin
                nextPC = currentPC + 4;
                nextPC[27:2] = j_addr;
                nextPC[1:0] = 2'b00;
            end
        end
        else nextPC = currentPC;
    end
    
endmodule
