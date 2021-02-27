import socket
import os
import mmap
import time
import sys
import pypci
from pcie_device import *
from datetime import datetime

#10 Devices
devices = pypci.lspci(device=0x7024)

pcie_devices = []

for i in range(len(devices)):
    print(devices[i].pcie_loc)
    new_pcie_device = Pcie_Device(i,devices[i])
    print(new_pcie_device.device_id)
    pcie_devices.append(new_pcie_device)
    # test all here
    for pd in pcie_devices:
        pd.log()



print(pcie_devices[0].address_space)

for device in pcie_devices:
    print(device.device_id,device.device_info.pcie_loc)
    
try:
    print("waiting for exit")
    while(1):
        time.sleep(0.5)
        now = datetime.now()
        dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
        print("date and time =", dt_string)	
        for pd in pcie_devices:
            pd.log()
            # pd.rescan()
            # #print(hex(pd.device_info.status))
            # #print(pd.device_info.bar)
            # pd.MicroBlaze.get_status()
            # err,data = pd.MicroBlaze.mb_read(0x80000100,4)
            # print(err,data)
            # if err == 1:
                # #pd.MicroBlaze.reset()
                # print("1")
                # pd.XVC.kill_server()
                # print("2")
                # pd.ICAP.reset()
                # print("3")
                # pd.ICAP.wbstar()
                # print("4")
                # time.sleep(2)
                # print("5")
                # pd.rescan()
                # print("6")
                # pd.XVC.start_server()
                # pd.XADC.reset()
                # pd.DDR.write_file(0x88000000,'mb_pb0.bin',1)
                # pd.DDR.write_file(0x88200000,'mb_pb1.bin',1)
                # pd.DDR.write_file(0x88400000,'mb_pb2.bin',1)
                # print("7")
                # time.sleep(2)         
                # print("8")       
                # pd.MicroBlaze.find_target()
                # print("9")
                # time.sleep(2)
                # err,data = pd.MicroBlaze.mb_read(0x80000100)
                # pd.MicroBlaze.dow("injection.elf")
                # print("10")
                # print(err,data)
            # if (pd.DDR.read(0x80000000)!=0x0):
                # Pcie_Device.tcl_client.int_exit()
                # exit()
                # pd.ICAP.reset()
                # pd.ICAP.wbstar()
                # time.sleep(2.0)
                # pd.rescan()
                # pd.XADC.reset()
                # pd.DDR.write_file(0x88000000,'mb_pb0.bin',1)
                # pd.DDR.write_file(0x88200000,'mb_pb1.bin',1)
                # pd.DDR.write_file(0x88400000,'mb_pb2.bin',1)
                # pd.MicroBlaze.find_target()
                # pd.MicroBlaze.dow("injection.elf")
            # print(pd.device_id,pd.DDR.read(0x80000100),pd.DDR.read(0x80000104),pd.DDR.read(0x80000108),pd.DDR.read(0x8000010C))
except KeyboardInterrupt:
    for pd in pcie_devices:
        pd.XVC.kill_server()
    Pcie_Device.tcl_client.int_exit()
    exit(0)