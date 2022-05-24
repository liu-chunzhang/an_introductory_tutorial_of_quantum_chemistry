#!/bin/bash
#BSUB -J intel
#BSUB -o RC2-highspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC2-highspin_371
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC2/BP86/RC2-highspin.inp /scratch/RC2-highspin_371
/apps/software/orca_5_0_0/orca /scratch/RC2-highspin_371/RC2-highspin.inp >& RC2-highspin.out
scp /scratch/RC2-highspin_371/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC2/BP86
scp /scratch/RC2-highspin_371/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC2/BP86
scp /scratch/RC2-highspin_371/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC2/BP86