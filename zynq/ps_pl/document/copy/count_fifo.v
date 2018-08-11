
`timescale 1ns/1ps
module count_fifo#(
	parameter integer WIDTH		= 	7,
	parameter integer SIZE		= 	10
	)
(
	CLK,							//system clk 100M
	RST_N,
	GATE,
	PMT,
	DATA,
	USAGE,
	INT
);
	
	input 					CLK;							//system clk 100M
	input 					RST_N;
	input 					GATE;
	input 					PMT;
	output                  INT;
	output	[WIDTH-1:0] 	DATA;
	output	[SIZE-1:0] 	    USAGE;
		
    wire 					clear;
    wire 					write;
	wire 	[WIDTH-1:0] 	count_num;
	
	counter counter(
					.CLK(CLK),                         
					.RST_N(RST_N),						
					.GATE(GATE),							
					.PMT(PMT),							
					.CLEAR(clear),	
					.WRITE(write),				
					.COUNTER(count_num)			
	);

    assign INT = clear;
    
	wire 	read_fifo;
	wire   	write_fifo;
	wire 	empty;
	wire 	full;
	assign 	read_fifo 	= 	empty 	? 	1'b0 : clear;		//empty is not read	
	assign 	write_fifo 	= 	full 	? 	1'b0 : write;		//write signal,while GATE is high and rise of PMT，full is not write

	fifo fifo(
				.CLK(CLK),    
				.RST_N(RST_N),                                                   
				.WRITE(write_fifo),                           
				.READ(read_fifo),                            
				.D(count_num),                    
				.Q(DATA),                   
				.EMPTY(empty),                          
				.FULL(full),
				.USAGE(USAGE)                            
	);
	
endmodule
