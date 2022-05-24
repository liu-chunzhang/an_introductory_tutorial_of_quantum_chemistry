#!/bin/bash
#BSUB -J intel
#BSUB -o CH2-UHF.out
#BSUB -n 4
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/CH2-UHF_335
scp $USER@mgt01:/apps/users/lcz/exe7/task7/session2/CH2-UHF.inp /scratch/CH2-UHF_335
/apps/software/orca_5_0_0/orca /scratch/CH2-UHF_335/CH2-UHF.inp >& CH2-UHF.out
scp /scratch/CH2-UHF_335/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task7/session2
scp /scratch/CH2-UHF_335/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task7/session2
scp /scratch/CH2-UHF_335/*.trj $USER@mgt01:/apps/users/lcz/exe7/task7/session2
