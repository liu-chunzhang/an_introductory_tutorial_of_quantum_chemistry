#!/bin/bash
#BSUB -J intel
#BSUB -o RC-highspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC-highspin_281
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/BP86/NoTrah/RC-highspin.inp /scratch/RC-highspin_281
/apps/software/orca_5_0_0/orca /scratch/RC-highspin_281/RC-highspin.inp >& RC-highspin.out
scp /scratch/RC-highspin_281/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/BP86/NoTrah
scp /scratch/RC-highspin_281/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/BP86/NoTrah
scp /scratch/RC-highspin_281/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/BP86/NoTrah
