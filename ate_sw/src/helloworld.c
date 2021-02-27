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
#include <stdlib.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xhwicap.h"
#include "xspi.h"
#include "pb0_frads.h"
#include "fault_camp.h"

static uint8_t CMD_STATUSREG_READ  = 0x05;
static uint8_t CMD_STATUSREG2_READ  = 0x07;
#define DEVICE_7SERIES_WORDS_PER_FRAME		((101<<1)+2)
#define XADC_ADDR XPAR_XADC_WIZ_0_BASEADDR
#define XADC_TEMP 0x200

#define PART_SIZE 0x80000

int main()
{
	u32 * counters = (u32 *)0x80000000;
	u32 * fault_list = (u32 *)0x84000000;
	counters[0] = 0;
	counters[1] = 0;
	while(1){
		init_platform();
		u32 Status;

		*((int*)XPAR_XADC_WIZ_0_BASEADDR) = 0xA;
		print("Hello World\n\r");

		xil_printf("[srand]%08X\r\n",Xil_In32(XADC_ADDR+XADC_TEMP));
		xil_printf("[srand]%08X\r\n",Xil_In32(XADC_ADDR+XADC_TEMP+4));
		xil_printf("[srand]%08X\r\n",Xil_In32(XADC_ADDR+XADC_TEMP+8));
		xil_printf("[srand]%08X\r\n",Xil_In32(XADC_ADDR+XADC_TEMP+12));

		srand(Xil_In32(XADC_ADDR+XADC_TEMP));
		//*((int*)0x40000000) = 3;
		//checksum on bitfiles...

		//return 0;

		XHwIcap_Config icap_config = *XHwIcap_LookupConfig(XPAR_AXI_HWICAP_0_DEVICE_ID);
		XHwIcap icap_ptr;

		if (XHwIcap_CfgInitialize(&icap_ptr,&icap_config,XPAR_AXI_HWICAP_0_BASEADDR))
		{
			print("ICAP Sad\n\r");

		}else{
			print("ICAP Ready\n\r");
		}
		u32 DeviceIdCode;
		XHwIcap_GetConfigReg(&icap_ptr, XHI_IDCODE, &DeviceIdCode);
		xil_printf("[id0]%08X\r\n",DeviceIdCode);
		XHwIcap_GetConfigReg(&icap_ptr, XHI_IDCODE, &DeviceIdCode);
		xil_printf("[id1]%08X\r\n",DeviceIdCode);
		XHwIcap_GetConfigReg(&icap_ptr, XHI_IDCODE, &DeviceIdCode);
		xil_printf("[id2]%08X\r\n",DeviceIdCode);
		XHwIcap_CommandDesync(&icap_ptr);
		icap_ptr.DeviceIdCode = 0x13636093;
//		u32 FB[8];
//		u32 Index =0;
//		FB[Index++] = XHI_DUMMY_PACKET;
//		FB[Index++] = XHI_SYNC_PACKET;
//		FB[Index++] = XHI_NOOP_PACKET;
//		FB[Index++] = 0x30020001;
//		FB[Index++] = 0x0000;
//		FB[Index++] = 0x30008001;
//		FB[Index++] = 0xF;
//		FB[Index++] = XHI_NOOP_PACKET;
//		XHwIcap_DeviceWrite(&icap_ptr, &FB[0], Index);
//
//		return 0;

		u32 injections[3][3];

		u32* count_fails = (u32*)0x80000104;

		count_fails[0] = 0;
		count_fails[1] = 0;
		count_fails[2] = 0;

		xil_printf("[Test all]%08X\r\n",test_all_duts(&icap_ptr,injections));

		u32 test_output = test_all_duts(&icap_ptr,injections);
		if((test_output&0x1)!=0x1){
			count_fails[0]++;
			*(fault_list++) = 1;
		}else{
			*(fault_list++) = 0;
		}
		*(fault_list++) = injections[0][0];
		*(fault_list++) = injections[0][1];
		*(fault_list++) = injections[0][2];
		if((test_output&0x2)!=0x2){
			count_fails[1]++;
			*(fault_list++) = 1;
		}else{
			*(fault_list++) = 0;
		}
		*(fault_list++) = injections[1][0];
		*(fault_list++) = injections[1][1];
		*(fault_list++) = injections[1][2];

		if((test_output&0x4)!=0x4){
			count_fails[2]++;
			*(fault_list++) = 1;
		}else{
			*(fault_list++) = 0;
		}
		*(fault_list++) = injections[2][0];
		*(fault_list++) = injections[2][1];
		*(fault_list++) = injections[2][2];

		u32 * count_test = (u32 *)0x80000100;
		*count_test = 1;
		while ((test_output&0x70) == 0x70){
			test_output = test_all_duts(&icap_ptr,injections);
			(*count_test)++;
			if((test_output&0x1)!=0x1){
				count_fails[0]++;
				*(fault_list++) = 1;
			}else{
				*(fault_list++) = 0;
			}
			*(fault_list++) = injections[0][0];
			*(fault_list++) = injections[0][1];
			*(fault_list++) = injections[0][2];
			if((test_output&0x2)!=0x2){
				count_fails[1]++;
				*(fault_list++) = 1;
			}else{
				*(fault_list++) = 0;
			}
			*(fault_list++) = injections[1][0];
			*(fault_list++) = injections[1][1];
			*(fault_list++) = injections[1][2];

			if((test_output&0x4)!=0x4){
				count_fails[2]++;
				*(fault_list++) = 1;
			}else{
				*(fault_list++) = 0;
			}
			*(fault_list++) = injections[2][0];
			*(fault_list++) = injections[2][1];
			*(fault_list++) = injections[2][2];
			if((*count_test%0x1)==0)
			{
				xil_printf("%08X %08X F0[%08X] F1[%08X] F2[%08X]\r\n",fault_list,*count_test,count_fails[0],count_fails[1],count_fails[2]);
			}
		}

		xil_printf("[Test all]%08X\r\n",test_output);
		print("PR Failed\n\r");
		return 0;


		u32 * FramePtr = 0x88000000;
		//	for( int i = 0; i <100; i++)
		//		xil_printf("[%02d]%08X\r\n",i,FramePtr[i]);
		*((int*)0x90000000) = 0;
		*((int*)0x90000004) = 0;
		*((int*)0x90000008) = 0;
		*((int*)0x9000000C) = 0;
		*((int*)0x40000000) = 1;
		Status = XHwIcap_DeviceWrite(&icap_ptr, FramePtr,
				PART_SIZE);
		if (Status != XST_SUCCESS)  {
			return XST_FAILURE;
		}
		*((int*)0x40000000) = 3;
		*((int*)0x40000000) = 1;
		*((int*)0x44a00000) = 0xA;
		*((int*)0x40000000) = 0;




		u32 FrameBuffer[DEVICE_7SERIES_WORDS_PER_FRAME];

		u32 sel_frad[3];
		u32 sel_word[3];
		u32 sel_bits[3];
		u32 count = 0;

		//while(1){
		for(int g = 0; g<0x10000; g++){
			*((int*)0x90000000) = 0;
			*((int*)0x90000004) = 0;
			*((int*)0x90000008) = 0;
			*((int*)0x9000000C) = 0;
			*((int*)0x40000000) = 1;


			for(int i = 0; i <1; i++){
				u32 passed_n = 1;
				while(passed_n){
					sel_frad[i] = rand();
					sel_word[i] = rand()%101;
					sel_bits[i] = rand()%32;
					u32 bit_mask = 0x1<<sel_bits[i];

					IcapReadFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);

					u32 cw0 = FrameBuffer[102+sel_word[i]];
					u32 bd0 = cw0 ^ bit_mask;
					FrameBuffer[102+sel_word[i]] = bd0;

					//xil_printf("[%02d]%08X\r\n",sel_word[i],cw0);
					//xil_printf("[%02d]%08X\r\n",sel_word[i],bd0);

					IcapWriteFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);

					//verify fault
					IcapReadFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);
					if(FrameBuffer[102+sel_word[i]]!=bd0){
						passed_n = 1;
					}else{
						passed_n = 0;
					}
				}
			}

			//test processors
			*((int*)0x40000000) = 0;
			u32 read;
			for (int j = 0;j<0x7FFF;j++)
			{
				//for( int z = 0;z<0xFF;z++);
				read = Xil_In32(0x90000004);
				//read = Xil_In32(0xA0000004);
				if(read==0x90D1){
					//xil_printf("%08X\r\n",j);
					break;
				}
			}
			//xil_printf("EXIT\n\r");
			//xil_printf("%08X\r\n",read);
			if(read!=0x90D1){
				xil_printf("Processor Failed\n\r");
				counters[0]++;
			}else{
				counters[1]++;
			}
