from pcie_mem_util import *


class QSPI:
    #REGS
    REG_RST   = 0x40
    REG_CR    = 0x60
    REG_SR    = 0x64
    REG_DTR   = 0x68
    REG_DRR   = 0x6C
    REG_SSR   = 0x70
    REG_DTO   = 0x74
    REG_DRO   = 0x78
    
    #MASK
    REG_RST_MASK = 0xA
    REG_CR_OFF   = 0x186
    REG_CR_ON    = 0x086
    REG_SR_RXE   = 0x00000001
    REG_SR_RXF   = 0x00000002
    REG_SR_TXE   = 0x00000004
    REG_SR_TXF   = 0x00000008
    REG_SSR_CEN  = 0xFFFFFFFE
    REG_SSR_CEF  = 0xFFFFFFFF
    
    #FLASH CMDS
    CMD_READ_ID    = 0x90
    CMD_RDID       = 0x9F
    CMD_READ       = 0x13
    
    
    def __init__ (self,device_offset,base_offset):
        self.device_offset = device_offset
        self.base_offset = base_offset
        self.reset()
        self.flash_id = self.read_id()
        self.falsh_info = self.device_info_read()
        print(hex(self.flash_id))
        print(hex(self.falsh_info[0x21]))
        print(hex(self.random_read(0x0)[35]))
        
    def reset(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_RST,self.REG_RST_MASK)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEF)
        mem.wwrite(self.REG_CR,self.REG_CR_OFF)


    def read_id(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_DTR,self.CMD_READ_ID)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEN)
        mem.wwrite(self.REG_CR,self.REG_CR_ON)
        while((mem.wread(self.REG_SR)&self.REG_SR_TXE)!=self.REG_SR_TXE):
            pass
        mem.wwrite(self.REG_CR,self.REG_CR_OFF)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEF)
        mem.wread(self.REG_DRR)
        mem.wread(self.REG_DRR)
        mem.wread(self.REG_DRR)
        mem.wread(self.REG_DRR)
        mem.wread(self.REG_DRR)
        return_val = mem.wread(self.REG_DRR)
        return return_val
    
    def device_info_read(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_DTR,self.CMD_RDID)
        for i in range(0x51):
            mem.wwrite(self.REG_DTR,0x0)
        
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEN)
        mem.wwrite(self.REG_CR,self.REG_CR_ON)
        while((mem.wread(self.REG_SR)&self.REG_SR_TXE)!=self.REG_SR_TXE):
            pass
        mem.wwrite(self.REG_CR,self.REG_CR_OFF)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEF)
        mem.wread(self.REG_DRR)
        mem.wread(self.REG_DRR)
        return_val = []
        for i in range(0x51):
            return_val.append(mem.wread(self.REG_DRR))
        return return_val
        
    def random_read(self,addr,length=256):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_DTR,self.CMD_READ)
        addr = int.to_bytes(addr,4,'big')
        for addr8 in addr:
            mem.wwrite(self.REG_DTR,addr8)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEN)
        mem.wwrite(self.REG_CR,self.REG_CR_ON)
        while((mem.wread(self.REG_SR)&self.REG_SR_TXE)!=self.REG_SR_TXE):
            pass
        mem.wwrite(self.REG_CR,self.REG_CR_OFF)
        while((mem.wread(self.REG_SR)&self.REG_SR_RXE)!=self.REG_SR_RXE):
            mem.wread(self.REG_DRR)
        while((mem.wread(self.REG_SR)&self.REG_SR_TXF)!=self.REG_SR_TXF):
            mem.wwrite(self.REG_DTR,0x0)
        mem.wwrite(self.REG_CR,self.REG_CR_ON)
        while((mem.wread(self.REG_SR)&self.REG_SR_TXE)!=self.REG_SR_TXE):
            pass
        mem.wwrite(self.REG_CR,self.REG_CR_OFF)
        mem.wwrite(self.REG_SSR,self.REG_SSR_CEF)
        return_val = []
        while((mem.wread(self.REG_SR)&self.REG_SR_RXE)!=self.REG_SR_RXE):
            return_val.append(mem.wread(self.REG_DRR))
        return return_val
        
