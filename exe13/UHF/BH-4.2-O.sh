#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.2-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.2-O_362
scp $USER@mgt01:/apps/users/lcz/exe13/UHF/BH-4.2-O.inp /scratch/BH-4.2-O_362
/apps/software/orca_5_0_0/orca /scratch/BH-4.2-O_362/BH-4.2-O.inp >& BH-4.2-O.out
scp /scratch/BH-4.2-O_362/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-4.2-O_362/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-4.2-O_362/*.trj $USER@mgt01:/apps/users/lcz/exe13/UHF
