#!/bin/bash
#BSUB -J intel
#BSUB -o BH-6.0-UMP2-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-6.0-UMP2-O_637
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-6.0-UMP2-O.inp /scratch/BH-6.0-UMP2-O_637
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-6.0-UHF-O.gbw /scratch/BH-6.0-UMP2-O_637
/apps/software/orca_5_0_0/orca /scratch/BH-6.0-UMP2-O_637/BH-6.0-UMP2-O.inp >& BH-6.0-UMP2-O.out
scp /scratch/BH-6.0-UMP2-O_637/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-6.0-UMP2-O_637/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-6.0-UMP2-O_637/*.trj $USER@mgt01:/apps/users/lcz/exe13/UMP2
