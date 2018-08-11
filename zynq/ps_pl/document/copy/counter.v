
`timescale 1ns/1ps
module counter #(
	parameter integer WIDTH				 = 8,
	parameter integer SIZE				 = 10
	)
(
	CLK,                  
	RST_N,				
	GATE,				
	PMT,				
	CLEAR,	
	WRITE,			
	COUNTER				
);

	input 				CLK;                          // Clock
	input 				RST_N;						// Reset
	input 				GATE;							// Gate control signal
	input 				PMT;							// Pulse signal
	output 				CLEAR;						
	output              WRITE;                     //Write fifo signal
	output [WIDTH-1:0]	COUNTER;			// Count number
	
	reg 				signal_1;
	reg 				signal_2;
	reg					pulse_signal_1;
	wire 				rise_signal;
	wire				fall_signal;
	wire				rise_pulse;
	
	reg 				CLEAR;
	reg                 WRITE;
	reg [WIDTH-1:0]		COUNTER;
/*	
	reg [2:0] cstate,nstate;
	parameter	IDLE		= 	3'b000,			//idle state
				RISE_EDGE	= 	3'b001,			//rise edge,clear 0
				HIGH_LEVEL 	= 	3'b010,			//high level,counter add
				FALL_EDGE	=	3'b011,			//fall edge,counter maintain,output CLEAR=1 signal
				LOW_LEVEL	= 	3'b100;			//low level,counter maintain
*/

	/*detect GATE and PMT of rise_edge*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
			signal_1 <= 1'b1;
			pulse_signal_1 <= 1'b1;
		end
		else begin
			signal_1 <= GATE;
			pulse_signal_1 <= PMT;
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
	
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
			CLEAR <= 1'b0;
			WRITE <= 1'b0;
			COUNTER <= {(WIDTH){1'b0}};
		end
		else begin
			if(rise_signal) begin
				CLEAR <= 1'b0;
				COUNTER <= {(WIDTH){1'b0}};
			end
			else if(GATE) begin
					CLEAR <= 1'b0;
					if(rise_pulse) begin
					    WRITE <= 1'b1;
						if(COUNTER == 2**SIZE-1)
							COUNTER <= {(WIDTH){1'b0}};
						else
							COUNTER <= COUNTER + 1;	
						end
					else begin
						COUNTER <= COUNTER;		
						WRITE <= 1'b0;	
					end		
			end
			else if(fall_signal) begin
				CLEAR <= 1'b1;
				COUNTER <= COUNTER;
			end
			else if(!GATE) begin
				CLEAR <= 1'b0;
				COUNTER <= COUNTER;
			end
		end
	end
	
/*
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N)
			cstate <= IDLE;
		else
			cstate <= nstate;
	end
	
	always@(*) begin
		case(cstate)
			IDLE:		begin
							COUNTER = {(WIDTH){1'b0}};
							CLEAR = 1'b0;
							nstate = RISE_EDGE;
						end
			RISE_EDGE: 	begin
							if(rise_signal) begin
								CLEAR = 1'b0;
								COUNTER = {(WIDTH){1'b0}};
								nstate = HIGH_LEVEL;
							end
							else
								nstate = RISE_EDGE;
						end
			HIGH_LEVEL: begin
							if(GATE) begin
								CLEAR = 1'b0;
								if(rise_pulse) begin
									if(COUNTER == 2**WIDTH-1) begin
										COUNTER = {(WIDTH){1'b0}};
										nstate = HIGH_LEVEL;	
									end
									else begin
										COUNTER = COUNTER + 1;
										nstate = HIGH_LEVEL;
									end
								end	
								else begin
									COUNTER = COUNTER;
									nstate = HIGH_LEVEL;
								end
							end	
							else if(fall_signal)
								nstate = FALL_EDGE;
						end
			FALL_EDGE:	begin
								CLEAR = 1'b1;
								COUNTER = COUNTER;	
								nstate = LOW_LEVEL;
						end
			LOW_LEVEL: 	begin
							if(!GATE) begin
								CLEAR = 1'b0;
								COUNTER = COUNTER;
								nstate = RISE_EDGE;
							end
							else
								nstate = RISE_EDGE;
						end
			default:nstate = IDLE;
		endcase
	end	
*/
	
endmodule
