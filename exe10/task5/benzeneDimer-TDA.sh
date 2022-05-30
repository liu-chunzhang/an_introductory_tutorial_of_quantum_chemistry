#!/bin/bash
#BSUB -J intel
#BSUB -o benzeneDimer-TDA.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/benzeneDimer-TDA_178
scp $USER@mgt01:/apps/users/lcz/exe10/task4/benzeneDimer-TDA.inp /scratch/benzeneDimer-TDA_178
/apps/software/orca_5_0_0/orca /scratch/benzeneDimer-TDA_178/benzeneDimer-TDA.inp >& benzeneDimer-TDA.out
scp /scratch/benzeneDimer-TDA_178/*.gbw $USER@mgt01:/apps/users/lcz/exe10/task4
scp /scratch/benzeneDimer-TDA_178/*.xyz $USER@mgt01:/apps/users/lcz/exe10/task4
scp /scratch/benzeneDimer-TDA_178/*.trj $USER@mgt01:/apps/users/lcz/exe10/task4
