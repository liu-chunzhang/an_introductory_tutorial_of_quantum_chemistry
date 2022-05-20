#!/bin/bash
#BSUB -J intel
#BSUB -o RC-flipspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC-flipspin_905
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah/RC-flipspin.inp /scratch/RC-flipspin_905
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah/RC-highspin.gbw /scratch/RC-flipspin_905
/apps/software/orca_5_0_0/orca /scratch/RC-flipspin_905/RC-flipspin.inp >& RC-flipspin.out
scp /scratch/RC-flipspin_905/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
scp /scratch/RC-flipspin_905/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
scp /scratch/RC-flipspin_905/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
