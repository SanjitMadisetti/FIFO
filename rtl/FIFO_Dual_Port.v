`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 00:00:32
// Design Name: 
// Module Name: FIFO_Dual_Port
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


module FIFO_Dual_Port#(parameter
word_width = 32,
stk_ptr_width =3)(
    output [word_width-1:0] Data_out, //Data path from FIFO
    output stk_full, //Status flags
           stk_almost_full,
           stk_half_full,
           stk_almost_empty,
           stk_empty,
    input [word_width-1:0] Data_in, //Data path into FIFO
    input write, //Flag controlling a write to the stack
          read, //Flag controlling a read from the stack
    input clk_write, //Clock to synchronize writes
          clk_read, //Clock to synchronize reads
          rst    
    );
    
    wire [stk_ptr_width-1:0] write_ptr, read_ptr;
    
    FIFO_Control_Unit M0_Controller(
    .write_to_stk(write_to_stk),
    .read_fr_stk(read_fr_stk),
    .write(write),
    .read(read),
    .stk_full(stk_full),
    .stk_empty(stk_empty)
    );
    
    FIFO_Datapath_Unit M1_Datapath(
    .Data_out(Data_out),
    .Data_in(Data_in),
    .write_ptr(write_ptr),
    .read_ptr(read_ptr),
    .write_to_stk(write_to_stk),
    .read_fr_stk(read_fr_stk),
    .clk_write(clk_write),
    .clk_read(clk_read),
    .rst(rst)
    );
    
    FIFO_Status_Unit M2(
    .write_ptr(write_ptr),
    .read_ptr(read_ptr),
    .stk_full(stk_full),
    .stk_almost_full(stk_almost_full),
    .stk_half_full(stk_half_full),
    .stk_almost_empty(stk_almost_empty),
    .stk_empty(stk_empty),
    .write_to_stk(write_to_stk),
    .read_fr_stk(read_fr_stk),
    .clk_write(clk_write),
    .clk_read(clk_read),
    .rst(rst)
    );
    
endmodule
