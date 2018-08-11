`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/14 11:55:01
// Design Name: 
// Module Name: top
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


module count_top(
        CLK,
        RST_N,
        GATE,
        DATA,
		USAGE,
		INT	
);
    input 			CLK;            //system clk 100M
    input 			RST_N;
    input 			GATE;
    output [6:0] 	DATA;
    output [6:0] 	USAGE;
    output 			INT;
    
    wire 			PMT;
    
    count_fifo count_fifo(
        .CLK(CLK),                          
        .RST_N(RST_N),
        .GATE(GATE),
        .PMT(PMT),
        .DATA(DATA),
		.USAGE(USAGE),
		.INT(INT)
    );
    
    pmt_signal pmt_signal(
        .CLK(CLK),                          
        .RST_N(RST_N),
        .PMT(PMT)
    );
endmodule

