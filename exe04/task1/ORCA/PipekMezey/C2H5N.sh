#!/bin/bash
#BSUB -J intel
#BSUB -o C2H5N.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/C2H5N_755
scp $USER@mgt01:/apps/users/lcz/loc/C2H5N.inp /scratch/C2H5N_755
/apps/software/orca_5_0_0/orca /scratch/C2H5N_755/C2H5N.inp >& C2H5N.out
scp /scratch/C2H5N_755/*.gbw $USER@mgt01:/apps/users/lcz/loc
scp /scratch/C2H5N_755/*.xyz $USER@mgt01:/apps/users/lcz/loc
scp /scratch/C2H5N_755/*.trj $USER@mgt01:/apps/users/lcz/loc
