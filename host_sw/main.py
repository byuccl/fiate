import socket
import os
import mmap
import time
import sys
import pypci
from pcie_device import *
from datetime import datetime
import numpy as np

#10 Devices
devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)

pcie_devices = []

mb_id           = [0]
mb_tmr_id       = [1]
vex_id          = [4]
vex_tmr_id      = [5,6,7,15]
taiga_id        = [8]
taiga_tmr_id    = [9,10,14,20]
pico_id         = [12]
pico_tmr_id     = [13,2,3,11,21]
kron_id         = [16]
kron_tmr_id     = [17,18,19,22]




mb_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in mb_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"mb","mb_injection.elf"))
mb_tmr_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in mb_tmr_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"mb_tmr","mb_injection.elf"))


devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)
    

vex_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in vex_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"vex","riscv_injection.elf"))
vex_tmr_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in vex_tmr_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"vex_tmr","riscv_injection.elf"))


devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)

taiga_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in taiga_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"taiga","riscv_injection.elf"))
taiga_tmr_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in taiga_tmr_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"taiga_tmr","riscv_injection.elf"))

devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)




pico_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in pico_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"pico","riscv_injection.elf"))
pico_tmr_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in pico_tmr_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"pico_tmr","riscv_injection.elf"))
    
devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)

pico_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in kron_id:
    kron_count = np.array([[0, 0, 0],[0,0,0]])
pcie_devices.append(Pcie_Device(id_num,devices[id_num],"kron","riscv_injection.elf"))
kron_tmr_count = np.array([[0, 0, 0],[0,0,0]])
for id_num in kron_tmr_id:
    pcie_devices.append(Pcie_Device(id_num,devices[id_num],"kron_tmr","riscv_injection.elf"))


devices = pypci.lspci(device=0x7024)

print(len(devices))
if (len(devices)<23):
    exit(0)
#exit(0)


print(pcie_devices[0].address_space)

for device in pcie_devices:
    print(device.device_id,device.device_info.pcie_loc)
    
try:
    print("waiting for exit")
    while(1):
        time.sleep(10)
        now = datetime.now()
        dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
        print("date and time =", dt_string)
        for id_num in mb_id:
            mb_count = np.add(mb_count,np.array(pcie_devices[id_num].log()))
        print("mb",mb_count)
        
        for id_num in mb_tmr_id:
            mb_tmr_count = np.add(mb_tmr_count,np.array(pcie_devices[id_num].log()))
        print("mb_tmr",mb_tmr_count)
        
        for id_num in vex_id:
            vex_count = np.add(vex_count,np.array(pcie_devices[id_num].log()))
        print("vex",vex_count)
        
        for id_num in vex_tmr_id:
            vex_tmr_count = np.add(vex_tmr_count,np.array(pcie_devices[id_num].log()))
        print("vex_tmr",vex_tmr_count)
        
        for id_num in taiga_id:
            taiga_count = np.add(taiga_count,np.array(pcie_devices[id_num].log()))
        print("taiga",taiga_count)
        
        for id_num in taiga_tmr_id:
            taiga_tmr_count = np.add(taiga_tmr_count,np.array(pcie_devices[id_num].log()))
        print("taiga_tmr",taiga_tmr_count)
        
        for id_num in pico_id:
            pico_count = np.add(pico_count,np.array(pcie_devices[id_num].log()))
        print("pico",pico_count)
        
        for id_num in pico_tmr_id:
            pico_tmr_count = np.add(pico_tmr_count,np.array(pcie_devices[id_num].log()))
        print("pico_tmr",pico_tmr_count)
        
        for id_num in kron_id:
            kron_count = np.add(kron_count,np.array(pcie_devices[id_num].log()))
        print("kron",kron_count)
        
        for id_num in kron_tmr_id:
            kron_tmr_count = np.add(kron_tmr_count,np.array(pcie_devices[id_num].log()))
        print("kron_tmr",kron_tmr_count)

        
except KeyboardInterrupt:
    for pd in pcie_devices:
        pd.XVC.kill_server()
    Pcie_Device.tcl_client.int_exit()
    exit(0)
