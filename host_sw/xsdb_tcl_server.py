import socket
from multiprocessing import Process
import time
import os

class xsdb_tcl_server:
    def __init__(self):
        self.HOST = "localhost"
        self.PORT = 8953
        self.socket = None
        self.xsdb = Process(target=self.xsdb_start)
        self.xsdb.start()
        time.sleep(1)
        self.open()

    def open(self):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.connect((self.HOST, self.PORT))

    def send_command(self, command):
        command += '\n'
        self.socket.sendall(command.encode())
        value = self.socket.recv(2048)
        #print(value)
        value = value.decode().rstrip()
        return value

    def close(self):
        if self.socket:
            self.socket.close()
            
    def xsdb_start(self):
        print("Start")
        os.system("/tools/Xilinx/HWSRVR/2019.1/bin/xsdb -interactive server.tcl")
        
    def int_exit(self):
        self.send_command("exit")
        self.close()
        self.xsdb.join()