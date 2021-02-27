
import os
import struct
import collections
import subprocess
import mmap
import portio


iopl_flag = False
root_flag = False

PCIConfigHeader = collections.namedtuple('PCIConfigHeader',
                                         ['pcie_loc',
                                          'vendor_id',
                                          'device_id',
                                          'command',
                                          'status',
                                          'revision_id',
                                          'prog_if',
                                          'subclass',
                                          'class_code',
                                          'cache_line_size',
                                          'latency_timer',
                                          'header_type',
                                          'bist',
                                          'bar',
                                          'cardbus_cis_pointer',
                                          'subsystem_vendor_id',
                                          'subsystem_id',
                                          'expansion_rom_base_address',
                                          'capabilities_pointer',
                                          'interrupt_line',
                                          'interrupt_pin',
                                          'min_grant',
                                          'max_latency',
                                          'extension'])

BaseAddressRegister = collections.namedtuple('BaseAddressRegister',
                                             ['type',
                                              'addr',
                                              'size'])

class BadAccessError(Exception):
    pass


def verify_root_privilege():
    global root_flag
    
    if os.getuid() != 0: # uid = 0 : root
        raise Exception('root privilege is required to run pyinterface module')
    
    root_flag = True
    return

def acquire_io_access_permission():
    global iopl_flag
    
    # root privilege is required
    if not root_flag:
        verify_root_privilege()
        pass
    
    ret = portio.iopl(3)
    if ret == 0:
        iopl_flag = True
        print('INFO: I/O access is available (using root privileges)')
        pass
    return ret


def create_pci_config_header(pcie_loc,config_dump, bar):
    d = {}
    d['pcie_loc'] = pcie_loc
    d['vendor_id'] = struct.unpack('<H', config_dump[0:2])[0]
    d['device_id'] = struct.unpack('<H', config_dump[2:4])[0]
    d['command'] = struct.unpack('<H', config_dump[4:6])[0]
    d['status'] = struct.unpack('<H', config_dump[6:8])[0]
    d['revision_id'] = struct.unpack('<B', config_dump[8:9])[0]
    d['prog_if'] = struct.unpack('<B', config_dump[9:10])[0]
    d['subclass'] = struct.unpack('<B', config_dump[10:11])[0]
    d['class_code'] = struct.unpack('<B', config_dump[11:12])[0]
    d['cache_line_size'] = struct.unpack('<B', config_dump[12:13])[0]
    d['latency_timer'] = struct.unpack('<B', config_dump[13:14])[0]
    d['header_type'] = struct.unpack('<B', config_dump[14:15])[0]
    d['bist'] = struct.unpack('<B', config_dump[15:16])[0]
    d['bar'] = bar
    d['cardbus_cis_pointer'] = struct.unpack('<I', config_dump[40:44])[0]
    d['subsystem_vendor_id'] = struct.unpack('<H', config_dump[44:46])[0]
    d['subsystem_id'] = struct.unpack('<H', config_dump[46:48])[0]
    d['expansion_rom_base_address'] = struct.unpack('<I', config_dump[48:52])[0]
    d['capabilities_pointer'] = struct.unpack('<B', config_dump[52:53])[0]
    d['interrupt_line'] = struct.unpack('<B', config_dump[60:61])[0]
    d['interrupt_pin'] = struct.unpack('<B', config_dump[61:62])[0]
    d['min_grant'] = struct.unpack('<B', config_dump[62:63])[0]
    d['max_latency'] = struct.unpack('<B', config_dump[63:64])[0]
    if len(config_dump) > 64:
        d['extension'] = config_dump[64:]
    else:
        d['extension'] = None
        pass
    config = PCIConfigHeader(**d)
    return config

def create_base_address_register(region_type, addr, size):
    bar = BaseAddressRegister(region_type, addr, size)
    return bar