#define FULL_PR
#if defined(FULL_PR)
			u32 * FramePtr = 0x88000000;
			//	for( int i = 0; i <100; i++)
			//		xil_printf("[%02d]%08X\r\n",i,FramePtr[i]);
			*((int*)0x90000000) = 0;
			*((int*)0x90000004) = 0;
			*((int*)0x90000008) = 0;
			*((int*)0x9000000C) = 0;
			*((int*)0x40000000) = 1;
			Status = XHwIcap_DeviceWrite(&icap_ptr, FramePtr,
					PART_SIZE);
			if (Status != XST_SUCCESS)  {
				return XST_FAILURE;
			}
			*((int*)0x44a00000) = 0xA;
			*((int*)0x40000000) = 0;
			//			print("Partial done!\n\r");


#else
			*((int*)0x90000000) = 0;
			*((int*)0x90000004) = 0;
			*((int*)0x90000008) = 0;
			*((int*)0x9000000C) = 0;
			*((int*)0x40000000) = 1;
			for(int i = 0; i <1; i++){

				u32 bit_mask = 0x1<<sel_bits[i];

				IcapReadFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);

				u32 cw0 = FrameBuffer[102+sel_word[i]];
				u32 bd0 = cw0 ^ bit_mask;
				FrameBuffer[102+sel_word[i]] = bd0;

				//xil_printf("[%02X]%08X\r\n",sel_word,cw0);
				//xil_printf("[%02X]%08X\r\n",sel_word,bd0);

				IcapWriteFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);

				//verify fault
				IcapReadFrame(&icap_ptr,i,sel_frad[i],FrameBuffer);
				if(FrameBuffer[102+sel_word[i]]!=bd0){
					xil_printf("Repair didn't happen???\n\r");
					xil_printf("[%02X]%08X\r\n",sel_word[i],cw0);
					xil_printf("[%02X]%08X\r\n",sel_word[i],bd0);
				}

			}
