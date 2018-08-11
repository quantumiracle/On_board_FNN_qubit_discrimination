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
        PMT,
        INTR,   
        COUNTER
);
    input           CLK;            //system clk 100M
    input           RST_N;          //reset signal,low valid
    input           GATE;           //GATE control signal
    input           PMT;            //external pulse signal
    output          INTR;           //output INT signal
    output [7:0]    COUNTER;        //output current count number
    
    wire            CLK_33K;        //33K
    
    counter counter(
        .CLK(CLK),
        .CLK_33K(CLK_33K),
        .RST_N(RST_N),
        .GATE(GATE),
        .PMT(PMT),
        .INTR(INTR),
        .COUNTER(COUNTER)
    );
    
    clk_div_33k clk_div_33k(
        .CLK(CLK),                          
        .RST_N(RST_N),
        .GATE(GATE),
        .CLK_33K(CLK_33K)
    );
endmodule

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
        PMT,
        INTR,   
        COUNTER
);
    input           CLK;            //system clk 100M
    input           RST_N;          //reset signal,low valid
    input           GATE;           //GATE control signal
    input           PMT;            //external pulse signal
    output          INTR;           //output INT signal
    output [7:0]    COUNTER;        //output current count number
    
    wire            CLK_33K;        //33K
    
    counter counter(
        .CLK(CLK),
        .CLK_33K(CLK_33K),
        .RST_N(RST_N),
        .GATE(GATE),
        .PMT(PMT),
        .INTR(INTR),
        .COUNTER(COUNTER)
    );
    
    clk_div_33k clk_div_33k(
        .CLK(CLK),                          
        .RST_N(RST_N),
        .GATE(GATE),
        .CLK_33K(CLK_33K)
    );
endmodule

