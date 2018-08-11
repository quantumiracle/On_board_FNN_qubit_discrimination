
`timescale 1ns/1ps
module fifo #(
	parameter integer WIDTH		= 	7,
	parameter integer SIZE_E	= 	7
	)
(
	CLK,                  
	RST_N,				
	WRITE,                
	READ,                 
	D,                    
	Q,                   
	EMPTY,                
	FULL,
	USAGE                  
);
	
	input 					CLK;                    // Clock
	input 					RST_N;					// Reset;
	input 					WRITE;                  // Write to FIFO
	input 					READ;                   // Read from FIFO
	input 	[WIDTH-1:0]		D;                    	// FIFO input
	output 	[WIDTH-1:0]		Q;                   	// FIFO output
	output 					EMPTY;                  // FIFO is empty
	output 					FULL;                   // FIFO is full
	output [SIZE_E-1:0]    	USAGE;                   // FIFO usage
	
	reg 					iFULL;
	reg 					iEMPTY;
	reg 	[WIDTH-1:0]		iQ;
	reg 	[SIZE_E:0] 		iWRAddr;
	reg 	[SIZE_E:0] 		iRDAddr;
	reg 	[WIDTH-1:0] 	iFIFOMem[0:2**SIZE_E-1];
)	reg     [SIZE_E-1:0]    iUSAGE;
	
	/*empty and full signal process*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
			iEMPTY <= 1'b1;
			iFULL <= 1'b0;
		end
		else begin
			if(iRDAddr == iWRAddr)
				iEMPTY <= 1'b1;
			else 
				iEMPTY <= 1'b0;
			if((iRDAddr[SIZE_E-1:0] == iWRAddr[SIZE_E-1:0]) && (iRDAddr != iWRAddr))	
				iFULL <= 1'b1;
			else
				iFULL <= 1'b0;
		end
	end
	
    //always@(RST_N or WRITE or iFULL or READ or iEMPTY) begin
    always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
			iWRAddr <= {(SIZE_E+1){1'b0}};
			iRDAddr <= {(SIZE_E+1){1'b0}};
		end
		else begin
			if(WRITE && !iFULL) begin       		
				iWRAddr <= iWRAddr + 1;
			end
			else if(READ && !iEMPTY) begin       	
				iRDAddr <= iRDAddr + 1;
			end
		end
    end

    /*FIFO memory process*/
	always@(posedge CLK or negedge RST_N) begin
		if(!RST_N) begin
		    iQ <= {(WIDTH){1'b0}};
		end
		else begin
			if(WRITE && !iFULL)
				iFIFOMem[iWRAddr[SIZE_E-1:0]] <= D;
			if(READ && !iEMPTY)
				//iQ <= iFIFOMem[iRDAddr[SIZE_E-1:0]];   //modify iRDAddr 
				iQ <= D;
		end
    end
 
    //always@(RST_N or WRITE or READ) begin
    always@(posedge CLK or negedge RST_N) begin
        if(!RST_N) 
            iUSAGE <= 0;
        else begin
            if(!READ && WRITE && !iFULL) 
                iUSAGE <= iUSAGE+1;
           if(!WRITE && READ && !iEMPTY) 
                iUSAGE <= iUSAGE-1; 
        end
    end   
   
    assign EMPTY = iEMPTY;
    assign FULL  = iFULL;
    assign Q     = iQ;
    assign USAGE = READ ? iUSAGE : {(SIZE_E+1){1'b0}};
    
endmodule
