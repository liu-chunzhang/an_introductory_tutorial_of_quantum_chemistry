#!/bin/bash
#BSUB -J intel
#BSUB -o RC-flipspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC-flipspin_578
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/HF/NoTrah/RC-flipspin.inp /scratch/RC-flipspin_578
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/HF/NoTrah/RC-highspin.gbw /scratch/RC-flipspin_578
/apps/software/orca_5_0_0/orca /scratch/RC-flipspin_578/RC-flipspin.inp >& RC-flipspin.out
scp /scratch/RC-flipspin_578/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/HF/NoTrah
scp /scratch/RC-flipspin_578/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/HF/NoTrah
scp /scratch/RC-flipspin_578/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task3/RC/HF/NoTrah
