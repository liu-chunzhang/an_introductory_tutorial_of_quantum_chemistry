#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.4-UCCSD-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-3.4-UCCSD-O_809
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-3.4-UCCSD-O.inp /scratch/BH-3.4-UCCSD-O_809
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-3.4-UHF-O.gbw /scratch/BH-3.4-UCCSD-O_809
/apps/software/orca_5_0_0/orca /scratch/BH-3.4-UCCSD-O_809/BH-3.4-UCCSD-O.inp >& BH-3.4-UCCSD-O.out
scp /scratch/BH-3.4-UCCSD-O_809/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-3.4-UCCSD-O_809/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-3.4-UCCSD-O_809/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD
