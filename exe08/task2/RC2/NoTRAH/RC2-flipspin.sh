#!/bin/bash
#BSUB -J intel
#BSUB -o RC2-flipspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC2-flipspin_670
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC2/NoTrah/RC2-flipspin.inp /scratch/RC2-flipspin_670
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC2/NoTrah/RC2-highspin.gbw /scratch/RC2-flipspin_670
/apps/software/orca_5_0_0/orca /scratch/RC2-flipspin_670/RC2-flipspin.inp >& RC2-flipspin.out
scp /scratch/RC2-flipspin_670/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC2/NoTrah
scp /scratch/RC2-flipspin_670/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC2/NoTrah
scp /scratch/RC2-flipspin_670/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC2/NoTrah
