#!/bin/bash


find . -name 'out-bc*.pdbqt' | while read file; 
	do
                if ! grep -q "ligand" <<< "$file"
                	then
                                /home/payam/Works/Project/UTEP/Autodock/software/autodock_vina_1_1_2_linux_x86/bin/vina_split --input "$file"
                fi
        done

