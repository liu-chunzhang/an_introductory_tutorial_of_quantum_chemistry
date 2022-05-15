#!/bin/bash
#BSUB -J intel
#BSUB -o stability-UHF.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/stability-UHF_358
scp $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA/cc-pVTZ/stability-UHF.inp /scratch/stability-UHF_358
/apps/software/orca_5_0_0/orca /scratch/stability-UHF_358/stability-UHF.inp >& stability-UHF.out
scp /scratch/stability-UHF_358/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA/cc-pVTZ
scp /scratch/stability-UHF_358/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA/cc-pVTZ
scp /scratch/stability-UHF_358/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/Mul5StablityTest/ORCA/cc-pVTZ
