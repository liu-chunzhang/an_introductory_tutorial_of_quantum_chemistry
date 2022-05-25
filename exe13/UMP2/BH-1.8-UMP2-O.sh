#!/bin/bash
#BSUB -J intel
#BSUB -o BH-1.8-UMP2-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-1.8-UMP2-O_145
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-1.8-UMP2-O.inp /scratch/BH-1.8-UMP2-O_145
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-1.8-UHF-O.gbw /scratch/BH-1.8-UMP2-O_145
/apps/software/orca_5_0_0/orca /scratch/BH-1.8-UMP2-O_145/BH-1.8-UMP2-O.inp >& BH-1.8-UMP2-O.out
scp /scratch/BH-1.8-UMP2-O_145/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-1.8-UMP2-O_145/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-1.8-UMP2-O_145/*.trj $USER@mgt01:/apps/users/lcz/exe13/UMP2
