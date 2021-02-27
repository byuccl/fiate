from pcie_mem_util import *


class XADC:
    #REGS
    REG_RST   = 0x00
    REG_TEMP  = 0x200
    
    #MASK
    REG_RST_MASK = 0xA
    
    def __init__ (self,device_offset,base_offset):
        self.device_offset = device_offset
        self.base_offset = base_offset
        self.reset()
        print('Temp {0:.2f}'.format(self.read_temp()))
        
        
    def reset(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_RST,self.REG_RST_MASK)

    def read_temp (self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        raw_temp = mem.wread(self.REG_TEMP)
        raw_temp = raw_temp >>4
        temp = (raw_temp*503.975/4096)-273.15
        return temp
        