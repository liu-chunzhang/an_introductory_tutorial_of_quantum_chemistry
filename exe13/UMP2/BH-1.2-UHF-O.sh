#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.2-UHF-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.2-UHF-O_955
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-1.2-UHF-O.inp /scratch/BH-1.2-UHF-O_955
/apps/software/orca_5_0_0/orca /scratch/BH-1.2-UHF-O_955/BH-1.2-UHF-O.inp >& BH-1.2-UHF-O.out
scp /scratch/BH-1.2-UHF-O_955/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-1.2-UHF-O_955/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-1.2-UHF-O_955/*.trj $USER@mgt01:/apps/users/lcz/exe13/UMP2
