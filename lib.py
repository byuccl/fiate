"""
Xilinx TMR
===========
This is a xilinx TMR example using SpyDrNet SHREC
"""

import spydrnet as sdn
from spydrnet.uniquify import uniquify
from spydrnet_shrec import apply_nmr, insert_organs
from spydrnet_shrec.analysis.find_voter_insertion_points import find_voter_insertion_points
from spydrnet_shrec.transformation.replication.organ import XilinxTMRVoter
from spydrnet_shrec import apply_nmr, uniquify_nmr_property


def generate_tmr(input_file,output_file):
    # set_property design_mode GateLvl [current_fileset]
    # set_property edif_top_file <path_to_file> [current_fileset]
    # link_design -part <part_number> -mode out_of_context
    #netlist = sdn.load_example_netlist_by_name('b13')  # loading an example, use `sdn.parse(<netlist filename>)` otherwise
    netlist = sdn.parse(input_file)  # loading an example, use `sdn.parse(<netlist filename>)` otherwise

    # uniquify is called to insure that non-leaf definitions are instanced only once, prevents unintended transformations.
    uniquify(netlist)

    # set instances_to_replicate [get_cells -hierarchical -filter {PRIMITIVE_LEVEL==LEAF||PRIMITIVE_LEVEL==MACRO}]
    hinstances_to_replicate = list(netlist.get_hinstances(recursive=True, filter=lambda x: x.item.reference.is_leaf() is True))
    #hinstances_to_replicate = list(x for x in hinstances_to_replicate if x.item.reference.name not in {'GND','VCC','RAMB36E2','RAMB18E2','RAMB36E1','RAMB18E1'})
    hinstances_to_replicate = list(x for x in hinstances_to_replicate if x.item.reference.name not in {'GND','VCC'})
    #hinstances_to_replicate = list(x for x in hinstances_to_replicate if x.item.reference.name not in {'GND','VCC','IBUF','OBUF'})
    instances_to_replicate = list(x.item for x in hinstances_to_replicate)



    # set ports_to_replicate [get_ports]
    hports_to_replicate = list(netlist.get_hports())
    ports_to_replicate = list(x.item for x in hports_to_replicate)

    # find out where to insert reduction and feedback voters
    insertion_points = find_voter_insertion_points(netlist, [*hinstances_to_replicate, *hports_to_replicate], {'FDRE', 'FDSE', 'FDPE', 'FDCE'})
    #insertion_points = find_voter_insertion_points(netlist, hinstances_to_replicate, {'FDRE', 'FDSE', 'FDPE', 'FDCE'})

    # replicate instances and ports
    replicas = apply_nmr([*instances_to_replicate, *ports_to_replicate], 3, name_suffix='TMR', rename_original=True)
    uniquify_nmr_property(replicas, {'HBLKNM', 'HLUTNM', 'SOFT_HLUTNM'}, "TMR")

    # insert voters on the selected drivers
    voters = insert_organs(replicas, insertion_points, XilinxTMRVoter(), 'VOTER')

    #compose out the netlist
    netlist.compose(output_file)
    
def generate_bins(input_file,output_file,bytes2erase):
    with open(input_file, 'rb') as file_t:
        blob_data = bytearray(file_t.read())

    blob_data = blob_data[bytes2erase:]
    print(hex(int.from_bytes(blob_data[0x20:0x24], byteorder='big', signed=False)))
    blob_data[0::4], blob_data[1::4],blob_data[2::4], blob_data[3::4] = blob_data[3::4], blob_data[2::4],blob_data[1::4], blob_data[0::4]
    print(hex(int.from_bytes(blob_data[0x20:0x24], byteorder='big', signed=False)))

    newFile = open(output_file,"wb")
    newFile.write(blob_data)