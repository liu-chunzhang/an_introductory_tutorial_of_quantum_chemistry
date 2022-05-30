#!/bin/bash
#BSUB -J intel
#BSUB -o BH-0.9-UHF-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-0.9-UHF-O_499
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T/BH-0.9-UHF-O.inp /scratch/BH-0.9-UHF-O_499
/apps/software/orca_5_0_0/orca /scratch/BH-0.9-UHF-O_499/BH-0.9-UHF-O.inp >& BH-0.9-UHF-O.out
scp /scratch/BH-0.9-UHF-O_499/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-0.9-UHF-O_499/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T
scp /scratch/BH-0.9-UHF-O_499/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD_T