def parse_lspci_output(output_txt):
    def get_register_size(line):
        if line.find('[size=') == -1:
            return 0
        
        size_str = line.split('[size=')[1].split(']')[0]
        if size_str.endswith('K'):
            size = int(size_str[:-1]) * 1024
        elif size_str.endswith('M'):
            size = int(size_str[:-1]) * 1024 * 1024
        elif size_str.endswith('G'):
            size = int(size_str[:-1]) * 1024 * 1024 * 1024
        else:
            size = int(size_str)
            pass
        
        return size
    
    def get_io_addr(line):
        if line.find('bridge') != -1:
            line = line.split('-')[0]
            return int(line.split()[-1], 16)
        
        return int(line.split()[3], 16)
    
    def get_mem_addr(line):
        if line.find('bridge') != -1:
            line = line.split('-')[0]
            return int(line.split()[-1], 16)
        
        return int(line.split()[2], 16)
    
    bar_list = []
    dump = b''
    dump_mode = False
    pcie_loc = output_txt[0:7]
    for line in output_txt.split('\n'):
        if line.strip().startswith('I/O'):
            io_addr = get_io_addr(line)
            io_size = get_register_size(line)
            new_io = create_base_address_register('io', io_addr, io_size)
            bar_list.append(new_io)
            pass
        
        if line.strip().startswith('Memory'):
            mem_addr = get_mem_addr(line)
            mem_size = get_register_size(line)
            new_mem = create_base_address_register('mem', mem_addr, mem_size)
            bar_list.append(new_mem)
            pass
        
        if line.startswith('00: '):
            dump_mode = True
            pass
        
        if dump_mode:
            dump_str = line.split(': ')[1]
            for byte in dump_str.split(' '):
                dump += int(byte, 16).to_bytes(1, 'little')
                continue
            pass
        continue
    
    config_header = create_pci_config_header(pcie_loc,dump, bar_list)
    return config_header

def lspci(vendor=None, device=None):
    """Collect PCI information and return its list.
    
    Parameters
    ----------
    vendor : int
        Return only devices with specified vendor ID.
    
    device : int
        Return only devices with specified device ID.
    
    Returns
    -------
    list
        List of PCI device information.
        Information are stored in PCIConfigHeader namedtuple object.
    
    Examples
    --------
    >>> b = pypci.lspci(vendor=0x1147, device=3214)
    
    >>> b[0].vendor_id
    4423
    
    >>> b[0].bar
    [BaseAddressRegister(type='mem', addr=2421170176, size=64),
     BaseAddressRegister(type='mem', addr=2421166080, size=64),
     BaseAddressRegister(type='mem', addr=2421174272, size=32)]
    """
    lspci_cmd = ['lspci', '-xxxx', '-v']
    lspci_results = subprocess.run(lspci_cmd, stdout=subprocess.PIPE)
    lspci_stdout = lspci_results.stdout.decode('utf-8')
    config = [parse_lspci_output(stdout) for stdout
              in lspci_stdout.split('\n\n') if stdout != '']
    
    if vendor is not None:
        config = [c for c in config if c.vendor_id==vendor]
        pass
    
    if device is not None:
        config = [c for c in config if c.device_id==device]
        pass
    
    return config

def read(bar, offset, size):
    """Read PCI data register.
    
    Parameters
    ----------
    bar : BaseAddressRegister
        BAR to read.
    
    offset : int
        Address offset in BAR to read.
    
    size : int
        Data size to read.
        
    Returns
    -------
    bytes
        Data read from BAR
        
    Examples
    --------
    >>> b = pypci.lspci(vendor=0x1147, device=3214)
    >>> pypci.read(b[0].bar[2], 0x0c, 4)
    b'\x00\x00\x00\x0c'
    """
    verify_access_range(bar, offset, size)
    if bar.type == 'io': return io_read(bar, offset, size)
    if bar.type == 'mem': return mem_read(bar, offset, size)
    return b''

