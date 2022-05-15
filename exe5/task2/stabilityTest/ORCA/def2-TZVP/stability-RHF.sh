#!/bin/bash
#BSUB -J intel
#BSUB -o stability-RHF.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/stability-RHF_814
scp $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/def2-TZVP/stability-RHF.inp /scratch/stability-RHF_814
/apps/software/orca_5_0_0/orca /scratch/stability-RHF_814/stability-RHF.inp >& stability-RHF.out
scp /scratch/stability-RHF_814/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/def2-TZVP
scp /scratch/stability-RHF_814/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/def2-TZVP
scp /scratch/stability-RHF_814/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/stabilityTest/ORCA/def2-TZVP
