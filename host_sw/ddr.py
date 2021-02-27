from pcie_mem_util import *
import numpy as np

class DDR:
    #REGS
    REG_PAGE = 0x8
    #DEF
    PAGE_SIZE = 0x10000
    
    
    def __init__ (self,device_offset,base_offset,page_offset):
        self.device_offset = device_offset
        self.base_offset = base_offset
        self.page_offset = page_offset
        self.set_page(0x80000000)
        #print(self.read_page(0x80000000))
        
    def set_page(self,address):
        mem = pcie_mem(self.device_offset+self.page_offset)
        #print(hex(mem.wread(self.REG_PAGE)))
        mem.wwrite(self.REG_PAGE,address)
        #print(hex(mem.wread(self.REG_PAGE)))
        
    def read(self,address):
        page = address&0xFFFF0000
        self.set_page(page)
        addr = address%self.PAGE_SIZE
        mem = pcie_mem(self.device_offset+self.base_offset)
        return mem.wread(addr)
        
        
    def write(self,address,data):
        page = address&0xFFFF0000
        self.set_page(page)
        addr = address%self.PAGE_SIZE
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(addr,data)
        

    def write_page(self,address,data,verify=0):
        page = address&0xFFFF0000
        #print(hex(page))
        self.set_page(page)
        addr = address%self.PAGE_SIZE
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.array[:len(data)] = data
        if(verify == 1):
            r_data = self.read_page(address,len(data))
            for r,d in zip(r_data,data):
                if (r != d):
                    print("Error!")
                    return 1
        return 0
        
        
    def read_page(self,address,length=(PAGE_SIZE>>2)):
        page = address&0xFFFF0000
        self.set_page(page)
        addr = address%self.PAGE_SIZE
        mem = pcie_mem(self.device_offset+self.base_offset)
        return mem.array[:length]
        
    def write_file(self,address,path,verify=0):
        print(path)
        file_array = np.fromfile(path, dtype=np.uint32)
        for i in range(0,len(file_array),self.PAGE_SIZE>>2):
            rval = self.write_page(address+(i<<2),file_array[0+i:(self.PAGE_SIZE>>2)+i],verify)
            if(rval == 1):
                return 1
        return 0