def write(bar, offset, data):
    """Write data to PCI board.
    
    Parameters
    ----------
    bar : BaseAddressRegister
        BAR to write.
    
    offset : int
        Address offset in BAR to write.
        
    data : bytes
        Data to write.
    
    Returns
    -------
    None
    
    Examples
    --------
    >>> b = pypci.lspci(vendor=0x1147, device=3214)
    
    >>> pypci.write(b[0].bar[2], 0x04, b'\x01')
    
    >>> data = struct.pack('<I', 1234567)
    >>> pypci.write(b[0].bar[2], 0x00, data)
    """
    if type(data) not in [bytes, bytearray]:
        msg = 'data should be bytes or bytearray type'
        raise TypeError(msg)
    
    size = len(data)
    verify_access_range(bar, offset, size)
    if bar.type == 'io': return io_write(bar, offset, data)
    if bar.type == 'mem': return mem_write(bar, offset, data)
    return

def verify_access_range(bar, offset, size):
    start = offset
    stop = offset + size - 1
    
    if (start < 0) or (stop < 0) or (start >= bar.size) or (stop >= bar.size):
        msg = 'PCI addr space is {0}-{1}'.format(hex(bar.addr),
                                                 hex(bar.addr+bar.size-1))
        msg += ' while tried to access {0}-{1}.'.format(hex(bar.addr+start),
                                                        hex(bar.addr+stop))
        raise BadAccessError(msg)
    return

def io_read(bar, offset, size):
    if not iopl_flag: 
        acquire_io_access_permission()
        pass
    
    target = bar.addr + offset
    
    ret = b''
    seek = 0
    while seek < size:
        remains = size - seek
        
        if remains >= 4:
            r = portio.inl(target+seek)
            ret += struct.pack('<I', r)
            seek += 4
            
        elif remains >= 2:
            r = portio.inw(target+seek)
            ret += struct.pack('<H', r)
            seek += 2
            
        else:
            r = portio.inb(target+seek)
            ret += struct.pack('<B', r)
            seek += 1
            pass
        continue
    
    return ret

def mem_read(bar, offset, size):
    if not root_flag:
        verify_root_privilege()
        pass
    
    f = os.open('/dev/mem', os.O_RDONLY)
    m = mmap_open(f, bar.size, prot=mmap.PROT_READ, offset=bar.addr)
    m.seek(offset, os.SEEK_CUR)
    ret = m.read(size)
    m.close()
    os.close(f)
    return ret
    
def io_write(bar, offset, data):
    if not iopl_flag: 
        acquire_io_access_permission()
        pass
    
    target = bar.addr + offset
    size = len(data)
    
    seek = 0
    while seek < size:
        remains = size - seek
        
        if remains >= 4:
            val = struct.unpack('<I', data[seek:seek+4])[0]
            portio.outl(val, target+seek)
            seek += 4
            
        elif remains >= 2:
            val = struct.unpack('<H', data[seek:seek+2])[0]
            portio.outw(val, target+seek)
            seek += 2
            
        else:
            val = struct.unpack('<B', data[seek:seek+1])[0]
            portio.outb(val, target+seek)
            seek += 1
            pass
        continue
    
    return

def mem_write(bar, offset, data):
    if not root_flag:
        verify_root_privilege()
        pass
    
    size = len(data)
    f = os.open('/dev/mem', os.O_RDWR)
    m = mmap_open(f, bar.size, prot=mmap.PROT_WRITE, offset=bar.addr)
    m.seek(offset, os.SEEK_CUR)
    m.write(data)
    m.close()
    os.close(f)
    return

def mmap_open(fileno, length, flags=mmap.MAP_SHARED,
              prot=mmap.PROT_WRITE|mmap.PROT_READ, offset=0):
    o = offset % mmap.ALLOCATIONGRANULARITY
    length2 = length + o
    offset2 = offset - o
    
    m = mmap.mmap(fileno, length2, flags=flags, prot=prot, offset=offset2)
    m.seek(o)
    return m
    