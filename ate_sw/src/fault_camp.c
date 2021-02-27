/*
 * fault_camp.c
 *
 *  Created on: Sep 14, 2020
 *      Author: lavat
 */

#include "xil_io.h"
#include "xhwicap.h"
#define PB0_ADR 0x88000000
#define PB1_ADR 0x88400000
#define PB2_ADR 0x88800000
#define PART_SIZE 0x100000
#define GPIO_ADDR XPAR_AXI_GPIO_0_BASEADDR


void clear_mem(int count){
	int base = (9+count)<<28;
	//xil_printf("[Base]%08X\r\n",base);
	*((int*)(base+0x0)) = 0;
	*((int*)(base+0x4)) = 0;
	*((int*)(base+0x8)) = 0;
	*((int*)(base+0xC)) = 0;
}

int read_dut(int count){
	int base = (9+count)<<28;
	int value = Xil_In32(base+0x4);
	//xil_printf("[%d]%08X\r\n",count,value);
	if(value == 0xA441) // MB 0x90D1  RISC-V 0xA441
		value = 1;
	else
		value = 0;
	return value;
}





void reset_on(int count){
	u32 value = Xil_In32(GPIO_ADDR);
	value = value | 0x1<<count;
	*((int*)GPIO_ADDR) = value;
}
void reset_off(int count){
	u32 value = Xil_In32(GPIO_ADDR);
	value = value & ~(0x1<<count);
	*((int*)GPIO_ADDR) = 0;
}

#define DEVICE_7SERIES_WORDS_PER_FRAME		((101<<1)+2)
int test_all_duts(XHwIcap *icap_ptr,u32 injections[3][3])
{
	int value = 0;
	int vd0,vd1,i;
	u32 FrameBuffer[DEVICE_7SERIES_WORDS_PER_FRAME];
	XStatus Status;
	u32 * FramePtr;
	/////////////////////////////////////////////////////////
	// CYCLE 1
	// Dut 0: Test normal operation, test at end
	// Dut 1: Inject Fault, test at end
	// Dut 2: PR configure
	/////////////////////////////////////////////////////////

	// Dut 0: normal test
	reset_on(0);
	clear_mem(0);
	reset_off(0);

	// Dut 1: Fault injection test
	//reset dut
	reset_on(1);
	clear_mem(1);

	i = 1;
	u32 passed_n = 1;
	u32 frame = 0;
	while(passed_n){
		injections[i][0] = rand();
		injections[i][1] = rand()%101;
		injections[i][2] = rand()%32;

		u32 bit_mask = 0x1<<injections[i][2];
		IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		u32 cw0 = FrameBuffer[102+injections[i][1]];
		u32 bd0 = cw0 ^ bit_mask;
		FrameBuffer[102+injections[i][1]] = bd0;

		//			xil_printf("[%02d]%08X\r\n",injections[i][1],cw0);
		//			xil_printf("[%02d]%08X\r\n",injections[i][1],bd0);

		IcapWriteFrame(icap_ptr,i,injections[i][0],FrameBuffer);

		//verify fault
		frame = IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		if(FrameBuffer[102+injections[i][1]]!=bd0){
			passed_n = 1;
		}else{
			passed_n = 0;
		}
	}
	injections[i][0] = frame;
	xil_printf("[I]%08X\r\n",frame);
	reset_off(1);

	reset_on(2);
	FramePtr = PB2_ADR;
	Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
			0xB5B79);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	*((int*)0x40050000) = 0xA;
	reset_off(2);

	vd0 = read_dut(0); //good read
	value |= (vd0<<4);
	vd1 = read_dut(1); //fault read
	value |= (vd1<<1);

	/////////////////////////////////////////////////////////
	// CYCLE 2
	// Dut 2: Test normal operation, test at end
	// Dut 0: Inject Fault, test at end
	// Dut 1: PR configure
	/////////////////////////////////////////////////////////

	// Dut 2: normal test
	reset_on(2);
	clear_mem(2);
	reset_off(2);

	// Dut 1: Fault injection test
	//reset dut
	reset_on(0);
	clear_mem(0);

	i = 0;
	passed_n = 1;
	frame = 0;
	while(passed_n){
		injections[i][0] = rand();
		injections[i][1] = rand()%101;
		injections[i][2] = rand()%32;
		u32 bit_mask = 0x1<<injections[i][2];
		IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		u32 cw0 = FrameBuffer[102+injections[i][1]];
		u32 bd0 = cw0 ^ bit_mask;
		FrameBuffer[102+injections[i][1]] = bd0;

		//			xil_printf("[%02d]%08X\r\n",injections[i][1],cw0);
		//			xil_printf("[%02d]%08X\r\n",injections[i][1],bd0);

		IcapWriteFrame(icap_ptr,i,injections[i][0],FrameBuffer);

		//verify fault
		frame = IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		if(FrameBuffer[102+injections[i][1]]!=bd0){
			passed_n = 1;
		}else{
			passed_n = 0;
		}
	}
	injections[i][0] = frame;
	xil_printf("[I]%08X\r\n",frame);
	reset_off(0);

	reset_on(1);
	FramePtr = PB1_ADR;
	Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
			0xB5B79);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	*((int*)0x40050000) = 0xA;
	reset_off(1);

	vd0 = read_dut(2); //good read
	value |= (vd0<<6);
	vd1 = read_dut(0); //fault read
	value |= (vd1<<0);

	/////////////////////////////////////////////////////////
	// CYCLE 3
	// Dut 1: Test normal operation, test at end
	// Dut 2: Inject Fault, test at end
	// Dut 0: PR configure
	/////////////////////////////////////////////////////////

	// Dut 2: normal test
	reset_on(1);
	clear_mem(1);
	reset_off(1);

	// Dut 1: Fault injection test
	//reset dut
	reset_on(2);
	clear_mem(2);

	i = 2;
	passed_n = 1;
	frame = 0;
	while(passed_n){
		injections[i][0] = rand();
		injections[i][1] = rand()%101;
		injections[i][2] = rand()%32;
		u32 bit_mask = 0x1<<injections[i][2];
		IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		u32 cw0 = FrameBuffer[102+injections[i][1]];
		u32 bd0 = cw0 ^ bit_mask;
		FrameBuffer[102+injections[i][1]] = bd0;

		//			xil_printf("[%02d]%08X\r\n",injections[i][1],cw0);
		//			xil_printf("[%02d]%08X\r\n",injections[i][1],bd0);

		IcapWriteFrame(icap_ptr,i,injections[i][0],FrameBuffer);

		//verify fault
		frame = IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
		if(FrameBuffer[102+injections[i][1]]!=bd0){
			passed_n = 1;
		}else{
			passed_n = 0;
		}
	}
	injections[i][0] = frame;
	xil_printf("[I]%08X\r\n",frame);
	reset_off(2);

	reset_on(0);
	FramePtr = PB0_ADR;
	Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
			0xCE46D);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	*((int*)0x40050000) = 0xA;
	reset_off(0);

	vd0 = read_dut(1); //good read
	value |= (vd0<<5);
	vd1 = read_dut(2); //fault read
	value |= (vd1<<2);

	return value;
}



