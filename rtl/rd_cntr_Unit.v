`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 23:14:45
// Design Name: 
// Module Name: rd_cntr_Unit
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


module rd_cntr_Unit#(parameter stk_ptr_width = 3)(
    output reg [stk_ptr_width:0] rd_cntr,
    output [stk_ptr_width-1:0] read_ptr,
    input read_fr_stk,clk_write,rst
    );
    
    assign read_ptr = rd_cntr[stk_ptr_width-1:0];
    
    always @(posedge clk_write, posedge rst) begin
        if(rst) begin rd_cntr <= 0; end
        else if(read_fr_stk) begin
            rd_cntr <= rd_cntr + 1;
        end
    end
endmodule
