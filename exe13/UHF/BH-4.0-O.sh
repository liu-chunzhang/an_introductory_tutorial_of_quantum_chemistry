#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.0-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.0-O_162
scp $USER@mgt01:/apps/users/lcz/exe13/UHF/BH-4.0-O.inp /scratch/BH-4.0-O_162
/apps/software/orca_5_0_0/orca /scratch/BH-4.0-O_162/BH-4.0-O.inp >& BH-4.0-O.out
scp /scratch/BH-4.0-O_162/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-4.0-O_162/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UHF
scp /scratch/BH-4.0-O_162/*.trj $USER@mgt01:/apps/users/lcz/exe13/UHF
