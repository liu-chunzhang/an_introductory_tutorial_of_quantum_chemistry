#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.0-UCCSD_T-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.0-UCCSD_T-O_502
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T/BH-1.0-UCCSD_T-O.inp /scratch/BH-1.0-UCCSD_T-O_502
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T/BH-1.0-UHF-O.gbw /scratch/BH-1.0-UCCSD_T-O_502
/apps/software/orca_5_0_0/orca /scratch/BH-1.0-UCCSD_T-O_502/BH-1.0-UCCSD_T-O.inp >& BH-1.0-UCCSD_T-O.out
scp /scratch/BH-1.0-UCCSD_T-O_502/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-1.0-UCCSD_T-O_502/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-1.0-UCCSD_T-O_502/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
