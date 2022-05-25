#!/bin/bash
#BSUB -J intel
#BSUB -o BH-3.4-UMP2-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-3.4-UMP2-O_338
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-3.4-UMP2-O.inp /scratch/BH-3.4-UMP2-O_338
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-3.4-UHF-O.gbw /scratch/BH-3.4-UMP2-O_338
/apps/software/orca_5_0_0/orca /scratch/BH-3.4-UMP2-O_338/BH-3.4-UMP2-O.inp >& BH-3.4-UMP2-O.out
scp /scratch/BH-3.4-UMP2-O_338/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-3.4-UMP2-O_338/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-3.4-UMP2-O_338/*.trj $USER@mgt01:/apps/users/lcz/exe13/UMP2
