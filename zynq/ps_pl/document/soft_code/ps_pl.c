/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
#include <math.h>
#include <stdlib.h>
//#include <iostream>
//#include <fstream>
#include <stdio.h>
//#include <string>
#include<time.h>
#include<string.h>


#include "platform.h"
#include "xil_printf.h"
#include "stdlib.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xparameters.h"
#include "xstatus.h"
#include "sleep.h"
#include "xscugic.h"
#include "xil_exception.h"

#include "ps_pl.h"

//using namespace std;

#define 	INT_CFG0_OFFSET 		0x00000C00  //0x00000C0C ICDICFR3 Register int_id is 48 to 63
#define 	INT_ID 					XPS_FPGA0_INT_ID
#define 	INTC_DEVICE_ID 			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define 	INT_TYPE_RISING_EDGE 	0x03
#define 	INT_TYPE_HIGHLEVEL 		0x01
#define 	INT_MASK 				0x03


XScuGic INTCInst;

float relu(float x){

	return x>0 ? x : 0;
}


/*intc handler func */
#define dat_dim 10
#define lay1_dim 20
#define lab_dim 2
static data[dat_dim];
static int cnt = 0 ;
static int Last_DATA = 0;
static float bias1[lay1_dim],bias2[lab_dim];
static  float mat_dat_lay1[dat_dim][lay1_dim];
static float mat_lay1_lab[lay1_dim][lab_dim];


static void Intc_Handler(void *para)
{
	u8 DATA = 0;
	cnt += 1;
	//load data


	DATA = Xil_In32(COUNTER_DATA);
	data[cnt-1] = abs( DATA - Last_DATA);

//			printf("%d, %d\n",DATA,Last_DATA);
//			printf("data.%d is %d\n",cnt,data[cnt-1]);
	Last_DATA = DATA;

//			if (DATA>0){
//				Xil_Out8(BRIGHT,1);
//				usleep(0.2);
//				Xil_Out8(BRIGHT,0);
//				usleep(1);
//				Xil_Out8(BRIGHT,1);
//				usleep(0.2);
//
//			}
//			else if(DATA == 0){
//
//				Xil_Out8(BRIGHT,1);
//				usleep(0.2);
//				Xil_Out8(BRIGHT,0);
//				usleep(1);
//				Xil_Out8(BRIGHT,1);
//				usleep(0.2);
//			}
}


void calcu(void){
//		for (int i=0;i<10;i++){
//
//			printf("%d ", data[i]);
//		}
		cnt = 0;
		Last_DATA = 0;



	//run matrix multiplication

	    float lay1[lay1_dim];
	    float lable[lab_dim];
	    float lable_[lab_dim];



	        for(int i=0;i<lay1_dim;i++){
	            lay1[i]=0;
	            for(int j=0;j<dat_dim;j++){
	                lay1[i]+=mat_dat_lay1[j][i]*data[j];  //get lay1 value

	            }
	            lay1[i]=relu(lay1[i]+bias1[i]);   //nonlinear activation function

	        }
	        for(int i=0;i<lab_dim;i++){
	            lable[i]=0;
	            for(int j=0;j<lay1_dim;j++){
	                lable[i]+=mat_lay1_lab[j][i]*lay1[j];

	            }
	            lable[i]+=bias2[i];
	            lable_[i]=relu(lable[i]);

			}
			
	// set state signal 

	        if (lable_[0]>=lable_[1]){
	        	Xil_Out8(BRIGHT,0);

	        }
	        else
	        {
	        	Xil_Out8(BRIGHT,0);
	        	usleep(1);
	        	Xil_Out8(BRIGHT,1);
	        	usleep(1);
	        	Xil_Out8(BRIGHT,0);
	        	usleep(1);
	        	Xil_Out8(BRIGHT,1);
				usleep(1);
				Xil_Out8(BRIGHT,0);
				usleep(1);
				Xil_Out8(BRIGHT,1);
				usleep(1);
				Xil_Out8(BRIGHT,0);


}


/*set triger type*/
void Intc_Trig_Setup(XScuGic *InstancePtr, int intId, int intType)
{
	u32 mask;
	mask = XScuGic_DistReadReg(InstancePtr,INT_CFG0_OFFSET + (intId/16)*4);
	mask &= ~(INT_MASK << (intId%16)*2);
	mask |= intType << ((intId%16)*2);
	XScuGic_DistWriteReg(InstancePtr,INT_CFG0_OFFSET + (intId/16)*4, mask);
	mask = XScuGic_DistReadReg(InstancePtr,INT_CFG0_OFFSET + (intId/16)*4);
}

/*intc initial*/
int Intc_Init(u16 DeviceId)
{
	XScuGic_Config *IntcConfig;
	int status;

	//Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	if(IntcConfig == NULL)
	{
		printf("XScuGic_LookupConfig is failed\n");
		return XST_FAILURE;
	}

	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig,IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS)
	{
		printf("XScuGic_CfgInitialize is dailed\n");
		return XST_FAILURE;
	}

	//Exception Handler
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&INTCInst);
	Xil_ExceptionEnable();

	//Register interrupt to handler
	status = XScuGic_Connect(&INTCInst,INT_ID,(Xil_ExceptionHandler)Intc_Handler,(void *)NULL);
	if(status != XST_SUCCESS)
	{
		printf("XScuGic_Connect is dailed\n");
		return XST_FAILURE;
	}

	//Set interrupt trigger type to rising edge
	Intc_Trig_Setup(&INTCInst,INT_ID,INT_TYPE_RISING_EDGE);

	//Enable interrupts in the controller
	XScuGic_Enable(&INTCInst,INT_ID);

	return XST_SUCCESS;
}



