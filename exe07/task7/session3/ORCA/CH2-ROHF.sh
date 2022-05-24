#!/bin/bash
#BSUB -J intel
#BSUB -o CH2-ROHF.out
#BSUB -n 4
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/CH2-ROHF_764
scp $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA/CH2-ROHF.inp /scratch/CH2-ROHF_764
/apps/software/orca_5_0_0/orca /scratch/CH2-ROHF_764/CH2-ROHF.inp >& CH2-ROHF.out
scp /scratch/CH2-ROHF_764/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
scp /scratch/CH2-ROHF_764/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
scp /scratch/CH2-ROHF_764/*.trj $USER@mgt01:/apps/users/lcz/exe7/task7/session3/ORCA
