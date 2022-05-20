#!/bin/bash
#BSUB -J intel
#BSUB -o RC-highspin.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/RC-highspin_872
scp $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah/RC-highspin.inp /scratch/RC-highspin_872
/apps/software/orca_5_0_0/orca /scratch/RC-highspin_872/RC-highspin.inp >& RC-highspin.out
scp /scratch/RC-highspin_872/*.gbw $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
scp /scratch/RC-highspin_872/*.xyz $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
scp /scratch/RC-highspin_872/*.trj $USER@mgt01:/apps/users/lcz/newexe8/exe8/task2/RC/autoTrah