int main()
{

	Xil_Out8(BRIGHT,1);
	sleep(1);
	for(int i = 0; i < dat_dim; i++){

		data[i]=0;
	}
	Xil_Out8(BRIGHT,0);
	sleep(1);
	int status;
    init_platform();
    printf("Hello World\n");
    cnt = 0;

    status = Intc_Init(INTC_DEVICE_ID);
    if(status != XST_SUCCESS)
    {
    	printf("INT initial is failed\n");
    	return XST_FAILURE;
	}
	
	//load bias

   	    char * bias=",-0.25748923,-0.23590721,-0.21906547,0.59941506,-0.2480824,-0.22780496,-0.258952,-0.08409015,0.54508823,-0.28011137,0.16650799,0.59744155,0.53245896,0.6548352,0.15048355,0.5493146,0.57741463,-0.25066608,0.5806574,-0.252708,0.9996286,1.0001718";
   	    const int data_bits=8;
   	    char * find, temp[data_bits];

   	    for (int i=0;i<lay1_dim;i++){

   	    find = strchr(bias, ',');
   	    strncpy(temp, find+1, data_bits-1);
   	    bias1[i]=atof(temp);
   	    bias = find+data_bits;
		   }
		   
   	    for (int i=0;i<lab_dim;i++)
   	    {
   	    	find = strchr(bias, ',');
   			strncpy(temp, find+1, data_bits-1);
   			bias2[i]=atof(temp);
   			bias = find+data_bits;

   	    }

   	//load weights

   	    char * weights=",0.25444105,0.23287426,0.2151692,-0.33150905,0.2381777,0.2224293,0.25606236,-0.065435074,-0.2766316,0.27774426,-0.0883795,-0.31068695,-0.2908567,-0.37979087,-0.076344766,-0.29164532,-0.32181937,0.24245569,-0.3051021,0.24399439,0.25274494,0.22782178,0.2159182,-0.29502216,0.24236324,0.22166795,0.25519156,-0.12023467,-0.2752591,0.27759564,-0.08177803,-0.3121808,-0.28067598,-0.3420914,-0.075063094,-0.30514708,-0.31725696,0.24391332,-0.31719482,0.24696882,0.2510371,0.22657686,0.21059379,-0.3187563,0.24375942,0.22253457,0.23999232,0.020725237,-0.28828782,0.26866895,-0.08335676,-0.31610373,-0.28647026,-0.33639342,-0.07641494,-0.28797585,-0.2980727,0.24064402,-0.29510844,0.23937505,0.25176546,0.23240568,0.21297257,-0.31168154,0.24096642,0.22590607,0.25389853,-0.0584,-0.27594724,0.27813414,-0.08229478,-0.3223845,-0.27656952,-0.33496776,-0.07688471,-0.29602426,-0.31333944,0.23965228,-0.31063125,0.2525149,0.25374624,0.21994163,0.21311802,-0.3244072,0.23848024,0.2245676,0.25272998,-0.08035832,-0.2863293,0.2785714,-0.08258811,-0.30167156,-0.2768235,-0.3281965,-0.075401045,-0.29682764,-0.3144507,0.2385691,-0.31616628,0.24749576,0.2451992,0.22961628,0.21287684,-0.30640778,0.22709994,0.2239031,0.24614885,-0.0026614335,-0.28375128,0.27576932,-0.08252433,-0.29879093,-0.2914146,-0.3403532,-0.075847715,-0.29115856,-0.28754458,0.24546917,-0.30368093,0.24100551,0.24896987,0.22972016,0.21766269,-0.3001342,0.24200314,0.22055067,0.25647753,-0.10171402,-0.28499788,0.27248046,-0.0822014,-0.31264988,-0.26972517,-0.3387254,-0.085151434,-0.2939305,-0.2942773,0.2476086,-0.29314813,0.25247797,0.25293174,0.23402339,0.21470486,-0.31594005,0.23730066,0.22347009,0.24674511,0.018044677,-0.27985606,0.27569652,-0.08112481,-0.30915108,-0.27911857,-0.34031713,-0.07498287,-0.2910611,-0.3073369,0.2435564,-0.30191872,0.24284792,0.25483194,0.21385826,0.20919456,-0.30208373,0.22860314,0.21436515,0.25624964,-0.09049431,-0.27384695,0.27922347,-0.08340655,-0.3068941,-0.2680914,-0.35757115,-0.075872526,-0.29864213,-0.29307738,0.24224882,-0.30798548,0.25010434,0.25365734,0.23153372,0.21302994,-0.2893196,0.24300078,0.22011214,0.24978542,-0.101376295,-0.27676016,0.2755356,-0.08309661,-0.30166736,-0.2780563,-0.3335736,-0.075578354,-0.26261365,-0.30821693,0.23977347,-0.30259094,0.24947517,-0.6804696,7.979173e-05,-0.9814741,0.00011057588,-0.90203685,0.00022704646,-0.0002289236,-1.0372245,-1.0004852,0.00010602466,-0.87044626,0.00031062966,-0.7849349,0.00019006536,-0.19298452,-0.026896834,-0.00032740968,-1.1058556,-0.8979558,0.00018226865,-3.0010644e-05,-0.10398392,-0.00033279043,-1.0149006,-0.0002553221,-1.1471648,-0.00012174167,-0.8732714,-0.0001432952,-0.07574718,-0.0003714824,-1.0683335,-0.00039253465,-1.0804759,-0.956126,0.00022395104,-0.00028678213,-1.0337454,-0.71179384,0.00019648518";

   	    for (int i=0;i<dat_dim;i++){
   	        for (int j=0;j<lay1_dim;j++){
   	        	find = strchr(weights, ',');
   				strncpy(temp, find+1, data_bits-1);

   	            mat_dat_lay1[i][j]=atof(temp);
   	            weights=find+data_bits;
   	        }
   	    }
   	    for (int i=0;i<lay1_dim;i++){
   	        for (int j=0;j<lab_dim;j++){
   	        	find = strchr(weights, ',');
   				strncpy(temp, find+1, data_bits-1);

   				mat_lay1_lab[i][j]=atof(temp);
   				weights=find+data_bits;

   	        }
   	    }
   	    // printf("%f\n",mat_dat_lay1[0][0]);
   	    // printf("%f\n",mat_lay1_lab[19][0]);
   	    // printf("%f\n",mat_lay1_lab[19][1]);



   	    u8 clear = 0;
    while(1)
    {

    	clear = Xil_In32(CLEAR);
    	if (clear)  //clear cnt at lower level of GATE
    		cnt = 0;
    	if (cnt>=10){

    		calcu();
    	}

    }

    cleanup_platform();

    return XST_SUCCESS;
}
