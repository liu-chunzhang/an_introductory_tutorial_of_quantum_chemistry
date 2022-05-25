#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.1-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.1-O_407
scp $USER@mgt01:/apps/users/lcz/exe13/UHF/BH-1.1-O.inp /scratch/BH-1.1-O_407
/apps/software/orca_5_0_0/orca /scratch/BH-1.1-O_407/BH-1.1-O.inp >& BH-1.1-O.out
scp /scratch/BH-1.1-O_407/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-1.1-O_407/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-1.1-O_407/*.trj $USER@mgt01:/apps/users/lcz/exe13/UHF
