`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 18:58:50
// Design Name: 
// Module Name: Gen_Counter
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

// 计数生成器
module Gen_Counter(
    input CLK,
    output reg [1:0] counter
    );
    initial begin
        counter <= 0;
    end
    always@(posedge CLK) begin
        counter <= counter + 1;
    end
endmodule
