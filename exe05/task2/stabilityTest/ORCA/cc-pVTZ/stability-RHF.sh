#!/bin/bash
#BSUB -J intel
#BSUB -o stability-RHF.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/stability-RHF_509
scp $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/stability-RHF.inp /scratch/stability-RHF_509
/apps/software/orca_5_0_0/orca /scratch/stability-RHF_509/stability-RHF.inp >& stability-RHF.out
scp /scratch/stability-RHF_509/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA
scp /scratch/stability-RHF_509/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA
scp /scratch/stability-RHF_509/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA
