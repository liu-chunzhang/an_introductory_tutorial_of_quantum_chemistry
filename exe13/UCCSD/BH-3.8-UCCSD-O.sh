#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.8-UCCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-3.8-UCCSD-O_172
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-3.8-UCCSD-O.inp /scratch/BH-3.8-UCCSD-O_172
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-3.8-UHF-O.gbw /scratch/BH-3.8-UCCSD-O_172
/apps/software/orca_5_0_0/orca /scratch/BH-3.8-UCCSD-O_172/BH-3.8-UCCSD-O.inp >& BH-3.8-UCCSD-O.out
scp /scratch/BH-3.8-UCCSD-O_172/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-3.8-UCCSD-O_172/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-3.8-UCCSD-O_172/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD
