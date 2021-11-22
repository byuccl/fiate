from pcie_mem_util import *
from icap import *
from xadc import *
from qspi import *
from ddr import *
from xvc import *
from xsdb_tcl_server import *
from microblaze import *
import pypci
from pathlib import Path


class Pcie_Device:

    address_space = {
        "debug_bridge" : 0x00000,
        "ddr"          : 0x10000,
        "mdm"          : 0x20000,
        "icap"         : 0x30000,
        "qspi"          : 0x40000,
        "xadc"         : 0x50000,
        "gpio"         : 0x70000
        }
    tcl_client = xsdb_tcl_server()

    def __init__(self,device_id,device_info,dut_name,elf_name,ip='127.0.0.1'):
        self.device_id = device_id
        self.device_info = device_info
        self.ip = ip
        self.elf = elf_name
        self.dut = dut_name
        self.port = 4000+self.device_id
        #self.rescan()
        #self.QSPI = QSPI(self.device_info.bar[0].addr,self.address_space["qspi"])
        
        #return
        

        self.MicroBlaze = MicroBlaze(self.tcl_client,self.ip,self.port)
        
        self.rescan()
        
        self.QSPI = QSPI(self.device_info.bar[0].addr,self.address_space["qspi"])

        self.ICAP = ICAP(self.device_info.bar[0].addr,self.address_space["icap"])
        time.sleep(10.0)
        self.rescan()
        
        
        
        self.XVC = XVC(self.device_info.bar[0].addr,self.address_space["debug_bridge"],port=self.port)
        
        
        self.XADC = XADC(self.device_info.bar[0].addr,self.address_space["xadc"])
        
        self.DDR = DDR(self.device_info.bar[0].addr,self.address_space["ddr"],self.address_space["gpio"])
        
        if (self.DDR.write_file(0x88000000,dut_name+'_pb0.bin',1)):
            self.isAlive = 0
            return
        self.DDR.write_file(0x88400000,dut_name+'_pb1.bin',1)
        self.DDR.write_file(0x88800000,dut_name+'_pb2.bin',1)
        
        self.DDR.write(0x80000000,self.device_id)
        self.DDR.write(0x80000100,0x00000000)
        self.DDR.write(0x80000104,0x00000000)
        self.DDR.write(0x80000108,0x00000000)
        self.DDR.write(0x8000010c,0x00000000)
        
        
        self.MicroBlaze.find_target()
        err,data= self.MicroBlaze.mb_read(0x80000000)
        
        
        print(err,data)
        
        if (err):
            self.isAlive = 0
            return
        else:
            self.isAlive = 1
        
        
        
        Path("log/"+dut_name).mkdir(parents=True, exist_ok=True)
        Path("log/"+dut_name+"/good").mkdir(parents=True, exist_ok=True)
        Path("log/"+dut_name+"/bad").mkdir(parents=True, exist_ok=True)
        self.files = []
        self.files.append("log/{1}/good/device{0}_{1}_pb0_good.log".format(self.device_id,dut_name))
        self.files.append("log/{1}/bad/device{0}_{1}_pb0_bad.log".format(self.device_id,dut_name))
        self.files.append("log/{1}/good/device{0}_{1}_pb1_good.log".format(self.device_id,dut_name))
        self.files.append("log/{1}/bad/device{0}_{1}_pb1_bad.log".format(self.device_id,dut_name))
        self.files.append("log/{1}/good/device{0}_{1}_pb2_good.log".format(self.device_id,dut_name))
        self.files.append("log/{1}/bad/device{0}_{1}_pb2_bad.log".format(self.device_id,dut_name))
        self.MicroBlaze.dow(elf_name)
        self.MicroBlaze.get_status()
        

        self.inject_count = 0
        self.same_count = 0
        
        #take one off the test rake when failing
        
        
        
    def rescan(self):
        pcie_loc ="0000\:"
        pcie_loc+=self.device_info.pcie_loc[0:2]
        pcie_loc+="\:"
        pcie_loc+=self.device_info.pcie_loc[3:]
        #print(pcie_loc)

        os.system("echo 1 > /sys/bus/pci/devices/"+pcie_loc+"/remove")
        time.sleep(0.2)
        os.system("echo 1 > /sys/bus/pci/rescan")
        time.sleep(0.4)
        os.system("echo 1 > /sys/bus/pci/devices/"+pcie_loc+"/enable")
        time.sleep(0.2)
        #os.system("lspci -v | grep -A 5 "+self.device_info.pcie_loc)
        #time.sleep(1)
        devices = pypci.lspci(device=0x7024)
        self.device_info = devices[self.device_id]
        
    def log(self):
        #print(self.device_id)
        good_count = [0,0,0]
        bad_count = [0,0,0]
        if (self.isAlive):
            #err,data= self.MicroBlaze.mb_read(0x90000004)
            #print(err,data)
            #err,data= self.MicroBlaze.mb_read(0xA0000004)
            #print(err,data)
            #err,data= self.MicroBlaze.mb_read(0xB0000004)
            #print(err,data)
            err,data = self.MicroBlaze.mb_read(0x80000100,4)
            if (not err):
                #print(data)
                
                new_count = int(data[0],16)
                
                if new_count == self.inject_count:
                    self.same_count = self.same_count + 1
                else:
                    self.same_count = 0
                while(self.inject_count<new_count):
                    #print(self.inject_count)
                    err,data = self.MicroBlaze.mb_read(0x84000000+4*12*self.inject_count,12)
                    if (not err):
                        #print(data)
                        
                        if (int(data[0],16) == 0):
                            self.write_log(self.files[0],data[1:4])
                            good_count [0] += 1
                        elif (int(data[0],16) == 1):
                            self.write_log(self.files[1],data[1:4])
                            bad_count [0] += 1
                        else:
                            err = 1
                            break
                            
                        if (int(data[4],16) == 0):
                            self.write_log(self.files[2],data[5:8])
                            good_count [1] += 1
                        elif (int(data[4],16) == 1):
                            self.write_log(self.files[3],data[5:8])
                            bad_count [1] += 1
                        else:
                            err = 1
                            break
                            
                        if (int(data[8],16) == 0):
                            self.write_log(self.files[4],data[9:12])
                            good_count [2] += 1
                        elif (int(data[8],16) == 1):
                            self.write_log(self.files[5],data[9:12])
                            bad_count [2] += 1
                        else:
                            err = 1
                            break
                            
                        self.inject_count = self.inject_count + 1
                    else:
                        break
                        
            if (self.same_count > 10):
                err = 1
            
            if (err):
                self.XVC.kill_server()
                self.ICAP.reset()
                self.ICAP.wbstar()
                time.sleep(5.0)
                self.rescan()
                self.XVC.start_server()
                self.XADC.reset()
                if (self.DDR.write_file(0x88000000,self.dut+'_pb0.bin',1)):
                    self.isAlive = 0
                    return [good_count,bad_count]
                self.DDR.write_file(0x88400000,self.dut+'_pb1.bin',1)
                self.DDR.write_file(0x88800000,self.dut+'_pb2.bin',1)
            
                self.DDR.write(0x80000000,self.device_id)
                self.DDR.write(0x80000100,0x00000000)
                self.DDR.write(0x80000104,0x00000000)
                self.DDR.write(0x80000108,0x00000000)
                self.DDR.write(0x8000010c,0x00000000)
            
                time.sleep(0.5)
                self.MicroBlaze.find_target()
                err,data= self.MicroBlaze.mb_read(0x80000000)
        
        
                print(err,data)
                
                if (err):
                    self.isAlive = 0
                else:
                    self.isAlive = 1
                time.sleep(0.5)
                self.inject_count = 0
                self.same_count = 0
                #err,data = pd.MicroBlaze.mb_read(0x80000100)
                self.MicroBlaze.dow(self.elf)
        else:
            print("is Dead!")
            
        return [good_count,bad_count]

    def write_log(self,file,data):
        f=open(file, "a+")
        str1 = "Frame 0x{0:08X}\t Word 0x{1:08X}\t Bit {2:3}\n".format(int(data[0],16),int(data[1],16),int(data[2],16))
        f.write(str1)
        f.close()