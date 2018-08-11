
`timescale 1ns/1ps
module clk_div_33k#(
	parameter integer SIZE	= 	1500		//100M/33k=3000,so counter is half of divide number
	)
	(
	CLK,						
	RST_N,
	CLK_33K,
	GATE,
);
	
	input 					CLK;			//system clk 100M
	input 					RST_N;
	input                   GATE;      
	output 					CLK_33K;

	reg 					CLK_33K;
	reg [10:0] 				cnt;
	
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) 
			cnt <= 0;
		else begin							
			if(cnt == SIZE)						
				cnt <= 0;
			else
				cnt <= cnt + 1;
		end
	end
	
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N)
			CLK_33K <= 1'b0;
		else begin
			if(cnt == SIZE)
				CLK_33K <= ~CLK_33K;
			else
				CLK_33K <= CLK_33K;
		end
	end

	always@( negedge GATE) begin
	   cnt <= 0;
	end
		
endmodule
