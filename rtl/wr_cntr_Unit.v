`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 23:07:36
// Design Name: 
// Module Name: wr_cntr_Unit
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


module wr_cntr_Unit#(parameter stk_ptr_width =3)(
    output reg [stk_ptr_width:0] wr_cntr,
    output [stk_ptr_width-1:0] write_ptr,
    input write_to_stk,clk_write,rst
    );
    
    assign write_ptr = wr_cntr[stk_ptr_width-1:0];
    
    always @(posedge clk_write, posedge rst) begin
        if(rst) begin wr_cntr <= 0; end
        else if(write_to_stk) begin
            wr_cntr <= wr_cntr+1;
        end
    end
     
endmodule
