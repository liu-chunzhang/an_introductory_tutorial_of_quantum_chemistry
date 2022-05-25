#!/bin/bash
#BSUB -J intel
#BSUB -o BH-4.6-UHF-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-4.6-UHF-O_425
scp $USER@mgt01:/apps/users/lcz/exe13/UMP2/BH-4.6-UHF-O.inp /scratch/BH-4.6-UHF-O_425
/apps/software/orca_5_0_0/orca /scratch/BH-4.6-UHF-O_425/BH-4.6-UHF-O.inp >& BH-4.6-UHF-O.out
scp /scratch/BH-4.6-UHF-O_425/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-4.6-UHF-O_425/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UMP2
scp /scratch/BH-4.6-UHF-O_425/*.trj $USER@mgt01:/apps/users/lcz/exe13/UMP2
