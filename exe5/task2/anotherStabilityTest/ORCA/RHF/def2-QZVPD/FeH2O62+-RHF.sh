#!/bin/bash
#BSUB -J intel
#BSUB -o FeH2O62+-RHF.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/FeH2O62+-RHF_177
scp $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA/def2-TZVP/def2-QZVPD/FeH2O62+-RHF.inp /scratch/FeH2O62+-RHF_177
/apps/software/orca_5_0_0/orca /scratch/FeH2O62+-RHF_177/FeH2O62+-RHF.inp >& FeH2O62+-RHF.out
scp /scratch/FeH2O62+-RHF_177/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA/def2-TZVP/def2-QZVPD
scp /scratch/FeH2O62+-RHF_177/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA/def2-TZVP/def2-QZVPD
scp /scratch/FeH2O62+-RHF_177/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/anotherStabilityTest/ORCA/def2-TZVP/def2-QZVPD
