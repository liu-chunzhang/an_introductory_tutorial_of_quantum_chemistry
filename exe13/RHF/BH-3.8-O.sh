#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.8-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-3.8-O_760
scp $USER@mgt01:/apps/users/lcz/exe13/RHF/BH-3.8-O.inp /scratch/BH-3.8-O_760
/apps/software/orca_5_0_0/orca /scratch/BH-3.8-O_760/BH-3.8-O.inp >& BH-3.8-O.out
scp /scratch/BH-3.8-O_760/*.gbw $USER@mgt01:/apps/users/lcz/exe13/RHF
scp /scratch/BH-3.8-O_760/*.xyz $USER@mgt01:/apps/users/lcz/exe13/RHF
scp /scratch/BH-3.8-O_760/*.trj $USER@mgt01:/apps/users/lcz/exe13/RHF
