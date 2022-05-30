#!/bin/bash
#BSUB -J intel
#BSUB -o benzeneDimer-TDDFT.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/benzeneDimer-TDDFT_348
scp $USER@mgt01:/apps/users/lcz/exe10/task4/benzeneDimer-TDDFT.inp /scratch/benzeneDimer-TDDFT_348
/apps/software/orca_5_0_0/orca /scratch/benzeneDimer-TDDFT_348/benzeneDimer-TDDFT.inp >& benzeneDimer-TDDFT.out
scp /scratch/benzeneDimer-TDDFT_348/*.gbw $USER@mgt01:/apps/users/lcz/exe10/task4
scp /scratch/benzeneDimer-TDDFT_348/*.xyz $USER@mgt01:/apps/users/lcz/exe10/task4
scp /scratch/benzeneDimer-TDDFT_348/*.trj $USER@mgt01:/apps/users/lcz/exe10/task4
