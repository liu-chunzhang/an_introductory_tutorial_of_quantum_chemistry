#!/bin/bash
#BSUB -J intel
#BSUB -o energy-UHF-Mul5.out
#BSUB -n 16
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/energy-UHF-Mul5_630
scp $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA/energy-UHF-Mul5.inp /scratch/energy-UHF-Mul5_630
/apps/software/orca_5_0_0/orca /scratch/energy-UHF-Mul5_630/energy-UHF-Mul5.inp >& energy-UHF-Mul5.out
scp /scratch/energy-UHF-Mul5_630/*.gbw $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
scp /scratch/energy-UHF-Mul5_630/*.xyz $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
scp /scratch/energy-UHF-Mul5_630/*.trj $USER@mgt01:/apps/users/lcz/exe5/task2/Multest/ORCA
