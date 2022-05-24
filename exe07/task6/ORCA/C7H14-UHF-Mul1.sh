#!/bin/bash
#BSUB -J intel
#BSUB -o C7H14-UHF-Mul1.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/C7H14-UHF-Mul1_866
scp $USER@mgt01:/apps/users/lcz/exe7/task6/ORCA/C7H14-UHF-Mul1.inp /scratch/C7H14-UHF-Mul1_866
/apps/software/orca_5_0_0/orca /scratch/C7H14-UHF-Mul1_866/C7H14-UHF-Mul1.inp >& C7H14-UHF-Mul1.out
scp /scratch/C7H14-UHF-Mul1_866/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task6/ORCA
scp /scratch/C7H14-UHF-Mul1_866/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task6/ORCA
scp /scratch/C7H14-UHF-Mul1_866/*.trj $USER@mgt01:/apps/users/lcz/exe7/task6/ORCA
