`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 01:15:06
// Design Name: 
// Module Name: t_FIFO_Dual_Port
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


module t_FIFO_Dual_Port();

    parameter stk_width = 32;
    parameter stk_height = 8;
    parameter stk_ptr_width = 4;
    wire [stk_width-1:0] Data_out;
    wire write;
    wire stk_full, stk_almost_full, stk_half_full;
    wire stk_almost_empty, stk_empty;
    reg [stk_width-1:0] Data_in;
    reg write_to_stk, read_fr_stk;
    reg clk_write, clk_read, rst;
    wire [stk_width-1:0] stk0, stk1, stk2, stk3, stk4, stk5, stk6, stk7;
    
    assign stk0 = M1.M1.stk[0];
    assign stk1 = M1.M1.stk[1];
    assign stk2 = M1.M1.stk[2];
    assign stk3 = M1.M1.stk[3];
    assign stk4 = M1.M1.stk[4];
    assign stk5 = M1.M1.stk[5];
    assign stk6 = M1.M1.stk[6];
    assign stk7 = M1.M1.stk[7];
    
    FIFO_Dual_Port M1(Data_out, stk_full,stk_almost_full,stk_half_full,stk_almost_empty, stk_empty, Data_in, write_to_stk,
    read_fr_stk,clk_write_clk_read,rst);
    
    initial #500 $finish;
    initial fork
        rst = 1; #5
        rst = 0;
        #400 rst = 1;
        #412 rst = 0;
    join
    
    initial begin 
        clk_write = 0;
        forever #5 clk_write = ~clk_write;
    end
    
    initial begin 
        clk_read = 0;
        forever #5 clk_read = ~clk_read;
    end
    
    //Data transitions
    
    initial begin
        Data_in = 32'hFFFF_AAAA;
        @(posedge write_to_stk);
        repeat(24) @(negedge clk_write) Data_in = ~Data_in;
    end
    
    initial fork
        write_to_stk = 0;
        begin #16 write_to_stk = 1;
        #140 write_to_stk = 0;
        end
        begin #286 write_to_stk = 1; end
    join
    
    //Read from FIFO
    initial fork
        begin #0 read_fr_stk = 0; end
        begin #144 read_fr_stk = 1; #8 read_fr_stk = 0; end
        begin #196 read_fr_stk = 1; #86 read_fr_stk = 0; end
    join
    
endmodule
