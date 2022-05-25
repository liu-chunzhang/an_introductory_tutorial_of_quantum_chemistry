#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.2-CCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-3.2-CCSD-O_538
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD/BH-3.2-CCSD-O.inp /scratch/BH-3.2-CCSD-O_538
/apps/software/orca_5_0_0/orca /scratch/BH-3.2-CCSD-O_538/BH-3.2-CCSD-O.inp >& BH-3.2-CCSD-O.out
scp /scratch/BH-3.2-CCSD-O_538/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-3.2-CCSD-O_538/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-3.2-CCSD-O_538/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD
