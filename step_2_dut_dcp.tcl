puts "Step 2 Generate DUT DCP"

cd duts



cd vex
source ./vex_prj.tcl
cd ..

cd mb
source ./mb_prj.tcl
cd ..

cd ..

puts "Step 2 Done, Anything Else?"