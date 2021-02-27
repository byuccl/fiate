import time
import re

class MicroBlaze:
    
    
    
    def __init__(self,tcl_client,ip,port):
        self.tcl_client = tcl_client
        self.ip = ip
        self.port = port
        self.target = -1
        self.connect_xvc()


    def connect_xvc(self):
        command = "connect -xvc-url {0}:{1}".format(self.ip,self.port)
        self.tcl_client.send_command(command)
        
        
    def find_target(self):
        command = "targets -filter {{name =~ \"*MicroBlaze #0*\" && jtag_cable_serial =~ \"*{0}*\"}}".format(self.port)
        #print(command)
        key = "([0-9]+)\** MicroBlaze #0"
        rval = self.tcl_client.send_command(command)
        m = re.search(key,rval)
        while(not m):
            time.sleep(0.5)
            rval = self.tcl_client.send_command(command)
            print(rval)
            m = re.search(key,rval)
        self.target = m.group(1)
        
    def mb_read(self,address,length=1):
        command = "target {0}".format(self.target)
        #print(command)
        self.tcl_client.send_command(command)
        command = "mrd 0x{0:08X} {1}".format(address,length)
        #print(command)
        rval = self.tcl_client.send_command(command)
        key = "([0-9A-F]+): ([0-9A-F]+) ([0-9A-F: ]*EOF)"
        m = re.search(key,rval)
        return_array = []
        if m:
            return_array.append(m.group(2))
            length = length - 1
            while (length > 0):
                m = re.search(key,m.group(3))
                if m:
                    return_array.append(m.group(2))
                    length = length - 1
                else:
                    break
            return 0, return_array
            
        else:
            return 1, rval

    def reset(self):
        #need to wait and rescan after
        command = "target {0}".format(self.target)
        self.tcl_client.send_command(command)
        command = "rst"
        print(self.tcl_client.send_command(command))


    def dow(self,path):
        command = "target {0}".format(self.target)
        self.tcl_client.send_command(command)
        command = "dow {0}".format(path)
        self.tcl_client.send_command(command)
        command = "con"
        self.tcl_client.send_command(command)
        
    def get_status(self):
        command = "target {0}".format(self.target)
        self.tcl_client.send_command(command)
        command = "state"
        print(self.tcl_client.send_command(command))
        