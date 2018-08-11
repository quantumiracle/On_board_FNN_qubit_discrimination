
`timescale 1ns/1ps
module counter #(
	parameter integer WIDTH				 = 8,
	parameter integer SIZE				 = 8
	)
(
	CLK,
	CLK_33K,
	RST_N,				
	GATE,				
	PMT,				
	INTR,			
	COUNTER				
);

	input 				CLK;                // Clock 100M
	input 				CLK_33K;			// Clock 33k
	input 				RST_N;				// Reset
	input 				GATE;				// Gate control signal
	input 				PMT;				// Pulse signal
	output 	reg			INTR;				// Interrupt signal
	output [WIDTH-1:0]	COUNTER;			// Count number
	
	reg 				signal_1;
	reg 				signal_2;
	reg					pulse_signal_1;
	reg                clk33_signal_1;
	//reg                INT;
	wire 				rise_signal;
	wire				fall_signal;
	wire				rise_pulse;
	wire               rise_clk_33k;
	
	reg [WIDTH-1:0]		COUNT;
	reg [WIDTH-1:0]		COUNTER;

	/*detect GATE and PMT of rise_edge*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
			signal_1 <= 1'b1;
			pulse_signal_1 <= 1'b1;
			clk33_signal_1 <= 1'b1;
		end
		else begin
			signal_1 <= GATE;
			pulse_signal_1 <= PMT;
			clk33_signal_1 <= CLK_33K;
		end
	end
	
	/*detect GATE of fall_edge*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N)
			signal_2 <= 1'b0;
		else begin
			signal_2 <= GATE;
		end
	end
		
	assign rise_signal	= GATE 	& 	(~signal_1);
	assign fall_signal 	= ~GATE & 	signal_2;
	assign rise_pulse 	= PMT 	& 	(~pulse_signal_1);
	assign rise_clk_33k   = CLK_33K &   (~clk33_signal_1); 
	
	/*when gate=1,accomplish count*/
	/*rise_edge of gate,clear count
	*negedge_edge of gate and gate=0,count=count
	*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) 
			COUNT <= {(WIDTH){1'b0}};
		else begin
			if(rise_signal) 
				COUNT <= {(WIDTH){1'b0}};
			else if(GATE) begin
				if(rise_pulse) begin
					if(COUNT == 2**SIZE-1)
						COUNT <= {(WIDTH){1'b0}};
					else
						COUNT <= COUNT + 1;	
					end
				else 
					COUNT <= COUNT;				
			end
			else if(fall_signal)
				COUNT <= COUNT;
			else if(!GATE) 
				COUNT <= COUNT;
		end
	end
	
	/*when gate=1,30us output counter*/
//	always@(posedge CLK_33K or negedge RST_N) begin
//		if(!RST_N) 
//			COUNTER <= {(WIDTH){1'b0}};
//		else if(GATE) 
//				COUNTER <= COUNT;
//			else 
//				COUNTER <= {(WIDTH){1'b0}};
//	end		
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
		    INTR <= 0;
			COUNTER <= {(WIDTH){1'b0}};
			end
		else if(GATE) begin
		          if (rise_clk_33k) begin
		            INTR <= 1;
				    COUNTER <= COUNT;
				end
               
			else begin
     
			    INTR <= 0;
				//COUNTER <= {(WIDTH){1'b0}};
				COUNTER <= COUNTER;
				end
				end
            else begin
            COUNTER <= COUNTER;
            end
        end
	
	
	/*genarate INT signal*/
    //assign INT = GATE & CLK_33K;
           
endmodule
