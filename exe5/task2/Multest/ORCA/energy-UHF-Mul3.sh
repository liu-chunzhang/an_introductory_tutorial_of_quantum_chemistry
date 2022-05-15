#!/bin/bash
#BSUB -J intel
#BSUB -o energy-UHF-Mul3.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/energy-UHF-Mul3_999
scp $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA/energy-UHF-Mul3.inp /scratch/energy-UHF-Mul3_999
/apps/software/orca_5_0_0/orca /scratch/energy-UHF-Mul3_999/energy-UHF-Mul3.inp >& energy-UHF-Mul3.out
scp /scratch/energy-UHF-Mul3_999/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
scp /scratch/energy-UHF-Mul3_999/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
scp /scratch/energy-UHF-Mul3_999/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
