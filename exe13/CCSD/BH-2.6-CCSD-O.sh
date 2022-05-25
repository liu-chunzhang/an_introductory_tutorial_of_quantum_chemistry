#!/bin/bash
#BSUB -J intel
#BSUB -o BH-2.6-CCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-2.6-CCSD-O_265
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD/BH-2.6-CCSD-O.inp /scratch/BH-2.6-CCSD-O_265
/apps/software/orca_5_0_0/orca /scratch/BH-2.6-CCSD-O_265/BH-2.6-CCSD-O.inp >& BH-2.6-CCSD-O.out
scp /scratch/BH-2.6-CCSD-O_265/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-2.6-CCSD-O_265/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-2.6-CCSD-O_265/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD
