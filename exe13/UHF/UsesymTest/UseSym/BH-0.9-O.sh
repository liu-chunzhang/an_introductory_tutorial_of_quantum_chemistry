#!/bin/bash
#BSUB -J intel
#BSUB -o BH-0.9-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-0.9-O_663
scp $USER@mgt01:/apps/users/lcz/exe13/UHF/UsesymTest/UseSym/BH-0.9-O.inp /scratch/BH-0.9-O_663
/apps/software/orca_5_0_0/orca /scratch/BH-0.9-O_663/BH-0.9-O.inp >& BH-0.9-O.out
scp /scratch/BH-0.9-O_663/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UHF/UsesymTest/UseSym
scp /scratch/BH-0.9-O_663/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UHF/UsesymTest/UseSym
scp /scratch/BH-0.9-O_663/*.trj $USER@mgt01:/apps/users/lcz/exe13/UHF/UsesymTest/UseSym
