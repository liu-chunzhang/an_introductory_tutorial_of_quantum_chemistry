#!/bin/bash
#BSUB -J intel
#BSUB -o stability-B3LYP.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/stability-B3LYP_987
scp $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/cc-pVTZ/stability-B3LYP.inp /scratch/stability-B3LYP_987
/apps/software/orca_5_0_0/orca /scratch/stability-B3LYP_987/stability-B3LYP.inp >& stability-B3LYP.out
scp /scratch/stability-B3LYP_987/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/cc-pVTZ
scp /scratch/stability-B3LYP_987/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/cc-pVTZ
scp /scratch/stability-B3LYP_987/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/cc-pVTZ
