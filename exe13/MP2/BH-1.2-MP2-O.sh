#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.2-MP2-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.2-MP2-O_937
scp $USER@mgt01:/apps/users/lcz/exe13/MP2/BH-1.2-MP2-O.inp /scratch/BH-1.2-MP2-O_937
scp $USER@mgt01:/apps/users/lcz/exe13/MP2/BH-1.2-O.gbw /scratch/BH-1.2-MP2-O_937
/apps/software/orca_5_0_0/orca /scratch/BH-1.2-MP2-O_937/BH-1.2-MP2-O.inp >& BH-1.2-MP2-O.out
scp /scratch/BH-1.2-MP2-O_937/*.gbw $USER@mgt01:/apps/users/lcz/exe13/MP2
scp /scratch/BH-1.2-MP2-O_937/*.xyz $USER@mgt01:/apps/users/lcz/exe13/MP2
scp /scratch/BH-1.2-MP2-O_937/*.trj $USER@mgt01:/apps/users/lcz/exe13/MP2
