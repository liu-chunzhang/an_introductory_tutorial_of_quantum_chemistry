#!/bin/bash
#BSUB -J intel
#BSUB -o C7H14.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/C7H14_895
scp $USER@mgt01:/apps/users/lcz/exe7/task1/UHF-ORCA/C7H14.inp /scratch/C7H14_895
/apps/software/orca_5_0_0/orca /scratch/C7H14_895/C7H14.inp >& C7H14.out
scp /scratch/C7H14_895/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task1/UHF-ORCA
scp /scratch/C7H14_895/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task1/UHF-ORCA
scp /scratch/C7H14_895/*.trj $USER@mgt01:/apps/users/lcz/exe7/task1/UHF-ORCA
