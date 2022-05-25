#!/bin/bash
#BSUB -J intel
#BSUB -o BH-0.8-RHF-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-0.8-RHF-O_609
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD/BH-0.8-RHF-O.inp /scratch/BH-0.8-RHF-O_609
/apps/software/orca_5_0_0/orca /scratch/BH-0.8-RHF-O_609/BH-0.8-RHF-O.inp >& BH-0.8-RHF-O.out
scp /scratch/BH-0.8-RHF-O_609/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-0.8-RHF-O_609/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-0.8-RHF-O_609/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD
