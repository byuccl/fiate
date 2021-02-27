from pcie_mem_util import *
from multiprocessing import Process
import socket
import os
import mmap
import time
import sys
import pypci

class XVC:
    #REG
    REG_LENG = 0x00
    REG_TMS  = 0x04
    REG_TDI  = 0x08
    REG_TDO  = 0x0C
    REG_CTL  = 0x10
    
    #MASH
    REG_CTL_START = 0x01
    
    
    def __init__ (self,device_offset,base_offset,ip='127.0.0.1',port=4000):
        self.device_offset = device_offset
        self.base_offset = base_offset
        self.ip = ip
        self.port = port
        
        self.start_server()
        #time.sleep(20)
        #p.kill()
    
    def kill_server(self):
        if self.server.is_alive():
            self.server.kill()
        
    def start_server(self):
        self.server = Process(target=self.xvc_server)
        self.server.start()
        
    def xvc_server(self):
        TCP_IP = self.ip
        TCP_PORT = self.port
        BUFFER_SIZE = 2048  # Normally 1024, but we want fast response

        debug = 0

        #print("connect -xvc-url {0}:{1}".format(TCP_IP,TCP_PORT))

        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.bind((TCP_IP, TCP_PORT))
        s.listen(1)


        while(1):
            conn, addr = s.accept()
            print ('Connection address:', addr)
            while 1:
                data = conn.recv(BUFFER_SIZE)
                if not data: break
                if(debug):
                    print ("received data:", data)
                #print(data[0:10])
                cmd = data[0:2].decode("utf-8")
                index = 0
                if cmd == "ge":
                    #print ("Get Info")
                    data = bytes("xvcServer_v1.0:1024\n", 'utf-8')
                    #print ("transmited data:", data)
                    conn.send(data)
                elif cmd == "se":
                    data = data[7:11]
                    #print ("transmited data:", data)
                    conn.send(data)
                elif cmd == "sh":
                    while (cmd== 'sh'):
                        length = data[index+6:index+10]
                        #print (length)
                        length =  int.from_bytes(length, byteorder='little', signed=False)
                        #print (hex(length))
                        nr_bytes = int((length + 7) / 8)
                        #print(nr_bytes)
                        word_length = int((nr_bytes + 3) / 4)*4
                        #print(word_length)
                        #print(tms)
                          
                        #print(cmd)
                        tdo = [0]*word_length
                        #print(tdo)
                        bytesLeft = nr_bytes
                        bitsLeft = length
                        byteIndex = 0

                        mem = pcie_mem(self.device_offset+self.base_offset)
                        
                        
                        while (bytesLeft >0):
                            #time.sleep(1)
                            if (bytesLeft >= 4):
                                mem.wwrite(self.REG_LENG,0x20)
                                tms = int.from_bytes(data[index+10+byteIndex:index+10+byteIndex+4],byteorder='little')
                                tdi = int.from_bytes(data[index+10+byteIndex+nr_bytes:index+10+byteIndex+nr_bytes+4],byteorder='little')
                                mem.wwrite(self.REG_TMS,tms)
                                mem.wwrite(self.REG_TDI,tdi)
                                #print(os.pread(fd,4,0x4))
                                #print(os.pread(fd,4,0x8))
                                mem.wwrite(self.REG_CTL,self.REG_CTL_START)
                                #print(length_write)
                                #print(tms[byteIndex:byteIndex+4])
                                #print(tdi[byteIndex:byteIndex+4])

                                output = mem.wread(self.REG_CTL)
                                while((output&self.REG_CTL_START)==self.REG_CTL_START):
                                    output = mem.wread(self.REG_CTL)


                                tdo[byteIndex:byteIndex+4] = mem.wread(self.REG_TDO).to_bytes(4,'little')
                                #print(tdo[byteIndex:byteIndex+4])
                                bytesLeft = bytesLeft - 4
                                byteIndex = byteIndex + 4
                                bitsLeft = bitsLeft - 32
                            else: 
                                mem.wwrite(self.REG_LENG,bitsLeft)
                                tms = int.from_bytes(data[index+10+byteIndex:index+10+byteIndex+bytesLeft],byteorder='little')
                                tdi = int.from_bytes(data[index+10+byteIndex+nr_bytes:index+10+byteIndex+nr_bytes+bytesLeft],byteorder='little')
                                mem.wwrite(self.REG_TMS,tms)
                                mem.wwrite(self.REG_TDI,tdi)
                                mem.wwrite(self.REG_CTL,self.REG_CTL_START)
                                output = mem.wread(self.REG_CTL)
                                while((output&self.REG_CTL_START)==self.REG_CTL_START):
                                    output = mem.wread  (self.REG_CTL)


                                tdo[byteIndex:byteIndex+4] = mem.wread(self.REG_TDO).to_bytes(4,'little')
                                #print(tdo[byteIndex:byteIndex+4])
                                
                                bytesLeft = 0
                                byteIndex = 0
                                bitsLeft = 0
                                #print(tdo)
                          
                        #for every 32 bits
                        #len of 32, tms, tdi
                        #ctrl = 1
                        #wait for ctrl = 0
                        #read tdo
                        #for less then 32 bits
                        #just set len to remaining bits, have tms and tdi ->
                        del mem
                        
                        index = index+10+(2*nr_bytes)
                        cmd = data[index:index+2].decode("utf-8")
                        #tdo[0::4], tdo[1::4],tdo[2::4], tdo[3::4] = tdo[3::4], tdo[2::4],tdo[1::4], tdo[0::4]
                        #print(tdo)
                        tdo = tdo[0:nr_bytes]
                        #print(tdo)
                        send_data = bytearray(tdo)
                        conn.send(send_data)
        conn.close()