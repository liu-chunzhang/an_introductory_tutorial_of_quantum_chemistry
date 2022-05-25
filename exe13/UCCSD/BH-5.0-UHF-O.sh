#!/bin/bash
#BSUB -J intel
#BSUB -o BH-5.0-UHF-O.out
#BSUB -n 8
#BSUB -q cqueue

export LD_LIBRARY_PATH=/apps/software/openmpi-4.1.1/lib:/apps/software/orca_5_0_0:$LD_LIBRARY_PATH
export PATH=/apps/software/openmpi-4.1.1/bin:/apps/software/orca_5_0_0:$PATH

mkdir /scratch/BH-5.0-UHF-O_857
scp $USER@mgt01:/apps/users/lcz/exe13/UCCSD/BH-5.0-UHF-O.inp /scratch/BH-5.0-UHF-O_857
/apps/software/orca_5_0_0/orca /scratch/BH-5.0-UHF-O_857/BH-5.0-UHF-O.inp >& BH-5.0-UHF-O.out
scp /scratch/BH-5.0-UHF-O_857/*.gbw $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-5.0-UHF-O_857/*.xyz $USER@mgt01:/apps/users/lcz/exe13/UCCSD
scp /scratch/BH-5.0-UHF-O_857/*.trj $USER@mgt01:/apps/users/lcz/exe13/UCCSD
