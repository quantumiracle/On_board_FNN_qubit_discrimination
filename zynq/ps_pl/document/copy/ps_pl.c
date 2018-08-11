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

#include <stdio.h>
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

#define 	INT_CFG0_OFFSET 		0x00000C00  //0x00000C0C ICDICFR3 Register int_id is 48 to 63
#define 	INT_ID 					XPS_FPGA0_INT_ID
#define 	INTC_DEVICE_ID 			XPAR_PS7_SCUGIC_0_DEVICE_ID
#define 	INT_TYPE_RISING_EDGE 	0x03
#define 	INT_TYPE_HIGHLEVEL 		0x01
#define 	INT_MASK 				0x03

XScuGic INTCInst;

/*intc handler func */
static void Intc_Handler(void *para)
{
	u8 data = 0;
	data = Xil_In32(COUNTER_DATA);
	printf("data is %d\n",data);
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
	int status;
    init_platform();
    printf("Hello World\n");

    status = Intc_Init(INTC_DEVICE_ID);
    if(status != XST_SUCCESS)
    {
    	printf("INT initial is failed\n");
    	return XST_FAILURE;
    }

    while(1)
    {
    	usleep(1);
    }

    cleanup_platform();

    return XST_SUCCESS;
}
