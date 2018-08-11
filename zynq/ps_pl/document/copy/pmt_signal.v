
`timescale 1ns/1ps
module pmt_signal#(
	parameter integer SIZE	= 	16383
	)
	(
	CLK,							//system clk 100M
	RST_N,
	PMT,
);
	
	input 					CLK;							//system clk 100M
	input 					RST_N;
	output 					PMT;

	reg 					PMT;
	reg [13:0] 				cnt;
	
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) 
			cnt <= 0;
		else begin							
			if(cnt == SIZE)				//clk = 3k				
				cnt <= 0;
			else
				cnt <= cnt + 1;
		end
	end
	
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N)
			PMT <= 1'b0;
		else begin
			if(cnt == SIZE)
				PMT <= ~PMT;
			else
				PMT <= PMT;
		end
	end
	
endmodule
