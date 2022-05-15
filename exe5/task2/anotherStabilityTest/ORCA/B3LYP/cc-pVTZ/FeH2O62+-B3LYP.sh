#!/bin/bash
#BSUB -J intel
#BSUB -o FeH2O62+-B3LYP.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/FeH2O62+-B3LYP_923
scp $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA/FeH2O62+-B3LYP.inp /scratch/FeH2O62+-B3LYP_923
/apps/software/orca_5_0_0/orca /scratch/FeH2O62+-B3LYP_923/FeH2O62+-B3LYP.inp >& FeH2O62+-B3LYP.out
scp /scratch/FeH2O62+-B3LYP_923/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA
scp /scratch/FeH2O62+-B3LYP_923/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA
scp /scratch/FeH2O62+-B3LYP_923/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA
