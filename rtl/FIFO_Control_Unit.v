`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 23:37:10
// Design Name: 
// Module Name: FIFO_Control_Unit
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


module FIFO_Control_Unit(
    output write_to_stk, read_fr_stk,
    input write, read, stk_full, stk_empty
    );
    
    assign write_to_stk = write && (!stk_full);
    assign read_fr_stk = read && (!stk_empty);
endmodule
