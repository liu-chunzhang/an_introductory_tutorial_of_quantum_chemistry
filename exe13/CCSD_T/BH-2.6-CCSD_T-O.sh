#!/bin/bash
#BSUB -J intel
#BSUB -o BH-2.6-CCSD_T-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-2.6-CCSD_T-O_297
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD_T/BH-2.6-CCSD_T-O.inp /scratch/BH-2.6-CCSD_T-O_297
/apps/software/orca_5_0_0/orca /scratch/BH-2.6-CCSD_T-O_297/BH-2.6-CCSD_T-O.inp >& BH-2.6-CCSD_T-O.out
scp /scratch/BH-2.6-CCSD_T-O_297/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
scp /scratch/BH-2.6-CCSD_T-O_297/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
scp /scratch/BH-2.6-CCSD_T-O_297/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD_T
