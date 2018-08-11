
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
		if(!RST_N || !GATE) begin
			cnt <= 0;
            CLK_33K <= 1'b1;
			end
		else begin	
					
			if(cnt == SIZE)	begin					
				cnt <= 0;
				CLK_33K <= ~CLK_33K;
				end
			else begin
				cnt <= cnt + 1;
				CLK_33K <= CLK_33K;
				end
		end
	end

				

	
//	always@(posedge CLK or negedge RST_N) begin
//	       if(GATE)
//	           CLEAR <= 0;
//           else
//               CLEAR <= 1;
//	end

//	always@( negedge GATE) begin
//	   cnt <= 0;
//	end
		
endmodule
