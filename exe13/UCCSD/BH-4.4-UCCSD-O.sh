#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.4-UCCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.4-UCCSD-O_262
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-4.4-UCCSD-O.inp /scratch/BH-4.4-UCCSD-O_262
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-4.4-UHF-O.gbw /scratch/BH-4.4-UCCSD-O_262
/apps/software/orca_5_0_0/orca /scratch/BH-4.4-UCCSD-O_262/BH-4.4-UCCSD-O.inp >& BH-4.4-UCCSD-O.out
scp /scratch/BH-4.4-UCCSD-O_262/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-4.4-UCCSD-O_262/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-4.4-UCCSD-O_262/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD
