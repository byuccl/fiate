puts "Step 4 Generate DUT TMR DCP"

read_edif bld/edfs/vex_tmr.edf
link_design -mode out_of_context -part xc7a200tfbg484-3
write_checkpoint bld/cpus/vex_tmr.dcp

close_project

read_edif bld/edfs/mb_tmr.edf
link_design -mode out_of_context -part xc7a200tfbg484-3
write_checkpoint bld/cpus/mb_tmr.dcp

close_project

read_edif bld/edfs/pico_tmr.edf
link_design -mode out_of_context -part xc7a200tfbg484-3
write_checkpoint bld/cpus/pico_tmr.dcp

close_project

read_edif bld/edfs/taiga_tmr.edf
link_design -mode out_of_context -part xc7a200tfbg484-3
write_checkpoint bld/cpus/taiga_tmr.dcp

close_project

read_edif bld/edfs/kron_tmr.edf
link_design -mode out_of_context -part xc7a200tfbg484-3
write_checkpoint bld/cpus/kron_tmr.dcp

close_project
puts "Step 4 Done, Anything Else?"