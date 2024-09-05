#!/bin/bash


#for i in {1..10}
#
#	do
#		/home/payam/Works/Project/UTEP/Autodock/software/autodock_vina_1_1_2_linux_x86/bin/vina --config conf-hpbcd --num_modes 1000 --energy_range 5 --cpu 8 --out out-hpbcd-$i.pdbqt --log out-hpbcd-$i.log --seed $i
#	done
#
#
#for j in {1..10}
#	do
#		/home/payam/Works/Project/UTEP/Autodock/software/autodock_vina_1_1_2_linux_x86/bin/vina --config conf-sbebcd --num_modes 1000 --energy_range 5 --cpu 8 --out out-sbebcd-$j.pdbqt --log out-sbebcd-$j.log --seed $j
#	done

for k in {1..10}
        do
                /home/payam/Works/Project/UTEP/Autodock/software/autodock_vina_1_1_2_linux_x86/bin/vina --config conf-bc --num_modes 1000 --energy_range 5 --cpu 8 --out out-bc-$k.pdbqt --log out-bc-$k.log --seed $k
        done


