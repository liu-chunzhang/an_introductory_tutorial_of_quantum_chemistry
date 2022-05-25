#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.2-UCCSD_T-O.out
#BSUB -n 1
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.2-UCCSD_T-O_530
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T/BH-1.2-UCCSD_T-O.inp /scratch/BH-1.2-UCCSD_T-O_530
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T/BH-1.2-UHF-O.gbw /scratch/BH-1.2-UCCSD_T-O_530
/apps/software/orca_5_0_0/orca /scratch/BH-1.2-UCCSD_T-O_530/BH-1.2-UCCSD_T-O.inp >& BH-1.2-UCCSD_T-O.out
scp /scratch/BH-1.2-UCCSD_T-O_530/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-1.2-UCCSD_T-O_530/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-1.2-UCCSD_T-O_530/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
