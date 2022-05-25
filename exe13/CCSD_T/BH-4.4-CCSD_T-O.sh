#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.4-CCSD_T-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.4-CCSD_T-O_682
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD_T/BH-4.4-CCSD_T-O.inp /scratch/BH-4.4-CCSD_T-O_682
/apps/software/orca_5_0_0/orca /scratch/BH-4.4-CCSD_T-O_682/BH-4.4-CCSD_T-O.inp >& BH-4.4-CCSD_T-O.out
scp /scratch/BH-4.4-CCSD_T-O_682/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
scp /scratch/BH-4.4-CCSD_T-O_682/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
scp /scratch/BH-4.4-CCSD_T-O_682/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
