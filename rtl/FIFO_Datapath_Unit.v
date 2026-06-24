`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 23:39:11
// Design Name: 
// Module Name: FIFO_Datapath_Unit
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


module FIFO_Datapath_Unit#(parameter word_width = 32, stk_height = 8,
stk_ptr_width = 3)(
    output reg [word_width-1:0] Data_out,
    input [word_width-1:0] Data_in,
    input [stk_ptr_width-1:0] write_ptr, read_ptr,
    input write_to_stk,read_fr_stk,
    input clk_write,clk_read,rst
    );
    
    reg [word_width-1:0] stk[stk_height-1:0]; //Memory array
    
    always @(posedge clk_write) if(write_to_stk) stk[write_ptr] <= Data_in;
    always @(posedge clk_read) if(read_fr_stk) Data_out <= stk[read_ptr];
    
endmodule