#endif

			//test processors
			*((int*)0x40000000) = 0;
			for (int j = 0;j<0x7FFF;j++)
			{
				//for( int z = 0;z<0xFF;z++);
				read = Xil_In32(0x90000004);
				//read = Xil_In32(0xA0000004);
				if(read==0x90D1){
					//xil_printf("%08X\r\n",j);
					break;
				}
			}
			//xil_printf("EXIT\n\r");
			//xil_printf("%08X\r\n",read);
			if(read!=0x90D1){
				xil_printf("Processor still Failed\n\r");

				u32 * FramePtr = 0x88000000;
				//	for( int i = 0; i <100; i++)
				//		xil_printf("[%02d]%08X\r\n",i,FramePtr[i]);
				*((int*)0x90000000) = 0;
				*((int*)0x90000004) = 0;
				*((int*)0x90000008) = 0;
				*((int*)0x9000000C) = 0;
				*((int*)0x40000000) = 1;
				Status = XHwIcap_DeviceWrite(&icap_ptr, FramePtr,
						PART_SIZE);
				if (Status != XST_SUCCESS)  {
					return XST_FAILURE;
				}
				*((int*)0x40000000) = 3;
				*((int*)0x40000000) = 1;
				*((int*)0x44a00000) = 0xA;
				*((int*)0x40000000) = 0;
				//			print("Partial done!\n\r");


			}
			//test processors
			*((int*)0x40000000) = 1;
			*((int*)0x40000000) = 3;
			*((int*)0x40000000) = 1;
			*((int*)0x40000000) = 0;
			for (int j = 0;j<0x7FFF;j++)
			{
				//for( int z = 0;z<0xFF;z++);
				read = Xil_In32(0x90000004);
				//read = Xil_In32(0xA0000004);
				if(read==0x90D1){
					//xil_printf("%08X\r\n",j);
					break;
				}
			}
			//xil_printf("EXIT\n\r");
			//xil_printf("%08X\r\n",read);
			if(read!=0x90D1){
				xil_printf("Restart?\n\r");
				xil_printf("[%08X][%08X][%08X]\r\n",pb0_frads[sel_frad[0]%2884],sel_word[0],sel_bits[0]);
				break;
			}


			if(++count%0x100==0){
				xil_printf("%08X P[%08X] F[%08X]\r\n",count,counters[1],counters[0]);
			}
		}


		print("Done!\n\r");
		while(1);
		cleanup_platform();
	}
	return 0;
}
