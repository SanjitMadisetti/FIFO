`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 23:20:27
// Design Name: 
// Module Name: FIFO_Status_Unit
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


module FIFO_Status_Unit#(parameter stk_ptr_width = 3, stk_height = 8,
HF_level = stk_height >> 1, //Half full level, e.g., 4
AF_level = (stk_height-HF_level) >> 1, //Almost full level, e.g., 6
AE_level = (HF_level) >> 1 //Almost empty level, e.g., 2
)(
    output [stk_ptr_width-1:0] write_ptr,
    output [stk_ptr_width-1:0] read_ptr,
    output stk_full, stk_almost_full, stk_half_full, stk_almost_empty, stk_empty,
    input write_to_stk, read_fr_stk,
    input clk_write, clk_read, rst
    );
    
    wire [stk_ptr_width:0] wr_cntr;
    wire [stk_ptr_width:0] wr_cntr_G;
    wire [stk_ptr_width:0] rd_cntr;
    wire [stk_ptr_width:0] ptr_gap = wr_cntr - rd_cntr; //2s complement gap between ptrs
    
    assign stk_full = (ptr_gap == stk_height) || rst;
    assign stk_almost_full = ((wr_cntr-rd_cntr) == AF_level) || rst;
    assign stk_half_full = ((wr_cntr-rd_cntr) == HF_level) || rst;
    assign stk_empty = (wr_cntr == rd_cntr) || rst;
    
    wr_cntr_Unit M0(wr_cntr,write_ptr,write_to_stk,clk_write,rst);
    rd_cntr_Unit M1(rd_cntr,read_ptr,read_fr_stk,clk_read,rst);
endmodule
