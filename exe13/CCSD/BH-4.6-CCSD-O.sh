#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.6-CCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.6-CCSD-O_255
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD/BH-4.6-CCSD-O.inp /scratch/BH-4.6-CCSD-O_255
/apps/software/orca_5_0_0/orca /scratch/BH-4.6-CCSD-O_255/BH-4.6-CCSD-O.inp >& BH-4.6-CCSD-O.out
scp /scratch/BH-4.6-CCSD-O_255/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-4.6-CCSD-O_255/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-4.6-CCSD-O_255/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD
