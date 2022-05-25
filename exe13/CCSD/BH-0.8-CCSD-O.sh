#!/bin/bash
#BSUB -J intel
#BSUB -o BH-0.8-CCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-0.8-CCSD-O_646
scp $USER@mgt01:/apps/users/lcz/exe13/CCSD/BH-0.8-CCSD-O.out /scratch/BH-0.8-CCSD-O_646
/apps/software/orca_5_0_0/orca /scratch/BH-0.8-CCSD-O_646/BH-0.8-CCSD-O.out >& BH-0.8-CCSD-O.out
scp /scratch/BH-0.8-CCSD-O_646/*.gbw $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-0.8-CCSD-O_646/*.xyz $USER@mgt01:/apps/users/lcz/exe13/CCSD
scp /scratch/BH-0.8-CCSD-O_646/*.trj $USER@mgt01:/apps/users/lcz/exe13/CCSD
