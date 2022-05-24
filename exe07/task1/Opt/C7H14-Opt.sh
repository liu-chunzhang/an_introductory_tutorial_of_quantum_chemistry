#!/bin/bash
#BSUB -J intel
#BSUB -o C7H14-Opt.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-3.1.4/lib:/apps/software/orca_4_2_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-3.1.4/bin:/apps/software/orca_4_2_0:$PATH

mkdir /scratch/C7H14-Opt_607
scp $USER@mgt01:/apps/users/lcz/exe7/task1/Opt/C7H14-Opt.inp /scratch/C7H14-Opt_607
/apps/software/orca_4_2_0/orca /scratch/C7H14-Opt_607/C7H14-Opt.inp >& C7H14-Opt.out
scp /scratch/C7H14-Opt_607/*.gbw $USER@mgt01:/apps/users/lcz/exe7/task1/Opt
scp /scratch/C7H14-Opt_607/*.xyz $USER@mgt01:/apps/users/lcz/exe7/task1/Opt
scp /scratch/C7H14-Opt_607/*.trj $USER@mgt01:/apps/users/lcz/exe7/task1/Opt