//#define DEVICE_7SERIES_WORDS_PER_FRAME		((101<<1)+2)
//int test_all_duts(XHwIcap *icap_ptr,u32 injections[3][3])
//{
//	u32 FrameBuffer[DEVICE_7SERIES_WORDS_PER_FRAME];
//    //print("Restart\n\r");
//	//Restart and clear ddr
//	reset_on();
//	clear_mem(0);
//	clear_mem(1);
//	clear_mem(2);
//
//	for(int i = 0; i <3; i++){
//		u32 passed_n = 1;
//		u32 frame = 0;
//		while(passed_n){
//			injections[i][0] = rand();
//			injections[i][1] = rand()%101;
//			injections[i][2] = rand()%32;
//			u32 bit_mask = 0x1<<injections[i][2];
//			IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
//			u32 cw0 = FrameBuffer[102+injections[i][1]];
//			u32 bd0 = cw0 ^ bit_mask;
//			FrameBuffer[102+injections[i][1]] = bd0;
//
////			xil_printf("[%02d]%08X\r\n",injections[i][1],cw0);
////			xil_printf("[%02d]%08X\r\n",injections[i][1],bd0);
//
//			IcapWriteFrame(icap_ptr,i,injections[i][0],FrameBuffer);
//
//			//verify fault
//			frame = IcapReadFrame(icap_ptr,i,injections[i][0],FrameBuffer);
//			if(FrameBuffer[102+injections[i][1]]!=bd0){
//				passed_n = 1;
//			}else{
//				passed_n = 0;
//			}
//		}
//		injections[i][0] = frame;
//	}
//
//	reset_off();
//	//Wait and test
//	int vd0 = read_dut(0);
//	int vd1 = read_dut(1);
//	int vd2 = read_dut(2);
//
//
//	u32 i = 0;
//	for( ; i < 0x7FFF;i++){
//		vd0 = read_dut(0);
//		vd1 = read_dut(1);
//		vd2 = read_dut(2);
//		if((vd0 == 0x1)&&(vd1 == 0x1)&&(vd2 == 0x1)){
//			reset_on();
//			break;
//		}
//	}
//
//
//	reset_on();
//	//xil_printf("[I]%08X\r\n",i);
//	int value = vd0;
//	value |= (vd1<<1);
//	value |= (vd2<<2);
//
//
//	//Reconfigure all
//	*((int*)0x40000000) = 1;
//	u32 * FramePtr = PB0_ADR;
//	XStatus Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
//			PART_SIZE);
//	if (Status != XST_SUCCESS)  {
//		return XST_FAILURE;
//	}
//	FramePtr = PB1_ADR;
//	Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
//			PART_SIZE);
//	if (Status != XST_SUCCESS)  {
//		return XST_FAILURE;
//	}
//	FramePtr = PB2_ADR;
//	Status = XHwIcap_DeviceWrite(icap_ptr, FramePtr,
//			PART_SIZE);
//	if (Status != XST_SUCCESS)  {
//		return XST_FAILURE;
//	}
//	*((int*)0x40000000) = 7;
//	*((int*)0x44a00000) = 0xA;
//	*((int*)0x40000000) = 0;
//
//
//
//	//Test again
//	clear_mem(0);
//	clear_mem(1);
//	clear_mem(2);
//	reset_off();
//
//	//Wait and test
//	vd0 = read_dut(0);
//	vd1 = read_dut(1);
//	vd2 = read_dut(2);
//	i = 0;
//	for( ; i < 0x7FFF;i++){
//		vd0 = read_dut(0);
//		vd1 = read_dut(1);
//		vd2 = read_dut(2);
//		if((vd0 == 0x1)&&(vd1 == 0x1)&&(vd2 == 0x1)){
//			reset_on();
//			break;
//		}
//	}
//	reset_on();
//	//xil_printf("[I]%08X\r\n",i);
//
//
//	//compile response
//	value |= (vd1<<4);
//	value |= (vd1<<5);
//	value |= (vd2<<6);
//
//
//	return value;
//}
