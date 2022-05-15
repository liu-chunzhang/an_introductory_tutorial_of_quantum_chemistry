#!/bin/bash
#BSUB -J intel
#BSUB -o opt-UHF.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/opt-UHF_543
scp $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA/opt-UHF.inp /scratch/opt-UHF_543
/apps/software/orca_5_0_0/orca /scratch/opt-UHF_543/opt-UHF.inp >& opt-UHF.out
scp /scratch/opt-UHF_543/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA
scp /scratch/opt-UHF_543/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA
scp /scratch/opt-UHF_543/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA
