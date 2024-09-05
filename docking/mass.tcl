mol new hpbcd.pdb

   

set outfile [open z-mass-center-dop.csv w]
puts $outfile "mass"


set cnt [atomselect top all ]


set comcnt [measure center $cnt weight mass]
foreach {cc1 cc2 cc3} $comcnt {break}






puts $outfile "$comcnt"

exit
