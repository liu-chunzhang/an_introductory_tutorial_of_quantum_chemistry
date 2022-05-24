#!/bin/bash
#BSUB -J intel
#BSUB -o CH2-CAS22.out
#BSUB -n 4
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/CH2-CAS22_137
scp $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA/CH2-CAS22.inp /scratch/CH2-CAS22_137
scp $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA/CH2-ROHF.gbw /scratch/CH2-CAS22_137
/apps/software/orca_5_0_0/orca /scratch/CH2-CAS22_137/CH2-CAS22.inp >& CH2-CAS22.out
scp /scratch/CH2-CAS22_137/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
scp /scratch/CH2-CAS22_137/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
scp /scratch/CH2-CAS22_137/*.trj $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
