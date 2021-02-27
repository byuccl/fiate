from pcie_mem_util import *
import time


class ICAP:
    #REGS
    REG_WF      = 0x100
    REG_RF      = 0x104
    REG_SZ      = 0x108
    REG_CR      = 0x10C
    REG_SR      = 0x110
    REG_WFV     = 0x114
    REG_RFO     = 0x118
    
    #MASKS PER REGS
    REG_CR_RESET_MASK = 0x0C
    REG_CR_WRITE_MASK = 0x01
    REG_CR_READ_MASK  = 0x02
    
    REG_SR_DONE_MASK  = 0x01
    
    #CMD SEQS
    
    def __init__(self,device_offset,base_offset):
        self.device_offset = device_offset
        self.base_offset = base_offset
        self.reset()
        print(hex(self.read_id_code()))
        self.wbstar()

    
    def reset(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_CR,self.REG_CR_RESET_MASK)
        mem.wwrite(self.REG_CR,0)
        
        
    def desync(self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_WF,0x30008001)
        mem.wwrite(self.REG_WF,0x0000000D)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_CR,self.REG_CR_WRITE_MASK)
        rval = mem.wread(self.REG_SR)
        if(rval & self.REG_SR_DONE_MASK):
            #print("Done")
            pass
        else:
            print("Not Done")
     
    
    def read_id_code (self):
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_WF,0xFFFFFFFF)
        mem.wwrite(self.REG_WF,0xAA995566)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_WF,0x20000000)
        cmd_id_code_rd = (1<<29 | 12<<13 | 1<<27 ) |0x1
        mem.wwrite(self.REG_WF,cmd_id_code_rd)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_CR,self.REG_CR_WRITE_MASK)
        rval = mem.wread(self.REG_SR)
        if(rval & self.REG_SR_DONE_MASK):
            #print("Done")
            pass
        else:
            print("Not Done")
        mem.wwrite(self.REG_SZ,0x4)
        mem.wwrite(self.REG_CR,self.REG_CR_READ_MASK)
        #Wait for done
        #while(1):
            #rval = mem.wread(self.REG_SR)
            #if(rval & self.REG_SR_DONE_MASK):
                #break
        rval = mem.wread(self.REG_SR)
        if(rval & self.REG_SR_DONE_MASK):
            #print("Done")
            pass
        else:
            print("Not Done")
        
        
        return_val = mem.wread(self.REG_RF)
        while(mem.wread(self.REG_RFO)!= 0 and mem.wread(self.REG_RFO)!= 0xFFFFFFFF):
            mem.wread(self.REG_RF)
            
        self.desync()
        
        return return_val
        
        
        
    def wbstar(self,addr=0x0):

        self.reset()
        mem = pcie_mem(self.device_offset+self.base_offset)
        mem.wwrite(self.REG_WF,0xFFFFFFFF)
        mem.wwrite(self.REG_WF,0xAA995566)
        mem.wwrite(self.REG_WF,0x20000000)
        mem.wwrite(self.REG_WF,0x30020001)
        mem.wwrite(self.REG_WF,addr)
        mem.wwrite(self.REG_WF,0x30008001)
        mem.wwrite(self.REG_WF,0x0000000F)
        mem.wwrite(self.REG_WF,0x20000000)
        #print(mem.wread(self.REG_WFV))
        #print(mem.wread(self.REG_RFO))
        mem.wwrite(self.REG_CR,self.REG_CR_WRITE_MASK)
        rval = mem.wread(self.REG_SR)
        if(rval & self.REG_SR_DONE_MASK):
            #print("Done")
            pass
        else:
            print("Not Done")
        #time.sleep(1)
        #print(mem.wread(self.REG_WFV))
        #print(mem.wread(self.REG_RFO))
        self.desync()
