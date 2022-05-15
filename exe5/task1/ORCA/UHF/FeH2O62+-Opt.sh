#!/bin/bash
#BSUB -J intel
#BSUB -o FeH2O62+-Opt.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/FeH2O62+-Opt_834
scp $USER@mgt01:/apps/users/lcz/exe5/task1/ORCA/UHF/FeH2O62+-Opt.inp /scratch/FeH2O62+-Opt_834
/apps/software/orca_5_0_0/orca /scratch/FeH2O62+-Opt_834/FeH2O62+-Opt.inp >& FeH2O62+-Opt.out
scp /scratch/FeH2O62+-Opt_834/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task1/ORCA/UHF
scp /scratch/FeH2O62+-Opt_834/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task1/ORCA/UHF
scp /scratch/FeH2O62+-Opt_834/*.trj $USER@mgt01:/apps/users/lcz/exe5/task1/ORCA/UHF
